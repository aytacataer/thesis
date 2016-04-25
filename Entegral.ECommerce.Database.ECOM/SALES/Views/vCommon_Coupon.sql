
CREATE VIEW [SALES].[vCommon_Coupon]
AS
SELECT C.ID,
       C.Code,
       C.GroupCode,
       C.MaxUsePerCustomer,
       C.MaxUseTotal,
       C.ValidityStartTime,
       C.ValidityEndTime,
       C.IsPersonal,
       C.IsActive,
       COUNT(CH.ID) AS UsageCount,
       C.IsAvailableOffline
FROM SALES.Coupon AS C
LEFT OUTER JOIN SALES.CouponHistory AS CH ON CH.CouponID = C.ID
GROUP BY C.ID,
         C.Code,
         C.GroupCode,
         C.MaxUsePerCustomer,
         C.MaxUseTotal,
         C.ValidityStartTime,
         C.ValidityEndTime,
         C.IsPersonal,
         C.IsActive,
         C.IsAvailableOffline