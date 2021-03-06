-- =============================================
-- Author:		汪奇志
-- Create date: 2010-05-27
-- Description: 团队访问记录视图
-- =============================================
ALTER VIEW view_TourVisitInfo_TourVisit
AS
SELECT 
	 A.Id AS VisitedId
	,A.TourId AS VisitedTourId
	,A.VisitedCompanyId
	,A.VisitedCompanyName
	,B.TourNo AS VisitedTourNo
	,B.RouteName AS VisitedRouteName
	,A.IssueTime AS VisitedTime
	,A.ClientIP
	,A.ClientUserId
	,A.ClientUserContactName
	,A.ComanyName AS ClientCompanyName
	,A.CompanyId AS ClientCompanyId	
	,C.ContactTel AS ClientContactTelephone
	,C.ContactMobile AS ClientContactMobile
	,C.QQ AS ClientContactQQ
	,B.AreaId AS VisitedTourAreaId
FROM tbl_TourVisitInfo AS A INNER JOIN tbl_TourList AS B
ON A.TourId=B.Id INNER JOIN tbl_CompanyUser AS C
ON A.ClientUserID=C.Id
	 