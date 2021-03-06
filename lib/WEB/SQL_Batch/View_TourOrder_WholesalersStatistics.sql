
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[View_TourOrder_WholesalersStatistics]
AS
SELECT     TourCompanyId,
                          (SELECT     CompanyName
                            FROM          tbl_CompanyInfo
                            WHERE      tbl_CompanyInfo.id = tbl_TourOrder.TourCompanyId) AS CompanyName,
                          (SELECT     AreaId, count(ID) AS ProduceNum
                            FROM          tbl_TourList
                            WHERE      tbl_TourList.CompanyID = tbl_TourOrder.TourCompanyId AND IsDelete = '0' AND IsChecked = '1' AND (ParentTourID is not null and len(ParentTourID) > 1)
                            GROUP BY AreaId
                            ORDER BY AreaId ASC FOR xml auto, root('root')) AS AreaIdAndProduceNum,
                          (SELECT     count(ID)
                            FROM          tbl_TourList
                            WHERE      tbl_TourList.CompanyID = tbl_TourOrder.TourCompanyId AND IsDelete = '0' AND IsChecked = '1' AND (ParentTourID is not null and len(ParentTourID) > 1)) AS ProduceNum,
                          (SELECT     count(id)
                            FROM          tbl_TourOrder AS a
                            WHERE      a.TourCompanyId = tbl_TourOrder.TourCompanyId AND a.OrderState = 4) AS NotAcceptedNum,
                          (SELECT     count(id)
                            FROM          tbl_TourOrder AS a
                            WHERE      a.TourCompanyId = tbl_TourOrder.TourCompanyId AND a.OrderState = 2) AS SaveSeatNum,
                          (SELECT     count(id)
                            FROM          tbl_TourOrder AS a
                            WHERE      a.TourCompanyId = tbl_TourOrder.TourCompanyId AND a.OrderState = 3) AS SaveSeatExpiredNum,
                          (SELECT     count(id)
                            FROM          tbl_TourOrder AS a
                            WHERE      a.TourCompanyId = tbl_TourOrder.TourCompanyId AND a.OrderState = 5) AS OrdainNum,
                          (SELECT     count(EventID)
                            FROM          tbl_LogUserLogin
                            WHERE      tbl_LogUserLogin.CompanyId = tbl_TourOrder.TourCompanyId AND tbl_LogUserLogin.EventCode = 1) AS LoginNum,
                          (SELECT     count(ID)
                            FROM          tbl_TourVisitInfo
                            WHERE      tbl_TourVisitInfo.VisitedCompanyId = tbl_TourOrder.TourCompanyId) AS VisitedNum
FROM         tbl_TourOrder
WHERE     IsDelete = '0'
GROUP BY TourCompanyId
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

SELECT * FROM tbl_tourlist WHERE id = '57ace365-ab28-48d9-9630-ea5840bf1c6b'