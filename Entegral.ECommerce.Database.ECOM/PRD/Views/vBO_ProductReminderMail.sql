



CREATE VIEW [PRD].[vBO_ProductReminderMail]
AS
SELECT 
PR.ID AS ProductReminderID,
PR.StoreID AS StoreID,
PR.CustomerID AS CustomerID,
PR.FirstName + ' ' + PR.LastName AS CustomerFullName,
PR.Email AS CustomerEmail,
PR.IsMailSent AS IsMailSent,
PR.VariantID,
P.FriendlyURI, 
DM.CDNPath,
P.DisplayName AS ProductDisplayName, 
P.MetaDescription, 
P.Description, 
VS.Quantity,
PA.ValueText AS GoodTypeDescription, 
PA1.ValueText as Size,
PA2.ValueText  AS Color
FROM PRD.ProductReminder AS PR 
INNER JOIN PRD.VariantStock AS VS ON PR.VariantID = VS.VariantID
INNER JOIN PRD.Variant AS V ON V.ID = PR.VariantID
INNER JOIN PRD.Product AS P ON P.ID = PR.ProductID
INNER JOIN PRD.vBO_ProductAttribute AS PA ON PA.ProductID = P.ID and PA.[AttributeCodeName]='good-type-description'
INNER JOIN PRD.vBO_ProductAttribute AS PA1 ON PA1.VariantID = V.ID and PA1.[AttributeCodeName]='size'
INNER JOIN PRD.vBO_ProductAttribute AS PA2 ON PA2.ProductID = V.ProductID and PA2.[AttributeCodeName]='color'
LEFT JOIN PRD.vBO_ProductDefaultMediaFile DM ON DM.ProductID = PR.ProductID
WHERE VS.Quantity>0
GO
