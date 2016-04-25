

CREATE VIEW [PRD].[vStore_Category_Lang]
AS
SELECT [C].[ID]
	,[C].[LanguageID]
	,[C].[DisplayName]
	,[C].[MetaKeywords]
	,[C].[MetaDescription]
	,[C].[PageTitle]
	,[C].[Description]
	,[C].[CustomURL]
	,[C].[FriendlyURI]
	,[C].[IsActive]
FROM PRD.Category_Lang AS C