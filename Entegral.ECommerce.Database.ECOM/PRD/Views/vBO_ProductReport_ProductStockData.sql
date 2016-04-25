

CREATE view [PRD].[vBO_ProductReport_ProductStockData] as 
SELECT        PM.ProductID, V.ID AS VariantID, V.Barcode AS VariantBarcode, P.ExternalSystemCode AS ProductExternalSystemCode, V.ExternalSystemCode AS VariantExternalSystemCode, VS.Quantity AS TotalStock, 
                         ISNULL(CAST((CASE WHEN PM.ProductID IS NULL THEN 0 ELSE 1 END) AS BIT), 0) AS HasAllImages
FROM            PRD.VariantStock AS VS INNER JOIN
                         PRD.Variant AS V ON V.ID = VS.VariantID INNER JOIN
                         PRD.Product AS P ON V.ProductID = P.ID INNER JOIN
                         PRD.ProductMedia AS PM ON P.ID = PM.ProductID INNER JOIN
                         PRD.ProductMediaFile AS PMF ON PMF.ProductMediaID = PM.ID INNER JOIN
                         PRD.vStore_ProductResizedAllImages AS PRM ON P.ID = PRM.ProductID INNER JOIN
                         PRD.vBO_ProductAttribute AS PA ON V.ID = PA.VariantID
WHERE        (P.IsActive = 1) AND (V.IsActive = 1) AND (PMF.CDNPath IS NOT NULL) AND (PA.IsVariant = 1)
GROUP BY V.ID, V.Barcode, P.ExternalSystemCode, V.ExternalSystemCode, PM.ProductID, VS.Quantity