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
-- Create date: 2010-05-20
-- Description:	�޸��Ŷ���Ϣ(ģ����)
-- =============================================
ALTER PROCEDURE proc_TourList_UpdateTemplateTourInfo
	@TemplateTourId CHAR(36),--ģ���ű��
	@CompanyId CHAR(36),--��˾���
	@CompanyName NVARCHAR(250),--��˾����
	@IsCompanyCheck CHAR(1),--��˾�Ƿ�ͨ�����
	@TourType TINYINT,--�Ŷ�����
	@RouteName NVARCHAR(250),--��·����
	@TourDays INT,--�Ŷ�����
	@AreaId INT,--��·������
	@AreaType TINYINT,--��·��������	
	@PlanPeopleCount INT,--�ƻ�����
	@ReleaseType CHAR(1),--�Ŷӷ�������		
	@AutoOffDays INT,--�Զ�ͣ��ʱ��(��λ:��)
	@LeaveTraffic NVARCHAR(500)=NULL,--������ͨ(��ͨ����)
	@BackTraffic NVARCHAR(500)=NULL,--���̽�ͨ	
	@SendContactName NVARCHAR(150)=NULL,--������
	@SendContactTel NVARCHAR(100)=NULL,--���ŵ绰
	@UrgentContactName NVARCHAR(150)=NULL,--������ϵ��
	@UrgentContactTel NVARCHAR(100)=NULL,--������ϵ�绰	
	@OperatorID CHAR(36),--����Ա���
	@TourContact NVARCHAR(100),--�ŶӸ�����
	@TourContactTel NVARCHAR(100),--�ŶӸ����˵绰
	@TourContactMQ NVARCHAR(20),--�ŶӸ�����MQ
	@TourContactUserName NVARCHAR(100),--�ŶӸ������û���	
	@MeetTourContect NVARCHAR(250)=NULL,--���ŷ�ʽ
	@CollectionContect NVARCHAR(250)=NULL,--���Ϸ�ʽ
	@StandardPlanError INT=0,--�г��Ƿ��쳣(�ٷ���)
	@TourPriceError INT=0,--�۸��Ƿ��쳣(�ٷ���)	
	@ResideContent NVARCHAR(500)=NULL,--ס��(������Ŀ)	
	@DinnerContent NVARCHAR(500)=NULL,--�ò�(������Ŀ)	
	@SightContent NVARCHAR(500)=NULL,--����(������Ŀ)	
	@CarContent NVARCHAR(500)=NULL,--�ó�(������Ŀ)	
	@GuideContent NVARCHAR(500)=NULL,--����(������Ŀ)	
	@TrafficContent NVARCHAR(500)=NULL,--������ͨ(������Ŀ)	
	@IncludeOtherContent NVARCHAR(500)=NULL,--������Ŀ��������(������Ŀ)	
	@NotContainService NVARCHAR(500)=NULL,--��������Ŀ (�ϲ���������Ŀ���Է���Ŀ����ͯ���š����ﰲ�š�������Ŀ��ע������)	
	@SpeciallyNotice NVARCHAR(500)=NULL,--��ܰ����
	@LeaveCity INT,--���۳���
	@SaleCity NVARCHAR(MAX),--���۳��� XML:<ROOT><SaleCityInfo  CityId="���۳��б�� INT" /></ROOT>
	@RouteTheme NVARCHAR(MAX),--��·���� XML:<ROOT><ThemeInfo ThemeId="������ INT" /></ROOT>
	@PriceDetail NVARCHAR(MAX),--������Ϣ XML:<ROOT><PriceInfo AdultPrice="���˼�|ͬ�м۸� MONEY" ChildrenPrice="��ͯ��|���м� MONEY" PriceStandId="���۱�׼��� CHAR(36)" CustomerLevelId="�ͻ��ȼ���� 0:ͬ�� 1:���� 2:������"  RowMark="���۵ȼ��б�ʶ TINYINT" /></ROOT>
	@StandardPlan NVARCHAR(MAX)=NULL,--��׼�������г���Ϣ XML:<ROOT><PlanInfo PlanId="�г̱�� CHAR(36)" PlanInterval="�г����� NVARCHAR(50)" Vehicle="��ͨ���� NVARCHAR(50)" TrafficNumber="��� NVARCHAR(50)" House="ס�� NVARCHAR(50)" Dinner="�ò� NVARCHAR(50)" PlanContent="�г����� NVARCHAR(2000)" PlanDay="�ڼ����г� INT"  /></ROOT>
	@LocalTravelAgency NVARCHAR(MAX)=NULL,--�ؽ�����Ϣ XML:<ROOT><AgencyInfo AgencyId="" AgencyName="" License="" Telephone=""  /></ROOT>
	@QuickPlan NVARCHAR(MAX)=NULL,--���ٷ������г�����
	@Result INT OUTPUT--�������
