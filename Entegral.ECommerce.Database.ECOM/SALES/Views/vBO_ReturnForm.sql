






CREATE VIEW [SALES].[vBO_ReturnForm]
AS
SELECT 
RF.ID,
RF.StoreID,
RF.CustomerID,
RF.TrackingNumber,
RF.Status,
RF.IsActive,
RF.CreateTime,
RF.UpdateTime,
OM.CreateTime AS OrderCreateTime,
S.ValidityDayCount,
S.Name,
C.FirstName + ' ' + C.LastName As CustomerName
FROM SALES.ReturnForm AS RF
INNER JOIN LK.STORE AS S ON S.ID = RF.StoreID
INNER JOIN CRM.Customer AS C ON C.ID = RF.CustomerID
INNER JOIN SALES.OrderMain AS OM ON OM.ID = RF.OrderID