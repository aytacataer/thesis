CREATE VIEW [SALES].[vReport_DailyOrderInfo]
AS
SELECT OB.StoreCode
	,ISNULL(OB.CreateDay, '1901-01-01') AS CreateDay
	,ISNULL(COUNT(OB.CreateDay), 0) OrderCount
	,ISNULL(SUM(OB.VATExcludedTotal), 0) VATExcludedTotal
	,ISNULL(SUM(OB.ItemCount), 0) AS ItemCount
FROM (
	SELECT CAST(dbo.ConvertToTurkishTime(OM.CreateTime) AS DATE) AS CreateDay
		,OM.ID AS OrderID
		,MAX(OM.TotalAmount - OM.TotalVAT) AS VATExcludedTotal
		,Count(OI.ID) AS ItemCount
		,S.Code AS StoreCode
	FROM sales.OrderMain OM
	INNER JOIN Sales.OrderItem OI ON OM.ID = OI.OrderID
	INNER JOIN LK.Store S ON OM.StoreID = S.ID
	LEFT JOIN LK.CancelReason CR ON OI.CancelReasonID = CR.ID
	WHERE OM.IsPlacedSuccessfully = 1
            AND CancelReasonID IS NULL
            AND OM.IsOldSystemOrder = 0
            AND OM.IsStartedSupply = 1
	GROUP BY CAST(dbo.ConvertToTurkishTime(OM.CreateTime) AS DATE), OM.ID, S.Code		
) OB
GROUP BY OB.CreateDay, OB.StoreCode