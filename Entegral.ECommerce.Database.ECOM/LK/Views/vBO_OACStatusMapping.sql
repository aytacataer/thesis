




CREATE VIEW [LK].[vBO_OACStatusMapping]
AS
SELECT 
	OACS.ID,
	OACS.StatusCodeID,
	S.Code as StatusCode,
	OACS.PackageStatusCode, 
	OACS.IsActive
FROM LK.OACStatusMapping AS OACS
INNER JOIN LK.StatusCode AS S ON S.ID = OACS.StatusCodeID