
CREATE VIEW [LK].[vBO_InvitationConfiguration]
AS
SELECT C.*, S.Name AS StoreName, S.Code AS StoreCode,
CA1.Code AS InvitorCampaignCode, CA2.Code AS InvitedCampaignCode  FROM 
LK.InvitationConfiguration AS C
INNER JOIN LK.Store AS S
ON S.ID = C.ID
LEFT OUTER JOIN SALES.Campaign AS CA1
ON CA1.ID = C.InvitorCampaignID
LEFT OUTER JOIN SALES.Campaign AS CA2
ON CA2.ID = C.InvitedCampaignID