

CREATE VIEW [LK].[vBO_StatusCode]
AS
SELECT SC.*
	,SG.Code StatusGroupCode
	,SG.Name StatusGroupName
FROM LK.StatusCode SC
LEFT JOIN LK.StatusGroup SG ON SC.StatusGroupID = SG.ID