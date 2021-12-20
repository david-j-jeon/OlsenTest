CREATE VIEW [dbo].[z_OC_PRDQ_PRTH] AS 

/*
Author: DJ
Report: Payroll Data Quality
Purpose: Optimal view for data quality items in posted


*/

SELECT
	PRTH.PRCo
	,PRTH.PRGroup
	,PRTH.PRDept
	,PRTH.PREndDate
	,PRTH.Employee
	,PREH.[Employee Name]
	,PRTH.PaySeq
	,PRTH.PostSeq
	,PRTH.PostDate
	,PRTH.EarnCode
	,EDL.Description AS [EarnCode Description]
	,CONCAT(PRTH.EarnCode, ' - ', EDL.Description) AS [EarnCode + Description]
	,PRTH.Craft
	,PRTH.Class
	,PREH.Craft AS [PREH Craft]
	,PREH.Class AS [PREH Class]
	,PRTH.Job
	,PRTH.Phase
	,PRTH.Shift
	,PRTH.Hours
	,PRTH.Amt
	,EDL.Factor
	,PRTH.Rate
	,PRTH.BatchId
	,'Posted' AS [PostStatus]
FROM PRTH
LEFT JOIN z_OC_PRDQ_PREH PREH
	ON PRTH.PRCo = PREH.PRCo AND PRTH.Employee = PREH.Employee
LEFT JOIN z_OC_PRDQ_EDL EDL
	ON PRTH.PRCo = EDL.PRCo AND PRTH.EarnCode = EDL.EDLCode AND EDL.EDLType = 'E'

GO