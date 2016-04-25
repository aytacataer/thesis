CREATE VIEW prd.[vBO_ProductDefaultMediaFile]
AS
SELECT ProductID
	,MIN(CDNPath) AS CDNPath
FROM prd.vBO_ProductMediaFile
WHERE SizeID IS NULL
GROUP BY ProductID