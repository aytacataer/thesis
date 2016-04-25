








CREATE VIEW [CRM].[vBO_Message]
AS
SELECT 
	M.ID,
	M.ParentID,
	M.StoreID,
	M.CustomerID,
	M.Subject,
	M.Content,
	M.Status,
	M.CreateTime,
	M.CreateUserID,
	M.UpdateTime,
	M.UpdateUserID,
	C.FirstName + ' ' + C.LastName AS CustomerName
FROM CRM.Message M
LEFT JOIN CRM.Customer C ON C.ID = M.CustomerID