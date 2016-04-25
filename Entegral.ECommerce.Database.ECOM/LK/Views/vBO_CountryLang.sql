
CREATE view [LK].[vBO_CountryLang]
as
Select 
	 ROW_NUMBER() OVER (ORDER BY CL.ID) AS 'RowID',
	[CL].[ID], [CL].[LanguageID], [CL].[Name], [CL].[IsActive], [CL].[CreateUserID], [CL].[CreateTime], [CL].[UpdateUserID], [CL].[UpdateTime],
	L.Name as 'LanguageName'
From 
	LK.Country C
		inner join
	LK.Country_Lang CL on CL.ID=C.ID
		inner join
	LK.Language L on L.ID=CL.LanguageID
