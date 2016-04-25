
create view [PRD].[vBO_ProductStock] as 
	SELECT
		P.ID As ProductID
		,sum(VS.Quantity) as TotalStock
	FROM PRD.[Product] P
	INNER JOIN PRD.[Variant] V ON V.[ProductID] = P.ID
	INNER JOIN PRD.[VariantStock] VS ON VS.[VariantID] = V.ID
	WHERE
		V.IsActive = 1
		group by p.ID