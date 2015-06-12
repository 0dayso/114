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
-- Create date: 2010-07-14
-- Description:	�жϹ���Ƿ���Ч
-- =============================================
ALTER PROCEDURE proc_SysAdv_IsValid
	@AdvId INT=0,--�����
	@PositionId INT,--λ�ñ��
	@StartDate DATETIME,--��ʼʱ��
	@EndDate DATETIME,--����ʱ��
	@Range TINYINT,--Ͷ�ŷ�Χ 0:��λ���� 1:ȫ�� 2:ʡ�� 3:����
	@Relation NVARCHAR(MAX)=NULL,--Ͷ�ŷ�Χ XML:<ROOT><RelationInfo RelationId="[ʡ��][����][��λ����]���"></ROOT> Ͷ�ŷ�ΧΪȫ��ʱ�������� ȫʡʱ����ʡ�ݱ�� ����ʱ�������б�� ��λ����ʱ������λ����
	@Result INT OUTPUT--��� 1:��Ч 0:��Ч
AS
BEGIN
	DECLARE @CurrentCount INT --��ǰ�������
	DECLARE @MaxCount INT --�������
	DECLARE @DisplayType TINYINT--������ʽ
	DECLARE @AdvType TINYINT--Ͷ������
	DECLARE @hdoc INT
	
	SELECT @MaxCount=ISNULL(AdvCount,0),@DisplayType=ISNULL(DisplayType,-1) FROM tbl_SysAdvArea WHERE AreaId=@PositionId

	IF(@DisplayType=-1)
	BEGIN
		SET @Result=0
		RETURN @Result
	END

	IF(@DisplayType=4)
	BEGIN
		SET @AdvType=2
	END
	ELSE
	BEGIN
		SET @AdvType=1
	END

	IF(@Range=1)--ȫ��
	BEGIN
		IF(@AdvId=0)
			SELECT @CurrentCount=COUNT(*) FROM tbl_SysAdv AS A WHERE ( (@StartDate BETWEEN A.StartDate AND A.EndDate) OR (@EndDate BETWEEN A.StartDate AND A.EndDate) ) AND A.AreaId=@PositionId
		ELSE
			SELECT @CurrentCount=COUNT(*) FROM tbl_SysAdv AS A WHERE ( (@StartDate BETWEEN A.StartDate AND A.EndDate) OR (@EndDate BETWEEN A.StartDate AND A.EndDate) ) AND Id<>@AdvId AND A.AreaId=@PositionId
	END
	ELSE IF(@Range=2)--ȫʡ
	BEGIN		
		EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@Relation
		--SELECT ID AS CityId INTO #TmpCity FROM tbl_SysCity WHERE ProvinceId IN(SELECT RelationId FROM OPENXML(@hdoc,'/ROOT/RelationInfo') WITH(RelationId INT))
		--EXECUTE sp_xml_removedocument @hdoc
		IF(@AdvId=0)
			SELECT @CurrentCount=COUNT(*) FROM tbl_SysAdv AS A WHERE ( (@StartDate BETWEEN A.StartDate AND A.EndDate) OR (@EndDate BETWEEN A.StartDate AND A.EndDate) ) 
				AND EXISTS(SELECT 1 FROM tbl_SysAdvAreaControl AS B WHERE B.AreaType=@AdvType AND B.AdvId=A.Id AND B.AreaId IN(SELECT ID FROM tbl_SysCity WHERE ProvinceId IN(SELECT RelationId FROM OPENXML(@hdoc,'/ROOT/RelationInfo') WITH(RelationId INT))))
				AND A.AreaId=@PositionId
		ELSE
			SELECT @CurrentCount=COUNT(*) FROM tbl_SysAdv AS A WHERE ( (@StartDate BETWEEN A.StartDate AND A.EndDate) OR (@EndDate BETWEEN A.StartDate AND A.EndDate) ) 
				AND EXISTS(SELECT 1 FROM tbl_SysAdvAreaControl AS B WHERE B.AreaType=@AdvType AND B.AdvId=A.Id AND B.AreaId IN(SELECT ID FROM tbl_SysCity WHERE ProvinceId IN(SELECT RelationId FROM OPENXML(@hdoc,'/ROOT/RelationInfo') WITH(RelationId INT)))) AND A.Id<>@AdvId
				AND A.AreaId=@PositionId
		EXECUTE sp_xml_removedocument @hdoc
		--DROP TABLE #TmpCity
	END
	ELSE IF(@Range=3)--����
	BEGIN
		EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@Relation
		IF(@AdvId=0)
			SELECT @CurrentCount=COUNT(*) FROM tbl_SysAdv AS A WHERE ( (@StartDate BETWEEN A.StartDate AND A.EndDate) OR (@EndDate BETWEEN A.StartDate AND A.EndDate) ) 
				AND EXISTS(SELECT 1 FROM tbl_SysAdvAreaControl AS B WHERE B.AreaType=@AdvType AND B.AdvId=A.Id AND B.AreaId IN(SELECT RelationId FROM OPENXML(@hdoc,'/ROOT/RelationInfo') WITH(RelationId INT)) )
				AND A.AreaId=@PositionId
		ELSE
			SELECT @CurrentCount=COUNT(*) FROM tbl_SysAdv AS A WHERE ( (@StartDate BETWEEN A.StartDate AND A.EndDate) OR (@EndDate BETWEEN A.StartDate AND A.EndDate) ) 
				AND EXISTS(SELECT 1 FROM tbl_SysAdvAreaControl AS B WHERE B.AreaType=@AdvType AND B.AdvId=A.Id AND B.AreaId IN(SELECT RelationId FROM OPENXML(@hdoc,'/ROOT/RelationInfo') WITH(RelationId INT)) ) AND A.Id<>@AdvId
				AND A.AreaId=@PositionId
		EXECUTE sp_xml_removedocument @hdoc
	END
	ELSE--��λ����
	BEGIN
		EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@Relation
		IF(@AdvId=0)
			SELECT @CurrentCount=COUNT(*) FROM tbl_SysAdv AS A WHERE ( (@StartDate BETWEEN A.StartDate AND A.EndDate) OR (@EndDate BETWEEN A.StartDate AND A.EndDate) ) 
				AND EXISTS(SELECT 1 FROM tbl_SysAdvAreaControl AS B WHERE B.AreaType=@AdvType AND B.AdvId=A.Id AND B.AreaId IN(SELECT RelationId FROM OPENXML(@hdoc,'/ROOT/RelationInfo') WITH(RelationId INT)) )
				AND A.AreaId=@PositionId
		ELSE
			SELECT @CurrentCount=COUNT(*) FROM tbl_SysAdv AS A WHERE ( (@StartDate BETWEEN A.StartDate AND A.EndDate) OR (@EndDate BETWEEN A.StartDate AND A.EndDate) ) 
				AND EXISTS(SELECT 1 FROM tbl_SysAdvAreaControl AS B WHERE B.AreaType=@AdvType AND B.AdvId=A.Id AND B.AreaId IN(SELECT RelationId FROM OPENXML(@hdoc,'/ROOT/RelationInfo') WITH(RelationId INT)) ) AND A.Id<>@AdvId
				AND A.AreaId=@PositionId
		EXECUTE sp_xml_removedocument @hdoc
	END

	IF(@CurrentCount<=@MaxCount AND @AdvId>0)
		SET @Result=1
    ELSE IF(@CurrentCount<@MaxCount AND @AdvId=0)
		SET @Result=1
	ELSE
		SET @Result=0

	RETURN @Result
END
GO

