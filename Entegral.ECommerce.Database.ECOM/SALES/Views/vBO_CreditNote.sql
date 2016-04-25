CREATE VIEW [SALES].[vBO_CreditNote]
AS
SELECT 
	C.*
	,PM.DisplayName AS PaymentMethodDisplayName
	,O.OrderCode
	,CU.FirstName
	,CU.LastName
	,CU.FullName
	,B.DisplayName AS BankName
	,O.StoreID
	,O.CreateTime AS OrderDate
	,O.CustomerIP
	,O.CustomerEmail
	,S.ExternalSystemCode AS StoreExternalSystemCode
FROM SALES.CreditNote AS C
INNER JOIN SALES.OrderMain AS O ON O.ID = C.OrderID
INNER JOIN CRM.vBO_Customer AS CU ON CU.ID = C.CustomerID
INNER JOIN LK.PaymentMethod AS PM ON PM.Code = C.PaymentMethodCode AND (PM.StoreID = O.StoreID OR PM.StoreID = 0)
LEFT JOIN LK.Bank AS B ON B.SystemCode = C.BankCode AND B.StoreID = O.StoreID
LEFT JOIN LK.Store AS S ON O.StoreID = S.ID