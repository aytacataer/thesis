


CREATE VIEW [SALES].[vStore_OrderItem]
AS
SELECT
	OI.*
	,V.ProductID
	,PR.ExternalSystemCode AS ProductExternalSystemCode
	,PR.FriendlyURI AS ProductFriendlyURI
	,S.TrackingNumber AS ShipmentTrackingNumber
	,S.WayBillNumber AS ShipmentWaybillNumber
FROM SALES.OrderItem OI
INNER JOIN PRD.vBO_Variant V ON V.ID = OI.VariantID
INNER JOIN PRD.Product PR ON PR.ID = V.ProductID
LEFT JOIN SALES.Shipment S ON OI.ShipmentID = S.ID