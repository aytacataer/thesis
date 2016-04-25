CREATE VIEW [PRD].[vCommon_ProductWithMedia]
AS
SELECT DISTINCT P.ID AS ProductID
FROM PRD.ProductMediaFile AS MF
INNER JOIN PRD.ProductMedia M ON M.ID = MF.ProductMediaID
INNER JOIN PRD.[Product] AS P ON P.ID = M.[ProductID]
