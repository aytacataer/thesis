
CREATE VIEW [PRD].[vBO_ProductReport_Product]
AS
SELECT
	P.ID, 
	P.ExternalSystemCode, 
	P.DisplayName, 
	P.DisplayOrder, 
	P.Description, 
	P.FriendlyURI, 
	P.MetaKeywords, 
	P.MetaDescription, 
	P.PageTitle, 
	P.VatRate, 
	P.IsActive,
	P.CreateTime, 
    P.UpdateTime,
	DM.CDNPath
FROM PRD.Product AS P 
INNER JOIN PRD.vBO_ProductDefaultMediaFile AS DM ON DM.ProductID = P.ID