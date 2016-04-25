





CREATE VIEW [SALES].[vReport_HourBasedDailySalesReport]
AS
WITH TemplateData(TimeInterval, Num, OrderTotalNumber, OrderTotalAmount) AS
(
    SELECT 0 Hour, 1 Num,'',''
    UNION ALL
    SELECT TimeInterval + 1, Num + 1,'',''
    FROM TemplateData
    WHERE Num < 24
)
,
AllOrders(StoreCode, OrderID, OrderTotalAmount, OrderCreateTimeAsLocalTime)
AS
(
	SELECT  S.Code AS StoreCode,
			OM.ID AS OrderID,
			TotalAmount AS OrderTotalAmount,
			dbo.ConvertToTurkishTime(CreateTime) AS OrderCreateTimeAsLocalTime
	FROM SALES.OrderMain AS OM
	INNER JOIN LK.Store AS S ON OM.StoreID = S.ID 
	WHERE	IsOldSystemOrder = 0 
			AND IsPlacedSuccessfully = 1 
			AND CreateTime > DATEADD(DAY, -8, GETUTCDATE())
)
,
TodayReport(StoreCode, TimeInterval, OrderTotalNumber, OrderTotalAmount)
AS
(
	SELECT  StoreCode,
			DATEPART(HOUR, OrderCreateTimeAsLocalTime) AS [TimeInterval],
			COUNT(OrderID) AS [SiparisAdet],
			SUM(OrderTotalAmount) AS [OrderTotalAmount] 
	FROM AllOrders
	WHERE CONVERT(NVARCHAR, OrderCreateTimeAsLocalTime, 104) = CONVERT(NVARCHAR, dbo.ConvertToTurkishTime(GETUTCDATE()), 104)
	GROUP BY StoreCode, DATEPART(HOUR, OrderCreateTimeAsLocalTime)
)
,
YesterdayReport(StoreCode, TimeInterval, OrderTotalNumber, OrderTotalAmount)
AS
(
	SELECT  StoreCode,
			DATEPART(HOUR, OrderCreateTimeAsLocalTime) AS [TimeInterval],
			COUNT(OrderID) AS [SiparisAdet],
			SUM(OrderTotalAmount) AS [OrderTotalAmount] 
	FROM AllOrders
	WHERE CONVERT(NVARCHAR, OrderCreateTimeAsLocalTime, 104) = CONVERT(NVARCHAR, dbo.ConvertToTurkishTime(GETUTCDATE() - 1), 104)
	GROUP BY StoreCode, DATEPART(HOUR, OrderCreateTimeAsLocalTime)
)
,
LastWeekToday(StoreCode, TimeInterval, OrderTotalNumber, OrderTotalAmount)
AS
(
	SELECT  StoreCode,
			DATEPART(HOUR, OrderCreateTimeAsLocalTime) AS [TimeInterval],
			COUNT(OrderID) AS [SiparisAdet],
			SUM(OrderTotalAmount) AS [OrderTotalAmount] 
	FROM AllOrders
	WHERE CONVERT(NVARCHAR, OrderCreateTimeAsLocalTime, 104) = CONVERT(NVARCHAR, dbo.ConvertToTurkishTime(GETUTCDATE() - 7), 104)
	GROUP BY StoreCode, DATEPART(HOUR, OrderCreateTimeAsLocalTime)
)

SELECT 
	S.Code AS StoreCode,
	ISNULL(tmp.TimeInterval, 0) AS TimeInterval,
	ISNULL(b.OrderTotalNumber, 0) AS [OrderTotalNumber_Today],
	ISNULL(b.OrderTotalAmount, 0) AS [OrderTotalAmount_Today],
	ISNULL(d.OrderTotalNumber, 0) AS [OrderTotalNumber_Yesterday],
	ISNULL(d.OrderTotalAmount, 0) AS [OrderTotalAmount_Yesterday],
	ISNULL(g.OrderTotalNumber, 0) AS [OrderTotalNumber_LastWeekToday],
	ISNULL(g.OrderTotalAmount, 0) AS[OrderTotalAmount_LastWeekToday],
	ISNULL(((CAST(( b.OrderTotalNumber - d.OrderTotalNumber ) AS DECIMAL) / d.OrderTotalNumber ) * 100 ), 0) AS [Today_Yesterday_Number_Percent],
	ISNULL(((CAST(( b.OrderTotalNumber - g.OrderTotalNumber ) AS DECIMAL) / g.OrderTotalNumber ) * 100), 0) AS [Today_LastWeekToday_Number_Percent],
	ISNULL(((CAST(( b.OrderTotalAmount - d.OrderTotalAmount ) AS DECIMAL) / d.OrderTotalAmount ) * 100), 0) AS [Today_Yesterday_Amount_Percent],
	ISNULL(((CAST(( b.OrderTotalAmount - g.OrderTotalAmount ) AS DECIMAL) / g.OrderTotalAmount ) * 100), 0) AS [Today_LastWeekToday_Amount_Percent] 
FROM LK.Store S
FULL JOIN TemplateData tmp ON 1 = 1
LEFT JOIN TodayReport AS b ON tmp.TimeInterval = b.TimeInterval AND b.StoreCode = S.Code
LEFT JOIN YesterdayReport AS d ON tmp.TimeInterval = d.TimeInterval  AND d.StoreCode = S.Code
LEFT JOIN LastWeekToday AS g ON tmp.TimeInterval = g.TimeInterval AND g.StoreCode = S.Code
WHERE S.ID <> 0