USE [Viewpoint]
GO

/****** Object:  View [dbo].[z_OC_PRDQ_EDL]    Script Date: 12/20/2021 4:51:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[z_OC_PRDQ_EDL] AS

/*
Author: DJ
Report: Payroll Data Quality
Purpose: Contains lookup of all earning/deduction/liability codes and factors 

*/

WITH earncode AS (
	SELECT 
		PRCo
		,EarnCode AS 'EDLCode'
		,Description
		,Factor
		,'E' AS 'EDLType'
	FROM PREC
),
dlcode AS (
	SELECT 
		PRCo
		,DLCode AS 'EDLCode'
		,Description
		,NULL AS 'Factor'
		,DLType AS 'EDLType'
	FROM PRDL
)
SELECT * FROM earncode
UNION ALL 
SELECT * FROM dlcode






GO


