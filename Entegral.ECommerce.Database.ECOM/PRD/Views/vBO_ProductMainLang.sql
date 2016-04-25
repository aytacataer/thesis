CREATE VIEW [PRD].[vBO_ProductLang]
AS
SELECT ROW_NUMBER() OVER (
		ORDER BY PL.ID DESC
		) AS RowID
	,[PL].[ID]
	,[PL].[LanguageID]
	,[PL].[DisplayName]
	,[PL].[Description]
	,[PL].[FriendlyURI]
	,[PL].[MetaKeywords]
	,[PL].[MetaDescription]
	,[PL].[PageTitle]
	,[PL].[CreateUserID]
	,[PL].[CreateTime]
	,[PL].[UpdateUserID]
	,[PL].[UpdateTime]
	,[PL].[IsActive]
	,L.NAME AS LanguageName
FROM prd.[Product_Lang] PL
INNER JOIN LK.LANGUAGE L ON L.ID = PL.LanguageID
