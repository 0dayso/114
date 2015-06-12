
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		���ĳ�
-- Create date: 2010-07-21
-- Description:	�����Զ�����
-- =============================================
alter PROCEDURE proc_TourOrder_AutoEvaluate
AS
BEGIN
	DECLARE @OrderId char(36)   --����ID
	--��ҹ�˾���
	DECLARE @BuyCompanyId char(36)
	--��ҹ�˾����
	DECLARE @BuyCompanyName NVARCHAR(250)
	--����û����
	DECLARE @BuyUserId char(36)
	--����û���ϵ������
	DECLARE @BuyUserContactName NVARCHAR(50)
	--�������� 1.���� 2.���� 3.����
	DECLARE @RateType TINYINT
	--����Ʒ��
	DECLARE @ServiceQuality FLOAT
	--�Լ۱�
	DECLARE @PriceQuality FLOAT
	--�������ݰ���
	DECLARE @TravelPlan FLOAT
	--�����
	DECLARE @AgreeLevel FLOAT
	--�����������һ���ֵ
	DECLARE @RateScore FLOAT
	--��������
	DECLARE @RateContent NVARCHAR(2000)
	--���ҹ�˾���
	DECLARE @SellCompanyId char(36)
	--��·����
	DECLARE @RouteName NVARCHAR(250)
	--���˼�
	DECLARE @SettlePeoplePrice MONEY
	--��ͯ��
	DECLARE @SettleChildPrice MONEY
	--�Ŷӱ��
	DECLARE @TourId char(36)
	--���۵���ʱ��
	DECLARE @ExpireTime DATETIME
	--�Ƿ���ϵͳĬ������
	DECLARE @IsSystemRate char(1)
	
	DECLARE @ErrorCount int
	SET @ErrorCount = 0;
		
	SET @RateType=1
	SET @ServiceQuality=5
	SET @PriceQuality=5
	SET @TravelPlan=5
	SET @AgreeLevel=100
	SET @RateContent='ϵͳĬ�Ϻ���!'
	SET @IsSystemRate='1'
	SET @RateScore=3

	begin tran 	

	DECLARE cur_AutoEvaluate CURSOR FOR 
	SELECT Id,ExpireTime,BuyCompanyId,BuyCompanyName,OperatorID,OperatorName,TourCompanyId,RouteName,PersonalPrice,ChildPrice,TourId FROM tbl_TourOrder WHERE RateType = 0 AND datediff(dd,ExpireTime,getdate()) > 0 and IsDelete = '0' and OrderSource = 0 and TourClassId = 2 and OrderType = '1'
	OPEN cur_AutoEvaluate
	WHILE 1 = 1
	BEGIN
		fetch next from cur_AutoEvaluate into @OrderId,@ExpireTime,@BuyCompanyId,@BuyCompanyName,@BuyUserId,@BuyUserContactName,@SellCompanyId,@RouteName,@SettlePeoplePrice,@SettleChildPrice,@TourId
	    if @@fetch_status<>0
		    break 
		
		set @ErrorCount = 0
		
		--д���۱���Ϣ
		INSERT INTO [tbl_RateOrder]([ID],[BuyCompanyId],[BuyCompanyName],[BuyUserId],[BuyUserContactName],[SellCompanyId],[RateType],[ServiceQuality],[PriceQuality],[TravelPlan],[AgreeLevel],[RateScore],[RateContent],[OrderId],[TourId],[RouteName],[SettlePeoplePrice],[SettleChildPrice],[IssueTime],[ExpireTime],[IsSystemRate]) VALUES (newid(),@BuyCompanyId,@BuyCompanyName,@BuyUserId,@BuyUserContactName,@SellCompanyId,@RateType,@ServiceQuality,@PriceQuality,@TravelPlan,@AgreeLevel,@RateScore,@RateContent,@OrderId,@TourId,@RouteName,@SettlePeoplePrice,@SettleChildPrice,getdate(),@ExpireTime,@IsSystemRate)
		if @@Error <> 0
			set @ErrorCount = @ErrorCount + @@Error
		
		UPDATE tbl_RateCountTotal SET ScoreNumber=ScoreNumber+1 WHERE CompanyId=@SellCompanyId AND ScoreType=(CASE @RateType WHEN 1 THEN 2 WHEN 2 THEN 3 WHEN 3 THEN 4 ELSE -1 END)
		if @@Error <> 0
			set @ErrorCount = @ErrorCount + @@Error
		--tbl_RateScoreTotal.ScoreType 3:����Ʒ����������
		UPDATE tbl_RateScoreTotal SET ScorePoint=ScorePoint+@ServiceQuality WHERE CompanyId=@SellCompanyId AND ScoreType=3
		if @@Error <> 0
			set @ErrorCount = @ErrorCount + @@Error
		--tbl_RateScoreTotal.ScoreType 4:�Լ۱���������
		UPDATE tbl_RateScoreTotal SET ScorePoint=ScorePoint+@PriceQuality WHERE CompanyId=@SellCompanyId AND ScoreType=4
		if @@Error <> 0
			set @ErrorCount = @ErrorCount + @@Error
		--tbl_RateScoreTotal.ScoreType 5:�������ݰ�����������
		UPDATE tbl_RateScoreTotal SET ScorePoint=ScorePoint+@TravelPlan WHERE CompanyId=@SellCompanyId AND ScoreType=5
		if @@Error <> 0
			set @ErrorCount = @ErrorCount + @@Error
		--tbl_RateScoreTotal.ScoreType 2:�����ܷ�ֵ
		UPDATE tbl_RateScoreTotal SET ScorePoint=ScorePoint+@RateScore WHERE CompanyId=@SellCompanyId AND ScoreType=2
		if @@Error <> 0
			set @ErrorCount = @ErrorCount + @@Error
		--tbl_TourOrder.RateType ͬ�����¶�������������
		UPDATE tbl_TourOrder SET RateType=@RateType WHERE Id=@OrderId
		if @@Error <> 0
			set @ErrorCount = @ErrorCount + @@Error
		
		--��������Ĺ�˾IDд��tbl_AutoJudgeCompany��(�ְ汾û�У���ʱע��)
		--INSERT INTO tbl_AutoJudgeCompany (CompanyId,RateScore) values (@sellCompanyId,@RateScore)
		
		if @ErrorCount <> 0
			rollback tran
	end		
	close cur_AutoEvaluate
    deallocate cur_AutoEvaluate
	
	commit tran
END
GO