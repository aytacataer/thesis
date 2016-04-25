


CREATE VIEW [PRD].[vStore_ProductCategoryInfo]
AS
SELECT C.ID
	,C.Code
	,C.ParentCategoryID
	,C.FriendlyURI
	,C.DisplayName
	,C.DisplayOrder
	,C.StoreID
	,C.IsActive
	,C.VisibilityStartDate
	,C.VisibilityEndDate
	,C.IsBrandCategory
	,CP.ProductID
FROM [PRD].[Category_Product] AS CP
INNER JOIN [PRD].[Category] AS C ON C.ID = CP.CategoryID