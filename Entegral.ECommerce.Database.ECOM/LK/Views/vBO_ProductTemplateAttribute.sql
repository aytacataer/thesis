
CREATE VIEW [LK].[vBO_ProductTemplateAttribute]
AS
SELECT
	PTA.ProductTemplateID AS ProductTemplateID,
	PTA.ID AS ProductTemplateAttributeID,
	A.ID,
	A.CodeName,
	A.ExternalSystemCode,
	A.DisplayName,
	A.IsActive
FROM LK.ProductTemplateAttribute PTA
INNER JOIN LK.Atribute A ON A.ID = PTA.AttributeID