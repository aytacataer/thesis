
create view [LK].[vBO_MaritalStatusLang]
as
Select 
	ROW_NUMBER() OVER (ORDER BY MSL.ID) AS 'RowID', 
	[MSL].[ID], [MSL].[LanguageID], [MSL].[Name],
	L.Name as 'LanguageName'
from 
	LK.MaritalStatus MS
		inner join
	LK.MaritalStatus_Lang MSL on  MS.ID = MSL.ID
		inner join
	LK.Language L on L.ID = MSL.LanguageID
