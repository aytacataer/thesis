

CREATE VIEW [SALES].[vBO_OrderItemShipment]
AS
SELECT
	Distinct
	S.ID,
	S.TrackingNumber,
	I.InvoiceNo,
	OI.DisplayName AS OrderItemDisplayName,
	CC.Name AS CargoCompanyName,
	CC.TrackingUrl,
	OM.ID AS OrderMainID

FROM SALES.Shipment S
INNER JOIN SALES.OrderItem OI ON S.ID = OI.ShipmentID
INNER JOIN SALES.OrderMain OM ON OI.OrderID = OM.ID
LEFT JOIN LK.CargoCompany CC ON S.CargoCompanyID = CC.ID
LEFT JOIN SALES.Invoice I ON I.ID = OI.InvoiceID

GO