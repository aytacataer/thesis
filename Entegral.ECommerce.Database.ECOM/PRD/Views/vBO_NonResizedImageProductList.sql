create  VIEW [PRD].[vBO_NonResizedImageProductList]
AS
SELECT DISTINCT (PM.ProductID) AS ID  
	,P.DisplayName
	,P.ExternalSystemCode
FROM [PRD].[vCommon_ProductMediaForCrossSize] PMF
JOIN [PRD].ProductMedia PM ON PM.ID = PMF.ProductMediaID
JOIN [PRD].Product P ON P.ID = PM.ProductID
WHERE PMF.SizeID IS NOT NULL
	AND PMF.CDNPath IS NULL