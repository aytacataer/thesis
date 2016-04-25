
CREATE VIEW [LK].[vBO_InvitationConfigurationLang]
as
Select 
	ROW_NUMBER() OVER (ORDER BY JL.ID) AS 'RowID', 
	[JL].[ID], [JL].[LanguageID], [JL].[InvitationSlogan], [JL].[InvitationCondition], [JL].[InvitationMailText], 
	L.Name as 'LanguageName'
from 
	LK.InvitationConfiguration J 
		inner join
	LK.InvitationConfiguration_Lang JL on  J.ID = JL.ID
		inner join
	LK.Language L on L.ID = JL.LanguageID