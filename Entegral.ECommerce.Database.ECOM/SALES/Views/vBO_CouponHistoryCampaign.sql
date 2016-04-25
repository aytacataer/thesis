
CREATE VIEW [SALES].[vBO_CouponHistoryCampaign]
AS
SELECT C.ID, C.Code, C.GroupCode, C.MaxUsePerCustomer, C.MaxUseTotal, C.ValidityStartTime,
C.ValidityEndTime, C.IsActive, COUNT(CH.ID) AS UsageCount, CH.CampaignID, CH.CustomerID
FROM SALES.Coupon AS C
LEFT JOIN SALES.CouponHistory AS CH 
ON CH.CouponID = C.ID
GROUP BY C.ID, C.Code, C.GroupCode, C.MaxUsePerCustomer, C.MaxUseTotal, C.ValidityStartTime,
C.ValidityEndTime, C.IsActive, CH.CampaignID, CH.CustomerID