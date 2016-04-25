




CREATE VIEW [PRD].[vBO_DetailedUncategorizedProduct]
AS
  SELECT TOP (100) PERCENT P.ID,
MAX(CASE WHEN A.CodeName ='sap-category' or A.CodeName ='good-type' or A.CodeName ='gender' or A.CodeName ='product-type' THEN P.ExternalSystemCode END) AS ExternalSystemCode,
MAX(CASE WHEN A.CodeName ='sap-category' or A.CodeName ='good-type' or A.CodeName ='gender' or A.CodeName ='product-type' THEN P.DisplayName END) AS DisplayName,
MAX(CASE WHEN A.CodeName ='product-type' THEN AO.ValueText END) AS PType,
MAX(CASE WHEN A.CodeName ='gender' THEN AO.ValueText END) AS Gender, 
MAX(CASE WHEN A.CodeName ='good-type' THEN AO.ValueText END) AS GType,
MAX(CASE WHEN A.CodeName ='sap-category' THEN AO.ValueText END) AS SAPCategory,
MAX(CASE WHEN A.CodeName ='sap-category' or A.CodeName ='good-type' or A.CodeName ='gender' or A.CodeName ='product-type' THEN PMF.CDNPath END) AS CDNPath
From
       (PRD.Product P 
             LEFT JOIN
       PRD.Category_Product CP on P.ID = CP.ProductID and CP.CategoryID not in (Select ID From PRD.Category Where IsBrandCategory = 1)
	   INNER JOIN PRD.[ProductAttribute] PA ON P.ID = PA.[ProductID]
	   INNER JOIN LK.[Atribute] A ON A.ID = PA.AttributeID
	   LEFT JOIN LK.[AttributeOption] AO ON AO.ID = PA.[AttributeOptionID]
	   LEFT JOIN PRD.ProductMedia PM on P.ID = PM.ProductID
	   LEFT JOIN PRD.ProductMediaFile PMF on PMF.ProductMediaID = PM.ID )
		Where 
       CP.ID is null and (A.CodeName='sap-category' or A.CodeName='gender' or A.CodeName='good-type' or A.CodeName='product-type')
	   GROUP BY P.ID
	   Order by P.ID asc