
CREATE VIEW [PRD].[vBO_NonColorGroupProduct]
AS
SELECT P.ID
	,P.ExternalSystemCode
	,P.DisplayName
FROM PRD.Product P
INNER JOIN PRD.ProductAttribute PA ON PA.ProductID = P.ID
INNER JOIN LK.Atribute A ON A.ID = PA.AttributeID
WHERE A.CodeName = 'color'
	AND P.ID NOT IN (
		SELECT ProductID
		FROM PRD.ProductAttribute PA
		INNER JOIN LK.Atribute A ON A.ID = PA.AttributeID
			AND A.CodeName = 'color-group'
		)