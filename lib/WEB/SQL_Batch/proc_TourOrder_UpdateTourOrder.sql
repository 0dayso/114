

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		���ĳ�
-- Create date: 2010-07-15
-- Description:	�޸Ķ���
-- Error������1��ʾ����������󣨶���ID��������Դ��š�����������λ�ţ�
-- Error������2��ʾ�˶���Ŀǰ��״̬�������޸�
-- Error������3�ö������ڵ��Ŷӵ�״̬���������Ӷ�������
-- Error������4�������ӵ����������Ŷӵ�ʣ�����������޸�
-- Error������5��ʾ�Ŷ��������㣬���ܼ�����λ������ɽ���
-- Error������6�������ӵ����������Ŷӵ�ʵ��ʣ������
-- Error������7��ʾ�޸Ķ����Ĺ����г����쳣
-- Success������9��ʾ���в����ѳɹ����
-- =============================================
alter PROCEDURE proc_TourOrder_UpdateTourOrder
	@OrderId char(36),  --����id
	@OrderType char(1),  --��������(1λ��) 0:Ԥ�� 1:����
	@OrderState tinyint,  --����״̬
	@ContactName nvarchar(20),--��ϵ��
    @ContactTel nvarchar(50),--��ϵ�绰
    @ContactFax nvarchar(50),--����
    @ContactMQ nvarchar(250),--MQ
    @ContactQQ nvarchar(250),--QQ
	@PriceStandId char(36),  --�۸�ȼ����
	@PersonalPrice money, --���˼�
	@ChildPrice money, --��ͯ��
	@MarketPrice money, --������
	@AdultNumber int, --������
	@ChildNumber int, --��ͯ��
	@MarketNumber int, --��������
	@PeopleNumber int, --������
	@OtherPrice money, --��������
	@SaveSeatDate datetime, --��λʱ��
	@OperatorContent nvarchar(500), --��������
	@LeaveTraffic nvarchar(500),--������ͨ����ͨ���ţ�
	@SpecialContent nvarchar(500), --�ر�Ҫ��
	@SumPrice money, --�ܽ��
	@SeatList nvarchar(max), --��λ�Ŷ����λ���ŷָ�
	@LastOperatorID char(36),--��������ID
	@OrderSource tinyint, --������Դ��� 0: �����µ���1������Ԥ��
	
	@OrderCustomerXML nvarchar(max),  --�����ο���ϢXML
    @Result int output -- ���ز���
