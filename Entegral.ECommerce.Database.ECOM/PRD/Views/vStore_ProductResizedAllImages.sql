
CREATE VIEW [PRD].[vStore_ProductResizedAllImages]
AS
WITH allImages
AS (
	SELECT M.ProductID
		,count(1) TotalCount
	FROM PRD.ProductMedia M
	FULL JOIN lk.MediaSize MS ON 1 = 1
	GROUP BY M.ProductID
	)
	,existingImages
AS (
	SELECT M.ProductID
		,count(1) ExistingCount
	FROM PRD.ProductMedia M
	INNER JOIN PRD.ProductMediaFile PMF ON PMF.ProductMediaID = M.ID
	WHERE PMF.SizeID IS NOT NULL
	GROUP BY M.ProductID
	)
SELECT A.ProductID
FROM allImages A
INNER JOIN existingImages E ON A.ProductID = E.ProductID
WHERE A.TotalCount = E.ExistingCount