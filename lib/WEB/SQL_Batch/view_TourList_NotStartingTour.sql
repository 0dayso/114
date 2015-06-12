-- =============================================
-- Author:		����־
-- Create date: 2010-05-24
-- Description: ������-δ�����Ŷ���ͼ
-- =============================================
ALTER VIEW view_TourList_NotStartingTour
AS
SELECT	
	 A.ID
	,A.CompanyId
	,A.TourNo
	,A.ParentTourID
	,A.TourState
	,A.LeaveDate
	,A.RouteState
	,A.TourDescription
	,A.TourDays
	,A.PersonalPrice
	,A.ChildPrice 
	,A.RealPrice
	,A.MarketPrice
	,A.PlanPeopleCount
	,A.RemnantNumber
	,A.ShowCount
	,A.RouteName
	,A.AreaId
	,A.RetailAdultPrice
	,A.RetailChildrenPrice
	,A.IsRecentLeave
	,A.RecentLeaveCount
	,A.TourReleaseType
	,A.OrderPeopleNumber
	,A.RouteType
	,A.TourContact
	--ʵ�ճ�����
	,(SELECT SUM(AdultNumber) FROM tbl_TourOrder WHERE TourId=A.Id AND  OrderState=5) AS CollectAdult
	--ʵ�ն�ͯ��
	,(SELECT SUM(ChildNumber) FROM tbl_TourOrder WHERE TourId=A.Id AND  OrderState=5) AS CollectChildren
	--Ԥ��������
	,(SELECT SUM(AdultNumber) FROM tbl_TourOrder WHERE TourId=A.Id AND  OrderState=2) AS AllowanceAdult
	--Ԥ����ͯ��
	,(SELECT SUM(ChildNumber) FROM tbl_TourOrder WHERE TourId=A.Id AND  OrderState=2) AS AllowanceChildren
	--δ���������
	,(SELECT SUM(AdultNumber) FROM tbl_TourOrder WHERE TourId=A.Id AND  OrderState IN(0,1)) AS UntreatedAdult
	--δ�����ͯ��
	,(SELECT SUM(ChildNumber) FROM tbl_TourOrder WHERE TourId=A.Id AND  OrderState IN(0,1)) AS UntreatedChildren
	,IsRecentLeaveNoControl
FROM tbl_TourList AS A
WHERE A.LeaveDate>=GETDATE() AND A.IsDelete='0'
GO
