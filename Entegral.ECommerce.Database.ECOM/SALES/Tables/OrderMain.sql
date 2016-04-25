CREATE TABLE [SALES].[OrderMain] (
    [ID]                                    INT              IDENTITY (1, 1) NOT NULL,
    [StoreID]                               INT              NOT NULL,
    [LanguageID]                            INT              CONSTRAINT [DF_OrderMain_LanguageID] DEFAULT ((0)) NOT NULL,
    [CustomerID]                            INT              NULL,
    [CustomerName]                          NVARCHAR (500)   NULL,
    [CustomerEmail]                         NVARCHAR (255)   NULL,
    [CustomerPhone]                         VARCHAR (50)     NULL,
    [AppliedCampaignID]                     INT              NULL,
    [CartGUID]                              UNIQUEIDENTIFIER NOT NULL,
    [CartTrackingNumber]                    NVARCHAR (50)    NULL,
    [OrderCode]                             AS               (CONVERT([nvarchar](max),(('AYM-'+((CONVERT([nvarchar](max),datepart(year,[CreateTime]),(0))+right('00'+CONVERT([nvarchar](max),datepart(month,[CreateTime]),(0)),(2)))+right('00'+CONVERT([nvarchar](max),datepart(day,[CreateTime]),(0)),(2))))+'-')+right('000000'+CONVERT([nvarchar](max),[ID],(0)),(6)),(0))),
    [OrderNote]                             NVARCHAR (1000)  NULL,
    [GiftNote]                              NVARCHAR (1000)  NULL,
    [PaymentMethodCode]                     VARCHAR (30)     NOT NULL,
    [OrderStatusCode]                       NVARCHAR (255)   NOT NULL,
    [CouponCode]                            NVARCHAR (50)    NULL,
    [TotalAmount]                           MONEY            NOT NULL,
    [TotalDiscount]                         MONEY            NOT NULL,
    [TotalVAT]                              MONEY            NOT NULL,
    [ShipmentTotal]                         MONEY            CONSTRAINT [DF_OrderMain_ShipmentTotal] DEFAULT ((0)) NOT NULL,
    [TotalPaymentMethodFee]                 MONEY            CONSTRAINT [DF_OrderMain_TotalPaymentMethodFee] DEFAULT ((0)) NOT NULL,
    [CustomerIP]                            NVARCHAR (50)    NOT NULL,
    [IsPickup]                              BIT              CONSTRAINT [DF_OrderMain_IsPickup] DEFAULT ((0)) NOT NULL,
    [OACIsCreatePackage]                    BIT              CONSTRAINT [DF_OrderMain_IsCreatePackage] DEFAULT ((0)) NOT NULL,
    [OACUpdateType]                         INT              CONSTRAINT [DF_OrderMain_OACIsUpdate] DEFAULT ((0)) NOT NULL,
    [OACExtensionOfStay]                    INT              NULL,
    [OACExtensionOfStayDate]                DATETIME         NULL,
    [StorePickupCode]                       INT              NULL,
    [CargoCompanyID]                        INT              NULL,
    [PickupLocationID]                      INT              NULL,
    [ReceiptNumber]                         VARCHAR (30)     NULL,
    [ShippingName]                          NVARCHAR (255)   NULL,
    [ShippingEmail]                         NVARCHAR (255)   NULL,
    [ShippingPhone]                         VARCHAR (15)     NULL,
    [ShippingCountry]                       NVARCHAR (50)    NULL,
    [ShippingCountryCode]                   NVARCHAR (10)    NULL,
    [ShippingCity]                          NVARCHAR (50)    NULL,
    [ShippingCityCode]                      NVARCHAR (10)    NULL,
    [ShippingDistrict]                      NVARCHAR (50)    NULL,
    [ShippingDistrictCode]                  NVARCHAR (10)    NULL,
    [ShippingTownCode]                      NVARCHAR (10)    NULL,
    [ShippingTown]                          NVARCHAR (50)    NULL,
    [ShippingAddress]                       NVARCHAR (255)   NULL,
    [BillingName]                           NVARCHAR (255)   NOT NULL,
    [BillingTaxNo]                          NVARCHAR (15)    NULL,
    [BillingTaxOffice]                      NVARCHAR (100)   NULL,
    [BillingCitizenID]                      NVARCHAR (15)    NULL,
    [BillingPhone]                          VARCHAR (15)     NOT NULL,
    [BillingCountry]                        NVARCHAR (50)    NOT NULL,
    [BillingCountryCode]                    NVARCHAR (10)    NULL,
    [BillingCity]                           NVARCHAR (50)    NOT NULL,
    [BillingCityCode]                       NVARCHAR (10)    NULL,
    [BillingDistrict]                       NVARCHAR (50)    NOT NULL,
    [BillingDistrictCode]                   NVARCHAR (10)    NULL,
    [BillingAddress]                        NVARCHAR (255)   NOT NULL,
    [IsUseShippingInfoAsBillingInfo]        BIT              NOT NULL,
    [IsPlacedSuccessfully]                  BIT              CONSTRAINT [DF_OrderMain_IsCreatedSuccessfully] DEFAULT ((0)) NOT NULL,
    [IsTransferredToExternalSystem]         BIT              CONSTRAINT [DF_OrderMain_IsTransferredToExternalSystem] DEFAULT ((0)) NOT NULL,
    [IsUpdated]                             BIT              CONSTRAINT [DF_OrderMain_IsUpdated] DEFAULT ((0)) NOT NULL,
    [ExternalSystemTransferTimeAsUpdate]    DATETIME         NULL,
    [IsStartedSupply]                       BIT              CONSTRAINT [DF_OrderMain_IsStartedSupply] DEFAULT ((0)) NOT NULL,
    [EarnedCouponCode]                      NVARCHAR (50)    NULL,
    [ExternalSystemTransferTime]            DATETIME         NULL,
    [CustomerExternalSystemCode]            VARCHAR (20)     NULL,
    [Ref1]                                  NVARCHAR (50)    NULL,
    [Ref2]                                  NVARCHAR (50)    NULL,
    [Ref3]                                  NVARCHAR (50)    NULL,
    [LoyaltyAmount]                         MONEY            CONSTRAINT [DF_OrderMain_LoyaltyAmount] DEFAULT ((0)) NOT NULL,
    [LoyaltyCardNumber]                     NVARCHAR (20)    NULL,
    [LoyaltyKey]                            NVARCHAR (10)    NULL,
    [LoyaltyPin]                            NVARCHAR (10)    NULL,
    [LoyaltyPhoneNumber]                    NVARCHAR (10)    NULL,
    [BonusAmount]                           MONEY            CONSTRAINT [DF_OrderMain_BonusAmount] DEFAULT ((0)) NOT NULL,
    [BonusKey]                              NVARCHAR (20)    NULL,
    [IsCheckoutSuccessfullyFromLoyaltyCard] BIT              NULL,
    [IsOldSystemOrder]                      BIT              CONSTRAINT [DF_OrderMain_IsOldSystemOrder] DEFAULT ((0)) NOT NULL,
    [IsTestOrder]                           BIT              CONSTRAINT [DF_OrderMain_IsTestOrder] DEFAULT ((0)) NOT NULL,
    [SaleOrigin]                            CHAR (1)         CONSTRAINT [DF_OrderMain_SaleOrigin] DEFAULT ('W') NOT NULL,
    [FraudScore]                            DECIMAL (5, 2)   CONSTRAINT [DF_OrderMain_FraudScore] DEFAULT ((0)) NOT NULL,
    [IsFraudScoreCalculated]                BIT              CONSTRAINT [DF_OrderMain_IsFraudScoreCalculated] DEFAULT ((0)) NOT NULL,
    [IsGuestOrder]                          BIT              CONSTRAINT [DF_OrderMain_IsGuestOrder] DEFAULT ((0)) NOT NULL,
    [IsInvoiceSendWithOrder]                BIT              CONSTRAINT [DF_OrderMain_IsInvoiceSendWithOrder] DEFAULT ((1)) NOT NULL,
    [IsFraudOrder]                          BIT              CONSTRAINT [DF_OrderMain_IsFraudOrder] DEFAULT ((0)) NOT NULL,
    [IsSameDayDelivery]                     BIT              CONSTRAINT [DF_OrderMain_IsSameDayDelivery] DEFAULT ((0)) NOT NULL,
    [GuestAccountActivationCode]            UNIQUEIDENTIFIER NULL,
    [CreateUserID]                          INT              NOT NULL,
    [CreateTime]                            DATETIME         CONSTRAINT [DF_Order_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]                          INT              NOT NULL,
    [UpdateTime]                            DATETIME         CONSTRAINT [DF_Order_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    [CancellationToken]                     UNIQUEIDENTIFIER CONSTRAINT [DF__OrderMain__Cance__1E105D02] DEFAULT (newid()) NOT NULL,
    [SellerStoreID]                         NVARCHAR (30)    CONSTRAINT [DF__OrderMain__Selle__20A2B0EA] DEFAULT (NULL) NULL,
    [SellerID]                              NVARCHAR (30)    CONSTRAINT [DF__OrderMain__Selle__2196D523] DEFAULT (NULL) NULL,
    [PlannedPickupPersonName]               NVARCHAR (70)    NULL,
    [PlannedPickupPersonMobile]             NVARCHAR (20)    NULL,
    [PlannedPickupPersonEmail]              NCHAR (50)       NULL,
    CONSTRAINT [PK_OrderMain_ID] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Order_OrderStatusCode] FOREIGN KEY ([OrderStatusCode]) REFERENCES [LK].[StatusCode] ([Code]),
    CONSTRAINT [FK_Order_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID]),
    CONSTRAINT [FK_OrderMain_Campaign] FOREIGN KEY ([AppliedCampaignID]) REFERENCES [SALES].[Campaign] ([ID]),
    CONSTRAINT [FK_OrderMain_CargoCompany] FOREIGN KEY ([CargoCompanyID]) REFERENCES [LK].[CargoCompany] ([ID]),
    CONSTRAINT [FK_OrderMain_PickupLocation] FOREIGN KEY ([PickupLocationID]) REFERENCES [LK].[PickupLocation] ([ID])
);































































































