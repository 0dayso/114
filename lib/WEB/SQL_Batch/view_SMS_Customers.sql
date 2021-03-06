-- =============================================
-- Author:		汪奇志
-- Create date: 2010-03-26
-- Description: 短信平台-客户列表视图
-- =============================================
CREATE VIEW view_SMS_Customers
AS
SELECT A.ID
	, A.CompanyID
	, A.UserID
	, A.CustomerCompanyName
	, A.CustomerContactName
	, A.ClassID
	, A.ReMark
	, A.MobileNumber
	, A.IssueTime
	, B.ClassName
FROM SMS_CustomerList AS A LEFT OUTER JOIN SMS_CustomerClass AS B 
ON A.ClassID = B.ID
GO