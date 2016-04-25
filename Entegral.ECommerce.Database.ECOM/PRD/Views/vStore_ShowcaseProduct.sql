


CREATE VIEW [PRD].[vStore_ShowcaseProduct]
AS
	SELECT
		PS.ShowcaseID
		,[P].[ID]
		,[P].StoreID
		,[P].[DisplayName]
		,[P].[Description]
		,[P].[DisplayOrder]
		,[P].[FriendlyURI]
		,[P].[VatRate]
		,[P].[PageTitle]
		,[P].[MetaDescription]
		,[P].[MetaKeywords]
		,[P].[IsVatIncluded]
		,[P].[Price1]
		,[P].[Price2]
		,[P].[Price2_StartTime]
		,[P].[Price2_EndTime]
		,[P].[Price3]
		,[P].[Price3_StartTime]
		,[P].[Price3_EndTime]
		,[P].[Price4]
		,[P].[Price4_StartTime]
		,[P].[Price4_EndTime]
		,[P].[HasAllImages]
	FROM PRD.[Showcase_Product] PS
	INNER JOIN PRD.[vStore_Product] P ON PS.[ProductID] = P.ID
