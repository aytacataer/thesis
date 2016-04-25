CREATE view [LK].[vBO_PickupLocation]
as
Select 
	PL.*,
	CT.Name as  CountryName,
	C.Name as  CityName,
	D.Name as DistrictName,
	T.Name AS TownName,
	S.Name as StoreName
from 
	LK.PickupLocation PL
		inner join
	LK.Country CT on CT.ID=PL.CountryID
		inner join
	LK.City C  on C.ID= PL.CityID
		inner join
	LK.District D on D.ID=PL.DistrictID
		left join
	LK.Town T on T.ID = PL.TownID
		inner join 
	LK.Store S on S.ID = PL.StoreID