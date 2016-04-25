




CREATE VIEW [PRD].[vStore_ProductSiteMap]
AS
SELECT P.ID
	,p.FriendlyURI
	,P.UpdateTime
	,P.StoreID
	,P.IsActive
	,'always' Changefreq
	,'0.5' [Priority]
FROM PRD.vStore_Product P
INNER JOIN PRD.vStore_ProductStock PS ON PS.ProductID = P.ID
INNER JOIN PRd.ProductStoreData PSD ON P.ID = PSD.ProductID
LEFT JOIN [PRD].[vStore_ProductResizedAllImages] AS PM ON P.ID = PM.ProductID
WHERE PS.TotalStock > 0 AND PM.ProductID IS NOT NULL