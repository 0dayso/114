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
-- Create date: 2010-07-15
-- Description:	�Ŷ�ά��(�Զ�ͣ�մ����Ƿ�������š������������)
-- =============================================
ALTER PROCEDURE [dbo].[SQLPlan_TourList_RecentLeave]
	@IsFirstTime CHAR(1)='0'
AS
BEGIN
	--��������������Ҫ���������š��������������ģ����
	DECLARE @tmptbl TABLE(TourId CHAR(36))
		
	IF(@IsFirstTime='0')
		INSERT INTO @tmptbl(TourId) SELECT ParentTourId FROM tbl_TourList WHERE IsRecentLeaveNoControl='1'
	ELSE
		INSERT INTO @tmptbl(TourId) SELECT Id FROM tbl_TourList WHERE ParentTourId=''
	
	--ģ���ű��
	DECLARE @TemplateTourId CHAR(36)

	DECLARE tmpcursor CURSOR
	FOR SELECT TourId FROM @tmptbl
	OPEN tmpcursor
	FETCH NEXT FROM tmpcursor INTO @TemplateTourId
	
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		--�Զ�ͣ�մ��� ���ֶ�ͣ���ֶ��������Զ�ͣ��
		UPDATE [tbl_TourList] SET TourState=3 WHERE [ParentTourID]=@TemplateTourId AND DATEADD(DAY,-[StopAcceptNum],[LeaveDate])<=GETDATE() AND TourState NOT IN(0,2)

		--���������ŵ��š�������ŵ�������
		EXECUTE proc_TourList_RecentLeave @TourId=@TemplateTourId,@IsParentTour=N'1'	

		FETCH NEXT FROM tmpcursor INTO @TemplateTourId
	END

	CLOSE tmpcursor
	DEALLOCATE tmpcursor
	
END
GO
