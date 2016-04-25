

CREATE VIEW [SALES].[vReport_DailyCancelledOrderItemInfo]
AS
SELECT
	Code AS [StoreCode] 
	,ISNULL(OB.CancelDay, '1901-01-01') AS CancelDay
	,ISNULL(COUNT(OB.CancelDay), 0) OrderCount
	,ISNULL(SUM(OB.VATExcludedTotal), 0) VATExcludedTotal
	,ISNULL(SUM(OB.ItemCount), 0) AS ItemCount
	,OB.CancelReasonCode
	,OB.CancelReasonText
FROM (
	SELECT 
		Code
		,convert(DATE, dbo.ConvertToTurkishTime(OI.CancelTime)) AS CancelDay
		,MAX(OI.SalePrice - (OI.SalePrice * OI.VATRate) / 100) AS VATExcludedTotal
		,Count(OI.ID) AS ItemCount
		,CR.ExternalSystemCode AS CancelReasonCode
		,CR.ReasonText AS CancelReasonText		
	FROM sales.OrderItem OI
	INNER JOIN Sales.OrderMain OM ON OM.ID = OI.OrderID
	INNER JOIN LK.Store S ON OM.StoreID = S.ID
	LEFT JOIN LK.CancelReason CR ON OI.CancelReasonID = CR.ID
	WHERE OM.IsPlacedSuccessfully = 1
		AND OM.IsStartedSupply = 1
		AND OI.CancelReasonID IS NOT NULL
	GROUP BY 
		Code
		,convert(DATE, dbo.ConvertToTurkishTime(OI.CancelTime))
		,OM.ID
		,CR.ExternalSystemCode
		,CR.ReasonText
		,OI.CancelTime
		,OI.SalePrice
		,OI.VATRate
	) OB
GROUP BY 
	Code
	,OB.CancelDay
	,OB.CancelReasonCode
	,OB.CancelReasonText