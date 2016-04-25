


CREATE VIEW [PRD].[vBO_VariantCodeInOpenCarts_ForStockUpdate]
AS
SELECT V.ExternalSystemCode
FROM SALES.Cart AS C
INNER JOIN SALES.CartItem CI ON C.GUID = CI.CartGUID
INNER JOIN PRD.Variant V ON CI.VariantID = V.ID
INNER JOIN PRD.Product P ON V.ProductID = P.ID
LEFT JOIN PRD.[vCommon_ProductWithMedia] AS PM ON PM.ProductID = P.ID
WHERE V.IsActive = 1
	AND P.IsActive = 1
	AND P.DontUpdateStockFromCentral = 0
	AND C.STATUS = 'OPEN'
	AND C.UpdateTime > DATEADD(hour, - 1, getutcdate())
	AND PM.ProductID IS NOT NULL