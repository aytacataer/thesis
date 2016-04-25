CREATE VIEW LK.vBO_RegisterCouponConfiguration_Lang
AS
SELECT ROW_NUMBER() OVER (ORDER BY JL.ID) AS 'RowID',
       [JL].[ID],
       [JL].[LanguageID], 
       [JL].[MailText],
       L.Name AS 'LanguageName'
FROM LK.RegisterCouponConfiguration J
INNER JOIN LK.RegisterCouponConfiguration_Lang JL ON J.ID = JL.ID
INNER JOIN LK.Language L ON L.ID = JL.LanguageID