
CREATE VIEW [PRD].[vBO_ProductVisitationLog]
AS
SELECT
	S.ExternalSystemCode AS StoreExternalSystemCode
	,S.NAME AS StoreName
	,VL.*
	,PR.ExternalSystemCode AS PrdExtSysCode
	,PR.DisplayName AS PrdDisplayName
	,C.FirstName + ' ' + C.LastName AS CustomerFullName
FROM [PRD].[VisitationLog] AS VL
LEFT JOIN [LK].[Store] AS S ON VL.StoreID = S.ID
LEFT JOIN [PRD].[Product] AS PR ON VL.ProductID = PR.ID
LEFT JOIN [CRM].[Customer] AS C ON VL.CustomerID = C.ID