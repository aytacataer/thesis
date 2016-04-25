CREATE VIEW [PRD].[vBO_CategoryShowCase]
AS
SELECT [CS].[ID]
	,[CS].[CategoryID]
	,[CS].[ShowcaseID]
	,[CS].[DisplayOrder]
	,S.StoreID
	,S.Code
	,S.DisplayName
	,S.SubTitle
	,S.StartDate
	,S.EndDate
	,ST.NAME AS StoreName
FROM PRD.Category_Showcase AS CS
INNER JOIN PRD.Showcase AS S ON S.ID = CS.ShowcaseID
INNER JOIN LK.Store AS ST ON ST.ID = S.StoreID