GO

CREATE NONCLUSTERED INDEX [DF_OrderMain_CustomerID]
    ON [SALES].[OrderMain]([CustomerID] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_OrderMain_FraudScore]
    ON [SALES].[OrderMain]([FraudScore] ASC, [IsOldSystemOrder] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_OrderMain_IsPlacedSuccessfully]
    ON [SALES].[OrderMain]([IsPlacedSuccessfully] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_OrderMain_IsPlacedSuccessfully_IsStartedSupply]
    ON [SALES].[OrderMain]([IsPlacedSuccessfully] ASC, [IsStartedSupply] ASC)
    INCLUDE([ID], [TotalAmount], [TotalVAT], [CreateTime]);
GO

CREATE NONCLUSTERED INDEX [IX_OrderMain_IsPlacedSuccessfully_IsStartedSupply_IsOldSystemOrder_OrderStatusCode]
    ON [SALES].[OrderMain]([IsPlacedSuccessfully] ASC, [IsStartedSupply] ASC, [IsOldSystemOrder] ASC, [OrderStatusCode] ASC)
    INCLUDE([ID]);
GO

CREATE NONCLUSTERED INDEX [IX_OrderMain_IsPlacedSuccessfully_IsStartedSupply_IsOldSystemOrder_OrderStatusCode_CreateTime]
    ON [SALES].[OrderMain]([IsPlacedSuccessfully] ASC, [IsStartedSupply] ASC, [IsOldSystemOrder] ASC, [OrderStatusCode] ASC)
    INCLUDE([ID], [CreateTime]);
GO

CREATE NONCLUSTERED INDEX [IX_OrderMain_Ref1]
    ON [SALES].[OrderMain]([Ref1] ASC)
    INCLUDE([ID]);
GO

CREATE NONCLUSTERED INDEX [IX_OrderMain_StatusCode]
    ON [SALES].[OrderMain]([OrderStatusCode] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_OrderMain_StoreID]
    ON [SALES].[OrderMain]([StoreID] ASC);
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_OrderMain_CancellationToken]
    ON [SALES].[OrderMain]([CancellationToken] ASC);