AS
BEGIN	
	SET @Result=0
	--��Ӫ��λ��Ϣ����
	DECLARE @UnitCompanyId CHAR(36)--��Ӫ��λ���
	
	--������Ϣ(ͬ�м��е���ͼ�)
	DECLARE @PersonalPrice MONEY --���˼�
	DECLARE @ChildPrice MONEY --��ͯ��
	DECLARE @RealPrice MONEY --������ͬ�м�
	DECLARE @MarketPrice MONEY --���������м�
	DECLARE @RetailAdultPrice MONEY --���г��˼�
	DECLARE @RetailChildrenPrice MONEY --���ж�ͯ��

	DECLARE @hdoc INT
	EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@PriceDetail

	SELECT @PersonalPrice=SUM(CASE WHEN C.CustomerLevelId=0  THEN C.AdultPrice ELSE 0 END)
		,@ChildPrice=SUM(CASE WHEN C.CustomerLevelId=0  THEN C.ChildrenPrice ELSE 0 END)
		,@RealPrice=SUM(CASE WHEN C.CustomerLevelId=2  THEN C.AdultPrice ELSE 0 END)
		,@MarketPrice=SUM(CASE WHEN C.CustomerLevelId=2  THEN C.ChildrenPrice ELSE 0 END)
		,@RetailAdultPrice=SUM(CASE WHEN C.CustomerLevelId=1 THEN C.AdultPrice ELSE 0 END)
		,@RetailChildrenPrice=SUM(CASE WHEN C.CustomerLevelId=1 THEN C.ChildrenPrice ELSE 0 END)
	FROM (SELECT B.AdultPrice,B.ChildrenPrice,B.CustomerLevelId,B.PriceStandId FROM OPENXML(@hdoc,'/ROOT/PriceInfo')
					WITH(AdultPrice MONEY,ChildrenPrice MONEY,PriceStandId CHAR(36),CustomerLevelId INT) AS B WHERE B.PriceStandId=(SELECT TOP 1 A.PriceStandId FROM OPENXML(@hdoc,'/ROOT/PriceInfo')
						WITH(AdultPrice MONEY,ChildrenPrice MONEY,PriceStandId CHAR(36),CustomerLevelId INT) AS A
						WHERE A.CustomerLevelId=0 ORDER BY A.AdultPrice ASC)
	) AS C
	GROUP BY C.PriceStandId
	EXECUTE sp_xml_removedocument @hdoc
	
	BEGIN TRANSACTION UpdateStandardTourInfo
	DECLARE @errorCount INT
	SET @errorCount=0

	--����ģ������Ϣ
	UPDATE [tbl_TourList] SET
		 [UnitCompanyId]=@UnitCompanyId,[CompanyName]=@CompanyName,[RouteName]=@RouteName
		,[TourDays]=@TourDays
		,[RouteType]=@AreaType,[AreaId]=@AreaId
		,[LeaveTraffic]=@LeaveTraffic,[BackTraffic]=@BackTraffic,[PlanPeopleCount]=@PlanPeopleCount
		,[SendContactName]=@SendContactName,[SendContactTel]=@SendContactTel,[UrgentContactName]=@UrgentContactName,[UrgentContactTel]=@UrgentContactTel
		,[TourContact]=@TourContact,[TourContactTel]=@TourContactTel,[StopAcceptNum]=@AutoOffDays,[TourContacMQ]=@TourContactMQ,[TourContacUserName]=@TourContactUserName
		,[MeetTourContect]=@MeetTourContect,[CollectionContect]=@CollectionContect,[PersonalPrice]=@PersonalPrice,[ChildPrice]=@ChildPrice,[RealPrice]=@RealPrice
		,[MarketPrice]=@MarketPrice,[OperatorID]=@OperatorID
		,[StandardPlanError]=@StandardPlanError,[TourPriceError]=@TourPriceError,[IsCompanyCheck]=@IsCompanyCheck
		,[RetailAdultPrice]=@RetailAdultPrice,[RetailChildrenPrice]=@RetailChildrenPrice
	WHERE Id=@TemplateTourId	

	--�������Ŵ˴�Ҫ���µ�������Ϣ
	DECLARE @tmptbl TABLE(TourId CHAR(36))
	INSERT INTO @tmptbl(TourId) SELECT Id FROM tbl_TourList WHERE ParentTourID=@TemplateTourId AND LeaveDate>=GETDATE()	

	--����������Ϣ ��������(����λ���ڡ�������Ķ���)>�ƻ�����ʱ �ƻ�����=��������
	UPDATE [tbl_TourList] SET
		 [UnitCompanyId]=@UnitCompanyId,[CompanyName]=@CompanyName,[RouteName]=@RouteName
		,[TourDays]=@TourDays,[ComeBackDate]=DATEADD(DAY,@TourDays-1,[LeaveDate])
		,[RouteType]=@AreaType,[AreaId]=@AreaId
		,[LeaveTraffic]=@LeaveTraffic,[BackTraffic]=@BackTraffic,[PlanPeopleCount]= CASE WHEN OrderPeopleNumber>@PlanPeopleCount THEN OrderPeopleNumber ELSE @PlanPeopleCount END
		,[SendContactName]=@SendContactName,[SendContactTel]=@SendContactTel,[UrgentContactName]=@UrgentContactName,[UrgentContactTel]=@UrgentContactTel
		,[TourContact]=@TourContact,[TourContactTel]=@TourContactTel,[StopAcceptNum]=@AutoOffDays,[TourContacMQ]=@TourContactMQ,[TourContacUserName]=@TourContactUserName
		,[MeetTourContect]=@MeetTourContect,[CollectionContect]=@CollectionContect,[PersonalPrice]=@PersonalPrice,[ChildPrice]=@ChildPrice,[RealPrice]=@RealPrice
		,[MarketPrice]=@MarketPrice,[OperatorID]=@OperatorID
		,[CreateTime]=GETDATE()
		,[StandardPlanError]=@StandardPlanError,[TourPriceError]=@TourPriceError,[IsCompanyCheck]=@IsCompanyCheck
		,[RetailAdultPrice]=@RetailAdultPrice,[RetailChildrenPrice]=@RetailChildrenPrice
	WHERE Id IN(SELECT TourId FROM @tmptbl)
	SET @errorCount=@errorCount+@@ERROR
	
	--������м���ģ���Ž����г̼۸����Ϣ���޸�
	INSERT INTO @tmptbl(TourId) VALUES(@TemplateTourId)

	--д���г���Ϣ ��ɾ��������
	IF(@ReleaseType='0') --��׼����
	BEGIN
		EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@StandardPlan
		DELETE FROM [tbl_TourStandardPlan] WHERE [TourBasicID] IN (SELECT TourId FROM @tmptbl)
		SET @errorCount=@errorCount+@@ERROR	
		INSERT INTO [tbl_TourStandardPlan] ([TourBasicID],[PlanInterval],[Vehicle],[TrafficNumber],[House],[Dinner],[PlanContent],[PlanDay])		
		SELECT B.[TourId],A.[PlanInterval],A.[Vehicle],A.[TrafficNumber],A.[House],A.[Dinner],A.[PlanContent],A.[PlanDay]
		FROM OPENXML(@hdoc,'/ROOT/PlanInfo') WITH(PlanInterval NVARCHAR(50),Vehicle NVARCHAR(50),TrafficNumber NVARCHAR(50),House NVARCHAR(50),Dinner NVARCHAR(50),PlanContent NVARCHAR(2000),PlanDay INT,PlanId CHAR(36)) AS A,@tmptbl AS B
		SET @errorCount=@errorCount+@@ERROR	
		EXECUTE sp_xml_removedocument @hdoc		
	END
	ELSE--���ٷ���
	BEGIN
		DELETE FROM [tbl_TourFastPlan] WHERE [TourBasicID] IN (SELECT TourId FROM @tmptbl)
		SET @errorCount=@errorCount+@@ERROR	
		INSERT INTO [tbl_TourFastPlan]([TourBasicID],[RoutePlan]) SELECT B.[TourId],@QuickPlan FROM @tmptbl AS B
		SET @errorCount=@errorCount+@@ERROR	
	END

	--д�뱨����Ϣ ��ɾ��������
	DELETE FROM [tbl_TourBasicPriceDetail] WHERE [TourBasicID] IN (SELECT TourId FROM @tmptbl)
	SET @errorCount=@errorCount+@@ERROR	
	EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@PriceDetail
	INSERT INTO [tbl_TourBasicPriceDetail]([TourBasicID],[PerosonalPrice],[ChildPrice],[CompanyPriceStandID],[SysCustomLevel],[RowMark])
    SELECT B.[TourId],A.[AdultPrice],A.[ChildrenPrice],A.[PriceStandId],A.[CustomerLevelId],A.[RowMark]
	FROM OPENXML(@hdoc,'/ROOT/PriceInfo') WITH(AdultPrice MONEY,ChildrenPrice MONEY,PriceStandId CHAR(36),CustomerLevelId INT,RowMark TINYINT) AS A,@tmptbl AS B
	SET @errorCount=@errorCount+@@ERROR	
	EXECUTE sp_xml_removedocument @hdoc

	--д������׼��Ϣ ��ɾ��������
	IF(@ReleaseType='0') --��׼����
	BEGIN
		DELETE FROM [tbl_TourServiceStandard] WHERE [TourBasicID] IN (SELECT TourId FROM @tmptbl)
		SET @errorCount=@errorCount+@@ERROR	
		INSERT INTO [tbl_TourServiceStandard]
			([TourBasicID],[ResideContent],[DinnerContent],[SightContent],[CarContent]
			,[GuideContent],[TrafficContent],[IncludeOtherContent],[NotContainService],[SpeciallyNotice])
		SELECT
			 B.TourId,@ResideContent,@DinnerContent,@SightContent,@CarContent
			,@GuideContent,@TrafficContent,@IncludeOtherContent,@NotContainService,@SpeciallyNotice
		FROM @tmptbl AS B
		SET @errorCount=@errorCount+@@ERROR
	END
	
	--д����۳�����Ϣ ��ɾ��������	
	DELETE FROM [tbl_TourAreaControl] WHERE [TourId] IN (SELECT TourId FROM @tmptbl)
	SET @errorCount=@errorCount+@@ERROR	
	INSERT INTO [tbl_TourAreaControl](TourId,CityId) SELECT B.TourId,@LeaveCity FROM @tmptbl AS B
	SET @errorCount=@errorCount+@@ERROR

	--д�����۳�����Ϣ
	DELETE FROM [tbl_TourCityControl] WHERE [TourId] IN (SELECT TourId FROM @tmptbl)
	SET @errorCount=@errorCount+@@ERROR	
	EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@SaleCity
	INSERT INTO [tbl_TourCityControl] (TourId,CityId)
	SELECT B.TourId,A.CityId FROM OPENXML(@hdoc,'/ROOT/SaleCityInfo') WITH(CityId INT) AS A,@tmptbl AS B	
	EXECUTE sp_xml_removedocument @hdoc
	SET @errorCount=@errorCount+@@ERROR

	--д��������Ϣ
	DELETE FROM [tbl_TourThemeControl] WHERE [TourId] IN (SELECT TourId FROM @tmptbl)
	EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@RouteTheme
	INSERT INTO [tbl_TourThemeControl] (TourId,ThemeId)
	SELECT B.TourId,A.ThemeId FROM OPENXML(@hdoc,'/ROOT/ThemeInfo') WITH(ThemeId INT) AS A,@tmptbl AS B	
	EXECUTE sp_xml_removedocument @hdoc
	SET @errorCount=@errorCount+@@ERROR

	--д��ؽ�����Ϣ
	IF(@ReleaseType='0')
	BEGIN
		DELETE FROM [tbl_TourLocalityInfo] WHERE [TourId] IN (SELECT TourId FROM @tmptbl)
		EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@LocalTravelAgency
		INSERT INTO tbl_TourLocalityInfo(TourId,LocalComoanyID,LocalCompanyName,LicenseNumber,ContactTel,OperatorID)
		SELECT B.TourId,A.AgencyId,A.AgencyName,A.License,A.Telephone,@OperatorID FROM OPENXML(@hdoc,'/ROOT/AgencyInfo') 
		WITH(AgencyId CHAR(36),AgencyName NVARCHAR(200),License NVARCHAR(250),Telephone NVARCHAR(100)) AS A,@tmptbl AS B
		EXECUTE sp_xml_removedocument @hdoc
		SET @errorCount=@errorCount+@@ERROR
	END

	--����Ŷ��Զ�ͣ��״̬ ���ֶ�ͣ���ֶ��������Զ�ͣ��
	UPDATE [tbl_TourList] SET [TourState]=3 WHERE [ParentTourID]=@TemplateTourId AND DATEADD(DAY,-@AutoOffDays,[LeaveDate])<=GETDATE() AND TourState NOT IN(0,2)
	SET @errorCount=@errorCount+@@ERROR
	
	--����Ŷ�״̬ �Զ�����������
	UPDATE [tbl_TourList] SET [TourState]=1 WHERE [ParentTourID]=@TemplateTourId AND [PlanPeopleCount]>[OrderPeopleNumber] AND TourState=4
	SET @errorCount=@errorCount+@@ERROR
	--����Ŷ�״̬ �������Զ�����
	UPDATE [tbl_TourList] SET [TourState]=4 WHERE [ParentTourID]=@TemplateTourId AND [PlanPeopleCount]=[OrderPeopleNumber] AND TourState=1
	SET @errorCount=@errorCount+@@ERROR

	--���������ŵ��š�������ŵ�������
	EXECUTE proc_TourList_RecentLeave @TourId=@TemplateTourId,@IsParentTour=N'1'

	--д���Ŷ���ϵ����Ϣ
	IF NOT EXISTS(SELECT 1 FROM [tbl_TourContactInfo] WHERE [CompanyId]=@CompanyId AND [ContactName]=@TourContact)
	BEGIN
		INSERT INTO [tbl_TourContactInfo]([CompanyId],[ContactName],[ContactTel],[ContactQQ],[ContactMQId],[UserName])
		VALUES(@CompanyId,@TourContact,@TourContactTel,'',@TourContactMQ,@TourContactUserName)
		SET @errorCount=@errorCount+@@ERROR	
	END

	--�����ŶӶ�������·������Ϣ
	UPDATE tbl_TourOrder SET AreaId=@AreaId WHERE TourId IN(SELECT TourId FROM @tmptbl)
	SET @errorCount=@errorCount+@@ERROR	
	
	--�ύ����
	IF(@errorCount>0)
	BEGIN
		ROLLBACK TRANSACTION UpdateStandardTourInfo
		SET @Result=0
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION UpdateStandardTourInfo
		SET @Result=1
	END

	RETURN @Result
