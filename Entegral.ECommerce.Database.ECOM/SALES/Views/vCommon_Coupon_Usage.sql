CREATE VIEW SALES.vCommon_Coupon_Usage
AS
SELECT c.Code, cus.ExternalSystemCode, c.MaxUseTotal, ch.CreateTime
FROM     SALES.CouponHistory AS ch LEFT OUTER JOIN
                  SALES.Coupon AS c ON ch.CouponID = c.ID LEFT OUTER JOIN
                  CRM.Customer AS cus ON ch.CustomerID = cus.ID
GO