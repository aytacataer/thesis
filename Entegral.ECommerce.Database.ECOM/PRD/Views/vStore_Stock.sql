
CREATE VIEW [PRD].[vStore_Stock]
AS
	SELECT
		V.ProductID
		,VS.VariantID
		,VS.Quantity
	FROM PRD.[Variant] V
	INNER JOIN PRD.[VariantStock] VS ON VS.[VariantID] = V.ID
	WHERE
		V.IsActive = 1