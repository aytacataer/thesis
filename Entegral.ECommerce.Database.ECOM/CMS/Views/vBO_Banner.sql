

CREATE VIEW [CMS].[vBO_Banner]
AS
SELECT [B].[ID]
	,[B].[StoreID]
	,[B].[BannerTemplateID]
	,[B].[Code]
	,[B].[AltText]
	,[B].[Title]
	,[B].[SubTitle]
	,[B].[Link]
	,[B].[IsOpenNewPage]
	,[B].[VisibilityStartDate]
	,[B].[VisibilityEndDate]
	,[B].[Width]
	,[B].[Height]
	,[B].[Class]
	,[B].[IsActive]
	,[B].[CreateUserID]
	,[B].[CreateTime]
	,[B].[UpdateUserID]
	,[B].[UpdateTime]
	,S.Code AS StoreCode
	,S.NAME AS StoreName
FROM CMS.Banner B
INNER JOIN LK.Store S ON B.StoreID = S.ID
