
CREATE VIEW [SALES].[vBO_PendingOrderItems]
AS
SELECT        ID, VariantID, OrderID, VariantExternalSystemCode, VariantBarcode, DisplayName, ItemName, ImageUrl, StorePrice, StorePriceNumber, SalePrice, InvoiceID, ReturnInvoiceID, ReturnReasonID, ReturnRemarks, 
                         ItemStatusCode, ShipmentID, ItemSeqNo, ItemRemarks, StorePrice1, StorePrice2, StorePrice3, AttributeValue1, AttributeValue2, AttributeValue3, AttributeValue4, AttributeValue5, AttributeValue6, VATRate, 
                         CategoryCode, IsProductDiscountForbidden, IsProductReturnForbidden, IsReturnedToExternalSystem, ChangeCardPrintTime, ExternalSystemReturnTime, PackagingLocationID, AssurerUser, GroupIdentifier, CreateUserID, 
                         CreateTime, UpdateUserID, UpdateTime
FROM            SALES.OrderItem AS OI
WHERE        (ItemStatusCode = 'pending') OR
                         (ItemStatusCode = 'transfer_waiting')
GO


