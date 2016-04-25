

CREATE VIEW [LK].[vBO_MyProfileSetting]
AS
SELECT 
	AT1.DisplayName as AttributeDisplayName1,
	AT2.DisplayName as AttributeDisplayName2
	,P.*
FROM LK.MyProfileSetting P
LEFT JOIN LK.Atribute AT1 ON P.AttributeID1 = AT1.ID 
LEFT JOIN LK.Atribute AT2 ON p.AttributeID2 = AT2.ID