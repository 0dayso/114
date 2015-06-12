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
-- Description:	�շ�MQ�������
-- =============================================
ALTER PROCEDURE proc_SysApplyService_MQChecked
	@ApplyId CHAR(36),--������
	@EnableTime DATETIME,--����ʱ��
	@ExpireTime DATETIME,--����ʱ��
	@ApplyState TINYINT,--���״̬ 1:ͨ�� 2:��ͨ��
	@CheckTime DATETIME,--���ʱ��
	@OperatorId INT,--�����
	@SubAccountNumber INT,--���˺�����
	@RenewalId CHAR(36),--���ѱ��
	@Result INT OUTPUT--1:�ɹ� 0:ʧ��
AS
BEGIN	
	DECLARE @CEnableTime DATETIME--ԭ����ʱ��
	DECLARE @CExpireTime DATETIME--ԭ����ʱ��
	DECLARE @CApplyState TINYINT--ԭ���״̬
	DECLARE @CompanyId CHAR(36)--�����˹�˾���

	DECLARE @OperatorLimit INT
	SET @OperatorLimit=0

	IF(GETDATE()  BETWEEN @EnableTime AND @ExpireTime )	
	BEGIN
		SET @OperatorLimit=@SubAccountNumber
	END

	SELECT @CApplyState=ApplyState,@CEnableTime=EnableTime,@CExpireTime=ExpireTime,@CompanyId=CompanyId FROM tbl_SysApplyService WHERE Id=@ApplyId

	DECLARE @errorCount INT	
	SET @errorCount=0

	IF(@CApplyState=0)--��˲���
	BEGIN
		IF(@ApplyState=1)--ͨ�����
		BEGIN

			BEGIN TRAN
			--д�������Ϣ
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=CAST(@SubAccountNumber AS NVARCHAR(250)),CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			SET @errorCount=@errorCount+@@ERROR
			--д��������Ϣ
			INSERT INTO tbl_SysApplyServiceFee(Id,CompanyID,ApplyServiceId,EnableTime,ExpireTime,OperatorID) VALUES(@RenewalId,@CompanyId,@ApplyId,@EnableTime,@ExpireTime,@OperatorId)
			SET @errorCount=@errorCount+@@ERROR
			--���˺���������
			DELETE FROM tbl_CompanySetting WHERE CompanyId=@CompanyId AND FieldName='OperatorLimit'
			SET @errorCount=@errorCount+@@ERROR
			INSERT INTO tbl_CompanySetting(CompanyId,FieldName,FieldValue) VALUES(@CompanyId,'OperatorLimit',@OperatorLimit)
			SET @errorCount=@errorCount+@@ERROR
			--д�빫˾�Ѿ���ͨ���շ���Ŀ
			INSERT INTO tbl_CompanyPayService(CompanyId,ServiceId,IsEnabled) VALUES(@CompanyId,1,CASE @OperatorLimit WHEN 0 THEN '0' ELSE '1' END )
			SET @errorCount=@errorCount+@@ERROR	

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
		END
		ELSE
		BEGIN
			--���������Ϣ
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=CAST(@SubAccountNumber AS NVARCHAR(250)),CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			SET @Result=1
		END	
	END
	ELSE--����޸Ĳ���
	BEGIN
		IF(@ApplyState=1)--ͨ�����
		BEGIN

			BEGIN TRAN
			--д�������Ϣ
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=CAST(@SubAccountNumber AS NVARCHAR(250)),CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			SET @errorCount=@errorCount+@@ERROR
			--����������Ϣ
			IF EXISTS(SELECT 1 FROM tbl_SysApplyServiceFee WHERE CompanyId=@CompanyId AND ApplyServiceId=@ApplyId AND EnableTime=@CEnableTime AND ExpireTime=@CExpireTime)
			BEGIN
				UPDATE  tbl_SysApplyServiceFee SET EnableTime=@EnableTime,ExpireTime=@ExpireTime WHERE CompanyId=@CompanyId AND ApplyServiceId=@ApplyId AND EnableTime=@CEnableTime AND ExpireTime=@CExpireTime
				SET @errorCount=@errorCount+@@ERROR
			END
			ELSE
			BEGIN
				INSERT INTO tbl_SysApplyServiceFee(Id,CompanyID,ApplyServiceId,EnableTime,ExpireTime,OperatorId) VALUES(@RenewalId,@CompanyId,@ApplyId,@EnableTime,@ExpireTime,@OperatorId)
				SET @errorCount=@errorCount+@@ERROR
			END
			--���˺���������
			DELETE FROM tbl_CompanySetting WHERE CompanyId=@CompanyId AND FieldName='OperatorLimit'
			SET @errorCount=@errorCount+@@ERROR
			INSERT INTO tbl_CompanySetting(CompanyId,FieldName,FieldValue) VALUES(@CompanyId,'OperatorLimit',@OperatorLimit)
			SET @errorCount=@errorCount+@@ERROR
			--��˾�Ѿ���ͨ���շ���Ŀ����
			DELETE FROM tbl_CompanyPayService WHERE CompanyId=@CompanyId AND ServiceId=1
			SET @errorCount=@errorCount+@@ERROR	
			INSERT INTO tbl_CompanyPayService(CompanyId,ServiceId,IsEnabled) VALUES(@CompanyId,1,CASE @OperatorLimit WHEN 0 THEN '0' ELSE '1' END )
			SET @errorCount=@errorCount+@@ERROR	


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
		END
		ELSE
		BEGIN
			BEGIN TRAN			
			--���������Ϣ
			--UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckTime=@CheckTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=CAST(@SubAccountNumber AS NVARCHAR(250)),CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			SET @errorCount=@errorCount+@@ERROR
			--ɾ��������Ϣ
			DELETE FROM tbl_SysApplyServiceFee WHERE CompanyId=@CompanyId  AND ApplyServiceId=@ApplyId AND EnableTime=@CEnableTime AND ExpireTime=@CExpireTime
			--���˺���������
			DELETE FROM tbl_CompanySetting WHERE CompanyId=@CompanyId AND FieldName='OperatorLimit'
			SET @errorCount=@errorCount+@@ERROR
			--�ѿ�ͨ������
			UPDATE tbl_CompanyPayService SET IsEnabled='0' WHERE CompanyId=@CompanyId AND ServiceId=1
			SET @errorCount=@errorCount+@@ERROR

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
		END	
	END

	RETURN @Result	
