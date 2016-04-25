


CREATE VIEW [SALES].[vReport_DailyNonTransferredOpenOrderByOrderItem]
AS
SELECT
	Code AS [StoreCode] 
	,ISNULL(OM.CreateDay, '1901-01-01') AS CreateDay
	,ISNULL(COUNT(OM.OrderID), 0) AS OrderCount
	,ISNULL(SUM(OM.VATExcludedTotal), 0) AS VATExcludedTotal
	,ISNULL(SUM(OM.ItemCount), 0) AS ItemCount
FROM (
	SELECT
		Code 
		,CONVERT(DATE, dbo.ConvertToTurkishTime(OM.CreateTime)) AS CreateDay
		,OM.ID OrderID
		,OrderItems.VATExcludedTotal
		,OrderItems.ItemCount
	FROM sales.OrderMain OM
	INNER JOIN LK.Store S ON OM.StoreID = S.ID
	INNER JOIN (
		SELECT OI.OrderID
			,COUNT(OI.ID) ItemCount
			,SUM(OI.SalePrice - ((OI.SalePrice * OI.VATRate) / (OI.VATRate + 100))) VATExcludedTotal
		FROM SALES.OrderItem OI
		LEFT JOIN SALES.Invoice I ON OI.InvoiceID = I.ID
		WHERE CancelReasonID IS NULL
			AND (
				I.IsTransferredToExternalSystem IS NULL
				OR I.IsTransferredToExternalSystem = 0
				)
		GROUP BY OrderID
		) AS OrderItems ON OrderItems.OrderID = OM.ID
	WHERE OM.IsPlacedSuccessfully = 1
		AND OM.IsOldSystemOrder = 0
		AND OM.IsStartedSupply = 1
		AND OM.OrderStatusCode IN (
			'supply_waiting'
			,'shipment_waiting'
			,'ready_ship'
			,'checking'
			,'completed'
			)
	) OM
GROUP BY OM.CreateDay,Code