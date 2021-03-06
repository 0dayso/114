-- =============================================
-- Author:		汪奇志
-- Create date: 2010-03-26
-- Description: 短信平台-已充值的公司汇总
-- =============================================
ALTER VIEW view_SMS_AllPayedCompany
AS
SELECT B.ID AS CompanyID
	,B.CompanyName
	,B.ContactName
	,B.ContactTel
	,B.ContactMobile
	,B.ContactMQ
	,A.AccountMoney
	,A.AccountSMSNumber 
	,B.ProvinceId
	,B.CityId
	,B.ContactQQ
FROM SMS_Account A INNER JOIN tbl_CompanyInfo B ON A.CompanyId=B.Id
WHERE A.IsPayed='1'
GO
