

CREATE VIEW [LK].[vBO_AttributeOptionLang]
AS
SELECT ROW_NUMBER() OVER (
		ORDER BY A.ID DESC
		) AS 'RowID'
	,[L].[ID]
	,[L].[LanguageID]
	,[L].[ValueText]
	,[L].[Description]
	,[L].[IsActive]
	,[L].[CreateUserID]
	,[L].[CreateTime]
	,[L].[UpdateUserID]
	,[L].[UpdateTime]
	,O.AttributeID
	,O.ValueText AS OriginalText
	,O.Description AS OriginalDescription
	,LNG.NAME AS LanguageName
FROM LK.[AttributeOption_Lang] AS L
INNER JOIN LK.[AttributeOption] AS O ON O.ID = L.ID
INNER JOIN LK.[Atribute] AS A ON A.ID = O.AttributeID
INNER JOIN lk.LANGUAGE AS LNG ON LNG.ID = L.LanguageID
