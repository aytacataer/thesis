
CREATE view [LK].[vBO_StatusCodeLang]
as
Select
ROW_NUMBER() OVER(ORDER BY SC.ID DESC) AS 'RowID',
SCL.*,
SC.Code,
SC.Type ,
L.Name as 'LanguageName'
from
LK.StatusCode SC
inner join
LK.StatusCode_Lang SCL on SCL.ID=SC.ID
inner join
LK.Language L on L.ID=SCL.LanguageID