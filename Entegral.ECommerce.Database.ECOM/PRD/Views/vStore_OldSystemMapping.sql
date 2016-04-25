CREATE VIEW [PRD].[vStore_OldSystemMapping]
AS
SELECT O.*, P.FriendlyURI AS ProductFriendlyURI, C.FriendlyURI AS CategoryFriendlyURI
FROM PRD.OldSystemMapping AS O
LEFT JOIN PRD.Product AS P
ON P.ID = O.CurrentSystemID
LEFT JOIN PRD.Category AS C
ON C.ID = O.CurrentSystemID