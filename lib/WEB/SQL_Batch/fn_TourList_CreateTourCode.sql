-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		����־
-- Create date: 2010-05-25
-- Description:	�����ź�
-- =============================================
ALTER FUNCTION fn_TourList_CreateTourCode
(
	--��˾���
	@CompanyId CHAR(36),
	--�ź�ǰ׺
	@Prefix NVARCHAR(50),
	--��������
	@LeaveDate DATETIME	
)
RETURNS NVARCHAR(200)
AS
BEGIN
	RETURN ISNULL(@Prefix,'')
		+CONVERT(VARCHAR(8),@LeaveDate,112)
		+dbo.fn_PadLeft(	(SELECT COUNT(*)+1 FROM tbl_TourList WHERE CompanyId=@CompanyId AND LeaveDate=@LeaveDate AND ParentTourID>''),0	,3)
END
GO