







CREATE VIEW [CMS].[vBO_ContentLang]
AS
SELECT
	ROW_NUMBER() OVER (ORDER BY SPL.ID) AS RowID,
	[SPL].[ID], [SPL].[LanguageID], [SPL].[Title], [SPL].[MetaKeywords], [SPL].[MetaDescription], [SPL].[IsActive], [SPL].[CreateUserID], [SPL].[CreateTime], [SPL].[UpdateUserID], [SPL].[UpdateTime],
	L.Name as LanguageName
FROM CMS.Content_Lang SPL
INNER JOIN LK.Language L ON SPL.LanguageID = L.ID
