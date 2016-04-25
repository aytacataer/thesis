CREATE VIEW [PRD].[vBO_CategoryContent]
AS
SELECT [CC].[ID]
	,[CC].[CategoryID]
	,[CC].[ContentID]
	,[CC].[IsMenuItem]
	,[CC].[IsListItem]
	,[CC].[DisplayOrder]
	,[C].[FriendlyURI] AS ContentFriendlyURI
	,[C].[StoreID]
	,[ST].[Code] AS StoreCode
	,[ST].[NAME] AS StoreName
	,[C].[IsActive]
FROM PRD.Category_Content AS CC
INNER JOIN CMS.Content AS C ON C.ID = CC.ContentID
INNER JOIN LK.Store AS ST ON ST.ID = C.StoreID