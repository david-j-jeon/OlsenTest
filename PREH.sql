USE [Viewpoint]
GO

/****** Object:  View [dbo].[z_OC_PRDQ_PREH]    Script Date: 12/20/2021 4:50:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












CREATE VIEW [dbo].[z_OC_PRDQ_PREH] AS 

/*
CREATED BY: DJ

Custom view for PayRoll Data Quality Report from PREH table.
Created to reduce redundancy in z_OC_PRTH/z_OC_PRTB and data quality items 


*/


SELECT 
	PRCo
	,PRGroup
	,Employee
	,CASE
		WHEN MidName IS NULL THEN CONCAT(LastName, ', ', FirstName)
		ELSE CONCAT(LastName, ', ', FirstName, ' ', MidName)
	END AS [Employee Name]
	,HireDate
	,Address
	,City
	,State
	,Country
	,Zip
	,Phone
	,Email
	,Craft
	,Class
	,ActiveYN
FROM PREH





GO


