





CREATE VIEW [SALES].[vBO_ReturnFormItem]
AS
SELECT 
RFI.ID,
RFI.ReturnFormID,
RFI.OrderItemID,
RFI.IsActive,
RFI.CreateTime,
RFI.UpdateTime,
OI.ItemName,
OI.ImageUrl,
OI.VariantBarcode,
OI.VariantExternalSystemCode,
S.ExternalSystemCode,
OM.ID AS OrderID,
OM.OrderCode,
OM.CustomerName,
OM.CustomerID
FROM SALES.ReturnFormItem AS RFI
INNER JOIN SALES.OrderItem AS OI ON OI.ID = RFI.OrderItemID
INNER JOIN SALES.OrderMain AS OM ON OM.ID  = OI.OrderID
INNER JOIN LK.Store AS S ON S.ID = OM.StoreID