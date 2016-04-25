
  CREATE VIEW [PRD].[vBO_CategoryBanner]
AS
SELECT [CB].[ID]
	,[CB].[CategoryID]
	,[CB].[BannerID]
	,[CB].[IsMenuItem]
	,[CB].[IsListItem]
	,[CB].[DisplayOrder]
	,B.Code
	,B.StoreID
	,ST.Code AS StoreCode
	,ST.NAME AS StoreName
	,B.IsActive
FROM PRD.Category_Banner AS CB
INNER JOIN CMS.Banner AS B ON B.ID = CB.BannerID
INNER JOIN LK.Store AS ST ON ST.ID = B.StoreID