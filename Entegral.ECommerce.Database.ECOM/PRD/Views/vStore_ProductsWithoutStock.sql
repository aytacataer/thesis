

CREATE VIEW [PRD].[vStore_ProductsWithoutStock]
AS
WITH firstCategory AS (
		SELECT DISTINCT 
				C.StoreID
			   ,CP.ProductID
		FROM PRD.Category_Product CP
		INNER JOIN PRD.Category C ON CP.CategoryID = C.ID
	)
SELECT
	firstCat.StoreID
	,P.ID
	,P.FriendlyURI
	,P.DisplayName
	,AO.ValueText AS Brand
FROM prd.product p
INNER JOIN firstCategory AS firstCat ON p.ID = firstCat.ProductID
LEFT JOIN prd.variant v ON p.id = v.productid
LEFT JOIN prd.variantstock vs ON v.id = vs.variantid
LEFT JOIN PRD.ProductAttribute PA ON PA.ProductID = P.ID
LEFT JOIN LK.AttributeOption AO ON PA.AttributeOptionID = AO.ID
LEFT JOIN LK.Atribute A ON PA.AttributeID = A.ID
WHERE A.CodeName = 'brand'
GROUP BY 
	firstCat.StoreID
	,P.ID
	,P.FriendlyURI
	,P.DisplayName
	,AO.ValueText
HAVING sum(vs.quantity) = 0