

CREATE VIEW [PRD].[vBO_ProductStoreData]
AS
SELECT [PSD].[ID]
	,[PSD].[StoreID]
	,[PSD].[ProductID]
	,[PSD].[PurchasePrice]
	,[PSD].[Price1]
	,[PSD].[Price2]
	,[PSD].[Price2_StartTime]
	,[PSD].[Price2_EndTime]
	,[PSD].[Price3]
	,[PSD].[Price3_StartTime]
	,[PSD].[Price3_EndTime]
	,[PSD].[Price4]
	,[PSD].[Price4_StartTime]
	,[PSD].[Price4_EndTime]
	,[PSD].[CreateUserID]
	,[PSD].[CreateTime]
	,[PSD].[UpdateUserID]
	,[PSD].[UpdateTime]
	,S.Name
FROM PRD.[ProductStoreData] PSD
INNER JOIN LK.STORE S ON S.ID = PSD.StoreID
