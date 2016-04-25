
CREATE view [LK].[vBO_District]
as
Select 
	[D].[ID], [D].[CityID], [D].[Name], [D].[DisplayOrder], 
	[D].[IsActive], [D].[CreateUserID], [D].[CreateTime], 
	[D].[UpdateUserID], [D].[UpdateTime], [D].[ExternalSystemCode],
	C.Name as 'CityName',
	C.CountryID,
	CO.Name as 'CountryName'
from 
	LK.District D
		inner join
	LK.City C on C.ID=D.CityID
		inner join 
	LK.Country CO on CO.ID=C.CountryID
