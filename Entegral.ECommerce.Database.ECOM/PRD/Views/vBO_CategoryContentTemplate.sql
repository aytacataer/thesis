CREATE VIEW [PRD].[vBO_CategoryContentTemplate]
AS
SELECT [CCT].[ID]
	,[CCT].[CategoryID]
	,[CCT].[ContentTemplateID]
	,[CCT].[DisplayOrder]
	,[CT].[StoreID]
	,[CT].[Code]
	,[ST].[Code] AS StoreCode
	,[ST].[NAME] AS StoreName
	,[CT].[IsActive]
FROM PRD.Category_ContentTemplate AS CCT
INNER JOIN CMS.ContentTemplate AS CT ON CT.ID = CCT.ContentTemplateID
INNER JOIN LK.Store AS ST ON ST.ID = CT.StoreID