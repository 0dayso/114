-- =============================================
-- Author:		汪奇志
-- Create date: 2010-03-26
-- Description:	短信系统-扣除账户余额
-- history:
-- 1.新增参数 @SMSNumber zhangzy   2010-5-24
-- =============================================
ALTER PROCEDURE proc_SMS_DeductAccountMoney
	@TempFeeTakeId CHAR(36),--金额扣除临时表编号
	@CompanyId CHAR(36),--公司编号
	@UserId CHAR(36),--用户编号
	@SendTotalId CHAR(36),--短信发送统计表编号
	@Money MONEY,--扣除金额
	@SMSNumber INT,--扣除短信条数
	@Result INT OUTPUT--操作结果 0.失败 1.成功	
AS
BEGIN
	SET @Result=0

	BEGIN TRANSACTION DeductAccountMoney
	DECLARE @errorCount INT
	SET @errorCount=0

	--从账户中扣除金额
	UPDATE [SMS_Account] SET [AccountMoney]=[AccountMoney]-@Money,[AccountSMSNumber]=[AccountSMSNumber]-@SMSNumber WHERE [CompanyId]=@CompanyId
	SET @errorCount=@errorCount+@@ERROR

	--写入金额扣除临时表
	INSERT INTO [SMS_TempFeeTake]([ID],[CompanyID],[UserID],[SendTotalID],[TakeMoeny],[TakeSMSNumber])
    VALUES (@TempFeeTakeId,@CompanyId,@UserId,@SendTotalId,@Money,@SMSNumber)
	SET @errorCount=@errorCount+@@ERROR

	IF(@errorCount>0)
	BEGIN
		ROLLBACK TRANSACTION DeductAccountMoney
		SET @Result=0
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION DeductAccountMoney
		SET @Result=1
	END

	RETURN @Result	
END
GO
