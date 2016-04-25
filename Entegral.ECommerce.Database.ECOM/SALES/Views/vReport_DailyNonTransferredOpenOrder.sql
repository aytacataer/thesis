CREATE VIEW [SALES].[vReport_DailyNonTransferredOpenOrder]
AS
SELECT Code AS [StoreCode]
	   ,ISNULL(OM.CreateDay, '1901-01-01') AS CreateDay
       ,ISNULL(COUNT(OM.OrderID), 0) AS OrderCount
       ,ISNULL(SUM(OM.VATExcludedTotal), 0) AS VATExcludedTotal
       ,ISNULL(SUM(OM.ItemCount), 0) AS ItemCount
FROM (
       SELECT  Code,
			   CONVERT(DATE, dbo.ConvertToTurkishTime(OM.CreateTime)) AS CreateDay
              ,OM.ID OrderID
              ,COUNT(OI.ID) ItemCount
              ,SUM(OI.SalePrice - ((OI.SalePrice * OI.VATRate) / (OI.VATRate + 100))) VATExcludedTotal
       FROM SALES.OrderMain OM
       INNER JOIN SALES.OrderItem OI ON OM.ID = OI.OrderID
	   INNER JOIN LK.Store S ON OM.StoreID = S.ID
       LEFT JOIN SALES.Invoice I ON OI.InvoiceID = I.ID
       WHERE OM.IsPlacedSuccessfully = 1
              AND CancelReasonID IS NULL
			  AND (OI.InvoiceID IS NULL OR I.IsTransferredToExternalSystem = 0)
              AND OM.IsOldSystemOrder = 0
              AND OM.IsStartedSupply = 1
       GROUP BY OM.ID, Code, CONVERT(DATE, dbo.ConvertToTurkishTime(OM.CreateTime))
       ) OM
GROUP BY OM.CreateDay,Code