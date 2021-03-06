set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

-- =============================================
-- Author:		汪奇志
-- Create date: 2010-05-25
-- Description:	批量生成团号
-- =============================================
ALTER PROCEDURE [dbo].[proc_TourList_CreateAutoTourCodes]
	@CompanyId CHAR(36),--公司编号
	@AreaId INT,--线路区域编号
	@LeaveDate NVARCHAR(MAX)--出团日期 XML:<ROOT><LeaveDateInfo LeaveDate="出团日期" /></ROOT>
AS
BEGIN
	--团号前缀
	DECLARE @Prefix NVARCHAR(50)
	SELECT @Prefix=PrefixText FROM tbl_CompanyAreaConfig WHERE CompanyId=@CompanyId AND AreaId=@AreaId
	SET @Prefix=ISNULL(@Prefix,'')

	DECLARE @hdoc INT
	EXECUTE sp_xml_preparedocument @hdoc OUTPUT, @LeaveDate

	SELECT		
		--团号:前缀+出团日期(yyyyMMdd)+流水号
		@Prefix
		+CONVERT(VARCHAR(8),A.[LeaveDate],112)
		+(SELECT [dbo].[fn_PadLeft](COUNT(*)+1,0,3) FROM [tbl_TourList] AS B WHERE B.[LeaveDate]=A.[LeaveDate] AND B.[CompanyId]=@CompanyId AND B.[ParentTourID]>'') 
		AS TourCode
		--出团日期
		,A.LeaveDate
	FROM OPENXML (@hdoc,'/ROOT/LeaveDateInfo') 
	WITH([LeaveDate] DATETIME) AS A
	
	EXECUTE sp_xml_removedocument @hdoc
END
