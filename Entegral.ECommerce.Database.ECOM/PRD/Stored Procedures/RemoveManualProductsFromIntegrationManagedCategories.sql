CREATE PROCEDURE [PRD].[RemoveManualProductsFromIntegrationManagedCategories]
AS
BEGIN
	DELETE CP
	FROM PRD.Category_Product CP
	INNER JOIN PRD.Category C ON CP.CategoryID = C.ID
	WHERE CP.IsFromIntegration = 0
		AND C.IsProductsManagedByIntegration = 1
END
