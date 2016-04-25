
CREATE VIEW [SALES].[vBO_OrderItem_ForOrderList]
AS
SELECT OM.CustomerID
	,OM.CustomerName
	,OM.CustomerEmail
	,OM.CustomerPhone
	,OM.ShippingCity
	,OM.OrderCode
	,OM.IsPlacedSuccessfully
	,OM.CreateTime OrderCreateTime
	,OM.OrderStatusCode
	,OM.ExternalSystemTransferTime
	,OM.IsTransferredToExternalSystem
	,OM.TotalAmount OrderTotalAmount
	,OM.IsTestOrder
	,OI.*
	,SI.InvoiceNo AS 'SalesInvoiceNo'
	,RI.InvoiceNO AS 'ReturnInvoiceNo'
	,V.ProductID
	,PR.ExternalSystemCode as ProductExternalSystemCode
	,V.FriendlyURI
	,OMS.DisplayName AS 'OrderStatusDisplayName'
	,OIS.DisplayName AS 'ItemStatusDisplayName'
	,S.ExternalSystemCode AS StoreExternalSystemCode
	,OM.StoreID
	,PL.ExternalSystemCode AS PackagingLocationExternalSystemCode
	,PL.NAME AS PackagingLocationName
	,SI.InvoiceDate AS InvoiceDate
	,RI.InvoiceDate AS ReturnInvoiceDate
	,SG.ID AS [StatusGroupID]
	,[PI].PaymentMethodCode AS PaymentMethodCode
FROM SALES.OrderItem OI
INNER JOIN SALES.OrderMain OM ON OM.ID = OI.OrderID
LEFT JOIN PRD.vBO_Variant V ON V.ID = OI.VariantID
LEFT JOIN PRD.Product PR ON PR.ID = V.ProductID
LEFT JOIN LK.StatusCode OMS ON OMS.Code = OM.OrderStatusCode
LEFT JOIN LK.StatusCode OIS ON OIS.Code = OI.ItemStatusCode
LEFT JOIN LK.Store S ON OM.StoreID = S.ID
LEFT JOIN LK.PackagingLocation PL ON OI.PackagingLocationID = PL.ID
LEFT JOIN [SALES].Invoice SI ON OI.InvoiceID = SI.ID
LEFT JOIN [SALES].Invoice RI ON OI.ReturnInvoiceID = RI.ID
LEFT JOIN [LK].StatusCode SC ON OI.ItemStatusCode = SC.Code
LEFT JOIN [LK].StatusGroup SG ON SC.StatusGroupID = SG.ID
LEFT JOIN [SALES].[PaymentInfo] [PI] ON OM.ID = [PI].OrderID