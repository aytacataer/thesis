




CREATE VIEW [PRD].[vReport_EasyProductReport]
AS
SELECT 
	V.ID,
	V.Barcode,
	V.ExternalSystemCode AS VariantCode,
	SUBSTRING(P.ExternalSystemCode,0,LEN(P.ExternalSystemCode)-4) AS GenericCode,
	P.ExternalSystemCode AS ItemCode,
	PA1.VisibleValueText AS ProductGroup,
	P.DisplayName AS Name,
	PA2.CustomValueText AS StyleNote,
	P.Description,
	P.FriendlyURI,
	P.IsActive,
	VS.Quantity AS TotalStock,
	PA3.ValueText AS Size,
	PA4.ValueText AS Gender,
	PA5.ValueText AS Season,
	PA6.ValueText AS Year,
	PA7.ValueText AS Story,
	PA8.ValueText AS Brand,
	P.PageTitle,
	P.MetaDescription,
	P.MetaKeywords,
	P.VatRate,
	PSD.Price1 AS PSF1,
	CAST(
             CASE 
                  WHEN (PSD.Price4 is not null AND GETDATE() between PSD.Price4_StartTime AND PSD.Price4_EndTime)
				          THEN PSD.Price4
				  WHEN (PSD.Price3 is not null AND GETDATE() between PSD.Price3_StartTime AND PSD.Price3_EndTime)
				          THEN PSD.Price3 
				  WHEN (PSD.Price2 is not null AND GETDATE() between PSD.Price2_StartTime AND PSD.Price2_EndTime)
				          THEN PSD.Price2	
                  ELSE PSD.Price1 
             END AS money) as ActualPrice,
   CAST(
             CASE 
                  WHEN (PSD.Price4 is not null AND GETDATE() between PSD.Price4_StartTime AND PSD.Price4_EndTime)
				          THEN PSD.Price4 * (1.0 - (P.VatRate / 100.0))
				  WHEN (PSD.Price3 is not null AND GETDATE() between PSD.Price3_StartTime AND PSD.Price3_EndTime)
				          THEN PSD.Price3 * (1.0 - (P.VatRate / 100.0))
				  WHEN (PSD.Price2 is not null AND GETDATE() between PSD.Price2_StartTime AND PSD.Price2_EndTime)
				          THEN PSD.Price2 * (1.0 - (P.VatRate / 100.0))	
                  ELSE PSD.Price1 * (1.0 - (P.VatRate / 100.0)) 
             END AS money) as ActualPriceWithoutVat,
    TagIds = STUFF((SELECT ', ' + CAST(ID AS varchar) FROM [PRD].[vBO_ProductTag] WHERE ProductID = P.ID FOR XML PATH(''), TYPE).value('.[1]', 'nvarchar(max)'), 1, 2, ''),
	TagNames = STUFF((SELECT ', ' + CAST(Tag AS varchar) FROM [PRD].[vBO_ProductTag] WHERE ProductID = P.ID FOR XML PATH(''), TYPE).value('.[1]', 'nvarchar(max)'), 1, 2, ''),
	PDM.CDNPath
FROM PRD.Variant V
INNER JOIN PRD.Product P ON P.ID = V.ProductID
LEFT JOIN [PRD].[vBO_ProductAttribute] PA1 ON PA1.ProductID = P.ID AND PA1.AttributeCodeName = 'good-type'
LEFT JOIN [PRD].[vBO_ProductAttribute] PA2 ON PA2.ProductID = P.ID AND PA2.AttributeCodeName = 'style-note'
LEFT JOIN [PRD].[vBO_ProductAttribute] PA3 ON PA3.VariantID = V.ID AND PA3.AttributeCodeName = 'size'
LEFT JOIN [PRD].[vBO_ProductAttribute] PA4 ON PA4.ProductID = P.ID AND PA4.AttributeCodeName = 'gender'
LEFT JOIN [PRD].[vBO_ProductAttribute] PA5 ON PA5.ProductID = P.ID AND PA5.AttributeCodeName = 'season'
LEFT JOIN [PRD].[vBO_ProductAttribute] PA6 ON PA6.ProductID = P.ID AND PA6.AttributeCodeName = 'year'
LEFT JOIN [PRD].[vBO_ProductAttribute] PA7 ON PA7.ProductID = P.ID AND PA7.AttributeCodeName = 'story'
LEFT JOIN [PRD].[vBO_ProductAttribute] PA8 ON PA8.ProductID = P.ID AND PA8.AttributeCodeName = 'brand'
LEFT JOIN [PRD].[vBO_VariantStock] VS ON VS.VariantID = V.ID 
LEFT JOIN [PRD].[vBO_ProductStoreData] PSD ON PSD.ProductID = P.ID
LEFT JOIN [PRD].[vBO_ProductDefaultMediaFile] PDM ON PDM.ProductID = P.ID