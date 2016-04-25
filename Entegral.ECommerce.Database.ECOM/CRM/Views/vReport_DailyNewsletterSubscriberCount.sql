

CREATE view [CRM].[vReport_DailyNewsletterSubscriberCount] 
as 
SELECT CreateDay
	,COUNT(CreateDay) AS CreatedCount
FROM (
	SELECT convert(date, dbo.ConvertToTurkishTime(CreateTime)) AS CreateDay
	FROM CRM.NewsLetterSubscription 
	) AS T1
GROUP BY T1.CreateDay