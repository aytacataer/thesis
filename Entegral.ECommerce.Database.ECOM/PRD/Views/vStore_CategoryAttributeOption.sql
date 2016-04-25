CREATE VIEW [PRD].[vStore_CategoryAttributeOption]
AS
SELECT CP.CategoryID
	,PA.AttributeID
	,PA.[AttributeOptionID]
FROM PRD.[Category_Product] CP
INNER JOIN PRD.[ProductAttribute] PA ON PA.[ProductID] = CP.[ProductID]
INNER JOIN LK.[AttributeOption] AO ON AO.ID = PA.[AttributeOptionID]
INNER JOIN LK.[Atribute] A ON A.ID = PA.AttributeID
WHERE AO.IsActive = 1
	AND A.IsActive = 1
GROUP BY CP.CategoryID
	,PA.AttributeID
	,PA.[AttributeOptionID]

