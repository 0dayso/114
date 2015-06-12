-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		����־
-- Create date: 2010-07-17
-- Description:	�����Ŷ�����ά��
-- =============================================
ALTER PROCEDURE SQLPlan_SysCity_TourNumber
	
AS
BEGIN
	--���б��
	DECLARE @CityId INT
	--��������
	DECLARE @CityChildrenTourNumber INT
	--ģ��������
	DECLARE @CityTemplateTourNumber INT

	DECLARE tmpcursor CURSOR
	FOR SELECT Id FROM tbl_SysCity
	OPEN tmpcursor
	
	FETCH NEXT FROM tmpcursor INTO @CityId
	
	WHILE(@@FETCH_STATUS=0)
	BEGIN
		SELECT @CityTemplateTourNumber=COUNT(*) FROM tbl_TourList AS A
		WHERE A.LeaveDate>=GETDATE() AND A.IsDelete='0' AND A.IsRecentLeave='1'
		AND EXISTS(SELECT 1 FROM tbl_TourCityControl AS B WHERE B.TourId=A.Id AND B.CityId=@CityId)
		
		SELECT @CityChildrenTourNumber=COUNT(*) FROM tbl_TourList AS A
		WHERE A.LeaveDate>=GETDATE() AND IsDelete='0'
		AND EXISTS(SELECT 1 FROM tbl_TourCityControl AS B WHERE B.TourId=A.Id AND B.CityId=@CityId)
		
		UPDATE tbl_SysCity SET ParentTourCount=@CityTemplateTourNumber,TourCount=@CityChildrenTourNumber WHERE Id=@CityId
		
		FETCH NEXT FROM tmpcursor INTO @CityId
	END

	CLOSE tmpcursor
	DEALLOCATE tmpcursor
	
	--ȫ��ģ��������
	DECLARE @TemplateTourNumber INT
	SELECT @TemplateTourNumber=SUM(ParentTourCount) FROM tbl_SysCity
	UPDATE tbl_SysSummaryCount SET FieldValue=@TemplateTourNumber WHERE FieldName='Route'
END
GO