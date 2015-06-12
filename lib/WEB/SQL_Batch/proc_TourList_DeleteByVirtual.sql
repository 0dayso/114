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
-- Create date:	2010-07-23
-- Description:	����ɾ���Ŷ���Ϣ
-- =============================================
ALTER PROCEDURE proc_TourList_DeleteByVirtual
	@TourId CHAR(36),--�Ŷӱ��
	@IsDelete CHAR(1), --�Ƿ�ɾ��
	@CompanyId CHAR(36),--��˾���
	@Result INT OUTPUT--0:ʧ�� 1:�ɹ�
AS
BEGIN
	SET @Result=0

	DECLARE @IsParentTour CHAR(1)
	SET @IsParentTour='0'

	IF EXISTS(SELECT 1 FROM tbl_TourList WHERE Id=@TourId AND ParentTourId='')
	BEGIN
		SET @IsParentTour='1'
	END
	
	UPDATE  [tbl_TourList] SET [IsDelete]=@IsDelete
	WHERE ([Id]=@TourId OR [ParentTourID]=@TourId) AND CompanyId=@CompanyId AND NOT EXISTS(SELECT 1 FROM [tbl_TourOrder] AS B WHERE B.[TourId]=[tbl_TourList].[Id])

	IF(@@ROWCOUNT>0)
	BEGIN
		SET @Result=1
		EXECUTE proc_TourList_RecentLeave @TourId=@TourId,@IsParentTour=@IsParentTour
	END

	RETURN @Result
END
GO
