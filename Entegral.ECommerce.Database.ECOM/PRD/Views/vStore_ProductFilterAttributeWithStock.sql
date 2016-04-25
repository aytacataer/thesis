

CREATE View [PRD].[vStore_ProductFilterAttributeWithStock]
as 
SELECT PA.ID
	,PA.[ProductID]
	,PA.[VariantID]
	,VS.Quantity [Stock]
	,A.ID AS AttributeID
	,AO.ID AS AttributeOptionID
	,AO.AttributeOptionCode AS AttributeOptionCode
	,AO.Style
	,PA.[CustomValueText]
	,A.CodeName
	,A.DisplayName
	,A.DisplayOrder
	,A.IsImageSwitcher
	,A.IsVariant
	,A.IsFilter
	,A.IsSearchAttribute
	,A.IsLookup
	,A.IsVisibleToCustomer
	,A.IsClassification
	,AO.Description AS OptionDescription
	,AO.ValueText
	,AO.DisplayOrder AS 'OptionDisplayOrder'
	,AO.AttributeLogo
FROM PRD.[ProductAttribute] AS PA
LEFT JOIN LK.[Atribute] AS A ON PA.AttributeID = A.ID
LEFT JOIN LK.[AttributeOption] AS AO ON PA.[AttributeOptionID] = AO.ID
LEFT JOIN PRD.VariantStock AS VS ON PA.VariantID = VS.VariantID
WHERE (A.IsActive = 1)
	AND (
			AO.IsActive IS NULL
			OR AO.IsActive = 1
		)
	AND A.IsFilter = 1
	AND (
	PA.VariantID IS NULL
		OR VS.Quantity > 0
		)