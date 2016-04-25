









CREATE VIEW [PRD].[vStore_ListingPage_CategoryProduct]
AS
SELECT C.ID
	,C.ParentCategoryID
	,C.Code
	,C.FriendlyURI
	,C.DisplayName
	,C.Description
	,C.StoreID
	,C.IsBrandCategory
	,CP.DisplayOrder
	,CP.ProductID
FROM [PRD].[Category_Product] AS CP
INNER JOIN [PRD].Product AS P ON CP.ProductID = P.ID
INNER JOIN [PRD].[Category] AS C ON C.ID = CP.CategoryID
WHERE P.IsActive = 1
	AND C.IsActive = 1