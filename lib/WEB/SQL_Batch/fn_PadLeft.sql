-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		汪奇志
-- Create date: 2010-05-25
-- Description:	右对齐字符，在左边用指定的字符填充以达到指定的总长度。
-- =============================================
ALTER FUNCTION [dbo].[fn_PadLeft]
(
	--输入的字符串
	@Input NVARCHAR(50),
	--填充字符
	@PaddingChar CHAR(1),
	--结果字符串中的字符数，等于原始字符数加上任何其他填充字符。
	@TotalWidth INT
)
RETURNS NVARCHAR(50)
AS
BEGIN
	DECLARE @tmp varchar(50)
	SELECT @tmp = ISNULL(REPLICATE(@PaddingChar,@TotalWidth - LEN(ISNULL(@Input ,0))), '') + @Input
	RETURN @tmp
END