END
GO

-- =============================================
-- Author:		����־
-- Create date: 2010-07-23
-- Description:	�շ�MQ�������
-- =============================================
ALTER PROCEDURE [dbo].[proc_SysApplyService_MQChecked]
	@ApplyId CHAR(36),--������
	@EnableTime DATETIME,--����ʱ��
	@ExpireTime DATETIME,--����ʱ��
	@ApplyState TINYINT,--���״̬ 1:ͨ�� 2:��ͨ��
	@CheckTime DATETIME,--���ʱ��
	@OperatorId INT,--�����
	@SubAccountNumber INT,--���˺�����
	@RenewalId CHAR(36),--���ѱ��
	@Result INT OUTPUT--1:�ɹ� 0:ʧ��
AS
BEGIN	
	DECLARE @CEnableTime DATETIME--ԭ����ʱ��
	DECLARE @CExpireTime DATETIME--ԭ����ʱ��
	DECLARE @CApplyState TINYINT--ԭ���״̬
	DECLARE @CompanyId CHAR(36)--�����˹�˾���
	DECLARE @IsEnabled CHAR(1)
	DECLARE @OperatorLimit INT
	SET @OperatorLimit=0
	SET @IsEnabled='0'

	IF(GETDATE()  BETWEEN @EnableTime AND @ExpireTime )	
	BEGIN
		SET @OperatorLimit=@SubAccountNumber
		SET @IsEnabled='1'
	END

	SELECT @CApplyState=ApplyState,@CEnableTime=EnableTime,@CExpireTime=ExpireTime,@CompanyId=CompanyId FROM tbl_SysApplyService WHERE Id=@ApplyId

	DECLARE @errorCount INT	
	SET @errorCount=0

	IF(@CApplyState=0)--��˲���
	BEGIN
		IF(@ApplyState=1)--ͨ�����
		BEGIN

			BEGIN TRAN
			--д�������Ϣ
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=CAST(@SubAccountNumber AS NVARCHAR(250)),CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			SET @errorCount=@errorCount+@@ERROR
			--д��������Ϣ
			INSERT INTO tbl_SysApplyServiceFee(Id,CompanyID,ApplyServiceId,EnableTime,ExpireTime,OperatorID) VALUES(@RenewalId,@CompanyId,@ApplyId,@EnableTime,@ExpireTime,@OperatorId)
			SET @errorCount=@errorCount+@@ERROR
			--���˺���������
			DELETE FROM tbl_CompanySetting WHERE CompanyId=@CompanyId AND FieldName='OperatorLimit'
			SET @errorCount=@errorCount+@@ERROR
			INSERT INTO tbl_CompanySetting(CompanyId,FieldName,FieldValue) VALUES(@CompanyId,'OperatorLimit',@OperatorLimit)
			SET @errorCount=@errorCount+@@ERROR
			--д�빫˾�Ѿ���ͨ���շ���Ŀ
			INSERT INTO tbl_CompanyPayService(CompanyId,ServiceId,IsEnabled) VALUES(@CompanyId,1,@IsEnabled)
			SET @errorCount=@errorCount+@@ERROR	

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
		END
		ELSE
		BEGIN
			--���������Ϣ
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=CAST(@SubAccountNumber AS NVARCHAR(250)),CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			SET @Result=1
		END	
	END
	ELSE--����޸Ĳ���
	BEGIN
		IF(@ApplyState=1)--ͨ�����
		BEGIN

			BEGIN TRAN
			--д�������Ϣ
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=CAST(@SubAccountNumber AS NVARCHAR(250)),CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			SET @errorCount=@errorCount+@@ERROR
			--����������Ϣ
			IF EXISTS(SELECT 1 FROM tbl_SysApplyServiceFee WHERE CompanyId=@CompanyId AND ApplyServiceId=@ApplyId AND EnableTime=@CEnableTime AND ExpireTime=@CExpireTime)
			BEGIN
				UPDATE  tbl_SysApplyServiceFee SET EnableTime=@EnableTime,ExpireTime=@ExpireTime WHERE CompanyId=@CompanyId AND ApplyServiceId=@ApplyId AND EnableTime=@CEnableTime AND ExpireTime=@CExpireTime
				SET @errorCount=@errorCount+@@ERROR
			END
			ELSE
			BEGIN
				INSERT INTO tbl_SysApplyServiceFee(Id,CompanyID,ApplyServiceId,EnableTime,ExpireTime,OperatorId) VALUES(@RenewalId,@CompanyId,@ApplyId,@EnableTime,@ExpireTime,@OperatorId)
				SET @errorCount=@errorCount+@@ERROR
			END
			--���˺���������
			DELETE FROM tbl_CompanySetting WHERE CompanyId=@CompanyId AND FieldName='OperatorLimit'
			SET @errorCount=@errorCount+@@ERROR
			INSERT INTO tbl_CompanySetting(CompanyId,FieldName,FieldValue) VALUES(@CompanyId,'OperatorLimit',@OperatorLimit)
			SET @errorCount=@errorCount+@@ERROR
			--��˾�Ѿ���ͨ���շ���Ŀ����
			DELETE FROM tbl_CompanyPayService WHERE CompanyId=@CompanyId AND ServiceId=1
			SET @errorCount=@errorCount+@@ERROR	
			INSERT INTO tbl_CompanyPayService(CompanyId,ServiceId,IsEnabled) VALUES(@CompanyId,1, @IsEnabled)
			SET @errorCount=@errorCount+@@ERROR	


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
		END
		ELSE
		BEGIN
			BEGIN TRAN			
			--���������Ϣ
			--UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckTime=@CheckTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=CAST(@SubAccountNumber AS NVARCHAR(250)),CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			SET @errorCount=@errorCount+@@ERROR
			--ɾ��������Ϣ
			DELETE FROM tbl_SysApplyServiceFee WHERE CompanyId=@CompanyId  AND ApplyServiceId=@ApplyId AND EnableTime=@CEnableTime AND ExpireTime=@CExpireTime
			--���˺���������
			DELETE FROM tbl_CompanySetting WHERE CompanyId=@CompanyId AND FieldName='OperatorLimit'
			SET @errorCount=@errorCount+@@ERROR
			--�ѿ�ͨ������
			UPDATE tbl_CompanyPayService SET IsEnabled='0' WHERE CompanyId=@CompanyId AND ServiceId=1
			SET @errorCount=@errorCount+@@ERROR

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
		END	
	END

	RETURN @Result	
END
GO

