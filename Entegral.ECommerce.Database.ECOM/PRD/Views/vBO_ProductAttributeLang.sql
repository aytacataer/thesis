


CREATE VIEW [PRD].[vBO_ProductAttributeLang]
AS
SELECT ROW_NUMBER() OVER (
		ORDER BY PA.ID DESC
		) AS RowID
	,PA.ID
	,P.ID AS 'ProductID'
	,P.DisplayName AS 'ProductDisplayName'
	,V.ID AS VariantID
	,V.ExternalSystemCode AS 'VariantExternalSystemCode'
	,V.Description AS 'VariantDescription'
	,A.DisplayName AS 'AttributeName'
	,L.NAME AS LanguageName
	,L.ID AS 'LanguageID'
	,PAL.[CustomValueText] 'CustomValueText'
FROM PRD.[ProductAttribute_Lang] PAL
INNER JOIN PRD.[ProductAttribute] PA ON PAL.ID = PA.ID
INNER JOIN LK.LANGUAGE L ON L.ID = PAL.LanguageID
INNER JOIN PRD.[Product] P ON P.ID = PA.[ProductID]
INNER JOIN LK.[Atribute] A ON A.ID = PA.AttributeID
LEFT OUTER JOIN PRD.[Variant] V ON V.ID = PA.[VariantID]
