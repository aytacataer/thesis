
CREATE VIEW [LK].[vBO_UserPackagingLocation]
AS
SELECT UPL.ID
	,UPL.UserName
	,UPL.PackagingLocationID
	,UPL.CanCreateReturnInvoice
	,PL.ExternalSystemCode AS PackagingLocationCode
	,PL.NAME AS PackagingLocationName
FROM [LK].[UserPackagingLocation] AS UPL
INNER JOIN [LK].PackagingLocation AS PL ON UPL.PackagingLocationID = PL.ID