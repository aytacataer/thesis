








CREATE VIEW [PRD].[vStore_ListingPage_ProductAttribute]
AS
SELECT PA.ID
	,PA.[ProductID]
	,PA.[VariantID]
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
	,A.IsDetailAtribute
	,AO.ValueText
	,AO.Description AS OptionDescription
	,AO.DisplayOrder AS OptionDisplayOrder
	,AO.AttributeLogo
	,VS.Quantity
FROM PRD.[ProductAttribute] AS PA
INNER JOIN PRD.Product AS P ON PA.ProductID = P.ID
INNER JOIN LK.[Atribute] AS A ON PA.AttributeID = A.ID
LEFT JOIN LK.[AttributeOption] AS AO ON PA.[AttributeOptionID] = AO.ID
LEFT JOIN PRD.Variant AS V ON PA.VariantID = V.ID
LEFT JOIN PRD.VariantStock AS VS ON V.ID = VS.VariantID
WHERE P.IsActive = 1
	AND A.IsActive = 1
	--AND A.IsFilter = 1
	AND (
		AO.ID IS NULL
		OR AO.IsActive = 1
		)
	AND (
		PA.VariantID IS NULL
		OR V.IsActive = 1
		)