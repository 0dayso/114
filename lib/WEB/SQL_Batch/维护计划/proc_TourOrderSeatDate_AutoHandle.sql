
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		���ĳ�
-- Create date: 2010-07-22
-- Description:	�������������λ�����������λ����(ִ�����ڣ�2����)
-- =============================================
alter PROCEDURE proc_TourOrderSeatDate_AutoHandle
AS
BEGIN
	
	DECLARE @OrderId char(36)
	DECLARE @ChangeResult int 
	
	DECLARE cur_AutoHandle CURSOR FOR 
	SELECT OrderId FROM tbl_TourOrder_SeatDate WHERE datediff(dd,SaveSeatDate,getdate()) >= 0 AND datediff(mi,SaveSeatDate,getdate()) >= 0
	OPEN cur_AutoHandle
	WHILE 1 = 1
	BEGIN
		fetch next from cur_AutoHandle into @OrderId
	    if @@fetch_status<>0
		    break 
		    
		SET @ChangeResult = 0
		--���Ķ�����״̬��Ϊ��λ����
		EXEC proc_TourOrder_SetOrderState @OrderId = @OrderId,@SaveSeatDate = NULL,@OrderState = 3,@Result = @ChangeResult output
		--��״̬�ɹ���ɾ��������
		IF @ChangeResult = 9
			DELETE FROM tbl_TourOrder_SeatDate WHERE OrderId = @OrderId
	end		
	close cur_AutoHandle
    deallocate cur_AutoHandle
END
GO