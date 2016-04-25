CREATE VIEW [SALES].[vBO_CampaignLang]
AS
SELECT  ROW_NUMBER() OVER(ORDER BY C.ID DESC) as RowID, [C].[ID], [C].[LanguageID], [C].[Description], [C].[CustomerInformationNote], [C].[NoMatchWarningNote], [C].[PaymentConditionWarningNote], [C].[CreateUserID], [C].[CreateTime], [C].[UpdateUserID], [C].[UpdateTime], [C].[IsActive], L.Name AS LanguageName
FROM SALES.Campaign_Lang AS C
LEFT JOIN LK.Language AS L
ON L.ID = C.LanguageID
