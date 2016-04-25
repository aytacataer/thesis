





CREATE VIEW [CMS].[vBO_BannerLang]
AS
SELECT
	ROW_NUMBER() OVER (ORDER BY BL.ID) AS RowID,
	[BL].[ID], [BL].[LanguageID], [BL].[AltText], [BL].[Title], [BL].[SubTitle], [BL].[Link], [BL].[IsOpenNewPage], [BL].[IsActive], [BL].[CreateUserID], [BL].[CreateTime], [BL].[UpdateUserID], [BL].[UpdateTime],
	L.Name as LanguageName
FROM CMS.Banner_Lang BL
INNER JOIN LK.Language L ON BL.LanguageID = L.ID
