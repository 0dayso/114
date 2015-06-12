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
-- Create date: 2010-07-23
-- Description:	�߼���������
-- =============================================
CREATE PROCEDURE proc_SysApplyService_Renewed
	@ApplyId CHAR(36),--������
	@EnableTime DATETIME,--����ʱ��
	@ExpireTime DATETIME,--����ʱ��
	@RenewTime DATETIME,--����ʱ��
	@OperatorId INT,--������
	@RenewalId CHAR(36),--���ѱ��
	@Result INT OUTPUT--1:�ɹ� 0:ʧ�� 2:����ʱ�䲻��
AS
BEGIN	
	SET @Result=0
	DECLARE @ServiceType TINYINT--�߼��������� 1:�շ�MQ 2:�߼�����
	DECLARE @CompanyId CHAR(36)--�������˾���
	DECLARE @CEnableTime DATETIME--ԭ������ʼʱ��
	DECLARE @CExpireTime DATETIME--ԭ������ʱ��
	DECLARE @CheckText NVARCHAR(250)--���ͨ����Ϣ
	SELECT @CompanyId=CompanyId,@ServiceType=ServiceType,@CEnableTime=EnableTime,@CExpireTime=ExpireTime,@CheckText=CheckText FROM tbl_SysApplyService WHERE Id=@ApplyId

	IF ((@EnableTime BETWEEN @CEnableTime AND @CExpireTime) OR (@ExpireTime BETWEEN @CEnableTime AND @CExpireTime) OR (@ExpireTime<=GETDATE()) OR (@EnableTime>@ExpireTime))
	BEGIN
		--����ʱ����д����ȷ
		SET @Result=2
		RETURN @Result
	END

	DECLARE @IsRenewNow CHAR(1)--�Ƿ���������
	SET @IsRenewNow='0'

	IF(GETDATE() BETWEEN @EnableTime AND @ExpireTime)
	BEGIN
		SET @IsRenewNow='1'
	END

	DECLARE @errorCount INT
	SET @errorCount=0

	BEGIN TRAN

	IF(@IsRenewNow='1')
	BEGIN
		UPDATE tbl_SysApplyService SET EnableTime=@EnableTime,ExpireTime=@ExpireTime WHERE Id=@ApplyId
		SET @errorCount=@errorCount+@@ERROR
	END

	--д��������Ϣ
	INSERT INTO tbl_SysApplyServiceFee(Id,CompanyID,ApplyServiceId,EnableTime,ExpireTime,OperatorId) VALUES(@RenewalId,@CompanyId,@ApplyId,@EnableTime,@ExpireTime,@OperatorId)
	SET @errorCount=@errorCount+@@ERROR

	IF(@IsRenewNow='1')
	BEGIN
		IF(@ServiceType=1)--�շ�MQ����
		BEGIN			
			DELETE FROM tbl_CompanySetting WHERE CompanyId=@CompanyId AND FieldName='OperatorLimit'
			SET @errorCount=@errorCount+@@ERROR
			INSERT INTO tbl_CompanySetting(CompanyId,FieldName,FieldValue) VALUES(@CompanyId,'OperatorLimit',@CheckText)
			SET @errorCount=@errorCount+@@ERROR
		END
		ELSE IF(@ServiceType=2)--�߼���������
		BEGIN
			UPDATE [tbl_SysCompanyDomain] SET [IsDisabled]='0' WHERE CompanyId=@CompanyId AND Domain=@CheckText
			SET @errorCount=@errorCount+@@ERROR
		END
	END

	--�ύ����
	IF(@errorCount>0)
	BEGIN
		ROLLBACK TRAN
		SET @Result=0
	END
	ELSE
	BEGIN		
		COMMIT TRAN
		SET @Result=1
	END

	RETURN @Result
END
GO
