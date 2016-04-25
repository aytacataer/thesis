
CREATE VIEW CRM.vCommon_ProductList
AS
SELECT 
	PL.*,
	C.ExternalSystemCode AS CustomerExternalSystemCode,
	C.FirstName,
	C.LastName,
	S.Code AS StoreCode,
	S.Name AS StoreName 
FROM CRM.ProductList PL
INNER JOIN LK.Store S ON PL.StoreID = S.ID
INNER JOIN CRM.Customer C ON PL.CustomerID = C.ID