END
GO

-- =============================================
-- Author:		����־
-- Create date: 2010-05-20
-- Description:	�޸��Ŷ���Ϣ(ģ����)
-- =============================================
ALTER PROCEDURE [dbo].[proc_TourList_UpdateTemplateTourInfo]
	@TemplateTourId CHAR(36),--ģ���ű��
	@CompanyId CHAR(36),--��˾���
	@CompanyName NVARCHAR(250),--��˾����
	@IsCompanyCheck CHAR(1),--��˾�Ƿ�ͨ�����
	@TourType TINYINT,--�Ŷ�����
	@RouteName NVARCHAR(250),--��·����
	@TourDays INT,--�Ŷ�����
	@AreaId INT,--��·������
	@AreaType TINYINT,--��·��������	
	@PlanPeopleCount INT,--�ƻ�����
	@ReleaseType CHAR(1),--�Ŷӷ�������		
	@AutoOffDays INT,--�Զ�ͣ��ʱ��(��λ:��)
	@LeaveTraffic NVARCHAR(500)=NULL,--������ͨ(��ͨ����)
	@BackTraffic NVARCHAR(500)=NULL,--���̽�ͨ	
	@SendContactName NVARCHAR(150)=NULL,--������
	@SendContactTel NVARCHAR(100)=NULL,--���ŵ绰
	@UrgentContactName NVARCHAR(150)=NULL,--������ϵ��
	@UrgentContactTel NVARCHAR(100)=NULL,--������ϵ�绰	
	@OperatorID CHAR(36),--����Ա���
	@TourContact NVARCHAR(100),--�ŶӸ�����
	@TourContactTel NVARCHAR(100),--�ŶӸ����˵绰
	@TourContactMQ NVARCHAR(20),--�ŶӸ�����MQ
	@TourContactUserName NVARCHAR(100),--�ŶӸ������û���	
	@MeetTourContect NVARCHAR(250)=NULL,--���ŷ�ʽ
	@CollectionContect NVARCHAR(250)=NULL,--���Ϸ�ʽ
	@StandardPlanError INT=0,--�г��Ƿ��쳣(�ٷ���)
	@TourPriceError INT=0,--�۸��Ƿ��쳣(�ٷ���)	
	@ResideContent NVARCHAR(MAX)=NULL,--ס��(������Ŀ)	
	@DinnerContent NVARCHAR(MAX)=NULL,--�ò�(������Ŀ)	
	@SightContent NVARCHAR(MAX)=NULL,--����(������Ŀ)	
	@CarContent NVARCHAR(MAX)=NULL,--�ó�(������Ŀ)	
	@GuideContent NVARCHAR(MAX)=NULL,--����(������Ŀ)	
	@TrafficContent NVARCHAR(MAX)=NULL,--������ͨ(������Ŀ)	
	@IncludeOtherContent NVARCHAR(MAX)=NULL,--������Ŀ��������(������Ŀ)	
	@NotContainService NVARCHAR(MAX)=NULL,--��������Ŀ (�ϲ���������Ŀ���Է���Ŀ����ͯ���š����ﰲ�š�������Ŀ��ע������)	
	@SpeciallyNotice NVARCHAR(MAX)=NULL,--��ܰ����
	@LeaveCity INT,--���۳���
	@SaleCity NVARCHAR(MAX),--���۳��� XML:<ROOT><SaleCityInfo  CityId="���۳��б�� INT" /></ROOT>
	@RouteTheme NVARCHAR(MAX),--��·���� XML:<ROOT><ThemeInfo ThemeId="������ INT" /></ROOT>
	@PriceDetail NVARCHAR(MAX),--������Ϣ XML:<ROOT><PriceInfo AdultPrice="���˼�|ͬ�м۸� MONEY" ChildrenPrice="��ͯ��|���м� MONEY" PriceStandId="���۱�׼��� CHAR(36)" CustomerLevelId="�ͻ��ȼ���� 0:ͬ�� 1:���� 2:������"  RowMark="���۵ȼ��б�ʶ TINYINT" /></ROOT>
	@StandardPlan NVARCHAR(MAX)=NULL,--��׼�������г���Ϣ XML:<ROOT><PlanInfo PlanId="�г̱�� CHAR(36)" PlanInterval="�г����� NVARCHAR(50)" Vehicle="��ͨ���� NVARCHAR(50)" TrafficNumber="��� NVARCHAR(50)" House="ס�� NVARCHAR(50)" Dinner="�ò� NVARCHAR(50)" PlanContent="�г����� NVARCHAR(2000)" PlanDay="�ڼ����г� INT"  /></ROOT>
	@LocalTravelAgency NVARCHAR(MAX)=NULL,--�ؽ�����Ϣ XML:<ROOT><AgencyInfo AgencyId="" AgencyName="" License="" Telephone=""  /></ROOT>
	@QuickPlan NVARCHAR(MAX)=NULL,--���ٷ������г�����
	@Result INT OUTPUT--�������
