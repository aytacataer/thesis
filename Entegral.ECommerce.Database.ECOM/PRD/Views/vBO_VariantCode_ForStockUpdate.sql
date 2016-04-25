

CREATE VIEW [PRD].[vBO_VariantCode_ForStockUpdate]
AS
SELECT V.ExternalSystemCode
FROM PRD.Variant AS V
INNER JOIN PRD.Product P ON V.ProductID = P.ID
LEFT JOIN PRD.[vCommon_ProductWithMedia] AS PM ON PM.ProductID = P.ID
WHERE V.IsActive = 1
	AND P.DontUpdateStockFromCentral = 0
	AND PM.ProductID IS NOT NULL