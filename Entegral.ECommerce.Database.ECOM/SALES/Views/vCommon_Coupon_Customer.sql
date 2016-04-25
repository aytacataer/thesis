


CREATE VIEW [SALES].[vCommon_Coupon_Customer]
AS
SELECT
	CC.*,
	C.ExternalSystemCode AS CustomerExternalSystemCode,
	C.FirstName,
	C.LastName,
	CO.Code AS CouponCode,
	CO.GroupCode AS CouponGroupCode
FROM SALES.Coupon_Customer CC
INNER JOIN SALES.Coupon CO ON CC.CouponID = CO.ID
INNER JOIN CRM.Customer C ON CC.CustomerID = C.ID