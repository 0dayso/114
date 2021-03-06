-- =============================================
-- Author:		汪奇志
-- Create date: 2010-03-26
-- Description:	短信系统-写入短信发送明细及统计信息，同时更新账户余额
-- History:
-- 1:2010-04-02 针对小灵通的处理
-- 2:2010-05-24 发送超时金额返还,增加短信条数返还  zhangzy
-- =============================================
ALTER PROCEDURE proc_SMS_InsertSendMessageInfo
	--短信统计表编号
	@SendTotalId CHAR(36),
	--公司编号
	@CompanyId CHAR(36),
	--公司名称
	@CompanyName NVARCHAR(250),
	--用户编号
	@UserId CHAR(36),
	--用户姓名
	@UserFullName NVARCHAR(100),
	--短信类型
	@SMSType INT=0,
	--短信内容
	@SMSContent NVARCHAR(2000),
	--单条短信费用
	@UseMoeny MONEY,
	--发送成功短信条数[移动、联通]
	@SuccessCount INT,
	--发送失败短信条数[移动、联通]
	@ErrorCount INT,
	--发送超时短信条数[移动、联通]
	@TimeoutCount INT,
	--短信内容实际产生的短信条数[移动、联通]
	@FactCount  INT,
	--金额扣除临时表编号
	@TempFeeTakeId CHAR(36),
	--短信发送时间
	@SendMessageTime DATETIME,
	--发送到的手机号码 XML:<ROOT><MobileInfo Number="15888888888" ReturnResult="0" ReturnMsg="发送成功" FactCount="1"  /></Root>
	--Number:手机号码(NVARCHAR) ReturnResult:发送返回的结果(INT) ReturnMsg:发送返回的消息(NVARCHAR)
	@Mobiles NVARCHAR(MAX),
	--操作结果 0:失败 1:成功
	@Result INT OUTPUT,
	--发送成功短信条数[小灵通]
	@PHSSuccessCount INT,
	--发送失败短信条数[小灵通]
	@PHSErrorCount INT,
	--发送超时短信条数[小灵通]
	@PHSTimeoutCount INT,
	--短信内容实际产生的短信条数[小灵通]
	@PHSFactCount  INT
AS
BEGIN
	SET @Result=0
	--写入短信发送统计信息
	INSERT INTO [SMS_SendTotal]
           ([ID]
           ,[CompanyID]
           ,[CompanyName]
           ,[UserID]
           ,[ContactName]
           ,[SMSType]
           ,[SMSContent]
           ,[IssueTime]
           ,[UseMoeny]
           ,[SuccessCount]
           ,[ErrorCount]
           ,[SuccessSplitCount]
           ,[ErrorSplitCount]
           ,[SMSUnitPrice])
     VALUES
           (@SendTotalId
           ,@CompanyId
           ,@CompanyName
           ,@UserId
           ,@UserFullName
           ,@SMSType
           ,@SMSContent
           ,GETDATE()
           ,((@SuccessCount+@ErrorCount)*@FactCount+(@PHSSuccessCount+@PHSErrorCount)*@PHSFactCount)*@UseMoeny
           ,@SuccessCount+@PHSSuccessCount
           ,@ErrorCount+@PHSErrorCount
           ,@SuccessCount*@FactCount+@PHSSuccessCount*@PHSFactCount
           ,@ErrorCount*@FactCount+@PHSErrorCount*@PHSFactCount
           ,@UseMoeny)

	--写入短信发送明细信息
	DECLARE @hdoc INT
	EXECUTE sp_xml_preparedocument @hdoc OUTPUT, @Mobiles
	INSERT INTO [SMS_SendDetail]
           ([ID]
		   ,[CompanyID]
           ,[UserID]
           ,[SendTotalID]
           ,[SMSType]
           ,[MobileNumber]
           ,[SMSContent]
           ,[SendTime]
           ,[ReturnResult]
           ,[ReturnMsg]
           ,[UseMoeny]
           ,[SMSSplitCount])
	SELECT
				[GUID] 
			   ,@CompanyId
			   ,@UserId
			   ,@SendTotalId
			   ,@SMSType
			   ,[Number]
			   ,@SMSContent
			   ,@SendMessageTime
			   ,[ReturnResult]
			   ,[ReturnMsg]
			   ,@UseMoeny*[FactCount]
			   ,[FactCount]
	FROM OPENXML (@hdoc,'/ROOT/MobileInfo')
	WITH([Number] NVARCHAR(50),ReturnResult INT,ReturnMsg NVARCHAR(300),FactCount INT,GUID CHAR(36))

	EXECUTE sp_xml_removedocument @hdoc

	--发送超时金额返还,以及短信条数返还
	IF(@TimeoutCount>0)
	BEGIN
		UPDATE [SMS_Account] SET [AccountMoney]=[AccountMoney]+@TimeoutCount*@FactCount*@UseMoeny+@PHSTimeoutCount*@PHSFactCount*@UseMoeny,[AccountSMSNumber]=[AccountSMSNumber]+@TimeoutCount*@FactCount+@PHSTimeoutCount*@PHSFactCount WHERE CompanyID=@CompanyId
	END

	--删除扣款临时表记录
	DELETE FROM SMS_TempFeeTake WHERE Id=@TempFeeTakeId

	SET @Result=1
	RETURN @Result
END
GO