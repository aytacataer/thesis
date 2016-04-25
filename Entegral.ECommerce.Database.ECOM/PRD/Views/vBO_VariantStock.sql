
CREATE VIEW [PRD].[vBO_VariantStock]
AS
SELECT
	P.ID AS ProductID
	,P.DisplayName AS 'ProductDisplayName' 
	,VS.[VariantID]
	,V.Description
	,V.ExternalSystemCode
	,VS.Quantity
FROM PRD.[VariantStock] VS
INNER JOIN PRD.[Variant] V ON VS.[VariantID] = V.ID
INNER JOIN PRD.[Product] P ON V.[ProductID] = P.ID