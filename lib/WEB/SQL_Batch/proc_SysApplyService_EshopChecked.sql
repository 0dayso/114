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
-- Description:	�߼������������
-- =============================================
ALTER PROCEDURE proc_SysApplyService_EshopChecked
	@ApplyId CHAR(36),--������
	@EnableTime DATETIME,--����ʱ��
	@ExpireTime DATETIME,--����ʱ��
	@ApplyState TINYINT,--���״̬ 1:ͨ�� 2:��ͨ��
	@CheckTime DATETIME,--���ʱ��
	@OperatorId INT,--�����
	@DomainName CHAR(255),--ͨ��������
	@RenewalId CHAR(36),--���ѱ��
	@Result INT OUTPUT--1:�ɹ� 0:ʧ�� 2:�����ظ�
AS
BEGIN	
	DECLARE @CEnableTime DATETIME--ԭ����ʱ��
	DECLARE @CExpireTime DATETIME--ԭ����ʱ��
	DECLARE @CApplyState TINYINT--ԭ���״̬
	DECLARE @CDomainName NVARCHAR(255)--ԭ���ͨ������
	DECLARE @CompanyId CHAR(36)--�����˹�˾���

	DECLARE @CompanyType TINYINT--��˾����
	DECLARE @CompanyName NVARCHAR(250)--��˾����
	DECLARE @IsDisabled CHAR(1)--�����Ƿ����
	DECLARE @DomainType TINYINT--��������
	SET @IsDisabled='1'
	SET @DomainType=1

	IF(GETDATE()  BETWEEN @EnableTime AND @ExpireTime )	
	BEGIN
		SET @IsDisabled='0'
	END

	--PRINT @IsDisabled

	SELECT @CApplyState=ApplyState,@CEnableTime=EnableTime,@CExpireTime=ExpireTime,@CDomainName=CheckText,@CompanyId=CompanyId FROM tbl_SysApplyService WHERE Id=@ApplyId
	SELECT @CompanyType=CompanyType,@CompanyName=CompanyName FROM tbl_CompanyInfo WHERE Id=@CompanyId	

	DECLARE @errorCount INT	
	SET @errorCount=0

	IF(@CApplyState=0)--��˲���
	BEGIN
		IF(@ApplyState=1)--ͨ�����
		BEGIN			
			IF EXISTS(SELECT 1 FROM tbl_SysCompanyDomain WHERE Domain=@DomainName)--�����ظ��ж�
			BEGIN
				SET @Result=2
				RETURN @Result
			END

			BEGIN TRAN
			--д�������Ϣ
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=@DomainName,CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			SET @errorCount=@errorCount+@@ERROR
			--д��������Ϣ
			INSERT INTO tbl_SysApplyServiceFee(Id,CompanyID,ApplyServiceId,EnableTime,ExpireTime,OperatorId) VALUES(@RenewalId,@CompanyId,@ApplyId,@EnableTime,@ExpireTime,@OperatorId)
			SET @errorCount=@errorCount+@@ERROR
			--д��������Ϣ				
			INSERT INTO [tbl_SysCompanyDomain] ([CompanyId],[CompanyType],[CompanyName],[Domain],[DomainType],[GoToUrl],[IssueTime],[IsDisabled])
			VALUES(@CompanyId,@CompanyType,@CompanyName,@DomainName,@DomainType,'',GETDATE(),@IsDisabled)
			SET @errorCount=@errorCount+@@ERROR	
			--д�빫˾�Ѿ���ͨ���շ���Ŀ
			INSERT INTO tbl_CompanyPayService(CompanyId,ServiceId,IsEnabled) VALUES(@CompanyId,2,CASE @IsDisabled WHEN '0' THEN '1' ELSE '0' END )
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
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=@DomainName,CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			SET @Result=1
		END	
	END
	ELSE--����޸Ĳ���
	BEGIN
		IF(@ApplyState=1)--ͨ�����
		BEGIN			
			IF (@DomainName<>@CDomainName AND EXISTS(SELECT 1 FROM tbl_SysCompanyDomain WHERE Domain=@DomainName))--�����ظ��ж�
			BEGIN
				SET @Result=2
				RETURN @Result
			END

			BEGIN TRAN
			--д�������Ϣ
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=@DomainName,CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
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
			--������Ϣ
			IF EXISTS(SELECT 1 FROM [tbl_SysCompanyDomain] WHERE CompanyId=@CompanyId AND Domain=@CDomainName)
			BEGIN
				UPDATE [tbl_SysCompanyDomain] SET [Domain]=@DomainName,[IsDisabled]=@IsDisabled WHERE CompanyId=@CompanyId AND Domain=@CDomainName
				SET @errorCount=@errorCount+@@ERROR
			END
			ELSE
			BEGIN				
				INSERT INTO [tbl_SysCompanyDomain] ([CompanyId],[CompanyType],[CompanyName],[Domain],[DomainType],[GoToUrl],[IssueTime],[IsDisabled])
				VALUES(@CompanyId,@CompanyType,@CompanyName,@DomainName,@DomainType,'',GETDATE(),@IsDisabled)
				SET @errorCount=@errorCount+@@ERROR
			END
			--��˾�Ѿ���ͨ���շ���Ŀ
			DELETE FROM tbl_CompanyPayService WHERE CompanyId=@CompanyId AND ServiceId=2
			SET @errorCount=@errorCount+@@ERROR
			INSERT INTO tbl_CompanyPayService(CompanyId,ServiceId,IsEnabled) VALUES(@CompanyId,2,CASE @IsDisabled WHEN '0' THEN '1' ELSE '0' END)
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
			--�����Ϣ����
			--UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckTime=@CheckTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=@DomainName,CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			SET @errorCount=@errorCount+@@ERROR
			--������Ϣ����
			DELETE FROM tbl_SysApplyServiceFee WHERE CompanyId=@CompanyId  AND ApplyServiceId=@ApplyId AND EnableTime=@CEnableTime AND ExpireTime=@CExpireTime
			SET @errorCount=@errorCount+@@ERROR
			--������Ϣ����
			UPDATE [tbl_SysCompanyDomain] SET [IsDisabled]='1' WHERE CompanyId=@CompanyId AND [Domain]=@CDomainName
			SET @errorCount=@errorCount+@@ERROR
			--�ѿ�ͨ������
			UPDATE tbl_CompanyPayService SET IsEnabled='0' WHERE CompanyId=@CompanyId AND ServiceId=2
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
-- Description:	�߼������������
-- =============================================
ALTER PROCEDURE [dbo].[proc_SysApplyService_EshopChecked]
	@ApplyId CHAR(36),--������
	@EnableTime DATETIME,--����ʱ��
	@ExpireTime DATETIME,--����ʱ��
	@ApplyState TINYINT,--���״̬ 1:ͨ�� 2:��ͨ��
	@CheckTime DATETIME,--���ʱ��
	@OperatorId INT,--�����
	@DomainName NVARCHAR(250),--ͨ��������
	@RenewalId CHAR(36),--���ѱ��
	@Result INT OUTPUT--1:�ɹ� 0:ʧ�� 2:�����ظ�
