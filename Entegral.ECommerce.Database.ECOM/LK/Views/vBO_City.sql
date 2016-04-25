
CREATE view [LK].[vBO_City]
as
Select 
	[c].[ID], [c].[ExternalSystemCode], [c].[CountryID], [c].[Name], [c].[DisplayOrder], [c].[IsActive], [c].[CreateUserID], [c].[CreateTime], [c].[UpdateUserID], [c].[UpdateTime],
	CO.Name as 'CountryName'
from  
	LK.City C
		inner join
	LK.Country CO on CO.ID=C.CountryID
