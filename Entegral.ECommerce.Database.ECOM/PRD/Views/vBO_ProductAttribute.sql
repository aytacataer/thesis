


CREATE VIEW [PRD].[vBO_ProductAttribute]
AS
SELECT PA.ID AS ID
	,PA.[ProductID]
	,PA.VariantID
	,PA.AttributeID
	,A.CodeName AS AttributeCodeName
	,PA.AttributeOptionID
	,P.DisplayName
	,V.Description AS VariantDescription
	,V.ExternalSystemCode VariantExternalSystemCode
	,A.DisplayName AS AttributeName
	,AO.ValueText AS ValueText
	,AO.Description AS OptionDescription
	,PA.[CustomValueText] AS CustomValueText
	,A.IsLookup
	,A.IsVariant
	,A.IsImageSwitcher
	,A.IsSearchAttribute
	,A.IsVisibleToCustomer
	,AO.VisibleValueText AS VisibleValueText
FROM PRD.[ProductAttribute] PA
INNER JOIN PRD.[Product] P ON P.ID = PA.[ProductID]
INNER JOIN LK.[Atribute] A ON A.ID = PA.AttributeID
LEFT JOIN LK.[AttributeOption] AO ON AO.ID = PA.[AttributeOptionID]
LEFT JOIN PRD.[Variant] V ON V.ID = PA.[VariantID]
