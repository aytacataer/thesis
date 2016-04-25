CREATE VIEW [PRD].[vStore_CategoryProductHavingStocks]
AS
SELECT cp.CategoryID
	,cp.ProductID
	,sum(vs.Quantity) QUANTITY
FROM PRD.Category_Product CP
INNER JOIN PRD.Product P ON P.ID = CP.ProductID
INNER JOIN PRD.Variant V ON V.ProductID = CP.ProductID
INNER JOIN PRD.VariantStock VS ON VS.VariantID = V.ID 
Where V.IsActive = 1
	AND P.IsActive = 1
GROUP BY cp.ProductID
	,cp.CategoryID
HAVING sum(vs.Quantity) > 0