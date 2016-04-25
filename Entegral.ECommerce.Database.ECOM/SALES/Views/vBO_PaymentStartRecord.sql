CREATE VIEW [SALES].[vBO_PaymentStartRecord]
AS
Select P.*, 
B.DisplayName BankName, PM.DisplayName PaymentMethodName,  O.CustomerEmail, O.CustomerIP, PM.IsIncludedDistributionAlgorithmOnReturn
From SALES.PaymentStartRecord P
INNER JOIN SALES.OrderMain O On O.ID = P.OrderID
INNER JOIN LK.PaymentMethod PM On P.PaymentMethodCode = PM.Code AND (O.StoreID = PM.StoreID OR PM.StoreID = 0)
LEFT JOIN LK.Bank B On P.BankCode = B.SystemCode AND B.StoreID = O.StoreID