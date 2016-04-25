





CREATE VIEW [SALES].[vBO_OrderMain_Summary]
AS

WITH orderItems(OrderID, OrderTotal, OrderItemID, SalePrice, InvoiceID, ReturnInvoiceID, CancelReasonID)
AS
(
SELECT 
		OM.ID,
		OM.TotalAmount,
		OI.ID AS [OrderItemID],
		OI.SalePrice,
		InvoiceID,
		ReturnInvoiceID,
		CancelReasonID 
		FROM [SALES].[OrderMain] AS OM
		INNER JOIN [SALES].[OrderItem] AS OI ON OM.ID = OI.OrderID
),
saleInvoices(OrderID, InvoiceTotal)
AS
(
SELECT OrderID,
	   SUM(SalePrice) AS [InvoiceTotal]
	   FROM orderItems WHERE InvoiceID is not null GROUP BY OrderID
),
returnInvoices(OrderID, ReturnInvoiceTotal)
AS
(
SELECT OrderID,
	   SUM(SalePrice) AS [ReturnInvoiceAmount]
	   FROM orderItems WHERE ReturnInvoiceID is not null GROUP BY OrderID
),
cancellations(OrderID, CancelTotal)
AS
(
SELECT OrderID,
	   SUM(SalePrice) AS [CancelTotal] 
	   FROM orderItems WHERE CancelReasonID is not null GROUP BY OrderID
),
orderInfo(OrderID, ItemCount, OrderTotal)
AS
(
SELECT OrderID,
	   COUNT(1) AS [ItemCount],
	   MAX(OrderTotal) AS [OrderTotal]
	   FROM orderItems GROUP BY OrderID
)

SELECT DISTINCT O.OrderID,
				ISNULL(O.OrderTotal, 0) AS [OrderTotal],
				ISNULL(InvoiceTotal, 0) AS [InvoiceTotal],
				ISNULL(ReturnInvoiceTotal, 0) AS [ReturnInvoiceTotal],
				ISNULL(CancelTotal, 0) AS [CancelTotal],
				ISNULL(ItemCount, 0) AS [ItemCount] 
				FROM orderInfo AS O 
				LEFT JOIN saleInvoices AS S ON O.OrderID = S.OrderID
				LEFT JOIN returnInvoices AS R ON O.OrderID = R.OrderID
				LEFT JOIN cancellations AS C ON O.OrderID = C.OrderID