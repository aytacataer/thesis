
CREATE VIEW [PRD].[vBO_ProductList]
AS
SELECT P.*
	,PS.TotalStock
	,DM.CDNPath
	,PSD.StoreID
	,PSD.PurchasePrice
	,PSD.Price1
	,PSD.Price2
	,PSD.Price2_StartTime
	,PSD.Price2_EndTime
	,PSD.Price3
	,PSD.Price3_StartTime
	,PSD.Price3_EndTime
	,PSD.Price4
	,PSD.Price4_StartTime
	,PSD.Price4_EndTime
FROM PRD.Product P
LEFT JOIN PRD.vBO_ProductDefaultMediaFile DM ON P.ID = DM.ProductID
LEFT JOIN prd.vBO_ProductStock PS ON p.ID = PS.ProductID
LEFT JOIN prd.vBO_ProductStoreData PSD ON p.ID = PSD.ProductID