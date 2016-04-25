Create view [LK].[vBO_Town]
as
Select 
	[T].[ID], 
	[T].[DistrictID], 
	[T].[Name], 
	[T].[DisplayOrder], 
	[T].[IsActive], 
	[T].[CreateUserID], 
	[T].[CreateTime], 
	[T].[UpdateUserID], 
	[T].[UpdateTime], 
	[T].[ExternalSystemCode],
	D.Name as 'DistrictName',
	D.CityID,
	C.Name as 'CityName',
	C.CountryID,
	CO.Name as 'CountryName'
from LK.Town T
	INNER JOIN 
	LK.District D on D.ID =T.DistrictID
		inner join
	LK.City C on C.ID=D.CityID
		inner join 
	LK.Country CO on CO.ID=C.CountryID