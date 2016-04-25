CREATE TABLE [LK].[Store] (
    [ID]                                   INT            NOT NULL,
    [Code]                                 VARCHAR (5)    NOT NULL,
    [ExternalSystemCode]                   NVARCHAR (50)  NOT NULL,
    [Name]                                 NVARCHAR (50)  NOT NULL,
    [IsActive]                             BIT            NOT NULL,
    [IsVatIncluded]                        BIT            CONSTRAINT [DF_Store_IsVatIncluded] DEFAULT ((1)) NOT NULL,
    [ProductListingPageSize]               INT            NOT NULL,
    [Url]                                  NVARCHAR (100) NOT NULL,
    [HideProductsWithNoStock]              BIT            CONSTRAINT [DF_Store_HideProductsWithNoStock] DEFAULT ((0)) NOT NULL,
    [HideProductsWithNoImage]              BIT            CONSTRAINT [DF_Store_HideProductsWithNoImage] DEFAULT ((0)) NOT NULL,
    [IsInMaintenance]                      BIT            CONSTRAINT [DF_Store_IsInMaintenance] DEFAULT ((0)) NOT NULL,
    [LoyaltyCardMinLimit]                  MONEY          CONSTRAINT [DF_Store_LoyaltyCardMinLimit] DEFAULT ((1)) NOT NULL,
    [LoyaltyCardMaxAmount]                 MONEY          CONSTRAINT [DF_Store_LoyaltyCardMaxAmount] DEFAULT ((2000)) NOT NULL,
    [LoyaltyCardMaxPercent]                DECIMAL (5, 2) NULL,
    [LoyaltyCardDiscountCode]              NVARCHAR (50)  NULL,
    [RedirectToCartFromProductMain]        BIT            CONSTRAINT [DF_Store_RedirectToCartFromProductMain] DEFAULT ((0)) NOT NULL,
    [RedirectToCartFromQuickView]          BIT            CONSTRAINT [DF_Store_RedirectToCartFromQuickView] DEFAULT ((0)) NOT NULL,
    [IsCartGiftCardRestrictionActive]      BIT            CONSTRAINT [DF_Store_IsCartGiftCardRestrictionActive] DEFAULT ((0)) NOT NULL,
    [IsStockOutCampaignActive]             BIT            CONSTRAINT [DF_Store_IsStockOutCampaignActive] DEFAULT ((0)) NOT NULL,
    [IsBinNumberControlActive]             BIT            CONSTRAINT [DF_Store_IsBinNumberControlActive] DEFAULT ((0)) NOT NULL,
    [IsDiscountRateDisplayed]              BIT            CONSTRAINT [DF_Store_IsDiscountRateDisplayed] DEFAULT ((1)) NOT NULL,
    [IsMultipleCampaignApplyOnCart]        BIT            CONSTRAINT [DF_Store_IsMultipleCampaignApplyOnCart] DEFAULT ((0)) NOT NULL,
    [IsReceiveCampaignMailActive]          BIT            CONSTRAINT [DF_Store_IsReceiveCampaignMailActive] DEFAULT ((1)) NOT NULL,
    [IsAdditionalFeeCanbeChargedFromBonus] BIT            CONSTRAINT [DF__Store__IsAdditio__52D92AFC] DEFAULT ((0)) NOT NULL,
    [ProductCache]                         NVARCHAR (50)  NULL,
    [SearchEngine]                         NVARCHAR (50)  NULL,
    [AllowGuestCheckout]                   BIT            CONSTRAINT [DF_Store_AllowGuestCheckout] DEFAULT ((0)) NOT NULL,
    [GuestCustomerID]                      INT            NULL,
    [ProductCacheProvider]                 NVARCHAR (50)  NULL,
    [SearchEngineProvider]                 NVARCHAR (50)  NULL,
    [ProductListingProvider]               NVARCHAR (50)  NULL,
    [ThreeDSecureLimit]                    INT            NULL,
    [ThreeDSecureLimitActive]              BIT            NULL,
    [InvoiceLength]                        INT            CONSTRAINT [DF_Store_InvoiceLength] DEFAULT ((20)) NOT NULL,
    [InvoiceDocNumberPrefixes]             NVARCHAR (30)  CONSTRAINT [DF_Store_InvoiceNumberPrefixes] DEFAULT (N'INV,RDF') NOT NULL,
    [EInvoiceDocNumberPrefixes]            NVARCHAR (30)  CONSTRAINT [DF_Store_EInvoiceNumberPrefixes] DEFAULT (N'INV,RDF') NOT NULL,
    [InvoicePosNumber]                     NVARCHAR (20)  CONSTRAINT [DF_Store_InvoiceIBMPosNumber] DEFAULT ((65326)) NOT NULL,
    [InvoiceStorePrefix]                   NVARCHAR (10)  CONSTRAINT [DF_Store_InvoiceStorePrefix] DEFAULT ((1)) NOT NULL,
    [InvoiceUserID]                        NVARCHAR (15)  CONSTRAINT [DF_Store_InvoiceUserID] DEFAULT ((0)) NOT NULL,
    [ValidityDayCount]                     INT            CONSTRAINT [DF_Store_ValidityDayCount] DEFAULT ((0)) NOT NULL,
    [MainCssURL]                           NVARCHAR (255) NULL,
    [StockGroupCode]                       NVARCHAR (30)  NOT NULL,
    [IsUserActivationAvailable]            BIT            NOT NULL,
    CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED ([ID] ASC)
);












































































GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Store]
    ON [LK].[Store]([Code] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Store_ExternalSystemCode]
    ON [LK].[Store]([ExternalSystemCode] ASC);

