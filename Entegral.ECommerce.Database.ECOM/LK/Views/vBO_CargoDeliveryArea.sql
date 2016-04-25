

CREATE VIEW [LK].[vBO_CargoDeliveryArea]
AS
SELECT
	CDA.ID,
	CDA.StoreID,
	S.Code As StoreCode,
	S.Name As StoreName,
	CDA.CargoCompanyID,
	CDA.CountryID,
	CDA.Name,
	C.Name As CountryName,
	CDA.Price,
	CDA.FreeThreshold,
	CDA.IsActive,
	CDA.CreateUserID,
	CDA.CreateTime,
	CDA.UpdateUserID,
	CDA.UpdateTime
FROM LK.CargoDeliveryArea As CDA
INNER JOIN LK.Store As S ON CDA.StoreID = S.ID
INNER JOIN LK.Country As C ON CDA.CountryID = C.ID