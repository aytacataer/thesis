

CREATE view [LK].[vBO_JobLang]
as
Select 
	ROW_NUMBER() OVER (ORDER BY JL.ID) AS 'RowID', 
	[JL].[ID], [JL].[LanguageID], [JL].[Name], [JL].[IsActive], [JL].[CreateUserID], [JL].[CreateTime], [JL].[UpdateUserID], [JL].[UpdateTime],
	L.Name as 'LanguageName'
from 
	LK.Job J 
		inner join
	LK.Job_Lang JL on  J.ID = JL.ID
		inner join
	LK.Language L on L.ID = JL.LanguageID
