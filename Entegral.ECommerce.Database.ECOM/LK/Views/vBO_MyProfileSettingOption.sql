



CREATE VIEW [LK].[vBO_MyProfileSettingOption]
AS
SELECT 
	AT1.DisplayName as AttributeDisplayName1,
	ATO1.ValueText as AttributeOptDisplayName1,
	AT2.DisplayName as AttributeDisplayName2,
	ATO2.ValueText as AttributeOptDisplayName2,
	P.*
FROM LK.MyProfileSettingOption P
LEFT JOIN LK.Atribute AT1 ON P.AttributeID1 = AT1.ID 
LEFT JOIN LK.Atribute AT2 ON p.AttributeID2 = AT2.ID
LEFT JOIN LK.AttributeOption ATO1 ON p.AttributeOptionID1 = ATO1.ID
LEFT JOIN LK.AttributeOption ATO2 ON p.AttributeOptionID2 = ATO2.ID