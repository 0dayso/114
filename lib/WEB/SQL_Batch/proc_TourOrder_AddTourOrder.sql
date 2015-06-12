



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		���ĳ�
-- Create date: 2010-07-15
-- Description:	�������޸Ķ���������Ŷ���Ϣ
-- Error������1��ʾ��������д���(���������߶�����Դ�����Ŷ�ID)
-- Error������2��ʾ���Ŷӵ�״̬�����տ�
-- Error������3��4��ʾ������������ʣ������
-- Error������5��ʾд�붩����Ϣ���쳣
-- Success������9��ʾ���в����ɹ�
-- =============================================
alter PROCEDURE proc_TourOrder_AddTourOrder
	@OrderId char(36),  --����ID
    @TourId char(36), --�Ŷ�ID
    @RouteName nvarchar(250),--��·���� 
    @TourNo nvarchar(250), --�ź�
    @AreaId int,--��·����ID
    @LeaveDate datetime,--����ʱ��
    @OrderType char(1),--��������
    @OrderState tinyint,--����״̬
    @BuyCompanyID char(36),--��ҹ�˾ID
    @BuyCompanyName nvarchar(250),--��ҹ�˾����
    @ContactName nvarchar(20),--��ϵ��
    @ContactTel nvarchar(50),--��ϵ�绰
    @ContactFax nvarchar(50),--����
    @ContactMQ nvarchar(250),--MQ
    @ContactQQ nvarchar(250),--QQ
    @OperatorID char(36),--����ԱID
    @OperatorName nvarchar(50),--����Ա����
    @CompanyID char(36),--����Ա���ڹ�˾ID
    @PriceStandId char(36),--�۸�ȼ�ID
    @PersonalPrice money,--���˼�
    @ChildPrice money,--��ͯ��
    @MarketPrice money,--������
    @AdultNumber int,--������
    @ChildNumber int,--��ͯ��
    @MarketNumber int,--��������
    @PeopleNumber int,--������
    @OtherPrice money,--��������
    @SaveSeatDate datetime,--��λʱ��
    @OperatorContent nvarchar(500),--��������
    @LeaveTraffic nvarchar(500),--������ͨ����ͨ���ţ�
    @SpecialContent nvarchar(500),--�ر�Ҫ��
    @SumPrice money,--�ܽ��
    @SeatList nvarchar(max),--��λ��
    @TourCompanyName nvarchar(250),--���ҹ�˾���
    @TourCompanyId char(36),--���ҹ�˾ID
    @TourClassId char(36),--�Ŷ�����ID
    @OrderSource tinyint, --������Դ��� 0: �����µ���1������Ԥ��
    
    @OrderCustomerXML nvarchar(max),  --�����ο���ϢXML
    @Result int output -- ���ز���
