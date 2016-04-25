CREATE VIEW PRD.vBO_ProductMediaLang
AS
SELECT ROW_NUMBER() OVER (
		ORDER BY PM.ID DESC
		) AS RowID
	,[PML].[ID]
	,[PML].[LanguageID]
	,[PML].[AltText]
	,[PML].[Title]
	,[PML].[IsActive]
	,[PML].[CreateUserID]
	,[PML].[CreateTime]
	,[PML].[UpdateUserID]
	,[PML].[UpdateTime]
	,PM.[VariantID]
	,PM.[ProductID]
	,PM.MediaFormat
	,PM.[AttributeOptionID]
	,L.NAME AS LanguageName
FROM PRD.ProductMedia PM
INNER JOIN PRD.ProductMedia_Lang PML ON PM.ID = PML.ID
INNER JOIN LK.LANGUAGE L ON L.ID = PML.LanguageID
