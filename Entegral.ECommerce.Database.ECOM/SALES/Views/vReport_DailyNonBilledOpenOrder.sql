


CREATE VIEW [SALES].[vReport_DailyNonBilledOpenOrder]
AS
SELECT Code as [StoreCode]
	   ,ISNULL(OpenOrders.CreateDay, '1901-01-01') AS CreateDay
       ,ISNULL(COUNT(OpenOrders.OrderID), 0) AS OrderCount
       ,ISNULL(SUM(OpenOrders.VATExcludedTotal), 0) AS VATExcludedTotal
       ,ISNULL(SUM(OpenOrders.ItemCount), 0) AS ItemCount
FROM (
       SELECT Code
			  ,CONVERT(DATE, dbo.ConvertToTurkishTime(OM.CreateTime)) AS CreateDay
              ,OM.ID OrderID
              ,COUNT(OI.ID) ItemCount
              ,SUM(SalePrice - (SalePrice * VATRate / (VATRate + 100))) VatExcludedTotal
       FROM SALES.OrderMain OM
	   INNER JOIN LK.Store S ON OM.StoreID = S.ID
       INNER JOIN SALES.OrderItem OI ON OM.ID = OI.OrderID
       WHERE OM.IsPlacedSuccessfully = 1
              AND OM.IsOldSystemOrder = 0
              AND OM.IsStartedSupply = 1
              AND InvoiceID IS NULL
              AND CancelReasonID IS NULL
              AND OM.OrderStatusCode IN (
                     'supply_waiting'
                     ,'shipment_waiting'
                     ,'ready_ship'
					 ,'checking'
                     )
       GROUP BY Code,OM.ID
              ,CONVERT(DATE, dbo.ConvertToTurkishTime(OM.CreateTime))
       ) OpenOrders
GROUP BY OpenOrders.CreateDay,Code