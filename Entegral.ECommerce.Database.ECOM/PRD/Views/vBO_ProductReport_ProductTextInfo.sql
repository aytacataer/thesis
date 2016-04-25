



CREATE VIEW [PRD].[vBO_ProductReport_ProductTextInfo]
AS
SELECT        P.ExternalSystemCode, P.DisplayName, P.Description, PA.CustomValueText AS StyleNote, CAST(
             CASE 
                  WHEN (pdmf.CDNPath is not null AND ps.TotalStock > 0 AND P.IsActive = 1)
				          THEN 1 
                  ELSE 0 
             END AS bit) as IsVisible
FROM            PRD.Product AS P 
				LEFT JOIN (Select Distinct PAI.CustomValueText,PAI.ProductID from PRD.ProductAttribute AS PAI INNER JOIN LK.Atribute AS A ON A.ID = PAI.AttributeID AND A.CodeName = 'style-note') AS PA ON PA.ProductID = P.ID
				LEFT JOIN PRD.vBO_ProductDefaultMediaFile AS pdmf ON pdmf.ProductID = P.ID
				LEFT JOIN PRD.vBO_ProductStock AS ps ON ps.ProductID = P.ID
GO