
CREATE VIEW [PRD].[vBO_ProductReminder]
AS
SELECT        PR.ID, PR.StoreID, PR.CustomerID, PR.FirstName, PR.LastName, PR.Email, PR.CellPhone, PR.Note, PR.ProductID, PR.VariantID, V.Barcode AS VariantBarcode, PR.AttributeValue1, PR.AttributeValue2, PR.AttributeValue3, PR.CreateUserID, 
                         PR.CreateTime, PR.UpdateUserID, PR.UpdateTime, S.Code AS StoreCode, S.Name AS StoreName
FROM            PRD.ProductReminder AS PR 
LEFT JOIN PRD.Variant AS V ON PR.VariantID = V.ID
INNER JOIN LK.Store AS S ON S.ID = PR.StoreID
GO