


CREATE VIEW [PRD].[vBO_RelatedProduct]
AS
WITH ProductCategories AS (
		SELECT 	DISTINCT C.StoreID
			   ,CP.ProductID
		FROM PRD.Category_Product CP
		INNER JOIN PRD.Category C ON CP.CategoryID = C.ID
	)
SELECT  PC.StoreID,
		RP.*, 
		P1.ExternalSystemCode AS ProductExternalSystemCode, 
		P1.DisplayName AS ProductDisplayName, 
		P1.CreateTime as [ProductCreateTime],
		P1.Description AS [ProductDescription],
		P2.ExternalSystemCode AS RelatedProductExternalSystemCode, 
		P2.DisplayName AS RelatedProductDisplayName,
		P2.CreateTime AS [RelatedProductCreateTime],
		P2.Description AS [RelatedProductDescription]
FROM PRD.RelatedProduct AS RP
INNER JOIN PRD.Product AS P1 ON P1.ID = RP.ProductID
INNER JOIN PRD.PRODUCT AS P2 ON P2.ID = RP.RelatedProductID
LEFT JOIN ProductCategories AS PC ON PC.ProductID = RP.RelatedProductID