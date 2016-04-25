
CREATE VIEW [SALES].[vBO_UnSuccessfulOrdersWithPayment]
AS
SELECT DISTINCT OM.ID
	,OM.OrderCode
	,OM.CustomerName
FROM SALES.OrderMain OM
INNER JOIN SALES.PaymentInfo P ON OM.ID = P.OrderID
WHERE OM.IsPlacedSuccessfully = 0