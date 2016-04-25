CREATE VIEW [PRD].[vINT_ParentChildCategory]
AS
SELECT parent.ID ParentID
	,parent.Code ParentCode
	,parent.StoreID ParentStoreID
	,parent.ParentCategoryID ParentParentCategoryID
	,child.ID ChildID
	,child.Code ChildCode
FROM PRD.Category parent
LEFT JOIN PRD.Category child ON child.ParentCategoryID = parent.ID
WHERE child.IsBrandCategory = 0
	AND parent.IsBrandCategory = 0