AS
BEGIN
	
	IF @PeopleNumber IS NULL OR @PeopleNumber <= 0 OR @OrderSource IS NULL OR @TourId IS NULL OR len(@TourId) <= 0 OR @OrderId IS NULL OR len(@OrderId) <= 0
	begin
		SET @Result = 1;
		RETURN
	end	

	DECLARE @ErrorCount int
	SET @ErrorCount = 0
	
	DECLARE @OrderNo nvarchar(250) --�������
	DECLARE @TourState tinyint   --�Ŷ�״̬
	DECLARE @TourPlanPeopleNum int  --�ŶӼƻ�����
	DECLARE @TourActualPeopleNum int  --�Ŷ�ʵ������
	DECLARE @TourVirtualSurplusPeopleNum int --�Ŷ�����ʣ������
	declare @ParentTourID char(36)  --�Ƿ�ģ����
	SET @TourPlanPeopleNum = 0
	set @TourActualPeopleNum = 0
	set @TourVirtualSurplusPeopleNum = 0
	
	SELECT @TourState = TourState,@ParentTourID = ParentTourID,@TourPlanPeopleNum = PlanPeopleCount,@TourActualPeopleNum = OrderPeopleNumber,@TourVirtualSurplusPeopleNum = RemnantNumber FROM tbl_TourList WHERE ID = @TourId

	if @ParentTourID is null or len(@ParentTourID) <= 0  --���ܶ�ģ�����¶���
	begin
		SET @Result = 1;
		RETURN
	end

	IF @OrderSource = 0  --�����µ���֤�Ŷ�״̬������ʣ������
	BEGIN
		IF @TourState <> 1   --�Ŷ�״̬��Ϊ���տ������µ�
		BEGIN
			SET @Result = 2;
			RETURN
		end		
		IF @TourVirtualSurplusPeopleNum < @PeopleNumber
		BEGIN
			SET @Result = 3;    --�Ŷ�����ʣ������С�ڵ�ǰ�����������µ�
			RETURN
		end	
	end	
	ELSE IF @OrderSource = 1    --ר�ߴ���Ԥ����֤ʵ��ʣ������
	BEGIN
		IF (@TourPlanPeopleNum - @TourActualPeopleNum) < @PeopleNumber
		BEGIN
			SET @Result = 4;    --�Ŷ�ʵ��ʣ������С�ڵ�ǰ�����������µ�
			RETURN
		end
	end	
	
	SET @OrderNo = dbo.fn_TourOrder_CreateOrderNo()
	
	BEGIN TRAN 
	
	--д������Ϣ
	INSERT INTO [tbl_TourOrder]
	([ID],[OrderNo],[TourId],[RouteName],[TourNo],[LeaveDate],[SiteId],[AreaId],[OrderType],[OrderState],[BuyCompanyID],[BuyCompanyName],[ContactName],[ContactTel],[ContactFax],[ContactMQ],[ContactQQ],[OperatorID],[OperatorName],[CompanyID],[PriceStandId],[PersonalPrice],[ChildPrice],[MarketPrice],[AdultNumber],[ChildNumber],[MarketNumber],[PeopleNumber],[OtherPrice],[SaveSeatDate],[OperatorContent],[LeaveTraffic],[SpecialContent],[SumPrice],[SeatList],[LastDate],[LastOperatorID],[IsDelete],[IssueTime],[TourCompanyName],[TourCompanyId],[TourClassId],[SuccessTime],[OrderSource])
	VALUES (@OrderId,@OrderNo,@TourId,@RouteName,@TourNo,@LeaveDate,0,@AreaId,@OrderType,@OrderState,@BuyCompanyID,@BuyCompanyName,@ContactName,@ContactTel,@ContactFax,@ContactMQ,@ContactQQ,@OperatorID,@OperatorName,@CompanyID,@PriceStandId,@PersonalPrice,@ChildPrice,@MarketPrice,@AdultNumber,@ChildNumber,@MarketNumber,@PeopleNumber,@OtherPrice,@SaveSeatDate,@OperatorContent,@LeaveTraffic,@SpecialContent,@SumPrice,@SeatList,getdate(),@OperatorID,'0',getdate(),@TourCompanyName,@TourCompanyId,@TourClassId,getdate(),@OrderSource)
	--��֤����
	SET @ErrorCount = @ErrorCount + @@ERROR
	--д����������Ϣ
	INSERT INTO [tbl_TourOrderFinance] ([Id],[OrderId],[OrderNo],[TourId],[TourNo],[TourClassId],[RouteName],[LeaveDate],[BuyCompanyID],[BuyCompanyName],[PeopleNumber],[ContactName],[ContactTel],[ContactFax],[OperatorID],[OperatorName],[CompanyID],[SumPrice])	VALUES (newid(),@OrderId,@OrderNo,@TourId,@TourNo,@TourClassId,@RouteName,@LeaveDate,@BuyCompanyID,@BuyCompanyName,@PeopleNumber,@ContactName,@ContactTel,@ContactFax,@OperatorID,@OperatorName,@CompanyID,@SumPrice)
	--��֤����
	SET @ErrorCount = @ErrorCount + @@ERROR
	
	--д�����ο���Ϣ
	IF @OrderCustomerXML IS NOT NULL and len(@OrderCustomerXML) > 0
	BEGIN
		set @OrderCustomerXML = replace(replace(@OrderCustomerXML,char(13),''),char(10),'')

		DECLARE @hdoc int
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @OrderCustomerXML
		INSERT INTO [tbl_TourOrderCustomer]([ID],[CompanyID],[OrderID],[VisitorName],[CradType],[CradNumber],[Sex],[VisitorType],[ContactTel],[Remark],[IssueTime],[SiteNo])
		SELECT newid(),@TourCompanyId,@OrderId,VisitorName,CradType,CradNumber,Sex,VisitorType,ContactTel,Remark,getdate(),SiteNo FROM OPENXML(@hdoc,N'/ROOT/OrderCustomer_Add')
		WITH (VisitorName nvarchar(100),CradType tinyint,CradNumber nvarchar(300),Sex char(1),VisitorType char(1),ContactTel nvarchar(100),Remark nvarchar(500),SiteNo varchar(3))
		EXEC sp_xml_removedocument @hdoc 
		--��֤����
		SET @ErrorCount = @ErrorCount + @@ERROR
	end	
	
	--�����Ŷ���ռ����λ��
	--�����Ŷ�ʵ�ʶ�������
	--�����Ŷ�����ʣ������
	--����������=ʵ��ʣ����������=����ʣ������ʱ�����Ŷ�״̬Ϊ�Զ�����
	IF @PeopleNumber = @TourVirtualSurplusPeopleNum OR @PeopleNumber = (@TourPlanPeopleNum - @TourActualPeopleNum)
	begin
		UPDATE tbl_TourList SET OccupySeat = (CASE WHEN OccupySeat IS NULL THEN '' ELSE OccupySeat END) + ',' + @SeatList,OrderPeopleNumber = (CASE WHEN OrderPeopleNumber IS NULL THEN 0 ELSE OrderPeopleNumber end) + @PeopleNumber,RemnantNumber = (CASE WHEN RemnantNumber IS NULL THEN 0 ELSE RemnantNumber END) - @PeopleNumber,TourState = 4 WHERE ID = @TourId 
		--��֤����
		SET @ErrorCount = @ErrorCount + @@ERROR
		--���������ŵ��š�������ŵ�������
		EXECUTE proc_TourList_RecentLeave @TourId=@TourId,@IsParentTour=N'0'
		--��֤����
		SET @ErrorCount = @ErrorCount + @@ERROR
	end
	ELSE
	begin
		UPDATE tbl_TourList SET OccupySeat = (CASE WHEN OccupySeat IS NULL THEN '' ELSE OccupySeat END) + ',' + @SeatList,OrderPeopleNumber = (CASE WHEN OrderPeopleNumber IS NULL THEN 0 ELSE OrderPeopleNumber end) + @PeopleNumber,RemnantNumber = (CASE WHEN RemnantNumber IS NULL THEN 0 ELSE RemnantNumber END) - @PeopleNumber WHERE ID = @TourId 
		--��֤����
		SET @ErrorCount = @ErrorCount + @@ERROR
	end
	
	IF @ErrorCount > 0 
	BEGIN
		SET @Result = 5;
		ROLLBACK TRAN 
	end	
	ELSE
	BEGIN
		SET @Result = 9;
		COMMIT TRAN 
	end
END
GO
