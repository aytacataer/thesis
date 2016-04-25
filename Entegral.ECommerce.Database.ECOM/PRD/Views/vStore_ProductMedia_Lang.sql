

CREATE VIEW [PRD].[vStore_ProductMedia_Lang]
AS
SELECT PML.[ID]
	,PM.ProductID
	,PML.[LanguageID]
	,PML.[AltText]
	,PML.[Title]
	,PML.[IsActive]
FROM PRD.ProductMedia_Lang AS PML
INNER JOIN PRD.ProductMedia AS PM on PML.ID = PM.ID