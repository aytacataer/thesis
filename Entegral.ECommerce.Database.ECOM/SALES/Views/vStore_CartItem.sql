CREATE VIEW [Sales].[vStore_CartItem]
AS
SELECT CI.*
	,C.[CustomerID]
	,C.[Status]
	,C.[LastViewedTime]
FROM Sales.CartItem AS CI
INNER JOIN Sales.Cart AS C ON CI.CartGUID = c.[GUID]