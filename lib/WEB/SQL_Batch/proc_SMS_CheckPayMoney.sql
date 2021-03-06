-- =============================================
-- Author:		
-- Create date: 
-- Description:	短信系统-充值审核
-- =============================================
ALTER PROCEDURE proc_SMS_CheckPayMoney	
	@PayMoneyId CHAR(36),--充值支付编号	
	@CheckStatus INT,--审核状态 0:未审核 1:审核通过  2:审核未通过
	@CheckTime DATETIME,--审核时间
	@CheckUserName NVARCHAR(100),--审核人用户名
	@CheckUserFullName NVARCHAR(100),--审核人姓名
	@Result INT OUTPUT,--审核结果 1:成功 2:失败
	@PayMoney MONEY,--金额
	@PaySMSNumber INT--短信条数
AS
BEGIN
	SET @Result=0
	BEGIN TRANSACTION CheckPayMoney
	DECLARE @errorCount INT
	SET @errorCount=0

	--充值金额
	--DECLARE @payMoney MONEY
	--充值公司编号
	DECLARE @payCompanyId CHAR(36)
	
	--SELECT @payMoney=[PayMoney],@payCompanyId=[CompanyId] FROM [SMS_PayMoney] WHERE [Id]=@PayMoneyId
	SELECT @payCompanyId=[CompanyId] FROM [SMS_PayMoney] WHERE [Id]=@PayMoneyId
	SET @errorCount=@errorCount+@@ERROR

	--更新审核状态
	UPDATE [SMS_PayMoney] SET [IsChecked]=@CheckStatus
		,[CheckTime]=@CheckTime
		,[CheckUserName]=@CheckUserName
		,[CheckOperatorName]=@CheckUserFullName
		,[PayMoney]=@PayMoney
		,[PaySMSNumber]=@PaySMSNumber
	WHERE [Id]=@PayMoneyId

	SET @errorCount=@errorCount+@@ERROR

	IF(@CheckStatus=1)--更新公司余额,短信剩余条数,以及是否充值过的状态
	BEGIN	
		UPDATE [SMS_Account] SET [AccountMoney]=[AccountMoney]+@PayMoney,[AccountSMSNumber]=[AccountSMSNumber]+@PaySMSNumber,[IsPayed]='1' WHERE [CompanyId]=@payCompanyId
		SET @errorCount=@errorCount+@@ERROR
	END
	
	IF(@errorCount>0)
	BEGIN
		ROLLBACK TRANSACTION CheckPayMoney
		SET @Result=0
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION CheckPayMoney
		SET @Result=1
	END

	RETURN @Result	
	
END
GO
