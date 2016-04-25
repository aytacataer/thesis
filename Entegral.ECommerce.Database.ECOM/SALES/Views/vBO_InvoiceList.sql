





CREATE VIEW [SALES].[vBO_InvoiceList]
AS
WITH InvoicedOrderDetail
	AS (
		SELECT 
			OM.ID AS OrderMainID,
			MAX(OM.OrderCode) AS OrderCode, 
			MAX(OM.BonusAmount) AS  BonusAmount,
			MAX(OM.CustomerID) AS CustomerID,
			MAX(OM.CustomerName) AS CustomerName,
			MAX(OM.StoreID) AS StoreID,
			MAX(OI.InvoiceID) AS InvoiceID,
			MAX(OI.ReturnInvoiceID) AS ReturnInvoiceID,
			SUM(OI.SalePrice) AS InvoiceAmount,
			AVG(OI.VATRate) AS AverageVatRate
		FROM SALES.OrderMain OM
			LEFT JOIN SALES.OrderItem OI ON OM.ID = OI.OrderID
		WHERE OM.IsOldSystemOrder=0 AND (OI.InvoiceID IS NOT NULL OR OI.ReturnInvoiceID IS NOT NULL)
		GROUP BY OM.ID, OI.InvoiceID,OI.ReturnInvoiceID
	)
SELECT  IOD.StoreID
		,IOD.OrderMainID 
		,IOD.OrderCode
		,IOD.InvoiceAmount
		,IOD.BonusAmount AS BonusAmount
		,IOD.CustomerID
		,IOD.CustomerName
		,CAST(CASE WHEN IOD.BonusAmount > 0 THEN 1 ELSE 0 END AS BIT) AS IsHopi
		,CAST(CASE WHEN IOD.AverageVatRate > 0 THEN 1 ELSE 0 END AS BIT ) AS IsVatIncluded
		,IOD.AverageVatRate AS AverageVatRate
		,PL.ExternalSystemCode AS PackagingLocationCode
        ,PL.NAME AS PackagingLocationName
		,I.*
FROM sales.Invoice I
LEFT JOIN lk.PackagingLocation PL ON I.PackagingLocationID = PL.ID
INNER JOIN InvoicedOrderDetail IOD ON IOD.InvoiceID = I.ID OR IOD.ReturnInvoiceID = I.ID