-- =============================================
-- Author:		����־
-- Create date: 2010-05-24
-- Description: ������-�ѳ����Ŷ���ͼ
-- =============================================
ALTER VIEW view_TourList_StartingTour
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
	,A.ComeBackDate
	--ʵ�ճ�����
	,(SELECT SUM(AdultNumber) FROM tbl_TourOrder WHERE TourId=A.Id AND  OrderState IN(0,1,2,5)) AS CollectAdult
	--ʵ�ն�ͯ��
	,(SELECT SUM(ChildNumber) FROM tbl_TourOrder WHERE TourId=A.Id AND  OrderState IN(0,1,2,5)) AS CollectChildren
	--��λ���ڳ�����
	,(SELECT SUM(AdultNumber) FROM tbl_TourOrder WHERE TourId=A.Id AND  OrderState=3) AS OverdueAdult
	--��λ���ڶ�ͯ��
	,(SELECT SUM(ChildNumber) FROM tbl_TourOrder WHERE TourId=A.Id AND  OrderState=3) AS OverdueChildren
	--�����������
	,(SELECT SUM(AdultNumber) FROM tbl_TourOrder WHERE TourId=A.Id AND  OrderState=4 AND IsDelete='0') AS DismissAdult
	--�������ͯ��
	,(SELECT SUM(ChildNumber) FROM tbl_TourOrder WHERE TourId=A.Id AND  OrderState=4 AND IsDelete='0') AS DismissChildren
FROM tbl_TourList AS A
WHERE A.LeaveDate<GETDATE() AND IsDelete='0' AND A.ParentTourID>''
GO

