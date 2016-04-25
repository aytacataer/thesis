CREATE VIEW [PRD].[vBO_CategoryLang]
AS
SELECT ROW_NUMBER() OVER (
		ORDER BY C.ID DESC
		) AS RowID
	,[C].[ID]
	,[C].[LanguageID]
	,[C].[DisplayName]
	,[C].[MetaKeywords]
	,[C].[MetaDescription]
	,[C].[PageTitle]
	,[C].[CustomURL]
	,[C].[FriendlyURI]
	,[C].[IsActive]
	,[C].[CreateUserID]
	,[C].[CreateTime]
	,[C].[UpdateUserID]
	,[C].[UpdateTime]
	,L.NAME AS LanguageName
FROM PRD.Category_Lang AS C
LEFT JOIN LK.LANGUAGE AS L ON L.ID = C.LanguageID
