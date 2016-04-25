CREATE VIEW PRD.vBO_ProductTag
AS
SELECT T.*, P.ExternalSystemCode, P.DisplayName
FROM PRD.ProductTag AS T
INNER JOIN PRD.Product AS P
ON P.ID = T.ProductID