
CREATE VIEW [PRD].[vStore_SiteMapDetailedCategoryProductInfo]
AS
SELECT P.ID 'ProductID'
	,CP.CategoryID
	,P.DisplayName 'ProductDisplayName'
	,P.FriendlyURI 'ProductFriendlyURI'
	,PA.ValueText 'BrandDisplayName'
	,P.StoreID
FROM PRD.vStore_Product P
LEFT JOIN PRD.vStore_ProductAttribute PA ON P.ID = PA.ProductID
INNER JOIN PRD.Category_Product CP ON P.ID = CP.ProductID
WHERE PA.CodeName = 'brand'
	AND P.HasAllImages = 1