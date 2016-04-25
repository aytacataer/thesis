
CREATE VIEW [PRD].[vBO_ShowCase]
AS
SELECT [SC].[ID]
	,[SC].[StoreID]
	,[SC].[Code]
	,[SC].[DisplayName]
	,[SC].[SubTitle]
	,[SC].[StartDate]
	,[SC].[EndDate]
	,[SC].[GetProductsFromExternal]
	,[SC].[IsActive]
	,[SC].[CreateUserID]
	,[SC].[CreateTime]
	,[SC].[UpdateUserID]
	,[SC].[UpdateTime]
	,S.NAME AS StoreName
FROM PRD.Showcase AS SC
INNER JOIN LK.Store AS S ON S.ID = SC.StoreID
