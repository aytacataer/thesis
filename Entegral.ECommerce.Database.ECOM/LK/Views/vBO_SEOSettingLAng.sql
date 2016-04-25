create view LK.vBO_SEOSettingLang
as
Select 
	ROW_NUMBER() OVER (ORDER BY SEO.ID) AS 'RowID',
	SEOLANG.*,
	L.Name as 'LanguageName'
From 
	LK.SEOSetting SEO
		inner join
	Lk.SEOSetting_Lang SEOLANG on SEO.ID=SEOLANG.ID
		inner join
	LK.Language L on L.ID=SEOLANG.LanguageID