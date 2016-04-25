CREATE PROCEDURE [SALES].[UpdateOrdersOfTransferredCustomer]
AS
BEGIN TRAN

UPDATE O
SET O.CustomerExternalSystemCode = C.ExternalSystemCode
FROM Sales.OrderMain O
INNER JOIN CRM.Customer C ON C.ID = O.CustomerID
WHERE C.ExternalSystemCode IS NOT NULL
	AND O.CustomerExternalSystemCode IS NULL

COMMIT

RETURN 0