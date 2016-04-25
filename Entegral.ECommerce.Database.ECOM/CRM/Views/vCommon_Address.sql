

CREATE VIEW [CRM].[vCommon_Address]
AS
SELECT [A].[ID], [A].[CustomerID], [A].[AddressDescription], 
[A].[Name], [A].[AddressText], [A].[Phone], [A].[Email], 
[A].[TaxOffice], [A].[TaxNo], [A].[CitizenID], [A].[Zip], 
[A].[CityID], [A].[DistrictID], [A].[IsDefaultBillingAddress], 
[A].[IsDefaultDeliveryAddress], [A].[IsActive], 
[A].[CreateUserID], [A].[CreateTime], [A].[UpdateUserID], 
[A].[UpdateTime], 
D.Name AS DistrictName, D.ExternalSystemCode AS DistrictExternalSystemCode,
C.Name AS CityName, C.ExternalSystemCode AS CityExternalSystemCode,
CO.Name AS CountryName, CO.ID AS CountryID, CO.ExternalSystemCode AS CountryExternalSystemCode,
T.Name AS TownName,T.ID AS TownID, T.ExternalSystemCode AS TownExternalSystemCode,
CU.ExternalSystemCode AS CustomerExternalSystemCode,[A].[Token]
FROM CRM.Address AS A
INNER JOIN CRM.Customer AS CU
ON CU.ID = A.CustomerID
LEFT JOIN LK.City AS C
ON C.ID = A.CityID
LEFT JOIN LK.Country AS CO
ON CO.ID = C.CountryID
LEFT JOIN LK.District AS D
ON A.DistrictID=D.ID
LEFT JOIN LK.Town AS T
ON A.TownID = T.ID
