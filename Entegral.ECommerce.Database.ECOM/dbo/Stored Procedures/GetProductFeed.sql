







CREATE PROCEDURE [dbo].[GetProductFeed]
AS
BEGIN
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SET ANSI_PADDING OFF;

	WITH firstMedia
	AS (
		SELECT pm.ProductID
			,MAX(pmf.CDNPath) AS CDNPath
		FROM prd.ProductMedia pm
		INNER JOIN prd.ProductMediaFile pmf ON pm.id = pmf.ProductMediaID
		--INNER JOIN lk.MediaSize ms ON pmf.SizeID = ms.ID AND ms.Code = 'size-thumb'
		WHERE pmf.SizeID IS NULL
			AND pm.DisplayOrder < 1
		GROUP BY pm.ProductID
	)
	,firstCategory 
	AS (
		SELECT DISTINCT 
				C.StoreID
			   ,CP.ProductID
		FROM PRD.Category_Product CP
		INNER JOIN PRD.Category C ON CP.CategoryID = C.ID
	)
	--,categoryHierarchies 
	--AS	(
	--	SELECT
	--		C1.ID,
	--		C1.Code,
	--		C1.ParentCategoryID,
	--		C1.ShowOnProductFeed,
	--		CAST('' AS VARCHAR(MAX)) AS Hierarchy
	--	FROM PRD.Category C1
	--	WHERE C1.ParentCategoryID IS NULL
	--	UNION ALL
	--	SELECT
	--		C2.ID,
	--		C2.Code,
	--		C2.ParentCategoryID,
	--		C2.ShowOnProductFeed,
	--		CH.Hierarchy + ' > ' + CAST(CH.ID AS VARCHAR)
	--	FROM PRD.Category C2    
	--	INNER JOIN categoryHierarchies CH  ON CH.ID = C2.ParentCategoryID
	--)
	, productCategories
	AS (
		SELECT C.ID, CP.ProductID, C.ShowOnProductFeed
		FROM PRD.Category_Product CP
		INNER JOIN PRD.Category C ON CP.CategoryID = C.ID
		WHERE C.ShowOnProductFeed = 1 AND C.ParentCategoryID IS NOT NULL
	)
	,allAttribues 
	AS (
		SELECT PA.[ProductID]
			,A.CodeName AS AttributeCodeName
			,AO.ValueText
		FROM PRD.[ProductAttribute] PA
		INNER JOIN LK.[AttributeOption] AO ON AO.ID = PA.[AttributeOptionID]
		INNER JOIN LK.[Atribute] A ON A.ID = PA.AttributeID
		WHERE A.CodeName IN (
				'color'
				,'gender'
				,'brand'
				,'main-category'
				,'sub-category'
				,'good-type'
				,'product-type'
				,'google-category'
				, 'good-type-description'
				
				)
	)
	,productAtts
	AS (
		SELECT PVT.[ProductID]
			,PVT.Color
			,PVT.Brand
			,PVT.Gender 
			,PVT.[main-category] AS MainCategory
			,PVT.[sub-category] AS SubCategory
			,PVT.[good-type] AS GoodType
			,PVT.[product-type] AS ProductType
			,PVT.[google-category] AS GoogleCategory
			,PVT.[good-type-description] AS GoodTypeDescription
			
		FROM (
			SELECT innerAtts.[ProductID]
				,innerAtts.AttributeCodeName
				,innerAtts.ValueText
			FROM allAttribues innerAtts
			) TEMP
		PIVOT(MAX(TEMP.ValueText) FOR TEMP.AttributeCodeName IN (
					color
					,brand
					,gender
					,[main-category]
					,[sub-category]
					,[good-type]
					,[product-type]
					,[google-category]
					,[good-type-description]
					)) AS PVT
	)
	,allAttOptionCodes
	AS
	(
		SELECT PA.[ProductID]
				,A.CodeName AS AttributeCodeName
				,AO.AttributeOptionCode
		FROM PRD.[ProductAttribute] PA
		INNER JOIN LK.[AttributeOption] AO ON AO.ID = PA.[AttributeOptionID]
		INNER JOIN LK.[Atribute] A ON A.ID = PA.AttributeID
		WHERE A.CodeName IN ( 'gender', 'good-type' )
	)
	,attOptionCodes
	AS
	(
		SELECT PVT.[ProductID]
			,PVT.Gender
			,PVT.[good-type] AS GoodTypeCode
		FROM (
			SELECT innerAtts.[ProductID]
				,innerAtts.AttributeCodeName
				,innerAtts.AttributeOptionCode
			FROM allAttOptionCodes innerAtts
			) TEMP
		PIVOT(MAX(TEMP.AttributeOptionCode) FOR TEMP.AttributeCodeName IN (
					gender
					,[good-type]
					)) AS PVT
	)
	,productsHasStock
	AS (
		SELECT DISTINCT V.ProductID
		FROM prd.Variant V
		INNER JOIN prd.VariantStock VS ON V.ID = VS.VariantID
		WHERE VS.Quantity > 0
	)
	SELECT firstCat.StoreID
		,p.ID AS ProductID
		,p.ExternalSystemCode
		,p.FriendlyURI
		,p.Description
		,p.DisplayName
		,PA.GoodTypeDescription
		,psd.Price1
		,psd.Price2
		,psd.Price2_StartTime
		,psd.Price2_EndTime
		,psd.Price3
		,psd.Price3_StartTime
		,psd.Price3_EndTime
		,firstMedia.CDNPath
		,PA.Color
		,PA.Brand
		,PA.MainCategory
		,PA.SubCategory
		,AOC.GoodTypeCode AS GoodType
		,PA.ProductType
		,PA.GoogleCategory AS GoogleCategory
		,PC.ID AS CategoryHierarchy
		,AOC.gender Gender
		,PA.gender GenderText
		,'M' AS Size
	FROM prd.Product AS p	
	INNER JOIN prd.ProductStoreData AS psd ON p.ID = psd.ProductID
	INNER JOIN firstCategory AS firstCat ON p.ID = firstCat.ProductID
	INNER JOIN productsHasStock ON p.ID = productsHasStock.ProductID
	INNER JOIN firstMedia ON firstMedia.ProductID = p.ID
	LEFT JOIN productCategories PC ON p.ID = PC.ProductID
	LEFT JOIN productAtts PA ON PA.ProductID = p.ID
	LEFT JOIN attOptionCodes AOC ON AOC.ProductID = p.ID
	WHERE p.IsActive = 1

END