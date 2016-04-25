
create VIEW [SALES].[vBO_FraudRule]
AS
SELECT FR.*
	,F.[FraudType]
	,F.StoreID
FROM SALES.FraudRule FR
JOIN SALES.Fraud F ON FR.FraudID = F.ID