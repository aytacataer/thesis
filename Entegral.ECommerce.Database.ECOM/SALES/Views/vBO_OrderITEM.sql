






CREATE VIEW [SALES].[vBO_OrderItem]
AS
SELECT OM.CustomerID
	,OM.CustomerName
	,OM.CustomerEmail
	,OM.CustomerPhone
	,OM.ShippingCity
	,OM.ShippingDistrict
	,OM.ShippingAddress
	,OM.IsPickup 
	,OM.OrderCode
	,OM.IsPlacedSuccessfully
	,OM.CreateTime OrderCreateTime
	,OM.OrderStatusCode
	,OM.ExternalSystemTransferTime
	,OM.IsTransferredToExternalSystem
	,OM.TotalAmount OrderTotalAmount
	,OM.TotalVAT OrderTotalVat
	,OM.PaymentMethodCode 
	,OM.IsTestOrder
	,Om.OrderNote
	,STUFF((SELECT ', ' + CAST(PYI.BankCode AS varchar) FROM [SALES].PaymentInfo PYI WHERE OrderId = OM.ID FOR XML PATH(''), TYPE).value('.[1]', 'nvarchar(max)'), 1, 2, '') as BankCode
	,STUFF((SELECT ', ' + CAST(PYI.CreditCardHolderName AS varchar) FROM [SALES].PaymentInfo PYI WHERE OrderId = OM.ID FOR XML PATH(''), TYPE).value('.[1]', 'nvarchar(max)'), 1, 2, '') as CreditCardHolderName
	,STUFF((SELECT ', ' + CAST(PYI.TrxID AS varchar) FROM [SALES].PaymentInfo PYI WHERE OrderId = OM.ID FOR XML PATH(''), TYPE).value('.[1]', 'nvarchar(max)'), 1, 2, '') as TrxID
	,CC.Name CargoCompanyName
	,SH.TrackingNumber 
	,OM.CouponCode
	,OI.*
	,V.Quantity TotalStock
	,ISNULL(CAST(OI.CancelReasonID AS bit), 0) AS IsCancelled
	,SI.InvoiceNo AS 'SalesInvoiceNo'
	,RI.InvoiceNO AS 'ReturnInvoiceNo'
	,V.ProductID
	,PR.ExternalSystemCode as ProductExternalSystemCode
	,V.FriendlyURI
	,OMS.DisplayName AS 'OrderStatusDisplayName'
	,OIS.DisplayName AS 'ItemStatusDisplayName'
	,CAST(CASE WHEN (OI.ReturnInvoiceID is not null) THEN 1 ELSE 0 END AS bit) as IsItemReturn
	,S.ExternalSystemCode AS StoreExternalSystemCode
	,OM.StoreID
	,PL.ExternalSystemCode AS PackagingLocationExternalSystemCode
	,PL.NAME AS PackagingLocationName
	,SI.InvoiceDate AS InvoiceDate
	,SI.InvoiceNo AS InvoiceNO
	,RI.InvoiceDate AS ReturnInvoiceDate
	,OM.Ref1 AS OrderRef1
	,OIS.StatusGroupID AS StatusGroupID	
	,CAST(CASE WHEN (pdmf.CDNPath is not null AND ps.TotalStock > 0 AND PR.IsActive = 1) THEN 1 ELSE 0 END AS bit) as IsVisible
	,OMD.IsDataTransfered AS IsDataTransfered
FROM SALES.OrderItem OI
INNER JOIN SALES.OrderMain OM ON OM.ID = OI.OrderID
INNER JOIN SALES.OrderMainDetail OMD ON OMD.OrderMainID = OM.ID
INNER JOIN PRD.vBO_Variant V ON V.ID = OI.VariantID
INNER JOIN PRD.Product PR ON PR.ID = V.ProductID
LEFT JOIN LK.StatusCode OMS ON OMS.Code = OM.OrderStatusCode
LEFT JOIN LK.StatusCode OIS ON OIS.Code = OI.ItemStatusCode
LEFT JOIN LK.Store S ON OM.StoreID = S.ID
LEFT JOIN LK.PackagingLocation PL ON OI.PackagingLocationID = PL.ID
LEFT JOIN [SALES].Invoice SI ON OI.InvoiceID = SI.ID
LEFT JOIN [SALES].Invoice RI ON OI.ReturnInvoiceID = RI.ID
LEFT JOIN [SALES].Shipment SH ON OI.ShipmentID = SH.ID
LEFT JOIN [LK].CargoCompany CC ON CC.ID =SH.CargoCompanyID
LEFT JOIN PRD.vBO_ProductDefaultMediaFile AS pdmf ON pdmf.ProductID = PR.ID
LEFT JOIN PRD.vBO_ProductStock AS ps ON ps.ProductID = PR.ID
GO