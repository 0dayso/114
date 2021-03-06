-- =============================================
-- Author:		汪奇志
-- Create date: 2010-05-24
-- Description: 快到期团队视图(以模板团显示)
-- =============================================
ALTER VIEW view_TourList_ComingExpireTour
AS
SELECT 
	 C.ParentTourId
	,C.Id
	,C.TourDays
	,C.CompanyId
	,C.CompanyName
	,C.AreaId
	,C.RouteName
	,C.LeaveDate
	,C.TourContact
	,C.TourContactTel
	,C.TourContacMQ
	,C.CreateTime
FROM tbl_TourList AS C INNER JOIN (
	SELECT A.ParentTourId,MAX(A.LeaveDate) AS LeaveDate FROM tbl_TourList AS A
	WHERE A.ParentTourId>'' 
		AND A.LeaveDate>=GETDATE()--CONVERT(NVARCHAR(50),GETDATE(),110) 
		AND A.IsDelete = '0'
	GROUP BY A.ParentTourId) AS B 
ON C.ParentTourId=B.ParentTourId AND C.LeaveDate=B.LeaveDate
GO