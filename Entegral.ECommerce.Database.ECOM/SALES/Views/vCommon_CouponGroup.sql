CREATE VIEW [SALES].[vCommon_CouponGroup]
AS
SELECT 
ROW_NUMBER() OVER (
		ORDER BY GroupCode DESC
		) AS RowID,
c.GroupCode, COUNT(C.ID) AS CouponCount, SUM(C.UsageCount) AS TotalUsageCount, 
SUM(MaxUseTotal) AS MaxUseTotal,
MIN(C.ValidityStartTime) AS ValidityStartTime, MAX(C.ValidityEndTime) AS ValidityEndTime
FROM SALES.vCommon_Coupon AS C
GROUP BY C.GroupCode