
CREATE VIEW [CMS].[vBO_Content]
AS
SELECT [SP].[ID]
	,[SP].[StoreID]
	,[SP].[ContentType]
	,[SP].[Title]
	,[SP].[MetaKeywords]
	,[SP].[MetaDescription]
	,[SP].[FriendlyURI]
	,[SP].VisibilityStartDate
	,[SP].VisibilityEndDate
	,[SP].[Width]
	,[SP].[Height]
	,[SP].[Class]
	,[SP].[IsActive]
	,[SP].[CreateUserID]
	,[SP].[CreateTime]
	,[SP].[UpdateUserID]
	,[SP].[UpdateTime]
	,S.Code AS StoreCode
	,S.NAME AS StoreName
FROM CMS.Content SP
INNER JOIN LK.Store S ON SP.StoreID = S.ID
