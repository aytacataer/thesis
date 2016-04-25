
CREATE VIEW PRD.vStore_ProductMedia
AS
SELECT [ID]
	,[DisplayOrder]
	,[MediaFormat]
	,[AltText]
	,[Title]
	,[ProductID]
	,[VariantID]
	,[AttributeOptionID]
	,[IsActive]
FROM [PRD].[ProductMedia]