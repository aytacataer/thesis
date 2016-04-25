CREATE view LK.vBO_EducationLevelLang
as
	Select 
		ROW_NUMBER() OVER (ORDER BY ELL.ID) AS 'RowID',
		[ELL].[ID], [ELL].[LanguageID], [ELL].[Name], [ELL].[IsActive], [ELL].[CreateUserID], [ELL].[CreateTime], [ELL].[UpdateUserID], [ELL].[UpdateTime],
		L.Name as 'LanguageName'
	From
		LK.EducationLevel EL
			inner join
		LK.EducationLevel_Lang ELL on EL.ID=ELL.ID
			inner join
		LK.Language L on L.ID=ELL.LanguageID
