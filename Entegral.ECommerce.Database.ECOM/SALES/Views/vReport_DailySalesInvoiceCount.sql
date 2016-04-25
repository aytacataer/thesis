



CREATE VIEW [SALES].[vReport_DailySalesInvoiceCount]
AS
SELECT 
	Code AS [StoreCode]
	,ISNULL(INV.InvoiceCreateDay, '1901-01-01') AS InvoiceCreateDay
	,ISNULL(COUNT(INV.InvoiceCreateDay), 0) AS InvoiceCount
	,ISNULL(AVG(1.0 * INV.OrderToInvoiceTimeDiff), 0) AS AverageOrderToInvoiceTimeDiff
FROM (
	SELECT 
		Code
		,convert(DATE, dbo.ConvertToTurkishTime(MAX(I.CreateTime))) AS InvoiceCreateDay
		,convert(DATE, dbo.ConvertToTurkishTime(MAX(OI.CreateTime))) AS OrderItemCreateDay
		,DATEDIFF(day, dbo.ConvertToTurkishTime(MAX(OI.CreateTime)), dbo.ConvertToTurkishTime(MAX(I.CreateTime))) AS OrderToInvoiceTimeDiff
	FROM SALES.Invoice I
	INNER JOIN SALES.OrderItem OI ON I.ID = OI.InvoiceID
	INNER JOIN SALES.OrderMain OM ON OI.OrderID = OM.ID
	INNER JOIN LK.Store S ON OM.StoreID = S.ID
	WHERE OI.CancelReasonID IS NULL
	GROUP BY Code,I.ID
		,I.IsTransferredToExternalSystem
	) INV
GROUP BY INV.InvoiceCreateDay,Code