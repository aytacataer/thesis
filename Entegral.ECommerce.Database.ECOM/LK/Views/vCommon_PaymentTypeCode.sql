


CREATE VIEW [LK].[vCommon_PaymentTypeCode]
AS
SELECT PM.StoreID, PM.Code PaymentMethodCode
	,B.SystemCode BankCode
	,PTC.*
FROM LK.PaymentTypeCode PTC
LEFT JOIN LK.PaymentMethod PM ON PTC.PaymentMethodID = PM.ID
LEFT JOIN LK.Bank B ON PTC.BankID = B.ID
LEFT JOIN LK.Store S ON PM.StoreID = S.ID