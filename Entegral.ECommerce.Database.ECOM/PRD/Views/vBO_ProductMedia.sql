CREATE VIEW [PRD].[vBO_ProductMedia]
AS
SELECT PM.[ID]
	,PM.[DisplayOrder]
	,PM.[MediaFormat]
	,PM.[AltText]
	,PM.[Title]
	,PM.[ProductID]
	,PM.[VariantID]
	,PM.[AttributeOptionID]
	,PM.[CreateUserID]
	,PM.[CreateTime]
	,PM.[UpdateUserID]
	,PM.[UpdateTime]
	,PM.[IsActive]
	,P.DisplayName AS ProductDisplayName
	,P.ExternalSystemCode AS ProductExternalSystemCode
	,V.Description AS VariantDescription
	,V.ExternalSystemCode AS VariantExternalSystemCode
	,AO.AttributeID AS AttributeID
	,A.DisplayName AS AttributeName
	,AO.ValueText AS AttributeValueText
FROM PRD.ProductMedia PM
INNER JOIN PRD.[Product] P ON PM.[ProductID] = P.ID
LEFT JOIN PRD.[Variant] V ON V.ID = PM.[VariantID]
LEFT JOIN LK.[AttributeOption] AO ON AO.ID = PM.[AttributeOptionID]
LEFT JOIN LK.[Atribute] A ON A.ID = AO.AttributeID
