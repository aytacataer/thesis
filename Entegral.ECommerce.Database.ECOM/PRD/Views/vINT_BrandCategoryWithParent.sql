
CREATE VIEW [PRD].[vINT_BrandCategoryWithParent]
AS
SELECT brand.ID BrandID
	,brand.Code BrandCode
	,brand.StoreID brandStoreID
	,brand.ParentCategoryID BrandParentID
	,parent.Code ParentCode
	,parent.IsBrandCategory IsParentBrandCategory
	,child.Code ChildCode
FROM PRD.Category brand
INNER JOIN PRD.Category parent ON brand.ParentCategoryID = parent.ID
LEFT JOIN PRD.Category child ON brand.ID = child.ParentCategoryID
WHERE brand.IsBrandCategory = 1