AS
BEGIN	
	SET @Result=0
	--��Ӫ��λ��Ϣ����
	DECLARE @UnitCompanyId CHAR(36)--��Ӫ��λ���
	
	--������Ϣ(ͬ�м��е���ͼ�)
	DECLARE @PersonalPrice MONEY --���˼�
	DECLARE @ChildPrice MONEY --��ͯ��
	DECLARE @RealPrice MONEY --������ͬ�м�
	DECLARE @MarketPrice MONEY --���������м�
	DECLARE @RetailAdultPrice MONEY --���г��˼�
	DECLARE @RetailChildrenPrice MONEY --���ж�ͯ��

	DECLARE @hdoc INT
	EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@PriceDetail

	SELECT @PersonalPrice=SUM(CASE WHEN C.CustomerLevelId=0  THEN C.AdultPrice ELSE 0 END)
		,@ChildPrice=SUM(CASE WHEN C.CustomerLevelId=0  THEN C.ChildrenPrice ELSE 0 END)
		,@RealPrice=SUM(CASE WHEN C.CustomerLevelId=2  THEN C.AdultPrice ELSE 0 END)
		,@MarketPrice=SUM(CASE WHEN C.CustomerLevelId=2  THEN C.ChildrenPrice ELSE 0 END)
		,@RetailAdultPrice=SUM(CASE WHEN C.CustomerLevelId=1 THEN C.AdultPrice ELSE 0 END)
		,@RetailChildrenPrice=SUM(CASE WHEN C.CustomerLevelId=1 THEN C.ChildrenPrice ELSE 0 END)
	FROM (SELECT B.AdultPrice,B.ChildrenPrice,B.CustomerLevelId,B.PriceStandId FROM OPENXML(@hdoc,'/ROOT/PriceInfo')
					WITH(AdultPrice MONEY,ChildrenPrice MONEY,PriceStandId CHAR(36),CustomerLevelId INT) AS B WHERE B.PriceStandId=(SELECT TOP 1 A.PriceStandId FROM OPENXML(@hdoc,'/ROOT/PriceInfo')
						WITH(AdultPrice MONEY,ChildrenPrice MONEY,PriceStandId CHAR(36),CustomerLevelId INT) AS A
						WHERE A.CustomerLevelId=0 ORDER BY A.AdultPrice ASC)
	) AS C
	GROUP BY C.PriceStandId
	EXECUTE sp_xml_removedocument @hdoc
	
	BEGIN TRANSACTION UpdateStandardTourInfo
	DECLARE @errorCount INT
	SET @errorCount=0

	--����ģ������Ϣ
	UPDATE [tbl_TourList] SET
		 [UnitCompanyId]=@UnitCompanyId,[CompanyName]=@CompanyName,[RouteName]=@RouteName
		,[TourDays]=@TourDays
		,[RouteType]=@AreaType,[AreaId]=@AreaId
		,[LeaveTraffic]=@LeaveTraffic,[BackTraffic]=@BackTraffic,[PlanPeopleCount]=@PlanPeopleCount
		,[SendContactName]=@SendContactName,[SendContactTel]=@SendContactTel,[UrgentContactName]=@UrgentContactName,[UrgentContactTel]=@UrgentContactTel
		,[TourContact]=@TourContact,[TourContactTel]=@TourContactTel,[StopAcceptNum]=@AutoOffDays,[TourContacMQ]=@TourContactMQ,[TourContacUserName]=@TourContactUserName
		,[MeetTourContect]=@MeetTourContect,[CollectionContect]=@CollectionContect,[PersonalPrice]=@PersonalPrice,[ChildPrice]=@ChildPrice,[RealPrice]=@RealPrice
		,[MarketPrice]=@MarketPrice,[OperatorID]=@OperatorID
		,[StandardPlanError]=@StandardPlanError,[TourPriceError]=@TourPriceError,[IsCompanyCheck]=@IsCompanyCheck
		,[RetailAdultPrice]=@RetailAdultPrice,[RetailChildrenPrice]=@RetailChildrenPrice
	WHERE Id=@TemplateTourId	

	--�������Ŵ˴�Ҫ���µ�������Ϣ
	DECLARE @tmptbl TABLE(TourId CHAR(36))
	INSERT INTO @tmptbl(TourId) SELECT Id FROM tbl_TourList WHERE ParentTourID=@TemplateTourId AND LeaveDate>=GETDATE()	

	--����������Ϣ ��������(����λ���ڡ�������Ķ���)>�ƻ�����ʱ �ƻ�����=��������
	UPDATE [tbl_TourList] SET
		 [UnitCompanyId]=@UnitCompanyId,[CompanyName]=@CompanyName,[RouteName]=@RouteName
		,[TourDays]=@TourDays,[ComeBackDate]=DATEADD(DAY,@TourDays-1,[LeaveDate])
		,[RouteType]=@AreaType,[AreaId]=@AreaId
		,[LeaveTraffic]=@LeaveTraffic,[BackTraffic]=@BackTraffic,[PlanPeopleCount]= CASE WHEN OrderPeopleNumber>@PlanPeopleCount THEN OrderPeopleNumber ELSE @PlanPeopleCount END
		,[SendContactName]=@SendContactName,[SendContactTel]=@SendContactTel,[UrgentContactName]=@UrgentContactName,[UrgentContactTel]=@UrgentContactTel
		,[TourContact]=@TourContact,[TourContactTel]=@TourContactTel,[StopAcceptNum]=@AutoOffDays,[TourContacMQ]=@TourContactMQ,[TourContacUserName]=@TourContactUserName
		,[MeetTourContect]=@MeetTourContect,[CollectionContect]=@CollectionContect,[PersonalPrice]=@PersonalPrice,[ChildPrice]=@ChildPrice,[RealPrice]=@RealPrice
		,[MarketPrice]=@MarketPrice,[OperatorID]=@OperatorID
		,[CreateTime]=GETDATE()
		,[StandardPlanError]=@StandardPlanError,[TourPriceError]=@TourPriceError,[IsCompanyCheck]=@IsCompanyCheck
		,[RetailAdultPrice]=@RetailAdultPrice,[RetailChildrenPrice]=@RetailChildrenPrice
	WHERE Id IN(SELECT TourId FROM @tmptbl)
	SET @errorCount=@errorCount+@@ERROR
	
	--������м���ģ���Ž����г̼۸����Ϣ���޸�
	INSERT INTO @tmptbl(TourId) VALUES(@TemplateTourId)

	--д���г���Ϣ ��ɾ��������
	IF(@ReleaseType='0') --��׼����
	BEGIN
		EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@StandardPlan
		DELETE FROM [tbl_TourStandardPlan] WHERE [TourBasicID] IN (SELECT TourId FROM @tmptbl)
		SET @errorCount=@errorCount+@@ERROR	
		INSERT INTO [tbl_TourStandardPlan] ([TourBasicID],[PlanInterval],[Vehicle],[TrafficNumber],[House],[Dinner],[PlanContent],[PlanDay])		
		SELECT B.[TourId],A.[PlanInterval],A.[Vehicle],A.[TrafficNumber],A.[House],A.[Dinner],A.[PlanContent],A.[PlanDay]
		FROM OPENXML(@hdoc,'/ROOT/PlanInfo') WITH(PlanInterval NVARCHAR(50),Vehicle NVARCHAR(50),TrafficNumber NVARCHAR(50),House NVARCHAR(50),Dinner NVARCHAR(50),PlanContent NVARCHAR(2000),PlanDay INT,PlanId CHAR(36)) AS A,@tmptbl AS B
		SET @errorCount=@errorCount+@@ERROR	
		EXECUTE sp_xml_removedocument @hdoc		
	END
	ELSE--���ٷ���
	BEGIN
		DELETE FROM [tbl_TourFastPlan] WHERE [TourBasicID] IN (SELECT TourId FROM @tmptbl)
		SET @errorCount=@errorCount+@@ERROR	
		INSERT INTO [tbl_TourFastPlan]([TourBasicID],[RoutePlan]) SELECT B.[TourId],@QuickPlan FROM @tmptbl AS B
		SET @errorCount=@errorCount+@@ERROR	
	END

	--д�뱨����Ϣ ��ɾ��������
	DELETE FROM [tbl_TourBasicPriceDetail] WHERE [TourBasicID] IN (SELECT TourId FROM @tmptbl)
	SET @errorCount=@errorCount+@@ERROR	
	EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@PriceDetail
	INSERT INTO [tbl_TourBasicPriceDetail]([TourBasicID],[PerosonalPrice],[ChildPrice],[CompanyPriceStandID],[SysCustomLevel],[RowMark])
    SELECT B.[TourId],A.[AdultPrice],A.[ChildrenPrice],A.[PriceStandId],A.[CustomerLevelId],A.[RowMark]
	FROM OPENXML(@hdoc,'/ROOT/PriceInfo') WITH(AdultPrice MONEY,ChildrenPrice MONEY,PriceStandId CHAR(36),CustomerLevelId INT,RowMark TINYINT) AS A,@tmptbl AS B
	SET @errorCount=@errorCount+@@ERROR	
	EXECUTE sp_xml_removedocument @hdoc

	--д������׼��Ϣ ��ɾ��������
	IF(@ReleaseType='0') --��׼����
	BEGIN
		DELETE FROM [tbl_TourServiceStandard] WHERE [TourBasicID] IN (SELECT TourId FROM @tmptbl)
		SET @errorCount=@errorCount+@@ERROR	
		INSERT INTO [tbl_TourServiceStandard]
			([TourBasicID],[ResideContent],[DinnerContent],[SightContent],[CarContent]
			,[GuideContent],[TrafficContent],[IncludeOtherContent],[NotContainService],[SpeciallyNotice])
		SELECT
			 B.TourId,@ResideContent,@DinnerContent,@SightContent,@CarContent
			,@GuideContent,@TrafficContent,@IncludeOtherContent,@NotContainService,@SpeciallyNotice
		FROM @tmptbl AS B
		SET @errorCount=@errorCount+@@ERROR
	END
	
	--д����۳�����Ϣ ��ɾ��������	
	DELETE FROM [tbl_TourAreaControl] WHERE [TourId] IN (SELECT TourId FROM @tmptbl)
	SET @errorCount=@errorCount+@@ERROR	
	INSERT INTO [tbl_TourAreaControl](TourId,CityId) SELECT B.TourId,@LeaveCity FROM @tmptbl AS B
	SET @errorCount=@errorCount+@@ERROR

	--д�����۳�����Ϣ
	DELETE FROM [tbl_TourCityControl] WHERE [TourId] IN (SELECT TourId FROM @tmptbl)
	SET @errorCount=@errorCount+@@ERROR	
	EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@SaleCity
	INSERT INTO [tbl_TourCityControl] (TourId,CityId)
	SELECT B.TourId,A.CityId FROM OPENXML(@hdoc,'/ROOT/SaleCityInfo') WITH(CityId INT) AS A,@tmptbl AS B	
	EXECUTE sp_xml_removedocument @hdoc
	SET @errorCount=@errorCount+@@ERROR

	--д��������Ϣ
	DELETE FROM [tbl_TourThemeControl] WHERE [TourId] IN (SELECT TourId FROM @tmptbl)
	EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@RouteTheme
	INSERT INTO [tbl_TourThemeControl] (TourId,ThemeId)
	SELECT B.TourId,A.ThemeId FROM OPENXML(@hdoc,'/ROOT/ThemeInfo') WITH(ThemeId INT) AS A,@tmptbl AS B	
	EXECUTE sp_xml_removedocument @hdoc
	SET @errorCount=@errorCount+@@ERROR

	--д��ؽ�����Ϣ
	IF(@ReleaseType='0')
	BEGIN
		DELETE FROM [tbl_TourLocalityInfo] WHERE [TourId] IN (SELECT TourId FROM @tmptbl)
		EXECUTE sp_xml_preparedocument @hdoc OUTPUT,@LocalTravelAgency
		INSERT INTO tbl_TourLocalityInfo(TourId,LocalComoanyID,LocalCompanyName,LicenseNumber,ContactTel,OperatorID)
		SELECT B.TourId,A.AgencyId,A.AgencyName,A.License,A.Telephone,@OperatorID FROM OPENXML(@hdoc,'/ROOT/AgencyInfo') 
		WITH(AgencyId CHAR(36),AgencyName NVARCHAR(200),License NVARCHAR(250),Telephone NVARCHAR(100)) AS A,@tmptbl AS B
		EXECUTE sp_xml_removedocument @hdoc
		SET @errorCount=@errorCount+@@ERROR
	END

	--����Ŷ��Զ�ͣ��״̬ ���ֶ�ͣ���ֶ��������Զ�ͣ��
	UPDATE [tbl_TourList] SET [TourState]=3 WHERE [ParentTourID]=@TemplateTourId AND DATEADD(DAY,-@AutoOffDays,[LeaveDate])<=GETDATE() AND TourState NOT IN(0,2)
	SET @errorCount=@errorCount+@@ERROR
	
	--����Ŷ�״̬ �Զ�����������
	UPDATE [tbl_TourList] SET [TourState]=1 WHERE [ParentTourID]=@TemplateTourId AND [PlanPeopleCount]>[OrderPeopleNumber] AND TourState=4
	SET @errorCount=@errorCount+@@ERROR
	--����Ŷ�״̬ �������Զ�����
	UPDATE [tbl_TourList] SET [TourState]=4 WHERE [ParentTourID]=@TemplateTourId AND [PlanPeopleCount]=[OrderPeopleNumber] AND TourState=1
	SET @errorCount=@errorCount+@@ERROR

	--���������ŵ��š�������ŵ�������
	EXECUTE proc_TourList_RecentLeave @TourId=@TemplateTourId,@IsParentTour=N'1'

	--д���Ŷ���ϵ����Ϣ
	IF NOT EXISTS(SELECT 1 FROM [tbl_TourContactInfo] WHERE [CompanyId]=@CompanyId AND [ContactName]=@TourContact)
	BEGIN
		INSERT INTO [tbl_TourContactInfo]([CompanyId],[ContactName],[ContactTel],[ContactQQ],[ContactMQId],[UserName])
		VALUES(@CompanyId,@TourContact,@TourContactTel,'',@TourContactMQ,@TourContactUserName)
		SET @errorCount=@errorCount+@@ERROR	
	END

	--�����ŶӶ�������·������Ϣ
	UPDATE tbl_TourOrder SET AreaId=@AreaId WHERE TourId IN(SELECT TourId FROM @tmptbl)
	SET @errorCount=@errorCount+@@ERROR	
	
	--�ύ����
	IF(@errorCount>0)
	BEGIN
		ROLLBACK TRANSACTION UpdateStandardTourInfo
		SET @Result=0
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION UpdateStandardTourInfo
		SET @Result=1
	END

	RETURN @Result
END
GO

