CREATE VIEW [CMS].[vBO_StoreContentTemplate]
AS
SELECT [SCT].[ID]
	,[SCT].[StoreID]
	,ST.CODE AS StoreCode
	,ST.NAME AS StoreName
	,CT.ID AS ContentTemplateID
	,CT.Code AS ContentTemplateCode
	,[SCT].[IsActive]
	,[SCT].[CreateUserID]
	,[SCT].[CreateTime]
	,[SCT].[UpdateUserID]
	,[SCT].[UpdateTime]
FROM CMS.Store_ContentTemplate SCT
INNER JOIN CMS.ContentTemplate CT ON CT.ID = SCT.ContentTemplateID
INNER JOIN LK.Store ST ON SCT.StoreID = ST.ID