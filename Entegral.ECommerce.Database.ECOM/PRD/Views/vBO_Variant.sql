

CREATE VIEW [PRD].[vBO_Variant]
AS
SELECT V.*
	,P.DisplayName
	,P.FriendlyURI
	,P.IsGiftCard
	,p.IsActive AS ProductIsActive
	,p.ExternalSystemCode as ProductExternalSystemCode
	,VS.Quantity
FROM PRD.Variant V
INNER JOIN PRD.Product P ON P.ID = V.ProductID
LEFT JOIN PRD.VariantStock VS ON VS.VariantID = V.ID