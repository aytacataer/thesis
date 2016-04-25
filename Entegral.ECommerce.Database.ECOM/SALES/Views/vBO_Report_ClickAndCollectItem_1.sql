
CREATE VIEW [SALES].[vBO_Report_ClickAndCollectItem]
AS
SELECT OrderID,OrderCode,DisplayName,AttributeValue1 as Renk,AttributeValue2 as Beden, 
  AttributeValue3 as Marka,SalePrice,StorePriceNumber,OrderTotalAmount as TotalInvoicePrice,SalesInvoiceNo,
  ItemStatusDisplayName,PackagingLocationName  
  FROM SALES.vBO_OrderItem 
  WHERE OrderCode IN (
  SELECT Distinct(OrderCode) 
  from SALES.vBO_Report_ClickAndCollect 
  Where OrderStatusCode IN ('returned','arrived_to_store','sent_to_store'))