



CREATE View [PRD].[vCommon_ProductMediaForCrossSize]
As
SELECT
	PMF.ProductMediaID
	,PMF.SizeID
	,PMF.SizeCode
	,PMF.SizeName
	,PMF.Width
	,PMF.Height
	,PMF.CDNPath
FROM (
	SELECT PM.ID AS ProductMediaID
		,PM.ProductID
		,MS.ID AS SizeID
		,MS.Code AS SizeCode
		,MS.NAME AS SizeName
		,MS.Width
		,MS.Height
		,( SELECT TOP 1 CDNPath FROM prd.ProductMediaFile PMF WHERE PMF.ProductMediaID = PM.ID AND PMF.SizeID = MS.ID ) AS CDNPath
	FROM prd.ProductMedia PM
	FULL JOIN lk.MediaSize MS ON 1 = 1
	) PMF
INNER JOIN PRD.vBO_ProductList P ON P.ID = PMF.ProductID
WHERE P.IsActive = 1
GO

