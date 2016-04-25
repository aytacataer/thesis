CREATE VIEW LK.vBO_RegisterCouponConfiguration
AS
SELECT C.ID, C.CampaignID, C.CouponValidityDayCount, C.MailText, S.Name AS StoreName, S.Code AS StoreCode, CA.Code AS CampaignCode, C.IsActive, S.ID AS StoreID
FROM     LK.RegisterCouponConfiguration AS C INNER JOIN
                  LK.Store AS S ON S.ID = C.ID LEFT OUTER JOIN
                  SALES.Campaign AS CA ON CA.ID = C.CampaignID
GO