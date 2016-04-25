

CREATE VIEW [PRD].[vStore_ProductMediaFile]
AS
SELECT PMF.ID
	,M.ProductID
	,PMF.ProductMediaID
	,PMF.CDNPath
	,SZ.Code SizeCode
	,SZ.Width
	,SZ.Height
	,PMF.SizeID
FROM PRD.ProductMedia M
INNER JOIN PRD.ProductMediaFile PMF ON PMF.ProductMediaID = M.ID
LEFT JOIN LK.MediaSize SZ ON SZ.ID = PMF.SizeID
WHERE SZ.IsActive = 1