﻿


CREATE VIEW [SALES].[vBO_OrderMain]
AS
SELECT OM.*,
		S.ExternalSystemCode AS StoreExternalSystemCode,
		PAY.Amount PaymentAmount,
		PAY.BankCode PaymentBankName,
		PAY.CreditCardHolderName CreditCardHolderName,
		PAY.AccountNumber AccountNumber,
		PAY.InstallmentCount InstallmentCount,
		PAY.PaymentDate PaymentDate,
		PAY.TrxID,
		PM.DisplayName PaymentMethod,
		SC.DisplayName OrderStatus,
		SC.UserVisibleDisplayName UserVisibleOrderStatus,
		CAM.Code CampaignCode,
		CAM.CouponGroup CampaignCouponGroup,
		CC.Code AS CargoCompanyCode
FROM SALES.OrderMain OM
	LEFT JOIN SALES.vBO_OrderPrimaryPaymentInfos PAY ON PAY.OrderID = OM.ID
	LEFT JOIN LK.PickupLocation PL ON OM.PickupLocationID = PL.ID
	LEFT JOIN LK.PaymentMethod PM ON PM.Code = OM.PaymentMethodCode AND (OM.StoreID = PM.StoreID OR PM.StoreID = 0)
	LEFT JOIN LK.StatusCode SC ON SC.Code = OM.OrderStatusCode
	LEFT JOIN SALES.Campaign CAM ON CAM.ID = OM.AppliedCampaignID
	LEFT JOIN LK.CargoCompany AS CC ON OM.CargoCompanyID = CC.ID
	LEFT JOIN LK.Store AS S ON S.ID = OM.StoreID