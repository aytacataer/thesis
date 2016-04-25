CREATE VIEW [PRD].[vBO_CategorySlider]
AS
SELECT [CS].[ID]
	,[CS].[CategoryID]
	,[CS].[SliderID]
	,[CS].[DisplayOrder]
	,S.Code
	,S.StoreID
	,ST.Code AS StoreCode
	,ST.NAME AS StoreName
	,S.Duration
	,S.IsActive
FROM PRD.Category_Slider AS CS
INNER JOIN CMS.Slider AS S ON S.ID = CS.SliderID
INNER JOIN LK.Store AS ST ON ST.ID = S.StoreID
