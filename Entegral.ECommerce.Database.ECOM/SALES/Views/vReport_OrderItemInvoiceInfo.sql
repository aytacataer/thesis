


CREATE VIEW [SALES].[vReport_OrderItemInvoiceInfo]
AS
SELECT 
	Code AS [StoreCode]
	,OI.OrderID
	,ISNULL((OI.SalePrice / (OI.VATRate + 100) * 100), 0) AS VatExcludedPrice
	,I.ID AS SaleInvoiceID
	,I.PackagingLocationID AS SaleInvoicePackagingLocationID
	,SPL.NAME AS SaleInvoicePackagingLocationName
	,RI.ID AS ReturnInvoiceID
	,RI.PackagingLocationID AS ReturnInvoicePackagingLocationID
	,RPL.NAME AS ReturnInvoicePackagingLocationName
	,CAST(O.CreateTime AS DATE) AS OrderCreateTime
	,CAST(I.CreateTime AS DATE) AS SaleInvoiceCreateTime
	,CAST(RI.CreateTime AS DATE) AS ReturnInvoiceCreateTime
FROM SALES.OrderItem AS OI
INNER JOIN SALES.OrderMain AS O ON OI.OrderID = o.ID
INNER JOIN LK.Store AS S ON O.StoreID = S.ID
LEFT JOIN Sales.Invoice AS I ON I.ID = OI.InvoiceID
LEFT JOIN Sales.Invoice AS RI ON RI.ID = OI.ReturnInvoiceID
LEFT JOIN LK.PackagingLocation AS SPL ON SPL.ID = I.PackagingLocationID
LEFT JOIN LK.PackagingLocation AS RPL ON RPL.ID = RI.PackagingLocationID
WHERE o.IsPlacedSuccessfully = 1
	AND OI.CancelReasonID IS NULL