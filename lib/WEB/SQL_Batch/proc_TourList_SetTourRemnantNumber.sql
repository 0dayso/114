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
-- Create date: 2010-07-19
-- Description:	�����Ŷ�����ʣ������
-- =============================================
CREATE PROCEDURE proc_TourList_SetTourRemnantNumber
	@TourId CHAR(36),--�Ŷӱ��
	@RemnantNumber INT,--����ʣ������
	@Result INT OUTPUT--������� 1:success 0:failure
AS
BEGIN
	SET @Result=0

	DECLARE @PlanPeopleCount INT--�ƻ�����
	DECLARE @OrderPeopleNumber INT--��������

	SELECT @PlanPeopleCount=PlanPeopleCount,@OrderPeopleNumber=OrderPeopleNumber FROM tbl_TourList WHERE Id=@TourId
	--����ʣ������>ʵ��ʣ������(�ƻ�����-��������)ʱ������ʣ������=ʵ��ʣ������(�ƻ�����-��������)
	SET @RemnantNumber=CASE WHEN @RemnantNumber>@PlanPeopleCount-@OrderPeopleNumber THEN @PlanPeopleCount-@OrderPeopleNumber ELSE @RemnantNumber END
	--��������ʣ������
	UPDATE [tbl_TourList] SET [RemnantNumber]=@RemnantNumber WHERE [Id]=@TourId

	IF(@RemnantNumber=0)--����ʣ������=0���Ŷ�״̬Ϊ�տ�ʱ�������Ŷ�״̬Ϊ�Զ�����
	BEGIN
		UPDATE tbl_TourList SET TourState=4 WHERE Id=@TourId AND TourState=1
	END
	ELSE--����ʣ������>0���Ŷ�״̬Ϊ�Զ�����ʱ�������Ŷ�״̬Ϊ�տ�
	BEGIN
		UPDATE tbl_TourList SET TourState=1 WHERE Id=@TourId AND TourState=4
	END

	SET @Result=1
END
GO
