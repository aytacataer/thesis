-- =============================================
-- Description:	gets modified products
-- =============================================
CREATE PROCEDURE [dbo].[GetPartialIndexableProducts]
	@storeId INT,
	@updateTime DATETIME
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @defaultStoreId INT = 0;

	SELECT P.ID AS ProductID, SUM(VS.Quantity) AS StockQuantity
	FROM PRD.Product P
	INNER JOIN PRD.Variant V ON P.ID = V.ProductID
	INNER JOIN PRD.VariantStock VS ON V.ID = VS.VariantID
	INNER JOIN prd.ProductStoreData as psd ON (psd.StoreID = @storeId OR psd.StoreID = @defaultStoreId) AND psd.ProductID = p.ID

	WHERE	((P.IsActive = 0 AND P.UpdateTime >= @updateTime)
			OR (P.IsActive = 1 AND V.UpdateTime >= @updateTime)
			OR (P.IsActive = 1 AND VS.UpdateTime >= @updateTime))
	GROUP BY P.ID
	--remove below for a full delta
	HAVING SUM(vs.Quantity) = 0;

END