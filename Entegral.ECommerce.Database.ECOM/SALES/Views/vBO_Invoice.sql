
CREATE VIEW [SALES].[vBO_Invoice]
AS
SELECT I.*
	,SI.InvoiceNo AS SaleInvoiceNo
	,PL.ExternalSystemCode AS PackagingLocationCode
	,PL.NAME AS PackagingLocationName
FROM sales.Invoice I
LEFT JOIN sales.Invoice SI ON I.SaleInvoiceID = SI.ID
LEFT JOIN lk.PackagingLocation PL ON I.PackagingLocationID = PL.ID