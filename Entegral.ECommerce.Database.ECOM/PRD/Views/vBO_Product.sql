
CREATE VIEW [PRD].[vBO_Product]
AS
SELECT PS.TotalStock
	,DM.CDNPath
	,P.*
FROM PRD.Product P
LEFT JOIN PRD.vBO_ProductDefaultMediaFile DM ON P.ID = DM.ProductID
LEFT JOIN prd.vBO_ProductStock PS ON p.ID = PS.ProductID