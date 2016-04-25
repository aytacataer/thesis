

CREATE VIEW [PRD].[vStore_CategorySiteMap]
AS
SELECT c.FriendlyURI
	,C.ID
	,C.UpdateTime
	,C.StoreID
	,C.IsActive
	,'daily' Changefreq
	,'1.0' [Priority]
FROM PRD.Category C
WHERE
	C.IsVisible = 1
	AND C.VisibilityStartDate <= GETDATE()
	AND C.VisibilityEndDate >= GETDATE()