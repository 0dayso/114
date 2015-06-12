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
-- Description:	�޸Ĺ��
-- =============================================
ALTER PROCEDURE proc_SysAdv_UpdateAdv
	@AdvId INT,--�����
	@PositionId INT,--λ�ñ��
	@CategoryId TINYINT,--�����
	@Title NVARCHAR(250),--����
	@Remark NVARCHAR(MAX),--����
	@RedirectURL NVARCHAR(250),--���ӵ�ַ
	@ImgPath NVARCHAR(250)=NULL,--ͼƬ·��
	@CompanyId CHAR(36),--����λ���
	@CompanyName NVARCHAR(250),--����λ����
	@ContactInfo NVARCHAR(250),--��ϵ��ʽ
	@StartDate DATETIME,--��ʼʱ��
	@EndDate DATETIME,--����ʱ��
	@OperatorId INT,--�����˱��
	@OperatorName NVARCHAR(50),--����������
	@IssueTime DATETIME,--����ʱ��
	@Range TINYINT,--Ͷ�ŷ�Χ 0:��λ���� 1:ȫ�� 2:ʡ�� 3:����
	@Relation NVARCHAR(MAX)=NULL,--Ͷ�ŷ�Χ XML:<ROOT><RelationInfo RelationId="[ʡ��][����][��λ����]���"></ROOT> Ͷ�ŷ�ΧΪȫ��ʱ�������� ȫʡʱ����ʡ�ݱ�� ����ʱ�������б�� ��λ����ʱ������λ����
	@Result INT OUTPUT--��� 0:ʧ�� 1:�ɹ�
AS
BEGIN
	--�ж��Ƿ���Ч
	EXECUTE proc_SysAdv_IsValid @AdvId=@AdvId,@PositionId=@PositionId,@StartDate=@StartDate,@EndDate=@EndDate,@Range=@Range,@Relation=@Relation,@Result=@Result OUTPUT
	IF(@Result=0) RETURN @Result
	
	BEGIN TRANSACTION UpdateAdv
	DECLARE @errorCount INT
	SET @errorCount=0

	SET @CompanyId=ISNULL(@CompanyId,'')
	--���¹�������Ϣ
	UPDATE tbl_SysAdv SET AreaId=@PositionId,ClassId=@CategoryId,AdvDescript=@Title,AdvRemark=@Remark,AdvLink=@RedirectURL
		,CompanyId=@CompanyId,CompanyName=@CompanyName,ContactInfo=@ContactInfo,StartDate=@StartDate,EndDate=@EndDate
		,OperatorId=@OperatorId,OperatorName=@OperatorName,IssueTime=@IssueTime,AdvArea=@Range
	WHERE Id=@AdvId
	SET @errorCount=@errorCount+@@ERROR

	--���ͼƬ��Ϣ
	IF(@ImgPath IS NOT NULL)
	BEGIN
		DELETE FROM tbl_SysAdvImg WHERE AdvId=@AdvId
		INSERT INTO tbl_SysAdvImg(AdvId,AdvImg) VALUES(@AdvId,@ImgPath)
		SET @errorCount=@errorCount+@@ERROR
	END
	
	--����ϵ
	DECLARE @DisplayType TINYINT--չ����ʽ
	DECLARE @AdvType TINYINT--���Ͷ������ 1:���� 2:MQ
	SET @AdvType=1

	SELECT @DisplayType=ISNULL(DisplayType,-1) FROM tbl_SysAdvArea WHERE AreaId=@PositionId

	IF(@DisplayType=4)
	BEGIN
		SET @AdvType=2
	END
	ELSE
	BEGIN
		SET @AdvType=1
	END

	DECLARE @hdoc INT
	EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@Relation
	DECLARE @tmpRelation TABLE(RelationId INT)

	IF(@Range=1) --ȫ��
	BEGIN
		INSERT INTO @tmpRelation(RelationId) SELECT Id FROM  tbl_SysCity
	END
	ELSE IF(@Range=2)--ʡ��
	BEGIN
		INSERT INTO @tmpRelation(RelationId) SELECT ID FROM tbl_SysCity WHERE ProvinceId IN(SELECT RelationId FROM OPENXML(@hdoc,'/ROOT/RelationInfo') WITH(RelationId INT))
	END
	ELSE IF(@Range=3)--����
	BEGIN
		INSERT INTO @tmpRelation(RelationId) SELECT RelationId FROM OPENXML(@hdoc,'/ROOT/RelationInfo') WITH(RelationId INT)
	END
	ELSE--��λ����
	BEGIN
		INSERT INTO @tmpRelation(RelationId) SELECT RelationId FROM OPENXML(@hdoc,'/ROOT/RelationInfo') WITH(RelationId INT)
	END

	--д����Ӧ��ϵ ��ɾ������Ҫ�Ĺ�ϵ ��д��δ��д��Ĺ�ϵ
	DELETE FROM tbl_SysAdvAreaControl WHERE AdvId=@AdvId AND AreaType=@AdvType 
		AND AreaId NOT IN(SELECT RelationId FROM @tmpRelation)
	
	INSERT INTO tbl_SysAdvAreaControl(AdvId,AreaType,AreaId,SortId) 
	SELECT @AdvId,@AdvType,A.RelationId,0 FROM @tmpRelation AS A 
	WHERE A.RelationId NOT IN(SELECT AreaId FROM tbl_SysAdvAreaControl WHERE AreaType=@AdvType AND AdvId=@AdvId)

	SET @errorCount=@errorCount+@@ERROR
	
	--�ύ����
	IF(@errorCount>0)
	BEGIN
		ROLLBACK TRANSACTION UpdateAdv
		SET @Result=0
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION UpdateAdv
		SET @Result=1
	END

	RETURN @Result
END
GO
