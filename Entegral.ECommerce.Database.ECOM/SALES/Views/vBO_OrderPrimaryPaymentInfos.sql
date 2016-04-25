







CREATE VIEW [SALES].[vBO_OrderPrimaryPaymentInfos]
AS

with cte AS
(
select
ROW_NUMBER() over (
PARTITION BY OrderID ORDER BY PaymentDate DESC
) AS rowNumber
, *
from Sales.PaymentInfo
)
select 
	   OrderID,
	   ID,
       PaymentMethodCode,
       Amount,
       BankCode,
       InstallmentCount,
       CreditCardHolderName,
       AccountNumber,
       Ref,
       TrxID,
       PaymentDate,
       IsCreatedManually,
       CreateUserID,
       CreateTime,
       UpdateUserID,
       UpdateTime

from cte where cte.rowNumber = 1