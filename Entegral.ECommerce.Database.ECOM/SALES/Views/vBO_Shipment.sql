



CREATE View [SALES].[vBO_Shipment]
As
Select
	Distinct
	S.ID,
	S.CargoCompanyID,
	S.TrackingNumber,
	S.WayBillNumber,
	S.CargoDeliveredTime,
	S.Deci,
	S.IsTransferredToExternalSystem,
	S.ExternalSystemTransferredTime,
	S.CreateUserID,
	S.CreateTime,
	S.UpdateUserID,
	S.UpdateTime,
	CC.Code As CargoCompanyCode,
	CC.TrackingUrl,
	OM.ID As OrderMainID,
	OM.OrderCode As OrderCode
From SALES.Shipment S
Inner Join SALES.OrderItem OI On S.ID = OI.ShipmentID
Inner Join SALES.OrderMain OM On OI.OrderID = OM.ID
Left Join LK.CargoCompany CC On S.CargoCompanyID = CC.ID