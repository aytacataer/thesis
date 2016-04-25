
CREATE VIEW [CMS].[vBO_Slider]
AS
SELECT [SL].[ID]
	,[SL].[StoreID]
	,[SL].[Code]
	,[SL].[Header]
	,[SL].[Duration]
	,[SL].[Width]
	,[SL].[Height]
	,[SL].[Class]
	,[SL].[PrevButtonClass]
	,[SL].[NextButtonClass]
	,[SL].[IsActive]
	,[SL].[CreateUserID]
	,[SL].[CreateTime]
	,[SL].[UpdateUserID]
	,[SL].[UpdateTime]
	,ST.CODE AS StoreCode
	,ST.NAME AS StoreName
FROM CMS.Slider SL
INNER JOIN LK.Store ST ON SL.StoreID = ST.ID
