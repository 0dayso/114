
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		���ĳ�
-- Create date: 2010-07-19
-- Description:	���ö���״̬
-- Error������1��ʾ�����������
-- Error������2��ʾ�޸Ķ���״̬ʱ�����쳣
-- Success������9��ʾ���в����ɹ����
-- =============================================
alter PROCEDURE proc_TourOrder_SetOrderState
	@OrderId char(36),   --����ID
	@SaveSeatDate datetime,    --��λ����ʱ��
	@OrderState tinyint,  --����״̬
	
	@Result int output   --����ֵ
AS
BEGIN
	IF @OrderId IS NULL OR len(@OrderId) <= 0 OR @OrderState IS NULL OR @OrderState < 0 OR (@OrderState = 2 and @SaveSeatDate is null)
	BEGIN
		SET @Result = 1
		return
	end	
	
	DECLARE @ErrorCount int
	SET @ErrorCount = 0
	DECLARE @OldOrderState tinyint  --ԭ���Ķ���״̬
	DECLARE @SeatList nvarchar(500)   --��������λ��
	DECLARE @AllSeatList varchar(500)  --�������е���λ��
	DECLARE @PeopleNumber int      --��������
	DECLARE @TourId   char(36)    --�Ŷ�ID
	DECLARE @TourState tinyint   --�Ŷ�״̬
	DECLARE @TourPlanPeopleNum int  --�ŶӼƻ�����
	DECLARE @TourActualPeopleNum int  --�Ŷ�ʵ������
	
	DECLARE @UpdateSql nvarchar(max)  --�����Ŷ�Sql���
	SET @UpdateSql = ''
	
	SELECT @TourId = TourId,@OldOrderState = OrderState,@PeopleNumber = PeopleNumber,@SeatList = SeatList FROM tbl_TourOrder WHERE ID = @OrderId
	SELECT @TourState = TourState, @TourPlanPeopleNum = PlanPeopleCount,@TourActualPeopleNum = OrderPeopleNumber FROM tbl_TourList WHERE ID = @TourId	
	
	IF (@OldOrderState = 3 OR @OldOrderState = 4) AND (@OrderState <> 3 AND @OrderState <> 4)
	BEGIN
		--��λ���ڻ��߲������Ϊ����״̬
		IF @PeopleNumber > (@TourPlanPeopleNum - @TourActualPeopleNum)
		BEGIN
			SET @Result = 2;   --�Ŷ�ʣ���������㣬���ܼ�����λ���߳ɽ�
			RETURN 
		end
	end	
	
	BEGIN TRAN 
	
	update tbl_TourOrder SET OrderState = @OrderState WHERE ID = @OrderId
	--��֤����
	SET @ErrorCount = @ErrorCount + @@ERROR
	
	IF @OrderState = 5  --�ѳɽ�  
	BEGIN
		DECLARE @SuccessTime datetime
		SET @SuccessTime = getdate()
	
		--���¶����Ľ��׳ɹ�ʱ��
		update tbl_TourOrder SET SuccessTime = @SuccessTime,ExpireTime = dateadd(dd,15,@SuccessTime),OrderType = '1' WHERE ID = @OrderId
		--��֤����
		SET @ErrorCount = @ErrorCount + @@ERROR
		
		--���¶���������Ϣ�Ľ��׳ɹ�ʱ��
		UPDATE [tbl_TourOrderFinance] SET [SuccessTime] = @SuccessTime WHERE [OrderId] = @OrderId
		--��֤����
		SET @ErrorCount = @ErrorCount + @@ERROR
	end	
	IF @OrderState = 2  --����λ
	BEGIN
		UPDATE tbl_TourOrder SET SaveSeatDate = @SaveSeatDate WHERE ID = @OrderId
		 --��λ����ʱ��Ϊ���죬�Ҵ������ڣ���д�봦����λ���ڵ���ʱ��
		DECLARE @TimeNow datetime
		SET @TimeNow = getdate()
		IF @SaveSeatDate is not null and datediff(dd,@SaveSeatDate,@TimeNow) = 0 AND @SaveSeatDate > @TimeNow
		BEGIN
			--ɾ���Ѵ��ڵģ��������ڵ�
			DELETE FROM tbl_TourOrder_SeatDate WHERE OrderId = @OrderId  
			INSERT INTO tbl_TourOrder_SeatDate (OrderId,SaveSeatDate) VALUES (@OrderId,@SaveSeatDate) 
		end
	end
	
	--������λ��
	SET @AllSeatList = ''
	set @AllSeatList = (SELECT cast(SeatList as nvarchar(max)) + ',' FROM tbl_TourOrder where TourId = @TourId FOR xml path(''))
	IF @SeatList IS not NULL OR len(@SeatList) > 0
		SET @AllSeatList = isnull(@AllSeatList,'') + @SeatList
	ELSE IF len(@AllSeatList) > 1
		SET @AllSeatList = substring(isnull(@AllSeatList,''),1,len(@AllSeatList) - 1)
	
	--����״̬��Ϊ��λ���ڻ��߲�����
	IF (@OldOrderState <> 3 AND @OldOrderState <> 4) AND (@OrderState = 3 OR @OrderState = 4)
	BEGIN
		--�Ŷ�״̬Ϊ�Զ������ĸ�Ϊ���տ�
		--�����Ŷ���ռ����λ��
		--�����Ŷ�ʵ�ʶ�������
		--�����Ŷ�����ʣ������
		SET @UpdateSql = ' UPDATE tbl_TourList SET OccupySeat = ''' + @AllSeatList + ''',OrderPeopleNumber = (CASE WHEN OrderPeopleNumber IS NULL THEN 0 ELSE OrderPeopleNumber end) - ' + cast(@PeopleNumber as nvarchar(20)) + ',RemnantNumber = (CASE WHEN RemnantNumber IS NULL THEN 0 ELSE RemnantNumber END) + ' + cast(@PeopleNumber AS nvarchar(20))
		IF @TourState = 4 AND @UpdateSql IS NOT NULL and len(@UpdateSql) > 1
		BEGIN
			SET @UpdateSql = @UpdateSql + ',' + ' TourState = 1 '
		end		
		IF @UpdateSql IS NOT NULL and len(@UpdateSql) > 1
			SET @UpdateSql = @UpdateSql + ' where ID = ''' + @TourId + ''''
	end	
	ELSE IF (@OldOrderState = 3 OR @OldOrderState = 4) AND (@OrderState <> 3 AND @OrderState <> 4)
	BEGIN
		--��λ���ڻ��߲������Ϊ����״̬
		--�Ŷ�״̬Ϊ�Զ������ĸ�Ϊ���տ�
		--�����Ŷ���ռ����λ��
		--�����Ŷ�ʵ�ʶ�������
		--�����Ŷ�����ʣ������
		SET @UpdateSql = ' UPDATE tbl_TourList SET OccupySeat = ''' + @AllSeatList + ''',OrderPeopleNumber = (CASE WHEN OrderPeopleNumber IS NULL THEN 0 ELSE OrderPeopleNumber end) + ' + cast(@PeopleNumber as nvarchar(20)) + ',RemnantNumber = (CASE WHEN RemnantNumber IS NULL THEN 0 ELSE RemnantNumber END) - ' + cast(@PeopleNumber as nvarchar(20))
		--�Ŷ�״̬Ϊ�տͻ����Զ�ͣ��ʱ�����¼ӵ���������ʵ��ʣ������ʱ
		--�����Ŷ�״̬Ϊ�Զ�����
		IF (@TourState = 1 OR @TourState = 3) AND (@PeopleNumber = @TourPlanPeopleNum - @TourActualPeopleNum) AND @UpdateSql IS NOT NULL and len(@UpdateSql) > 1
		begin
			SET @UpdateSql = @UpdateSql + ',' + ' TourState = 4 '
		end
		IF @UpdateSql IS NOT NULL and len(@UpdateSql) > 1
			SET @UpdateSql = @UpdateSql + ' where ID = ''' + @TourId + ''''
	end
	
	IF @UpdateSql IS NOT NULL and len(@UpdateSql) > 1
	BEGIN
		EXEC (@UpdateSql)
		--��֤����
		SET @ErrorCount = @ErrorCount + @@ERROR
		--���������ŵ��š�������ŵ�������
		EXEC proc_TourList_RecentLeave @TourId=@TourId,@IsParentTour=N'0'
	end
	
	IF @ErrorCount > 0 
	BEGIN
		SET @Result = 2;
		ROLLBACK TRAN 
	end	
	ELSE
	BEGIN
		SET @Result = 9;
		COMMIT TRAN 
	end
END
GO
