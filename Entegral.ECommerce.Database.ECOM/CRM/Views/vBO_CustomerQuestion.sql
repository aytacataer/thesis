



CREATE view [CRM].[vBO_CustomerQuestion]
AS
SELECT 
	CQ.*,
	C.FirstName + C.LastName  AS CustomerName,
	C.ExternalSystemCode AS CustomerExternalSystem,
	CQS.DisplayName,
	p.ExternalSystemCode AS ProductCode
FROM 
CRM.CustomerQuestion CQ
LEFT JOIN CRM.Customer C on C.ID=CQ.CustomerID
LEFT JOIN PRD.Product P on CQ.ProductID = P.ID
LEFT JOIN LK.CustomerQuestionStatus CQS on CQS.Code=CQ.CustomerQuestionStatusCode
WHERE CQ.IsTransferredToExternalSystem = 0