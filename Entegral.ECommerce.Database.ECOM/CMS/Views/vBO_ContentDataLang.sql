



CREATE VIEW [CMS].[vBO_ContentDataLang]
AS
SELECT ROW_NUMBER() OVER (
		ORDER BY CL.ID
		) AS RowID
	,CL.[ID]
	,CL.[LanguageID]	
	,CL.[Body]
	,CL.[IsActive]
	,CL.[CreateUserID]
	,CL.[CreateTime]
	,CL.[UpdateUserID]
	,CL.[UpdateTime]
	,L.NAME AS LanguageName
	,C.ID AS ContentID
	,CD.ContentDeviceType
FROM CMS.ContentData_Lang CL
INNER JOIN LK.LANGUAGE L ON CL.LanguageID = L.ID
INNER JOIN CMS.ContentData CD ON CL.ID = CD.ID
INNER JOIN CMS.Content C ON CD.ContentID = C.ID