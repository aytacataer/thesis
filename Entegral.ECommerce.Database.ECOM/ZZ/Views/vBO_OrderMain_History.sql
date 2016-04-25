﻿







CREATE VIEW [ZZ].[vBO_OrderMain_History]
AS
SELECT
	0 As HID,
	-1 As Action,
	OM.UpdateTime As ActionTime,
	OM.UpdateUserID AS ActionUserID,
	OM.AppliedCampaignID,
	OM.BillingAddress,
	OM.BillingCitizenID,
	OM.BillingCity,
	OM.BillingCountry,
	OM.BillingDistrict,
	OM.BillingName,
	OM.BillingPhone,
	OM.BillingTaxNo,
	OM.BillingTaxOffice,
	OM.CargoCompanyID,
	OM.CartGUID,
	OM.CouponCode,
	OM.CreateTime,
	OM.CreateUserID,
	OM.CustomerEmail,
	OM.CustomerExternalSystemCode,
	OM.CustomerID,
	OM.CustomerIP,
	OM.CustomerName,
	OM.CustomerPhone,
	OM.GiftNote,
	OM.ID,
	OM.IsPlacedSuccessfully,
	OM.IsStartedSupply,
	OM.OrderCode,
	OM.OrderNote,
	OM.OrderStatusCode,
	OM.PaymentMethodCode,
	OM.PickupLocationID,
	OM.Ref1,
	OM.Ref2,
	OM.Ref3,
	OM.ShipmentTotal,
	OM.ShippingAddress,
	OM.ShippingCity,
	OM.ShippingCountry,
	OM.ShippingDistrict,
	OM.ShippingEmail,
	OM.ShippingName,
	OM.ShippingPhone,
	OM.StoreID,
	OM.TotalAmount,
	OM.TotalDiscount,
	OM.TotalVAT,
	OM.TotalPaymentMethodFee,
	S.ExternalSystemCode AS StoreExternalSystemCode,
	OM.UpdateTime,
	SC.DisplayName OrderStatus,
	OM.IsTransferredToExternalSystem,
	OM.ExternalSystemTransferTime,
	OM.LanguageID,
	OM.EarnedCouponCode,
	OM.LoyaltyAmount,
	OM.LoyaltyCardNumber,
	OM.LoyaltyKey,
	OM.LoyaltyPin,
	OM.LoyaltyPhoneNumber,
	OM.IsCheckoutSuccessfullyFromLoyaltyCard,
	OM.IsOldSystemOrder,
    OM.IsTestOrder,
    OM.SaleOrigin,
    OM.FraudScore,
    OM.IsFraudScoreCalculated,
    OM.IsGuestOrder,
    OM.IsInvoiceSendWithOrder,
    OM.IsFraudOrder,
    OM.IsSameDayDelivery,
    OM.GuestAccountActivationCode
FROM         SALES.OrderMain OM 
LEFT JOIN LK.StatusCode SC ON SC.Code = OM.OrderStatusCode 
LEFT JOIN LK.Store S ON S.ID = OM.StoreID


Union


SELECT  
	OMH.HID,
	OMH.[Action],   
	OMH.ActionTime,
	OMH.UpdateUserID AS ActionUserID,
	OMH.AppliedCampaignID,
	OMH.BillingAddress,
	OMH.BillingCitizenID,
	OMH.BillingCity,
	OMH.BillingCountry,
	OMH.BillingDistrict,
	OMH.BillingName,
	OMH.BillingPhone,
	OMH.BillingTaxNo,
	OMH.BillingTaxOffice,
	OMH.CargoCompanyID,
	OMH.CartGUID,
	OMH.CouponCode,
	OMH.CreateTime,
	OMH.CreateUserID,
	OMH.CustomerEmail,
	OMH.CustomerExternalSystemCode,
	OMH.CustomerID,
	OMH.CustomerIP,
	OMH.CustomerName,
	OMH.CustomerPhone,
	OMH.GiftNote,
	OMH.ID,
	OMH.IsPlacedSuccessfully,
	OMH.IsStartedSupply,
	OMH.OrderCode,
	OMH.OrderNote,
	OMH.OrderStatusCode,
	OMH.PaymentMethodCode,
	OMH.PickupLocationID,
	OMH.Ref1,
	OMH.Ref2,
	OMH.Ref3,
	OMH.ShipmentTotal,
	OMH.ShippingAddress,
	OMH.ShippingCity,
	OMH.ShippingCountry,
	OMH.ShippingDistrict,
	OMH.ShippingEmail,
	OMH.ShippingName,
	OMH.ShippingPhone,
	OMH.StoreID,
	OMH.TotalAmount,
	OMH.TotalDiscount,
	OMH.TotalVAT,
	OMH.TotalPaymentMethodFee,
	S.ExternalSystemCode AS StoreExternalSystemCode,
	OMH.UpdateTime,
	SC.DisplayName OrderStatus,
	OMH.IsTransferredToExternalSystem,
	OMH.ExternalSystemTransferTime,
	OMH.LanguageID,
	OMH.EarnedCouponCode,
	OMH.LoyaltyAmount,
	OMH.LoyaltyCardNumber,
	OMH.LoyaltyKey,
	OMH.LoyaltyPin,
	OMH.LoyaltyPhoneNumber,
	OMH.IsCheckoutSuccessfullyFromLoyaltyCard,
	OMH.IsOldSystemOrder,
    OMH.IsTestOrder,
    OMH.SaleOrigin,
    OMH.FraudScore,
    OMH.IsFraudScoreCalculated,
    OMH.IsGuestOrder,
    OMH.IsInvoiceSendWithOrder,
    OMH.IsFraudOrder,
    OMH.IsSameDayDelivery,
    OMH.GuestAccountActivationCode
FROM         ZZ.OrderMain_History OMH

LEFT JOIN LK.StatusCode SC ON SC.Code = OMH.OrderStatusCode
LEFT JOIN LK.Store S ON S.ID = OMH.StoreID
GO
