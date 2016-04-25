﻿





CREATE VIEW [CRM].[vBO_Customer]
AS
WITH Orders AS
(
	SELECT COUNT(ID) 'OrderCount', CustomerID FROM SALES.OrderMain
	GROUP BY CustomerID
)
SELECT [C].[ID]
	,[C].[GUID]
	,[C].[StoreID]
	,[C].[EmailInteractionValidationGUID]
	,[C].[ExternalSystemCode]
	,[C].[Email]
	,[C].[Password]
	,[C].[FirstName]
	,[C].[LastName]
	,[C].[FirstName] + ' ' + [C].[LastName] AS FullName
	,[C].[GenderID]
	,[C].[MaritalStatusID]
	,[C].[EducationLevelID]
	,[C].[ShoeSize]
	,[C].[BodySize]
	,[C].LoyaltyCardNumber
	,[C].[JobID]
	,[C].[Birthday]
	,[C].[CellPhone]
	,[C].[RegistrationOrigin]
	,[C].[RegisterIpAddress]
	,[C].[IsActivatedByEmail]
	,[C].[IsTransferredToExternalSystem]
	,[C].[ExternalSystemTransferTime]
	,[C].[StockOutCampaignAppliedStores]
	,[C].[IsTestCustomer]
	,[C].[IsGuestCustomer]
	,[C].[IsSuspiciousCustomer]
	,[C].[ReceiveCampaignMessages]
	,[C].[ReceiveCampaignMessageUnCheckDate]
	,[C].[ReceiveCampaignMailVerificationCode]
	,[C].[ReceiveCampaignMailVerificationTime]
	,[C].[ReceiveCampaignMailIsVerified]
	,[C].[ReceiveCampaignMailIpAddress]
	,[C].[FacebookID]
	,[C].[IsActive]
	,[C].[CreateUserID]
	,[C].[CreateTime]
	,[C].[UpdateUserID]
	,[C].[UpdateTime]
	,[S].[Name] AS [StoreName]
	,G.NAME AS GenderName
	,G.ExternalSystemCode AS GenderExternalSystemCode
	,M.NAME AS MaritalStatusName
	,M.ExternalSystemCode AS MaritalStatusExternalSystemCode
	,E.NAME AS EducationLevelName
	,E.ExternalSystemCode AS EducationLevelExternalSystemCode
	,J.NAME AS JobName
	,J.ExternalSystemCode AS JobExternalSystemCode
	,[O].OrderCount AS TotalNumOfOrders
FROM CRM.Customer AS C
LEFT OUTER JOIN LK.Gender AS G ON C.GenderID = G.ID
LEFT OUTER JOIN LK.MaritalStatus AS M ON C.MaritalStatusID = M.ID
LEFT OUTER JOIN LK.EducationLevel AS E ON C.EducationLevelID = E.ID
LEFT OUTER JOIN LK.Job AS J ON C.JobID = J.ID
LEFT OUTER JOIN LK.Store AS S ON C.StoreID = S.ID
LEFT JOIN Orders AS O ON C.ID = O.CustomerID