AS
BEGIN
	IF @OrderId IS NULL OR len(@OrderId) <= 0 OR @OrderSource IS NULL OR @PeopleNumber IS NULL OR @PeopleNumber <= 0 OR (@OrderState = 2 and @SaveSeatDate IS NULL)
	begin
		SET @Result = 1;
		RETURN
	end	

	DECLARE @ErrorCount int
	SET @ErrorCount = 0
	
	DECLARE @TourCompanyId char(36)
	DECLARE @TourId char(36)
	DECLARE @OldPeopleNumber int  --Ҫ�޸ĵĶ����޸�ǰ��������
	DECLARE @OldOrderState tinyint   --ԭ���Ķ���״̬
	DECLARE @TourState tinyint   --�Ŷ�״̬
	DECLARE @TourPlanPeopleNum int  --�ŶӼƻ�����
	DECLARE @TourActualPeopleNum int  --�Ŷ�ʵ������
	DECLARE @TourVirtualSurplusPeopleNum int --�Ŷ�����ʣ������
	DECLARE @NewPeopleNumber int   --�䶯�����������޸�ǰ��������䶯���������䶯Ϊ0
	DECLARE @IsActualEqual char(1)    --�䶯�����Ƿ��ʵ��ʣ���������
	DECLARE @IsVirtualEqual char(1)   --�䶯�����Ƿ������ʣ���������
	DECLARE @Sql nvarchar(max)       --��������Ŷӱ��Sql���
	DECLARE @AllSeatList varchar(max)  --�������е���λ��
	SET @NewPeopleNumber = 0;
	SET @IsActualEqual = '0';
	SET @IsVirtualEqual = '0';
	SET @Sql = '';
	
	SELECT @TourId = TourId,@OldOrderState = OrderState, @OldPeopleNumber = (case when PeopleNumber is null then 0 else PeopleNumber end), @TourCompanyId = TourCompanyId FROM tbl_TourOrder WHERE ID = @OrderId
	SELECT @TourState = TourState, @TourPlanPeopleNum = PlanPeopleCount,@TourActualPeopleNum = OrderPeopleNumber,@TourVirtualSurplusPeopleNum = RemnantNumber FROM tbl_TourList WHERE ID = @TourId	
	
	IF @OrderSource = 0   --�����޸Ķ�����ֻ���޸�δ����ʹ����еĶ�����
	BEGIN
		--�䶯���� = ���ڵ����� - ԭ��������
		SET @NewPeopleNumber = @PeopleNumber - @OldPeopleNumber 
		IF @OldOrderState <> 0 AND @OldOrderState <> 1
		BEGIN
			SET @Result = 2;    --����״̬��Ϊδ������ߴ�����ʱ�����޸�
			RETURN
		end		
		IF @PeopleNumber > @OldPeopleNumber   --��������С�Ĵ�
		BEGIN
			IF @TourState <> 1  --�Ŷ�״̬��Ϊ���տ��������Ӷ�������
			BEGIN
				SET @Result = 3;    --�ö������ڵ��Ŷӵ�״̬���������Ӷ�������
				RETURN
			end			
			IF @TourVirtualSurplusPeopleNum < @NewPeopleNumber
			BEGIN
				SET @Result = 4;    --�������ӵ����������Ŷӵ�����ʣ�����������޸�
				RETURN
			end			
			ELSE IF @TourVirtualSurplusPeopleNum = @NewPeopleNumber 
				SET @IsVirtualEqual = '1'; --�䶯����������ʣ���������
		end		
	end	
	ELSE IF @OrderSource = 1  --ר���޸Ķ���
	BEGIN
		IF (@OldOrderState = 3 OR @OldOrderState = 4) AND (@OrderState <> 3 and @OrderState <> 4)
		BEGIN
			--�䶯���� = ���ڵ�����
		    SET @NewPeopleNumber = @PeopleNumber
			--ԭ������״̬Ϊ��λ���ڻ��߲�����ʱ���޸ĳ�����״̬Ҫ��֤ʵ��ʣ������
			IF (@TourPlanPeopleNum - @TourActualPeopleNum) < @PeopleNumber
			BEGIN
				SET @Result = 5;    --�Ŷ��������㣬���ܼ�����λ������ɽ���
				RETURN
			end			
			ELSE IF (@TourPlanPeopleNum - @TourActualPeopleNum) = @PeopleNumber
				SET @IsActualEqual = '1'  --�䶯������ʵ��ʣ���������
		end		
		ELSE IF (@OldOrderState <> 3 and @OldOrderState <> 4) AND (@OrderState = 3 OR @OrderState = 4)
		BEGIN
			--��ռ���������Ķ���������λ���ںͲ�������Ķ�������Ϊ��ռ���������Ķ�������λ���ںͲ�������Ķ�����
			--�䶯���� = 0 - ���ڵ�����
		    SET @NewPeopleNumber = 0 - @PeopleNumber
		end
		ELSE
		BEGIN
			--�䶯���� = ���ڵ����� - ԭ��������
			SET @NewPeopleNumber = @PeopleNumber - @OldPeopleNumber
			IF @PeopleNumber > @OldPeopleNumber   --����С ��  ��
			BEGIN
				IF (@TourPlanPeopleNum - @TourActualPeopleNum) < @NewPeopleNumber
				BEGIN
					SET @Result = 6;    --�������ӵ����������Ŷӵ�ʵ��ʣ�����������޸�
					RETURN
				end			
				ELSE IF (@TourPlanPeopleNum - @TourActualPeopleNum) = @NewPeopleNumber
					SET @IsActualEqual = '1'  --�䶯������ʵ��ʣ���������
			end		
		end
	end
	
	BEGIN TRAN 
	
	--�޸Ķ���
	update tbl_TourOrder 
	set [OrderType] = @OrderType,[OrderState] = @OrderState,[ContactName] = @ContactName,[ContactTel] = @ContactTel,[ContactFax] = @ContactFax,[ContactMQ] = @ContactMQ,[ContactQQ] = @ContactQQ,[PriceStandId] = @PriceStandId,[PersonalPrice] = @PersonalPrice,[ChildPrice] = @ChildPrice,[MarketPrice] = @MarketPrice,[AdultNumber] = @AdultNumber,[ChildNumber] = @ChildNumber,[MarketNumber] = @MarketNumber,[PeopleNumber] = @PeopleNumber,[OtherPrice] = @OtherPrice,[SaveSeatDate] = @SaveSeatDate,[OperatorContent] = @OperatorContent,[LeaveTraffic] = @LeaveTraffic,[SpecialContent] = @SpecialContent,[SumPrice] = @SumPrice,[SeatList] = @SeatList,[LastDate] = getdate(),[LastOperatorID] = @LastOperatorID where [ID] = @OrderId
	--��֤����
	SET @ErrorCount = @ErrorCount + @@ERROR
	
	IF @OrderState = 2 --����λ
	BEGIN
		DECLARE @TimeNow datetime
		SET @TimeNow = getdate()
		--��λ����ʱ��Ϊ���죬�Ҵ������ڣ���д�봦����λ���ڵ���ʱ��
		IF @SaveSeatDate is not null and datediff(dd,@SaveSeatDate,@TimeNow) = 0 AND @SaveSeatDate > @TimeNow
		BEGIN
			--ɾ���Ѵ��ڵģ��������ڵ�
			DELETE FROM tbl_TourOrder_SeatDate WHERE OrderId = @OrderId  
			INSERT INTO tbl_TourOrder_SeatDate (OrderId,SaveSeatDate) VALUES (@OrderId,@SaveSeatDate) 
		end
	end
	
	IF @OrderState = 5 --�ѳɽ�
	BEGIN
		--���¶����Ľ��׳ɹ�ʱ��
		update tbl_TourOrder SET SuccessTime = getdate(),ExpireTime = dateadd(dd,15,getdate()),OrderType = '1' WHERE ID = @OrderId
		--��֤����
		SET @ErrorCount = @ErrorCount + @@ERROR
		--�޸Ķ�������
		UPDATE [tbl_TourOrderFinance] SET [PeopleNumber] = @PeopleNumber,[ContactName] = @ContactName,[ContactTel] = @ContactTel,[ContactFax] = @ContactFax,[SumPrice] = @SumPrice,[SuccessTime] = getdate() WHERE [OrderId] = @OrderId
		--��֤����
		SET @ErrorCount = @ErrorCount + @@ERROR
	end	
	ELSE
	BEGIN
		UPDATE [tbl_TourOrderFinance] SET [PeopleNumber] = @PeopleNumber,[ContactName] = @ContactName,[ContactTel] = @ContactTel,[ContactFax] = @ContactFax,[SumPrice] = @SumPrice WHERE [OrderId] = @OrderId
		--��֤����
		SET @ErrorCount = @ErrorCount + @@ERROR
	end
	
	--�޸Ķ����ο���Ϣ
	IF @OrderCustomerXML IS NOT NULL and len(@OrderCustomerXML) > 1
	BEGIN
		set @OrderCustomerXML = replace(replace(@OrderCustomerXML,char(13),''),char(10),'')		

		--ɾ��ԭ�е��ο���Ϣ
		DELETE FROM tbl_TourOrderCustomer WHERE OrderID = @OrderId
		--��֤����
		SET @ErrorCount = @ErrorCount + @@ERROR
		
		--д�µ��ο���Ϣ
		DECLARE @hdoc int
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @OrderCustomerXML
		INSERT INTO [tbl_TourOrderCustomer]([ID],[CompanyID],[OrderID],[VisitorName],[CradType],[CradNumber],[Sex],[VisitorType],[ContactTel],[Remark],[IssueTime],[SiteNo])
		SELECT newid(),@TourCompanyId,@OrderId,VisitorName,CradType,CradNumber,Sex,VisitorType,ContactTel,Remark,getdate(),SiteNo FROM OPENXML(@hdoc,N'/ROOT/OrderCustomer_Add')
		WITH (VisitorName nvarchar(100),CradType tinyint,CradNumber nvarchar(300),Sex char(1),VisitorType char(1),ContactTel nvarchar(100),Remark nvarchar(500),SiteNo varchar(3))
		EXEC sp_xml_removedocument @hdoc 
		--��֤����
		SET @ErrorCount = @ErrorCount + @@ERROR
	end	
	
	--������λ��
	SET @AllSeatList = ''
	set @AllSeatList = (SELECT cast(SeatList as nvarchar(max)) + ',' FROM tbl_TourOrder where TourId = @TourId FOR xml path(''))
	IF @SeatList IS not NULL OR len(@SeatList) > 0
		SET @AllSeatList = isnull(@AllSeatList,'') + @SeatList
	ELSE IF len(@AllSeatList) > 1
		SET @AllSeatList = substring(isnull(@AllSeatList,''),1,len(@AllSeatList) - 1)
	
	--�����Ŷ���ռ����λ��
	--�����Ŷ�ʵ�ʶ�������
	--�����Ŷ�����ʣ������
	IF @NewPeopleNumber IS NOT NULL AND @NewPeopleNumber <> 0
	BEGIN
		SET @Sql = ' UPDATE tbl_TourList SET OccupySeat = ''' + @AllSeatList + ''',OrderPeopleNumber = (CASE WHEN OrderPeopleNumber IS NULL THEN 0 ELSE OrderPeopleNumber  end) + ' + cast(@NewPeopleNumber as nvarchar(20)) + ',RemnantNumber = (CASE WHEN RemnantNumber IS NULL THEN 0 ELSE RemnantNumber END) - ' + cast(@NewPeopleNumber as nvarchar(20))
	end	
	
	IF @NewPeopleNumber > 0  --С �� ��
	BEGIN
		IF @IsActualEqual = '1' OR @IsVirtualEqual = '1'
		BEGIN
			--�Ŷ�״̬Ϊ�տͻ����Զ�ͣ��ʱ�����¼ӵ���������ʵ�ʻ��������ʣ������ʱ
			--�����Ŷ�״̬Ϊ�Զ�����
			IF @TourState = 1 OR @TourState = 3 AND @Sql IS NOT NULL and len(@Sql) > 1
				SET @Sql = @Sql + ',' + ' TourState = 4 '
		end
	end	
	ELSE IF @NewPeopleNumber < 0   --�� �� С
	BEGIN
		--���������ɴ��Сʱ��ԭ���Ŷӵ�״̬Ϊ�Զ������ĸ�Ϊ�տ�
		IF @TourState = 4 AND @Sql IS NOT NULL and len(@Sql) > 1
			SET @Sql = @Sql + ',' + ' TourState = 1 '
	end	

	IF @Sql IS NOT NULL and len(@Sql) > 1
		SET @Sql = @Sql + ' where ID = ''' + @TourId + ''''
	
	IF @Sql IS NOT NULL and len(@Sql) > 1
	BEGIN
		EXEC (@Sql)  --ִ�и����Ŷ���Ϣ��Sql���
		--��֤����
		SET @ErrorCount = @ErrorCount + @@ERROR
		--���������ŵ��š�������ŵ�������
		EXEC proc_TourList_RecentLeave @TourId=@TourId,@IsParentTour=N'0'
	end
	
	IF @ErrorCount > 0 
	BEGIN
		SET @Result = 7;
		ROLLBACK TRAN 
	end	
	ELSE
	BEGIN
		SET @Result = 9;
		COMMIT TRAN 
	end
END
GO
