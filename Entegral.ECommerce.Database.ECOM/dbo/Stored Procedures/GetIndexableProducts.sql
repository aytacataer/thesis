
-- =============================================
-- Description:	gets index-ready products
-- =============================================
CREATE PROCEDURE [dbo].[GetIndexableProducts]
	@offset INT,
	@limit INT,
	@storeId INT,
	@languageId INT
	--@partialDate DATETIME = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SET ANSI_PADDING OFF;

	DECLARE @defaultStoreId INT = 0;

	--IF OBJECT_ID('tempdb.dbo.#products', 'U') IS NOT NULL DROP TABLE #products;
	--IF OBJECT_ID('tempdb.dbo.#images', 'U') IS NOT NULL DROP TABLE #images;
	--IF OBJECT_ID('tempdb.dbo.#attributes', 'U') IS NOT NULL DROP TABLE #attributes;
	--IF OBJECT_ID('tempdb.dbo.#categories', 'U') IS NOT NULL DROP TABLE #categories;
	--IF OBJECT_ID('tempdb.dbo.#smartTags', 'U') IS NOT NULL DROP TABLE #smartTags;

	--CREATE TABLE #products
	DECLARE @products TABLE
	(
		ProductId INT,
		Title NVARCHAR(150),
		DisplayOrder INT,
		Description NVARCHAR(1000),
		ProductKey NVARCHAR(500),
		VatRate INT,
		Price1 MONEY,
		Price2 MONEY DEFAULT NULL,
		Price2_StartTime DATETIME DEFAULT NULL,
		Price2_EndTime DATETIME DEFAULT NULL,
		Price3 MONEY DEFAULT NULL,
		Price3_StartTime DATETIME DEFAULT NULL,
		Price3_EndTime DATETIME DEFAULT NULL,
		Price4 MONEY DEFAULT NULL,
		Price4_StartTime DATETIME DEFAULT NULL,
		Price4_EndTime DATETIME DEFAULT NULL,
		StockQuantity INT,
		IsVatIncluded BIT,
		IsPreOrder BIT,
		MetaData NVARCHAR(MAX),
		ProductCode NVARCHAR(150),
		SortPriority DECIMAL(6,2),
		PRIMARY KEY (ProductID)
	);

	DECLARE @images TABLE
	(
		ProductID INT,
		ID INT,
		MediaFileID INT,
		CDNPath NVARCHAR(MAX),
		MediaFormat NVARCHAR(50),
		SizeID INT,
		DisplayOrder INT,
		PRIMARY KEY (ProductID,ID,MediaFileID)
	);

	DECLARE @attributes TABLE
	(
		ProductID INT,
		AttributeID INT,
		AttributeOptionID INT,
		CodeName VARCHAR(150),
		ValueText NVARCHAR(150)
		--PRIMARY KEY (ProductID,AttributeID,AttributeOptionID)
	);
	--24997, 20, 556
	DECLARE @categories TABLE
	(
		CategoryID INT,
		CategoryKey NVARCHAR(MAX),
		FriendlyUri NVARCHAR(MAX),
		DisplayName NVARCHAR(MAX),
		IsNotHyperlink BIT,
		ShowProducts BIT,
		IsVisible BIT,
		IsActive BIT,
		CategoryPath NVARCHAR(MAX),
		PRIMARY KEY (CategoryID)
	);

	DECLARE @smartTags TABLE
	(
		ID INT,
		Value NVARCHAR(50),
		ImageUrl NVARCHAR(MAX),
		ProductID INT,
		PRIMARY KEY (ID,ProductID)
	);

	INSERT INTO @products
	SELECT
		r.ID,
		r.DisplayName,
		r.DisplayOrder,
		r.Description,
		r.FriendlyURI,
		r.VatRate,
		r.Price1,
		r.Price2,
		r.Price2_StartTime,
		r.Price2_EndTime,
		r.Price3, 
		r.Price3_StartTime, 
		r.Price3_EndTime, 
		r.Price4,
		r.Price4_StartTime, 
        r.Price4_EndTime,
		r.TotalStock,
		r.IsVatIncluded,
		r.IsPreOrder,
		r.MetaData,
		r.ExternalSystemCode,
		r.Score
	FROM    (SELECT
				ROW_NUMBER() OVER ( ORDER BY p.ID ) AS RowNum, 
				ps.TotalStock,
				--dm.CDNPath, 
				p.ID, 
				--p.ExternalSystemCode, 
				ISNULL(pl.DisplayName, p.DisplayName) as DisplayName, 
				p.DisplayOrder, 
				ISNULL(pl.Description,p.Description) as Description, 
				ISNULL(pl.FriendlyURI, p.FriendlyURI) as FriendlyURI,
				--ISNULL(pl.MetaKeywords, p.MetaKeywords) as MetaKeywords,
				--ISNULL(pl.MetaDescription, p.MetaDescription) as MetaDescription,
				--ISNULL(pl.PageTitle, p.PageTitle) as PageTitle,
				p.VatRate, 
				--p.IsDiscountForbidden, 
                --p.IsReturnForbidden, 
				--p.IsGiftCard, 
				--p.IsUseInfoInSeo, 
				--p.IsActive, 
				--p.CreateUserID,
				--p.CreateTime, 
				--p.UpdateUserID, 
				--p.UpdateTime, 
				--p.IsCreatedByIntegration, 
				p.IsPreOrder, 
				--p.EstimatedSupplyDate, 
                --p.DontUpdateStockFromCentral,
				--psd.ID as ProductStoreID,
				--psd.StoreID,
				--psd.ProductID,
				psd.Price1,
				psd.Price2,
				psd.Price2_StartTime,
				psd.Price2_EndTime,
				psd.Price3, 
				psd.Price3_StartTime, 
				psd.Price3_EndTime, 
				psd.Price4,
				psd.Price4_StartTime, 
                psd.Price4_EndTime,
				s.IsVatIncluded,
				ISNULL(p.MetaKeywords + '::', '') + (SELECT vrn.Barcode + '::' AS 'data()' FROM prd.Variant vrn WHERE vrn.ProductID = p.ID AND vrn.IsActive = 1 FOR XML PATH('')) AS MetaData,
				p.ExternalSystemCode,
				ISNULL(p.Score, CASE WHEN p.Score = 0 THEN 1 ELSE p.Score END) as Score
				--s.Name as StoreName
			FROM prd.vStore_Product AS p
				 INNER JOIN prd.ProductStoreData as psd ON (psd.StoreID = @storeId OR psd.StoreID = @defaultStoreId) AND psd.ProductID = p.ID
				 INNER JOIN lk.Store AS s ON s.ID = psd.StoreID
				 INNER JOIN prd.vBO_ProductStock AS ps ON p.ID = ps.ProductID
				 LEFT JOIN prd.Product_Lang pl ON pl.LanguageID = @languageId AND pl.ID = p.ID AND pl.IsActive = 1
			WHERE (@languageId = 0 OR pl.DisplayName IS NOT NULL)
				  AND ( (p.HasAllImages = 0 AND s.HideProductsWithNoImage = 0) OR ( p.HasAllImages = 1) )
				  AND ( (ps.TotalStock = 0 AND  s.HideProductsWithNoStock = 0) OR ( ps.TotalStock > 0) )
			) AS r			
	WHERE   r.RowNum >= @offset AND r.RowNum < @limit+@offset
	ORDER BY r.RowNum ASC OPTION (RECOMPILE); --recompile needed for performance

	--images
	INSERT INTO @images
	--SELECT r.ProductID, r.ID, r.MediaFileID, r.CDNPath, r.MediaFormat, r.SizeID FROM
	--(
		SELECT 
			pm.ProductID,
			pm.ID,			
			--ROW_NUMBER() OVER (PARTITION BY pm.ProductID ORDER BY pm.ProductID ASC, pm.DisplayOrder ASC) AS RowNum,
			pmf.ID as MediaFileID,
			pmf.CDNPath,
			pm.MediaFormat,
			pmf.SizeID,
			pm.DisplayOrder
		FROM prd.ProductMedia pm 
		INNER JOIN prd.ProductMediaFile pmf ON pmf.ProductMediaID = pm.ID
		INNER JOIN lk.MediaSize ms ON ms.ID = pmf.SizeID
		WHERE pm.ProductID IN (SELECT p.ProductId FROM @products p) AND pm.IsActive = 1 AND ms.Code = 'size-listing'
		ORDER BY pm.DisplayOrder ASC
	--) as r
	--WHERE RowNum < 2
	;

	--smart tags
	INSERT INTO @smartTags
	SELECT
		s.ID,
		s.Value,
		s.ImageUrl,
		sp.ProductID
		FROM PRD.SmartTag s
		INNER JOIN  PRD.SmartTag_Product sp ON sp.SmartTagID = s.ID
	WHERE s.IsActive = 1;

	--attr
	INSERT INTO @attributes
	SELECT
		pa.ProductID,
		pa.AttributeID,
		pa.AttributeOptionID,		
		at.CodeName,
		ISNULL(al.ValueText, AO.ValueText)
	FROM 
		prd.ProductAttribute pa 		
		INNER JOIN LK.Atribute at ON at.ID = pa.AttributeID
		LEFT JOIN LK.[AttributeOption] AO ON AO.ID = PA.[AttributeOptionID]
		LEFT JOIN LK.AttributeOption_Lang al ON al.LanguageID = @languageId AND al.ID = pa.AttributeOptionID AND al.IsActive = 1
	WHERE 
		pa.ProductID IN (SELECT p.ProductId FROM @products p)
		AND pa.AttributeOptionID IS NOT NULL
		AND (pa.VariantID IS NULL OR (SELECT SUM(vs.Quantity) FROM prd.VariantStock vs WHERE vs.VariantID = pa.VariantID) > 0)
		AND (@languageId = 0 OR al.ValueText IS NOT NULL)
		OPTION (RECOMPILE);

	--categories //TODO: category language!!
	WITH CategoryHier (CategoryID, CategoryKey, FriendlyUri, DisplayName, IsNotHyperlink, ShowProducts, IsVisible, IsActive, CategoryPath) as
	(
	  SELECT
			c.ID as CategoryID,
			c.Code,
			c.FriendlyURI,
			c.DisplayName,
			c.IsNotHyperlink,
			c.ShowProducts,
			c.IsVisible,
			c.IsActive,
			CONVERT(NVARCHAR(MAX), c.ID)  as CategoryPath			
	  FROM prd.Category c	  
	  WHERE c.ParentCategoryID IS NULL AND (c.StoreID = @storeId OR c.StoreID = @defaultStoreId) 
	  UNION ALL
	  SELECT rc.ID as CategoryID, 
			 rc.Code,
			 rc.FriendlyURI,
			 rc.DisplayName,
			 rc.IsNotHyperlink,
			 rc.ShowProducts,
			 rc.IsVisible,
			 rc.IsActive,
			 CAST(CategoryHier.CategoryPath + N'/' + CONVERT(NVARCHAR(MAX), rc.ID) as NVARCHAR(MAX))
	  FROM prd.Category rc
	  INNER JOIN CategoryHier ON rc.ParentCategoryID = CategoryHier.CategoryID
	  WHERE rc.StoreID = @storeId OR rc.StoreID = @defaultStoreId
	)

	INSERT INTO @categories
	SELECT ch.* FROM CategoryHier as ch;

	--products
	SELECT p.*,
		(SELECT 
			img.ID,
			img.MediaFileID,
			img.CDNPath,
			img.MediaFormat,
			img.SizeID,
			img.DisplayOrder
			FROM @images img 
			WHERE img.ProductID = p.ProductId
			FOR XML AUTO, ROOT ('images')) as ProductImages,

		  (SELECT 
			attr.* 
			FROM @attributes attr
			WHERE attr.ProductID = p.ProductId
			FOR XML AUTO, ROOT ('attributes')) as ProductAttributes,

		(
		SELECT cat.* FROM
		(
			SELECT 
			catTemp.CategoryID,
			catTemp.CategoryKey,
			catTemp.FriendlyUri,
			catTemp.DisplayName,
			catTemp.IsNotHyperlink,
			catTemp.CategoryPath,
			pic.DisplayOrder
			FROM @categories catTemp
			INNER JOIN prd.Category_Product pic ON pic.CategoryID = catTemp.CategoryID AND pic.ProductID = p.ProductId
			WHERE catTemp.IsActive = 1 AND catTemp.ShowProducts = 1
		)	AS cat
		FOR XML AUTO, ROOT ('categories')) as ProductCategories,

		(SELECT st.* FROM
		(
			SELECT
				s.ID,
				s.Value,
				s.ImageUrl,
				sp.ProductID
				FROM PRD.SmartTag s
				INNER JOIN  PRD.SmartTag_Product sp ON sp.SmartTagID = s.ID
			WHERE s.IsActive = 1 
				AND s.StartTime >= GETDATE()
				AND s.EndTime < GETDATE()
				AND sp.ProductID = p.ProductId

		) AS st
		FOR XML AUTO, ROOT ('smart_tags')) as SmartTags

		FROM @products p;

END