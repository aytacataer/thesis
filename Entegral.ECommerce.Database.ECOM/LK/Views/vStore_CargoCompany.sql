
CREATE VIEW [LK].[vStore_CargoCompany]
AS
SELECT 
	C.ID,
	C.CODE,
	C.NAME,
	C.LogoUrl,
	C.Priority,
	C.TrackingUrl,
	C.IsDeliverySameDay,
	C.IsPayAtDoor,
	C.CargoPaymentMethodID,
	CPM.Code AS CargoPaymentMethodCode,
	CPM.Name AS CargoPaymentMethodName,
	C.IsActive
FROM LK.CargoCompany C
LEFT JOIN LK.CargoPaymentMethod CPM ON C.CargoPaymentMethodID = CPM.ID