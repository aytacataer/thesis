

CREATE VIEW [PRD].[vBO_ProductReport_ProductStoreData]
AS
SELECT
	PSD.ProductID, 
	P.ExternalSystemCode, 
	PSD.Price1, 
	PSD.Price2, 
	PSD.Price2_StartTime, 
	PSD.Price2_EndTime, 
	PSD.Price3, 
	PSD.Price3_StartTime, 
	PSD.Price3_EndTime, 
	PSD.Price4, 
	PSD.Price4_StartTime, 
	PSD.Price4_EndTime, 
	PSD.CreateTime, 
	PSD.UpdateTime
FROM PRD.ProductStoreData AS PSD 
INNER JOIN PRD.Product AS P ON P.ID = PSD.ProductID