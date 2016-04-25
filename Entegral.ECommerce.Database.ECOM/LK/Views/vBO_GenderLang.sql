
CREATE view [LK].[vBO_GenderLang]
as
Select 
	ROW_NUMBER() OVER (ORDER BY GL.ID) AS 'RowID',
	[GL].[ID], [GL].[LanguageID], [GL].[Name],
	L.Name as 'LanguageName'
From 
	LK.Gender G
		inner join
	Lk.Gender_Lang GL on GL.ID=G.ID
		inner join
	LK.Language L on L.ID=GL.LanguageID
