-- =============================================
-- Author:		汪奇志
-- Create date: 2010-05-28
-- Description: 有订单的团队视图
-- =============================================
USE TourPlatform
GO
ALTER VIEW view_TourList_HavingOrderTour
AS
SELECT 
	 A.Id
	,A.CompanyId
	,A.TourNo
	,A.RouteName
	,A.PlanPeopleCount
	,A.RemnantNumber
	,A.TourDays
	,A.LeaveDate
	,A.ComeBackDate
	--采购零售商数量
	,(SELECT COUNT(*) FROM (SELECT BuyCompanyID FROM tbl_TourOrder WHERE OrderState NOT IN(3,4) AND TourId=A.Id GROUP BY BuyCompanyID) AS B) AS BuyCompanyNumber
	--采购座位数量
	,A.OrderPeopleNumber
	,A.AreaId
FROM tbl_TourList AS A
WHERE EXISTS(SELECT 1 FROM tbl_TourOrder WHERE TourId=A.Id AND IsDelete='0')
GO
