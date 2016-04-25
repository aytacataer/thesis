CREATE VIEW [PRD].[vBO_ShowcaseLang]
AS
SELECT ROW_NUMBER() OVER (
		ORDER BY S.ID DESC
		) AS RowID
	,[S].[ID]
	,[S].[LanguageID]
	,[S].[DisplayName]
	,[S].[Subtitle]
	,[S].[IsActive]
	,[S].[CreateUserID]
	,[S].[CreateTime]
	,[S].[UpdateUserID]
	,[S].[UpdateTime]
	,L.NAME AS LanguageName
FROM PRD.Showcase_Lang AS S
LEFT JOIN LK.LANGUAGE AS L ON L.ID = S.LanguageID
