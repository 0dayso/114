set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

-- ===========================================================================
-- Author:		周文超
-- Create date: 2010-06-11
-- Description:	新订单产生后向批发商发送MQ消息
-- Resulr: success：Resulr = 9
-- Resulr: error：Resulr = 1 订单ID为null或者空
-- Resulr: error：Resulr = 2 向设定过的批发商发送时写MQ消息表异常
-- Resulr: error：Resulr = 3 向设定过的批发商发送时写MQ消息中转地址表异常
-- Resulr: error：Resulr = 4 向订单所属团队的创建人发送时写MQ消息表异常
-- Resulr: error：Resulr = 5 向订单所属团队的创建人发送时写MQ消息中转地址表异常
-- History:修改人：zhangzy   修改内容：增加临时表，im_AcceptMsgPeople去掉城市查询条件  修改时间：2010-8-23
-- ============================================================================
ALTER PROCEDURE [dbo].[proc_im_message_BuildWholesalersMessage]
	@OrderId char(36),
	@MQMessageTransitUrl nvarchar(500), --MQ消息中转页面地址（登录页）
	@MQPurposeUrl nvarchar(3000),  --MQ消息目的地址
	@Result int output
AS
BEGIN
	SET @Result = 0
	IF(len(@OrderId) < 1 or @MQMessageTransitUrl is null or len(@MQMessageTransitUrl) < 1 or @MQPurposeUrl is null or len(@MQPurposeUrl) < 1)
		RETURN 1
	
	--MQ消息内容
	DECLARE @Message nvarchar(max)
	--预订人ID
	DECLARE @OrderOperatorId char(36)
	--预订人MQID
	DECLARE @OrderOpertorIdMQID int
	--订单所属团队ID
	DECLARE @TourId char(36)
	--订单所属公司ID
	DECLARE @CompanyId char(36)
	--预定公司名称
	DECLARE @BuyCompanyName nvarchar(250)
	--订单所属线路区域ID
	DECLARE @AreaId int
	--订单对应团的出团时间
	DECLARE @LeaveDate datetime
	--订单线路名称
	DECLARE @RouteName nvarchar(250)
	--订单成人数
	DECLARE @AdultNumber int
	--订单儿童数
	DECLARE @ChildNumber int
	--操作员ID
	DECLARE @OperatorId char(36)
	--操作员MQID
	DECLARE @OperatorMQID int
	--订单所属团队的创建人
	DECLARE @CreateTourOperatorId char(36)
	--是否向订单所属团队的创建人发送过消息
	DECLARE @IsSend int
	SET @IsSend = 0
	--MQ消息中转地址表ID
	declare @im_message_urlId char(36)
	--出发时间字符串形式
	DECLARE @LeaveDateString nvarchar(20)
	
	--变量赋值
	SELECT @TourId = TourId,@CompanyId = TourCompanyId,@BuyCompanyName = (SELECT CompanyName FROM tbl_CompanyInfo where tbl_CompanyInfo.id = tbl_TourOrder.BuyCompanyID),@AreaId = AreaId,@OrderOperatorId = OperatorID,@LeaveDate = LeaveDate,@RouteName = RouteName,@AdultNumber = AdultNumber,@ChildNumber = ChildNumber,@OrderOpertorIdMQID = (SELECT im_uid FROM im_member WHERE bs_uid = tbl_TourOrder.OperatorID),@CreateTourOperatorId = (SELECT OperatorID FROM tbl_TourList WHERE tbl_TourList.id = tbl_TourOrder.TourId) FROM tbl_TourOrder WHERE ID = @OrderId

	SET @LeaveDateString = convert(nvarchar(20),@LeaveDate,120)
	
	SET @Message = '【新订单】' + @BuyCompanyName + convert(nvarchar(20),getdate(),120) + '向您提交：' + substring(@LeaveDateString,1,len(@LeaveDateString) -3) + '出发“' + @RouteName + '”订单(' + cast(@AdultNumber as nvarchar(20)) + '成人' + cast(@ChildNumber as nvarchar(20)) + '儿童) 请尽快点击网址处理！' + @MQMessageTransitUrl

	set @MQPurposeUrl = @MQPurposeUrl + @OrderId;

	begin tran

	--1.循环向设定过的批发商发送订单消息（不包括当前团队的发布批发商）	
	--将要发送MQ消息的MQID存入临时表
	CREATE TABLE #TMPMSGMQID(USERID CHAR(36),NewMesUrlId char(36));
	INSERT INTO #TMPMSGMQID (USERID,NewMesUrlId) select distinct OperatorId,newid() from im_AcceptMsgPeople where CompanyId=@CompanyId and OperatorId!=@OrderOperatorId and TourAreaId=@AreaId

	--设定过的批发商中是否包含订单所属团队创建人
	select @IsSend = count(*) from #TMPMSGMQID where USERID = @CreateTourOperatorId
	
	--写MQ消息表
	INSERT INTO im_message(src,dst,[message],flag,IssueTime) select @OrderOpertorIdMQID,(select im_member.im_uid from im_member where im_member.bs_uid = #TMPMSGMQID.USERID),@message + NewMesUrlId,0,getdate() from #TMPMSGMQID where USERID <> @OrderOperatorId
	if @@error > 0
	begin
		--写MQ消息表异常
		set @Result = 2
		DROP TABLE #TMPMSGMQID
		rollback tran
		RETURN
	end

	--写MQ消息链接表
	INSERT INTO im_message_url(ID,RedirectUrl,RedirectLoginType,IssueTime,uid) select NewMesUrlId,@MQPurposeUrl,1,getdate(),(select im_member.im_uid from im_member where im_member.bs_uid = #TMPMSGMQID.USERID) from #TMPMSGMQID where USERID <> @OrderOperatorId
	if @@error > 0
	begin
		--写MQ消息中转地址异常
		set @Result = 3
		DROP TABLE #TMPMSGMQID
		rollback tran
		RETURN
	end

    DROP TABLE #TMPMSGMQID    --删除临时表

    --2.向订单所属团队的创建人发送MQ消息
    if @IsSend is null or @IsSend = 0
    begin
    	select @OperatorMQID = im_uid from im_member where bs_uid = @CreateTourOperatorId;
		if @OperatorMQID >0 and @OrderOpertorIdMQID>0 and @OperatorMQID <> @OrderOpertorIdMQID
		begin
			set @im_message_urlId = newid();
			--写MQ消息表
			INSERT INTO im_message(src,dst,[message],flag,IssueTime) VALUES (@OrderOpertorIdMQID,@OperatorMQID,@message + @im_message_urlId,0,getdate())
			if @@error > 0
			begin
				--向订单所属团队的创建人发送MQ消息时写MQ消息表异常
				set @Result = 4
				rollback tran
				RETURN
			end
			--写MQ链接表
			INSERT INTO im_message_url(ID,RedirectUrl,RedirectLoginType,IssueTime,uid) VALUES (@im_message_urlId,@MQPurposeUrl,1,getdate(),@OperatorMQID)
			if @@error > 0
			begin
				--向订单所属团队的创建人发送MQ消息时写MQ消息中转地址异常
				set @Result = 5
				rollback tran
			end
		end
	end  
	set @Result = 9
	commit tran
END

