CREATE TABLE [SALES].[Cart] (
    [GUID]                  UNIQUEIDENTIFIER NOT NULL,
    [TrackingNumber]        NVARCHAR (50)    NULL,
    [CustomerID]            INT              NULL,
    [StoreID]               INT              NOT NULL,
    [CouponCode]            NVARCHAR (50)    CONSTRAINT [DF_Cart_CouponCode] DEFAULT ((0)) NULL,
    [Status]                NVARCHAR (30)    NOT NULL,
    [StatusNote]            NVARCHAR (500)   NULL,
    [BonusAmount]           MONEY            CONSTRAINT [DF_Cart_BonusScore] DEFAULT ((0)) NOT NULL,
    [BonusKey]              NVARCHAR (20)    NULL,
    [LastPaymentActionTime] DATETIME         NULL,
    [LastItemChangeTime]    DATETIME         NULL,
    [OpenCartMailSentTime]  DATETIME         NULL,
    [LastViewedTime]        DATETIME         CONSTRAINT [DF_Cart_LastViewedTime] DEFAULT (getutcdate()) NOT NULL,
    [SellerID]              NVARCHAR (30)    NULL,
    [SellerStoreID]         NVARCHAR (30)    NULL,
    [UpdateTime]            DATETIME         CONSTRAINT [DF_Cart_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]          INT              NOT NULL,
    CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED ([GUID] ASC),
    CONSTRAINT [FK_Cart_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID])
);














GO
CREATE NONCLUSTERED INDEX [IX_Cart_StoreID]
    ON [SALES].[Cart]([StoreID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Cart_Status]
    ON [SALES].[Cart]([Status] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Cart_LastItemChangeTime]
    ON [SALES].[Cart]([LastItemChangeTime] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Cart_Customer]
    ON [SALES].[Cart]([CustomerID] ASC, [Status] ASC);

