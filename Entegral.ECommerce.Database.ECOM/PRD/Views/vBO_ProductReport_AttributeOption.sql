


CREATE VIEW [PRD].[vBO_ProductReport_AttributeOption]
AS
SELECT
	A.ID AS AttributeID,
	A.CodeName As AttributeCode,
	PA.ProductID, 
	P.ExternalSystemCode AS ProductExternalSystemCode, 
	V.ExternalSystemCode AS VariantExternalSystemCode, 
	A.DisplayName AS [AttributeName], 
	AO.ValueText, 
	PA.CustomValueText
FROM PRD.ProductAttribute AS PA 
INNER JOIN PRD.Product AS P ON P.ID = PA.ProductID 
INNER JOIN LK.Atribute AS A ON A.ID = PA.AttributeID
LEFT OUTER JOIN LK.AttributeOption AS AO ON AO.ID = PA.AttributeOptionID 
LEFT OUTER JOIN PRD.Variant AS V ON V.ID = PA.VariantID