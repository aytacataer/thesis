



CREATE view [CRM].[vReport_DailyNewCustomerCount] 
as 
SELECT
	Code as [StoreCode] 
	,CreateDay
	,COUNT(CreateDay) AS CreatedCount
FROM (
	SELECT Code,convert(Date, dbo.ConvertToTurkishTime(CreateTime)) AS CreateDay
	FROM CRM.Customer AS C
	INNER JOIN LK.Store AS S ON C.StoreID = S.ID
	) AS T1
GROUP BY T1.CreateDay,Code