
CREATE VIEW [SALES].[vBO_OrdersWithPendingItems]
AS
SELECT OM.ID,OM.CreateTime
FROM SALES.OrderMain OM
INNER JOIN SALES.OrderMainDetail OMD ON OMD.OrderMainID = OM.ID
INNER JOIN SALES.OrderItem OI ON OI.OrderID = OM.ID
INNER JOIN LK.StatusCode SC ON OI.ItemStatusCode = SC.Code
WHERE OMD.IsPendingMailSent = 0
	AND OM.IsPlacedSuccessfully = 1
	AND (OI.CancelationID is null AND OI.InvoiceID IS NULL AND OI.ReturnInvoiceID IS NULL)
	GROUP BY OM.ID,OM.CreateTime