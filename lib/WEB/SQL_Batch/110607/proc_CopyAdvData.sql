


GO
-- =============================================
-- Author:		周文超
-- Create date: 2011-05-30
-- Description:	将首页广告优秀企业展示（11）的数据复制到首页推荐企业（77）
-- =============================================
create procedure proc_CopyAdvData
	@AdvAreaId int, -- 复制源的广告位Id
	@CopyToAdvAreaId int,	--复制到的广告位Id
	@ErrorValue int output   --错误代码
as
begin
	if @AdvAreaId is null or @AdvAreaId <= 0 or @CopyToAdvAreaId is null or @CopyToAdvAreaId <= 0
	begin
		set @ErrorValue = 0
		return
	end	

	declare @ErrorCount int    --错误计数器
	declare @AdvId int
		   ,@ClassId tinyint
           ,@AdvDescript nvarchar(250)
           ,@AdvRemark nvarchar(max)
           ,@AdvLink nvarchar(250)
           ,@CompanyId char(36)
           ,@CompanyName nvarchar(250)
           ,@ContactInfo nvarchar(250)
           ,@StartDate datetime
           ,@EndDate datetime
           ,@OperatorId int
           ,@OperatorName nvarchar(100)
           ,@IssueTime datetime
           ,@IsUsed char(1)
           ,@AdvArea tinyint

	declare @NewAdvId int
	set @NewAdvId = 0
	set @ErrorCount = 0

	begin tran CopyAdvData
	
	DECLARE cur_CopyAdvData CURSOR FOR
	SELECT [ID]
		   ,[ClassId]
           ,[AdvDescript]
           ,[AdvRemark]
           ,[AdvLink]
           ,[CompanyId]
           ,[CompanyName]
           ,[ContactInfo]
           ,[StartDate]
           ,[EndDate]
           ,[OperatorId]
           ,[OperatorName]
           ,[IssueTime]
           ,[IsUsed]
           ,[AdvArea]
	from tbl_SysAdv where areaid = @AdvAreaId order by [ID]
	open cur_CopyAdvData
	while 1 = 1
	begin
		fetch next from cur_CopyAdvData into @AdvId
		   ,@ClassId
           ,@AdvDescript
           ,@AdvRemark
           ,@AdvLink
           ,@CompanyId
           ,@CompanyName
           ,@ContactInfo
           ,@StartDate
           ,@EndDate
           ,@OperatorId
           ,@OperatorName
           ,@IssueTime
           ,@IsUsed
           ,@AdvArea
	    if @@fetch_status<>0
		    break
		
		if @AdvId is null or @AdvId <= 0
			continue
		
		INSERT INTO [tbl_SysAdv]
           ([AreaId]
           ,[ClassId]
           ,[AdvDescript]
           ,[AdvRemark]
           ,[AdvLink]
           ,[CompanyId]
           ,[CompanyName]
           ,[ContactInfo]
           ,[StartDate]
           ,[EndDate]
           ,[OperatorId]
           ,[OperatorName]
           ,[IssueTime]
           ,[IsUsed]
           ,[AdvArea])
		 VALUES
		   (@CopyToAdvAreaId
		   ,@ClassId
		   ,@AdvDescript
		   ,@AdvRemark
		   ,@AdvLink
		   ,@CompanyId
		   ,@CompanyName
		   ,@ContactInfo
		   ,@StartDate
		   ,@EndDate
		   ,@OperatorId
		   ,@OperatorName
		   ,@IssueTime
		   ,@IsUsed
		   ,@AdvArea)
		--保存新广告id
		set @NewAdvId = @@Identity
		--验证错误
		SET @ErrorCount = @ErrorCount + @@ERROR

		INSERT INTO [tbl_SysAdvAreaControl]
           ([AdvId]
           ,[AreaType]
           ,[AreaId]
           ,[SortId])
		select @NewAdvId,[AreaType],[AreaId],[SortId] from tbl_SysAdvAreaControl 
		where AdvId = @AdvId
		--验证错误
		SET @ErrorCount = @ErrorCount + @@ERROR
	end
	close cur_CopyAdvData
    deallocate cur_CopyAdvData

	IF @ErrorCount > 0 
	BEGIN
		SET @ErrorValue = -1;
		ROLLBACK TRAN CopyAdvData
	end	
	ELSE
	BEGIN
		SET @ErrorValue = 1;
		COMMIT TRAN CopyAdvData
	end
end
go


--执行
declare @RValue int
set @RValue = -1
execute proc_CopyAdvData 11,77,@RValue output
print @RValue
go
--删除存储过程
drop proc dbo.proc_CopyAdvData
go