AS
BEGIN	
	DECLARE @CEnableTime DATETIME--ԭ����ʱ��
	DECLARE @CExpireTime DATETIME--ԭ����ʱ��
	DECLARE @CApplyState TINYINT--ԭ���״̬
	DECLARE @CDomainName NVARCHAR(255)--ԭ���ͨ������
	DECLARE @CompanyId CHAR(36)--�����˹�˾���

	DECLARE @CompanyType TINYINT--��˾����
	DECLARE @CompanyName NVARCHAR(250)--��˾����
	DECLARE @IsDisabled CHAR(1)--�����Ƿ����
	DECLARE @DomainType TINYINT--��������
	SET @IsDisabled='1'
	SET @DomainType=1

	IF(GETDATE()  BETWEEN @EnableTime AND @ExpireTime )	
	BEGIN
		SET @IsDisabled='0'
	END

	--PRINT @IsDisabled

	SELECT @CApplyState=ApplyState,@CEnableTime=EnableTime,@CExpireTime=ExpireTime,@CDomainName=CheckText,@CompanyId=CompanyId FROM tbl_SysApplyService WHERE Id=@ApplyId
	SELECT @CompanyType=CompanyType,@CompanyName=CompanyName FROM tbl_CompanyInfo WHERE Id=@CompanyId	

	DECLARE @errorCount INT	
	SET @errorCount=0

	IF(@CApplyState=0)--��˲���
	BEGIN
		IF(@ApplyState=1)--ͨ�����
		BEGIN			
			IF (@DomainName<>'' AND @DomainName IS NOT NULL AND EXISTS(SELECT 1 FROM tbl_SysCompanyDomain WHERE Domain=@DomainName))--�����ظ��ж�
			BEGIN
				SET @Result=2
				RETURN @Result
			END

			BEGIN TRAN
			--д�������Ϣ
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=@DomainName,CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			SET @errorCount=@errorCount+@@ERROR
			--д��������Ϣ
			INSERT INTO tbl_SysApplyServiceFee(Id,CompanyID,ApplyServiceId,EnableTime,ExpireTime,OperatorId) VALUES(@RenewalId,@CompanyId,@ApplyId,@EnableTime,@ExpireTime,@OperatorId)
			SET @errorCount=@errorCount+@@ERROR
			--д��������Ϣ
			IF(@DomainName<>'' AND @DomainName IS NOT NULL)	
			BEGIN
				INSERT INTO [tbl_SysCompanyDomain] ([CompanyId],[CompanyType],[CompanyName],[Domain],[DomainType],[GoToUrl],[IssueTime],[IsDisabled])
				VALUES(@CompanyId,@CompanyType,@CompanyName,@DomainName,@DomainType,'',GETDATE(),@IsDisabled)
				SET @errorCount=@errorCount+@@ERROR	
			END
			--д�빫˾�Ѿ���ͨ���շ���Ŀ
			INSERT INTO tbl_CompanyPayService(CompanyId,ServiceId,IsEnabled) VALUES(@CompanyId,2,CASE @IsDisabled WHEN '0' THEN '1' ELSE '0' END )
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
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=@DomainName,CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			SET @Result=1
		END	
	END
	ELSE--����޸Ĳ���
	BEGIN
		IF(@ApplyState=1)--ͨ�����
		BEGIN			
			IF (@DomainName<>'' AND @DomainName IS NOT NULL AND @DomainName<>@CDomainName AND EXISTS(SELECT 1 FROM tbl_SysCompanyDomain WHERE Domain=@DomainName))--�����ظ��ж�
			BEGIN
				SET @Result=2
				RETURN @Result
			END

			BEGIN TRAN
			--д�������Ϣ
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=@DomainName,CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
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
			--������Ϣ
			IF(@DomainName<>'' AND @DomainName IS NOT NULL)
			BEGIN
				IF EXISTS(SELECT 1 FROM [tbl_SysCompanyDomain] WHERE CompanyId=@CompanyId AND Domain=@CDomainName)
				BEGIN
					UPDATE [tbl_SysCompanyDomain] SET [Domain]=@DomainName,[IsDisabled]=@IsDisabled WHERE CompanyId=@CompanyId AND Domain=@CDomainName
					SET @errorCount=@errorCount+@@ERROR
				END
				ELSE
				BEGIN				
					INSERT INTO [tbl_SysCompanyDomain] ([CompanyId],[CompanyType],[CompanyName],[Domain],[DomainType],[GoToUrl],[IssueTime],[IsDisabled])
					VALUES(@CompanyId,@CompanyType,@CompanyName,@DomainName,@DomainType,'',GETDATE(),@IsDisabled)
					SET @errorCount=@errorCount+@@ERROR
				END
			END
			ELSE
			BEGIN
				DELETE FROM [tbl_SysCompanyDomain] WHERE CompanyId=@CompanyId AND Domain=@CDomainName
			END
			--��˾�Ѿ���ͨ���շ���Ŀ
			DELETE FROM tbl_CompanyPayService WHERE CompanyId=@CompanyId AND ServiceId=2
			SET @errorCount=@errorCount+@@ERROR
			INSERT INTO tbl_CompanyPayService(CompanyId,ServiceId,IsEnabled) VALUES(@CompanyId,2,CASE @IsDisabled WHEN '0' THEN '1' ELSE '0' END)
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
			--�����Ϣ����
			--UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckTime=@CheckTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			UPDATE tbl_SysApplyService SET ApplyState=@ApplyState,CheckText=@DomainName,CheckTime=@CheckTime,EnableTime=@EnableTime,ExpireTime=@ExpireTime,OperatorId=@OperatorId WHERE Id=@ApplyId
			SET @errorCount=@errorCount+@@ERROR
			--������Ϣ����
			DELETE FROM tbl_SysApplyServiceFee WHERE CompanyId=@CompanyId  AND ApplyServiceId=@ApplyId AND EnableTime=@CEnableTime AND ExpireTime=@CExpireTime
			SET @errorCount=@errorCount+@@ERROR
			--������Ϣ����
			UPDATE [tbl_SysCompanyDomain] SET [IsDisabled]='1' WHERE CompanyId=@CompanyId AND [Domain]=@CDomainName
			SET @errorCount=@errorCount+@@ERROR
			--�ѿ�ͨ������
			UPDATE tbl_CompanyPayService SET IsEnabled='0' WHERE CompanyId=@CompanyId AND ServiceId=2
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
