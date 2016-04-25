



CREATE VIEW [SALES].[vBO_OrdersArrivedToStoreButNotCompleted]
AS
SELECT DISTINCT OSH.CreateTime AS OrderStatusLastChangeTime, OM.*
FROM SALES.OrderMain OM
INNER JOIN SALES.OrderItem OI ON OM.ID = OI.OrderID AND OI.InvoiceID IS NOT NULL AND OI.CancelReasonID IS NULL
INNER JOIN SALES.OrderMainDetail OMD ON OM.ID = OMD.OrderMainID 
INNER JOIN Sales.OrderStatusHistory OSH ON OSH.OrderID = OM.ID AND 
OSH.ID = 
(SELECT MAX(OSH2.ID) FROM Sales.OrderStatusHistory OSH2 WHERE OSH2.ID = OSH.ID AND OSH2.OrderStatusCode='arrived_to_store' ) 
WHERE OM.IsPlacedSuccessfully = 1 AND OM.IsPickup=1 AND OMD.IsOrdersArrivedToStoreButNotCompletedMailSent=0 AND OM.OrderStatusCode='arrived_to_store' 
AND CONVERT(date,OSH.CreateTime) < CONVERT(date, DATEADD(day,-15,GETUTCDATE()))