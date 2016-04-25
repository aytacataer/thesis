
CREATE VIEW CRM.vCommon_ProductListItem
AS
SELECT 
	PLI.*,
	PL.Name AS ProductListName,
	PL.ListType AS ProductListType,
	PL.IsActive AS IsActiveProductList
FROM CRM.ProductListItem PLI
INNER JOIN CRM.ProductList PL ON PLI.ProductListID = PL.ID