


CREATE VIEW [CMS].[vBO_BannerDataLang]
AS
SELECT ROW_NUMBER() OVER (
		ORDER BY BL.ID
		) AS RowID
	,[BL].[ID]
	,[BL].[LanguageID]	
	,[BL].[ImagePath]
	,[BL].[IsActive]
	,[BL].[CreateUserID]
	,[BL].[CreateTime]
	,[BL].[UpdateUserID]
	,[BL].[UpdateTime]
	,L.NAME AS LanguageName
	,B.ID AS BannerID
	,BD.BannerDeviceType
FROM CMS.BannerData_Lang BL
INNER JOIN LK.LANGUAGE L ON BL.LanguageID = L.ID
INNER JOIN CMS.BannerData BD ON BL.ID = BD.ID
INNER JOIN CMS.Banner B ON BD.BannerID = B.ID