CREATE VIEW [LK].[vBO_Store]
AS
SELECT S.*
	,C.FirstName + ' ' + c.LastName AS CustomerName
FROM LK.Store S
LEFT JOIN CRM.Customer C ON S.GuestCustomerID = C.ID