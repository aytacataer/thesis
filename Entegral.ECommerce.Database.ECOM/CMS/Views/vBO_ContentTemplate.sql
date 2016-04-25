

CREATE VIEW [CMS].[vBO_ContentTemplate]
AS
SELECT
	[CT].[ID], [CT].[StoreID], [CT].[Code],[CT].[IsActive], [CT].[CreateUserID], [CT].[CreateTime], [CT].[UpdateUserID], [CT].[UpdateTime],
	ST.CODE AS StoreCode,
	ST.NAME AS StoreName	
FROM CMS.ContentTemplate CT
INNER JOIN LK.Store ST ON CT.StoreID = ST.ID