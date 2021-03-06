set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

-- ===========================================================================
-- Author:		周文超
-- Create date: 2010-06-11
-- Description:	订单状态改变后向零售商发送MQ消息
-- Resulr: success：Resulr = 9
-- Resulr: error：Resulr = 1 订单ID为null或者空
-- Resulr: error：Resulr = 2 写MQ消息表异常
-- Resulr: error：Resulr = 3 写MQ消息中转地址表异常
-- ============================================================================
ALTER PROCEDURE [dbo].[proc_im_message_BuildRetailersMessage]
	@OrderId char(36),
	@MQMessageTransitUrl nvarchar(500), --MQ消息中转页面地址（登录页）
	@MQPurposeUrl nvarchar(3000),  --MQ消息目的地址
	@Result int output
AS
BEGIN
	SET @Result = 0
	IF(len(@OrderId) < 1 or @MQMessageTransitUrl is null or len(@MQMessageTransitUrl) < 1 or @MQPurposeUrl is null or len(@MQPurposeUrl) < 1)
		RETURN 1
		
	--订单操作员ID
	DECLARE @OperatorId char(36)
	--订单操作员MQID
	DECLARE @OperatorMQID int
	--预定人ID
	DECLARE @OrderOperatorId char(36)
	--预订人MQID
	DECLARE @OrderOpertorIdMQID int
	--订单所属团队ID
	DECLARE @TourId char(36)
	--订单所属公司ID
	DECLARE @CompanyId char(36)
	--订单所属公司名称
	DECLARE @CompanyName nvarchar(250)
	--订单对应团的出团时间
	DECLARE @LeaveDate datetime
	--订单线路名称
	DECLARE @RouteName nvarchar(250)
	--订单成人数
	DECLARE @AdultNumber int
	--订单儿童数
	DECLARE @ChildNumber int
	--订单状态
	DECLARE @OrderState int
	--留位时间
	DECLARE @SaveSeatDate datetime
	--跳转到的URL
	DECLARE @RedirectUrl nvarchar(3000)
	--MQ消息内容
	DECLARE @Message nvarchar(max)
	--出发时间字符串形式
	DECLARE @LeaveDateString nvarchar(20)
	--MQ消息中转地址表ID
	declare @newid char(36)
	
	--变量赋值
	SELECT @TourId = TourId,@CompanyId = TourCompanyId,@CompanyName = (SELECT CompanyName FROM tbl_CompanyInfo where tbl_CompanyInfo.id = tbl_TourOrder.TourCompanyId),@OrderState = OrderState,@OrderOperatorId = OperatorID,@LeaveDate = LeaveDate,@RouteName = RouteName,@AdultNumber = AdultNumber,@ChildNumber = ChildNumber,@OperatorId = LastOperatorID,@SaveSeatDate = SaveSeatDate FROM tbl_TourOrder WHERE ID = @OrderId;
	
	SELECT @OperatorMQID = im_uid from im_member where bs_uid = @OperatorId;
	SELECT @OrderOpertorIdMQID = im_uid from im_member where bs_uid = @OrderOperatorId;

	set @MQPurposeUrl = @MQPurposeUrl + @OrderId;

	if @OperatorMQID is not null and @OperatorMQID = @OrderOpertorIdMQID
	begin
		set @Result = 9    --自己不能给自己发消息
		return
	end

	SET @LeaveDateString = convert(nvarchar(20),@LeaveDate,120);
	
	IF @OrderState = 5
	begin
		SET @Message = '【确认成交】' + @CompanyName + '确认成交：';
	end
	else if @OrderState = 2
	begin
		SET @Message = '【同意留位】' + @CompanyName + '同意留位：';
	end
	ELSE IF @OrderState = 4
	begin
		SET @Message = '【不受理】' + @CompanyName + '不受理：'
	end
	set @Message = @Message + substring(@LeaveDateString,1,len(@LeaveDateString) -3) + '出发的“' + @RouteName + '"订单。(' + cast(@AdultNumber as nvarchar(20)) + '成人' + cast(@ChildNumber as nvarchar(20)) + '儿童)' + '请点击查看! ' + @MQMessageTransitUrl;
	
	BEGIN tran

	if @OperatorMQID > 0 and @OrderOpertorIdMQID > 0 AND @OrderState IN (2,4,5)
	BEGIN
		set @newid = newid()
		INSERT im_message(src,dst,[message],flag,IssueTime ) values (@OperatorMQID,@OrderOpertorIdMQID,@Message + @newid,0,getdate())
		if @@error > 0
		begin
			--写MQ消息表异常
			set @Result = 2
			rollback tran
		end
		INSERT INTO im_message_url(id,RedirectUrl,RedirectLoginType,IssueTime,uid) VALUES (@newid,@MQPurposeUrl,2,getdate(),@OrderOpertorIdMQID)
		if @@error > 0
		begin
			--写MQ消息中转地址异常
			set @Result = 3
			rollback tran
		end
	end	
	set @Result = 9
	commit tran
END

