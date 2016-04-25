
CREATE VIEW [PRD].[vBO_ProductReport_Category]
AS
SELECT
	C.ID AS CategoryID, 
	C.Code, 
	P.ExternalSystemCode, 
	C.DisplayName, 
	C.Description, 
	C.PageTitle, 
	C.FriendlyURI, 
	C.CreateTime, 
	C.UpdateTime
FROM PRD.Category AS C 
INNER JOIN PRD.Category_Product AS CP ON CP.CategoryID = C.ID 
INNER JOIN PRD.Product AS P ON P.ID = CP.ProductID