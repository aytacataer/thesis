
create view	LK.vBO_PaymentMethodLang
as
Select 
	 ROW_NUMBER() OVER (ORDER BY PM.ID) AS 'RowID',	
	 PML.*,
	 L.Name as 'LanguageName'
from
	LK.PaymentMethod  PM 
		inner join
	LK.PaymentMethod_Lang PML on PML.ID=PM.ID
		inner join
	LK.Language L on L.ID=PML.LanguageID