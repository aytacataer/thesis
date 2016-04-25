CREATE VIEW [SALES].[vBatch_OpenCartProduct]
AS
SELECT CI.CartGUID
	,C.StoreID
	,C.LastItemChangeTime
	,CI.UpdateTime CartItemUpdateTime
	,CI.ProductID
	,CI.VariantID
	,C.CustomerID
	,Cus.FirstName
	,Cus.LastName
	,CUs.Email
FROM SALES.CartItem CI
INNER JOIN SALES.Cart C ON C.[GUID] = CI.CartGUID
INNER JOIN PRD.VariantStock VS ON CI.VariantID = VS.VariantID
INNER JOIN CRM.Customer Cus ON Cus.ID = C.CustomerID
WHERE C.[Status] = 'OPEN'
	AND C.OpenCartMailSentTime IS NULL
	AND C.CustomerID IS NOT NULL
	AND VS.Quantity > 0