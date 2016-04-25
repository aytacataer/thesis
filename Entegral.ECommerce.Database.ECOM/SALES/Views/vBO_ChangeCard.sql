


CREATE view [SALES].[vBO_ChangeCard]
as
Select 
	S.ExternalSystemCode as 'StoreCode',
	O.ID  as 'OrderID',
	O.SaleOrigin,
	I.CreateUserID ,
	I.CreateTime ,
	OI.ItemName as 'ItemName',
	OI.DisplayName as 'DisplayName',
	OI.VariantBarcode as 'VariantBarcode',
	OI.ID as 'OrderItemID',
	PL.ExternalSystemCode AS 'PackageExternalSystemCode', 
	PL.ID AS PackageLocationID
from
	SALES.OrderMain O 
		inner join
	SALES.OrderItem OI on O.ID=OI.OrderID
		inner join
	LK.Store S on S.ID=O.StoreID
		inner join
	SALES.Invoice I on OI.InvoiceID = I.ID
		INNER JOIN
	LK.PackagingLocation AS PL ON OI.PackagingLocationID = PL.ID