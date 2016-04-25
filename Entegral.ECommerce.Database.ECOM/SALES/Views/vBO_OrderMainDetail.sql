
CREATE VIEW [Sales].[vBO_OrderMainDetail]
AS
SELECT OMD.*
	,OM.OrderCode
	,OM.CustomerID
	,OM.CustomerEmail
	,OM.CreateTime
FROM Sales.OrderMainDetail OMD
INNER JOIN Sales.OrderMain OM ON OM.ID = OMD.OrderMainID