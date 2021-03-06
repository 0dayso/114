set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

-- =============================================
-- Author:		周文超
-- Create date: 2010-07-16
-- Description:	操作后发送MQ消息(可带链接)
-- Error：返回1回复ID为null
-- Error：返回2查询值出错
-- Error：返回3查询值出错
-- Error：返回4写MQ消息失败
-- Success：返回9所有操作完成
-- =============================================
ALTER PROCEDURE [dbo].[proc_im_message_BuildExchangeCommentMessage]
	@ExchangeCommentId char(36),
	@MQMessageTransitUrl nvarchar(500), --MQ消息中转页面地址（登录页）
	@MQPurposeUrl nvarchar(3000),  --MQ消息目的地址
	@Result int output   --返回值
AS
BEGIN
	IF @ExchangeCommentId IS NULL OR len(@ExchangeCommentId) <= 0 or @MQMessageTransitUrl is null or len(@MQMessageTransitUrl) < 1 or @MQPurposeUrl is null or len(@MQPurposeUrl) < 1
	BEGIN
		SET @Result = 1
		RETURN
	end	
	
	DECLARE @TopicId char(36)  -- 供求ID
	DECLARE @TopicClassId tinyint  --评论类型
	DECLARE @CommentMQID int   --评论人MQ
	DECLARE @CommentId char(36)   --所回复的评论编号(对应对某个互动交流话题的评论)
	DECLARE @OperatorMQ int   --供求发布人MQ
	DECLARE @MessageInfo nvarchar(max)  --消息内容
	DECLARE @RedirectUrl nvarchar(3000)  --跳转到的URL
	DECLARE @Error int       --错误数
	DECLARE @NewGUID char(36)       --MQ消息跳转到的URL ID
	set @NewGUID = newid()
	SET @Error = 0
	
	SELECT @TopicId = TopicId,@TopicClassId = TopicClassId,@CommentMQID = OperatorMQ,@CommentId = CommentId FROM tbl_ExchangeComment WHERE ID = @ExchangeCommentId
	IF @TopicClassId = 1 AND (@CommentId IS not NULL OR len(@CommentId) > 0) AND (@TopicId IS NULL or len(@TopicId) <= 0)
	BEGIN
		SET @Result = 2
		RETURN
	end	
	SELECT @OperatorMQ = OperatorMQ FROM tbl_ExchangeList WHERE ID = @TopicId
	IF @OperatorMQ IS NULL OR len(@OperatorMQ) <= 0
	BEGIN
		SET @Result = 3
		RETURN
	end	
	if @OperatorMQ = @CommentMQID  --自己不能给自己发MQ消息
	begin
		SET @Result = 9
		RETURN 
	end

	SET @MessageInfo = '您在同业114网站上发布的信息有人回复了，请及时查收！' + @MQMessageTransitUrl;
	SET @MQPurposeUrl = @MQPurposeUrl + @TopicId
	
	begin tran 
	
	INSERT im_message(src,dst,[message],flag,IssueTime ) values (@CommentMQID,@OperatorMQ,@MessageInfo + @NewGUID,0,getdate())
	if @@error <> 0
		set @Error = @Error + @@error
	
	INSERT INTO im_message_url(id,RedirectUrl,RedirectLoginType,IssueTime,uid) VALUES (@NewGUID,@MQPurposeUrl,0,getdate(),@OperatorMQ)
	if @@error <> 0
		set @Error = @Error + @@error
	
	if @Error <> 0
	begin
		set @Result = 4
		rollback tran
	end	
	else
	begin
		set @Result = 9
		commit tran
	end
END

