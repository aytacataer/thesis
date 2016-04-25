
CREATE VIEW [PRD].[vBO_ProductShowcase]
AS
SELECT P.ID
	,P.DisplayName AS ProductDisplayName
	,P.Description
	,P.ExternalSystemCode
	,P.FriendlyURI
	,P.IsActive
	,S.ID AS ShowcaseID
	,S.Code AS ShowcaseCode
	,PS.DisplayOrder
FROM PRD.[Product] AS P
LEFT JOIN PRD.[Showcase_Product] AS PS ON PS.[ProductID] = P.ID
LEFT JOIN PRD.Showcase AS S ON S.ID = PS.ShowcaseID
