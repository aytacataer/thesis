CREATE VIEW [PRD].[vBO_ProductCategories]
AS
SELECT
	P.ID AS ProductID,
	C.ID AS CategoryID, 
	C.StoreID,
	C.IsActive
FROM PRD.Category AS C 
INNER JOIN PRD.Category_Product AS CP ON CP.CategoryID = C.ID 
INNER JOIN PRD.Product AS P ON P.ID = CP.ProductID