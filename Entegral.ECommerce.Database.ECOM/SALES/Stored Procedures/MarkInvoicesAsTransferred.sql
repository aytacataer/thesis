CREATE PROCEDURE [SALES].[MarkInvoicesAsTransferred] @storeID INT
	,@startTime DATETIME
	,@endTime DATETIME
AS
BEGIN TRAN

UPDATE SALES.Invoice
SET IsTransferredToExternalSystem = 1
	,ExternalSystemTransferTime = GETUTCDATE()
FROM Sales.Invoice AS I
INNER JOIN (
	SELECT DISTINCT INV.ID
	FROM SALES.Invoice INV
	INNER JOIN SALES.OrderItem OI ON INV.ID = OI.InvoiceID
		OR INV.ID = OI.ReturnInvoiceID
	INNER JOIN SALES.OrderMain OM ON OI.OrderID = OM.ID
	WHERE OM.StoreID = @storeID
		AND INV.IsTransferredToExternalSystem = 0
		AND INV.CreateTime >= @startTime
		AND INV.CreateTime <= @endTime
	) AS Invoices ON Invoices.ID = I.ID

COMMIT

RETURN 0