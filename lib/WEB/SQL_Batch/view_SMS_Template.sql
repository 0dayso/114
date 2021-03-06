-- =============================================
-- Author:		汪奇志
-- Create date: 2010-03-26
-- Description: 短信平台-常用短语视图
-- =============================================
CREATE VIEW view_SMS_Template
AS
SELECT A.[ID]
      ,A.[CompanyID]
      ,A.[UserID]
      ,A.[ClassID]
      ,A.[WordContent]
      ,A.[IssueTime]
	  ,B.[ClassName]
FROM [SMS_CommonWords] AS A LEFT OUTER JOIN [SMS_CommonWordClass] AS B
ON A.ClassId=B.Id	
GO
