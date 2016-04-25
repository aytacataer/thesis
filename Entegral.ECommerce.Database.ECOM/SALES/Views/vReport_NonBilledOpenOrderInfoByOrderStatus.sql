

CREATE VIEW [SALES].[vReport_NonBilledOpenOrderInfoByOrderStatus]
AS
SELECT
	Code as [StoreCode] 
	,OM.ID AS OrderID
	,OI.ID AS OrderItemID
	,ISNULL((OI.SalePrice * 100 / (100 + OI.VATRate)),0) AS VATExcludedSalePrice
	,OI.ItemStatusCode AS ItemStatusCode
FROM Sales.OrderItem OI
INNER JOIN Sales.OrderMain OM ON OI.OrderID = OM.ID
INNER JOIN LK.Store S ON OM.StoreID = S.ID
LEFT JOIN Sales.Invoice INV ON OI.InvoiceID = INV.ID
WHERE OM.OrderStatusCode IN (
		'supply_waiting'
		,'shipment_waiting'
		,'ready_ship'
		,'checking'
		)
	AND OI.InvoiceID IS NULL
	AND OM.IsPlacedSuccessfully = 1
	AND OM.IsOldSystemOrder = 0
	AND OM.IsStartedSupply = 1
	AND OI.CancelReasonID IS NULL