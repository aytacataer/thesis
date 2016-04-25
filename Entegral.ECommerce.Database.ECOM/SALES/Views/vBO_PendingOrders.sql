


CREATE view [SALES].[vBO_PendingOrders] 
as
SELECT ROW_NUMBER() OVER (
		ORDER BY OM.ID
		) AS RowID
	,DATEDIFF(DD, OM.CreateTime, getdate()) AS 'LastDay'
	,OM.*
	,POI.DisplayName
	,POI.ItemStatusCode
	,CASE 
		WHEN ISNULL(POI.ReturnInvoiceID, 0) = 0
			THEN 'Yok'
		ELSE 'Var'
		END AS 'IMF'
	,POI.ReturnInvoiceID
	,POI.AttributeValue1
	,POI.AttributeValue2
	,POI.VariantExternalSystemCode
	,POI.VariantBarcode
	,POI.ItemRemarks
	,SCOI.DisplayName AS ItemStatusDisplayName
	,SCOM.DisplayName AS OrderStatusDisplayName
FROM SALES.OrderMain OM
INNER JOIN SALES.vBO_PendingOrderItems POI ON OM.ID = POI.OrderID
LEFT OUTER JOIN LK.StatusCode SCOI ON SCOI.Code = POI.ItemStatusCode
	AND SCOI.Type = 'OI'
LEFT OUTER JOIN LK.StatusCode SCOM ON SCOM.Code = OM.OrderStatusCode
	AND SCOM.Type = 'O'
WHERE OM.OrderStatusCode NOT IN (
		'completed'
		,'return_waiting'
		,'returned'
		)
	AND OM.IsPlacedSuccessfully = 1
	AND OM.IsStartedSupply = 1