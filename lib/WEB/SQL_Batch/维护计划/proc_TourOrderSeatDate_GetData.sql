
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		���ĳ�
-- Create date: 2010-07-22
-- Description: ��������λ���ڵĶ���д����������ʱ��
-- =============================================
alter PROCEDURE proc_TourOrderSeatDate_GetData
AS
BEGIN
	
	--�����ʱ��
	DELETE FROM tbl_TourOrder_SeatDate
	--д������
	INSERT INTO tbl_TourOrder_SeatDate SELECT Id,SaveSeatDate FROM tbl_TourOrder WHERE IsDelete = '0' and OrderType = '0' AND datediff(dd,SaveSeatDate,getdate()) >= 0 AND OrderState = 2
	
END
GO