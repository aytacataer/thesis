create VIEW [PRD].[vBO_NonResizedImageProduct]
AS
SELECT MS.Code
	,MS.Name
	,count(DISTINCT(P.ID)) AS ProductCount
FROM PRD.vCommon_ProductMediaForCrossSize PMF
LEFT JOIN LK.MediaSize MS ON PMF.SizeID = MS.ID
LEFT JOIN PRD.ProductMedia PM ON PM.ID = PMF.ProductMediaID
LEFT JOIN PRD.Product P ON P.ID = PM.ProductID
WHERE pmf.SizeID IS NOT NULL
	AND pmf.CDNPath IS NULL
GROUP BY MS.Code
	,MS.Name