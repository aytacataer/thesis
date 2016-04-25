



CREATE VIEW [PRD].[vStore_Product]
AS
SELECT P.ID
	,PSD.StoreID
	,P.DisplayName
	,P.Description
	,P.DisplayOrder
	,P.FriendlyURI
	,P.VatRate
	,P.Score
	,P.PageTitle
	,P.MetaDescription
	,P.MetaKeywords
	,P.ExternalSystemCode
	,P.IsDiscountForbidden
	,P.IsReturnForbidden
	,P.IsUseInfoInSeo
	,P.UpdateTime
	,P.IsGiftCard
	,S.IsVatIncluded
	,PSD.Price1
	,PSD.Price2
	,PSD.Price2_StartTime
	,PSD.Price2_EndTime
	,PSD.Price3
	,PSD.Price3_StartTime
	,PSD.Price3_EndTime
	,PSD.Price4
	,PSD.Price4_StartTime
	,PSD.Price4_EndTime
	,P.IsActive
	,P.IsPreOrder
	,P.EstimatedSupplyDate
	,ISNULL(CAST((
			CASE 
				WHEN PM.ProductID IS NULL
					THEN 0
				ELSE 1
				END
			) AS BIT), 0) AS HasAllImages
FROM PRD.[Product] P
INNER JOIN PRD.[ProductStoreData] PSD ON P.ID = PSD.[ProductID]
INNER JOIN LK.[Store] S ON PSD.StoreID = S.ID
LEFT JOIN [PRD].[vStore_ProductResizedAllImages] AS PM ON P.ID = PM.ProductID
Where P.IsActive = 1
