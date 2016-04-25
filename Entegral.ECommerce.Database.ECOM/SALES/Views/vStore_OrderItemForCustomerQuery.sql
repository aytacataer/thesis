




CREATE VIEW [SALES].[vStore_OrderItemForCustomerQuery]
AS
SELECT
	OI.*
	,V.ProductID
	,PR.ExternalSystemCode AS ProductExternalSystemCode
	,PR.FriendlyURI AS ProductFriendlyURI
	,S.TrackingNumber AS ShipmentTrackingNumber
	,S.WayBillNumber AS ShipmentWaybillNumber
	,(CASE WHEN RFI.ID IS NULL THEN 0 ELSE 1 END) AS IsReturnFormItem
FROM SALES.OrderItem OI
LEFT JOIN PRD.vBO_Variant V ON V.ID = OI.VariantID
LEFT JOIN PRD.Product PR ON PR.ID = V.ProductID
LEFT JOIN SALES.Shipment S ON OI.ShipmentID = S.ID
LEFT JOIN SALES.ReturnFormItem RFI ON RFI.OrderItemID = OI.ID