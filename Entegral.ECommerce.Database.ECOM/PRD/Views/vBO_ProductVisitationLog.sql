CREATE VIEW [PRD].[vBO_ProductVisitationLog]
AS
SELECT VL.*,
	   PR.ExternalSystemCode AS PrdExtSysCode,
	   PR.DisplayName AS PrdDisplayName,
	   C.FirstName + ' ' + C.LastName AS CustomerFullName
	FROM [PRD].[VisitationLog] AS VL
left join [PRD].[Product] AS PR ON VL.ProductID = PR.ID
left join [CRM].[Customer] AS C on VL.CustomerID = C.ID