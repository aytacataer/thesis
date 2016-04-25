CREATE TABLE [ZZ].[OrderMain_History] (
    [HID]                                   INT              IDENTITY (1, 1) NOT NULL,
    [Action]                                INT              NOT NULL,
    [ActionTime]                            DATETIME         NOT NULL,
    [ActionUserID]                          INT              NOT NULL,
    [ID]                                    INT              NOT NULL,
    [StoreID]                               INT              NOT NULL,
    [LanguageID]                            INT              NOT NULL,
    [CustomerID]                            INT              NULL,
    [CustomerName]                          NVARCHAR (500)   NULL,
    [CustomerEmail]                         NVARCHAR (255)   NULL,
    [CustomerPhone]                         VARCHAR (50)     NULL,
    [AppliedCampaignID]                     INT              NULL,
    [CartGUID]                              UNIQUEIDENTIFIER NOT NULL,
    [OrderCode]                             AS               (CONVERT([nvarchar](max),(('BEY-'+((CONVERT([nvarchar](max),datepart(year,[CreateTime]),(0))+right('00'+CONVERT([nvarchar](max),datepart(month,[CreateTime]),(0)),(2)))+right('00'+CONVERT([nvarchar](max),datepart(day,[CreateTime]),(0)),(2))))+'-')+right('00000'+CONVERT([nvarchar](max),[ID],(0)),(5)),(0))),
    [OrderNote]                             NVARCHAR (1000)  NULL,
    [GiftNote]                              NVARCHAR (1000)  NULL,
    [PaymentMethodCode]                     VARCHAR (30)     NOT NULL,
    [OrderStatusCode]                       NVARCHAR (255)   NOT NULL,
    [CouponCode]                            NVARCHAR (50)    NULL,
    [TotalAmount]                           MONEY            NOT NULL,
    [TotalDiscount]                         MONEY            NOT NULL,
    [TotalVAT]                              MONEY            NOT NULL,
    [ShipmentTotal]                         MONEY            CONSTRAINT [DF_OrderMain_History_ShipmentTotal] DEFAULT ((0)) NOT NULL,
    [TotalPaymentMethodFee]                 MONEY            CONSTRAINT [DF_OrderMain_History_TotalPaymentMethodFee] DEFAULT ((0)) NOT NULL,
    [CustomerIP]                            NVARCHAR (50)    NOT NULL,
    [IsPickup]                              BIT              CONSTRAINT [DF_OrderMain_History_IsPickup] DEFAULT ((0)) NOT NULL,
    [CargoCompanyID]                        INT              NOT NULL,
    [PickupLocationID]                      INT              NULL,
    [ShippingName]                          NVARCHAR (255)   NULL,
    [ShippingEmail]                         NVARCHAR (255)   NULL,
    [ShippingPhone]                         VARCHAR (15)     NULL,
    [ShippingCountry]                       NVARCHAR (50)    NULL,
    [ShippingCity]                          NVARCHAR (50)    NULL,
    [ShippingDistrict]                      NVARCHAR (50)    NULL,
    [ShippingAddress]                       NVARCHAR (255)   NULL,
    [BillingName]                           NVARCHAR (255)   NOT NULL,
    [BillingTaxNo]                          NVARCHAR (15)    NULL,
    [BillingTaxOffice]                      NVARCHAR (100)   NULL,
    [BillingCitizenID]                      NVARCHAR (15)    NULL,
    [BillingPhone]                          VARCHAR (15)     NOT NULL,
    [BillingCountry]                        NVARCHAR (50)    NOT NULL,
    [BillingCity]                           NVARCHAR (50)    NOT NULL,
    [BillingDistrict]                       NVARCHAR (50)    NOT NULL,
    [BillingAddress]                        NVARCHAR (255)   NOT NULL,
    [IsPlacedSuccessfully]                  BIT              CONSTRAINT [DF_OrderMain_History_IsPlacedSuccessfully] DEFAULT ((0)) NOT NULL,
    [IsTransferredToExternalSystem]         BIT              CONSTRAINT [DF_OrderMain_History_IsTransferredToExternalSystem] DEFAULT ((0)) NOT NULL,
    [IsStartedSupply]                       BIT              CONSTRAINT [DF_OrderMain_History_IsStartedSupply] DEFAULT ((0)) NOT NULL,
    [EarnedCouponCode]                      NVARCHAR (50)    NULL,
    [ExternalSystemTransferTime]            DATETIME         NULL,
    [CustomerExternalSystemCode]            VARCHAR (20)     NULL,
    [Ref1]                                  NVARCHAR (50)    NULL,
    [Ref2]                                  NVARCHAR (50)    NULL,
    [Ref3]                                  NVARCHAR (50)    NULL,
    [LoyaltyAmount]                         MONEY            CONSTRAINT [DF_OrderMain_History_LoyaltyAmount] DEFAULT ((0)) NOT NULL,
    [LoyaltyCardNumber]                     NVARCHAR (20)    NULL,
    [LoyaltyKey]                            NVARCHAR (10)    NULL,
    [LoyaltyPin]                            NVARCHAR (10)    NULL,
    [LoyaltyPhoneNumber]                    NVARCHAR (10)    NULL,
    [IsCheckoutSuccessfullyFromLoyaltyCard] BIT              NULL,
    [IsOldSystemOrder]                      BIT              CONSTRAINT [DF_OrderMain_History_IsOldSystemOrder] DEFAULT ((0)) NOT NULL,
    [IsTestOrder]                           BIT              CONSTRAINT [DF_OrderMain_History_IsTestOrder] DEFAULT ((0)) NOT NULL,
    [SaleOrigin]                            CHAR (1)         CONSTRAINT [DF_OrderMain_History_SaleOrigin] DEFAULT ('W') NOT NULL,
    [FraudScore]                            DECIMAL (5, 2)   CONSTRAINT [DF_OrderMain_History_FraudScore] DEFAULT ((0)) NOT NULL,
    [IsFraudScoreCalculated]                BIT              CONSTRAINT [DF_OrderMain_History_IsFraudScoreCalculated] DEFAULT ((0)) NOT NULL,
    [IsGuestOrder]                          BIT              CONSTRAINT [DF_OrderMain_History_IsGuestOrder] DEFAULT ((0)) NOT NULL,
    [IsInvoiceSendWithOrder]                BIT              CONSTRAINT [DF_OrderMain_History_IsInvoiceSendWithOrder] DEFAULT ((1)) NOT NULL,
    [IsFraudOrder]                          BIT              CONSTRAINT [DF_OrderMain_History_IsFraudOrder] DEFAULT ((0)) NOT NULL,
    [IsSameDayDelivery]                     BIT              CONSTRAINT [DF_OrderMain_History_IsSameDayDelivery] DEFAULT ((0)) NOT NULL,
    [GuestAccountActivationCode]            UNIQUEIDENTIFIER NULL,
    [CreateUserID]                          INT              NOT NULL,
    [CreateTime]                            DATETIME         CONSTRAINT [DF_OrderMain_History_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]                          INT              NOT NULL,
    [UpdateTime]                            DATETIME         CONSTRAINT [DF_OrderMain_History_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_OrderMain_History] PRIMARY KEY CLUSTERED ([HID] ASC) WITH (FILLFACTOR = 90)
);





















GO
