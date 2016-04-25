
CREATE VIEW [PRD].[vBO_ProductMediaFile]
AS
SELECT [PMF].[ID]
	,[PMF].[SizeID]
	,[PMF].[ProductMediaID]
	,[PMF].[CDNPath]
	,MS.Height
	,MS.Width
	,MS.Name
	,MS.Code
	,PM.[ProductID]
	,PM.DisplayOrder AS [ProductMediaDisplayOrder]
FROM PRD.ProductMediaFile PMF
INNER JOIN PRD.ProductMedia PM ON PM.ID = PMF.ProductMediaID
LEFT JOIN LK.MediaSize MS ON MS.ID = PMF.SizeID
