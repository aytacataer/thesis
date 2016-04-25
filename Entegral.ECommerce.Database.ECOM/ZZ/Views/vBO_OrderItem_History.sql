



CREATE VIEW [ZZ].[vBO_OrderItem_History]
AS
SELECT  
		0 As HID,
		-1 As Action,
		OI.UpdateTime As ActionTime,
		OI.UpdateUserID AS ActionUserID, 
		OI.UpdateTime,
		OI.UpdateUserID,
		OI.CreateTime, 
		OI.CreateUserID,
		OI.CategoryCode,
		OI.VATRate,
		OI.AttributeValue6,
		OI.AttributeValue5, 
		OI.AttributeValue4,
		OI.AttributeValue3,
		OI.AttributeValue2,
		OI.AttributeValue1,
		OI.StorePrice3, 
		OI.StorePrice2, 
		OI.StorePrice1, 
		OI.ItemRemarks, 
		OI.ItemSeqNo, 
		OI.ItemStatusCode, 
		SC.DisplayName ItemStatus, 
		OI.SalePrice, 
		OI.StorePriceNumber, 
		OI.StorePrice, 
		OI.ImageUrl, 
		OI.ItemName, 
		OI.DisplayName,
		OI.VariantBarcode, 
		OI.OrderID, 
		OI.VariantID, 
		OI.ID,
		OI.IsReturnedToExternalSystem,
		OI.ExternalSystemReturnTime,
		OI.ReturnInvoiceID,
		OI.InvoiceID,
		OI.ShipmentID,
		OI.GroupIdentifier,
		OI.GroupIdentifierUpdateTime
FROM         SALES.OrderItem OI
LEFT JOIN LK.StatusCode SC ON SC.Code = OI.ItemStatusCode

UNION

SELECT  
		OIH.HID, 
		OIH.[Action],
		OIH.ActionTime,
		OIH.ActionUserID, 
		OIH.UpdateTime, 
		OIH.UpdateUserID,
		OIH.CreateTime, 
		OIH.CreateUserID,
		OIH.CategoryCode,
		OIH.VATRate,
		OIH.AttributeValue6,
		OIH.AttributeValue5, 
		OIH.AttributeValue4,
		OIH.AttributeValue3,
		OIH.AttributeValue2,
		OIH.AttributeValue1,
		OIH.StorePrice3, 
		OIH.StorePrice2, 
		OIH.StorePrice1, 
		OIH.ItemRemarks, 
		OIH.ItemSeqNo, 
		OIH.ItemStatusCode, 
		SC.DisplayName ItemStatus, 
		OIH.SalePrice, 
		OIH.StorePriceNumber, 
		OIH.StorePrice, 
		OIH.ImageUrl, 
		OIH.ItemName, 
		OIH.DisplayName,
		OIH.VariantBarcode, 
		OIH.OrderID, 
		OIH.VariantID, 
		OIH.ID,
		OIH.IsReturnedToExternalSystem,
		OIH.ExternalSystemReturnTime,
		OIH.ReturnInvoiceID,
		OIH.InvoiceID,
		OIH.ShipmentID,
		OIH.GroupIdentifier,
		OIH.GroupIdentifierUpdateTime
FROM         ZZ.OrderItem_History OIH

LEFT JOIN LK.StatusCode SC ON SC.Code = OIH.ItemStatusCode
GO
