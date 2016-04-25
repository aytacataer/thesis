

CREATE VIEW [PRD].[vStore_ListingPage_ProductMedia]
AS
--WITH ListingMedia
--AS (
--	SELECT ROW_NUMBER() OVER (
--			PARTITION BY M.ProductID ORDER BY M.ProductID
--				,M.DisplayOrder
--			) AS RowNumber
--		,M.ID
--		,M.ProductID
--		,M.DisplayOrder
--		,SZ.Code AS SizeCode
--		,PMF.CDNPath
--	FROM PRD.ProductMedia M
--	INNER JOIN PRD.Product P ON P.ID = M.[ProductID]
--	INNER JOIN PRD.ProductMediaFile PMF ON PMF.ProductMediaID = M.ID
--	LEFT JOIN LK.MediaSize SZ ON SZ.ID = PMF.SizeID
--	WHERE SZ.Code = 'size-listing'
--		AND P.IsActive = 1
--		AND (
--			SZ.IsActive IS NULL
--			OR SZ.IsActive = 1
--			)
--	)
--SELECT LM.ID
--	,LM.ProductID
--	,LM.DisplayOrder
--	,LM.SizeCode
--	,LM.CDNPath
--FROM ListingMedia LM
--WHERE LM.RowNumber <= 2

	SELECT 
		M.ID
		,M.ProductID
		,M.DisplayOrder
		,SZ.Code AS SizeCode
		,PMF.CDNPath
	FROM PRD.ProductMedia M
	INNER JOIN PRD.Product P ON P.ID = M.[ProductID]
	INNER JOIN PRD.ProductMediaFile PMF ON PMF.ProductMediaID = M.ID
	LEFT JOIN LK.MediaSize SZ ON SZ.ID = PMF.SizeID
	WHERE 
		P.IsActive = 1
		AND PMF.SizeID IS NOT NULL
		AND (
			SZ.IsActive IS NULL
			OR SZ.IsActive = 1
			)