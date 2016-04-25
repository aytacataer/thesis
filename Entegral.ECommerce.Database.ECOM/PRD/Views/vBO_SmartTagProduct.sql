



CREATE VIEW [PRD].[vBO_SmartTagProduct]
AS
SELECT 
	T.ID,
	T.ProductID,
	P.ExternalSystemCode, 
	P.DisplayName, 
	T.SmartTagID, 
	ST.Value,
	ST.StartTime,
	ST.EndTime,
	ST.ImageUrl
FROM PRD.SmartTag_Product AS T
INNER JOIN PRD.Product AS P ON P.ID = T.ProductID
INNER JOIN PRD.SmartTag AS ST ON ST.ID = T.SmartTagID