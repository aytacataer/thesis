
CREATE VIEW [PRD].[vBO_ProductReport_Variant]
AS
SELECT
	ID AS VariantID, 
	ProductID, 
	DisplayName, 
	ExternalSystemCode, 
	Barcode, 
	FriendlyURI, 
	IsGiftCard AS GiftCard, 
	ProductExternalSystemCode, 
	IsActive
FROM PRD.vBO_Variant AS V