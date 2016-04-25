CREATE TABLE [SALES].[Coupon_Customer] (
    [ID]                INT      IDENTITY (1, 1) NOT NULL,
    [CouponID]          INT      NOT NULL,
    [CustomerID]        INT      NOT NULL,
    [ValidityStartTime] DATETIME NOT NULL,
    [ValidityEndTime]   DATETIME NOT NULL,
    [IsActive]          BIT      CONSTRAINT [DF_Coupon_Customer_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]      INT      NOT NULL,
    [CreateTime]        DATETIME CONSTRAINT [DF_Coupon_Customer_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]      INT      NOT NULL,
    [UpdateTime]        DATETIME CONSTRAINT [DF_Coupon_Customer_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Coupon_Customer] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Coupon_Customer_Coupon] FOREIGN KEY ([CouponID]) REFERENCES [SALES].[Coupon] ([ID]),
    CONSTRAINT [FK_Coupon_Customer_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [CRM].[Customer] ([ID])
);


GO
CREATE NONCLUSTERED INDEX [IX_Coupon_Coupon]
    ON [SALES].[Coupon_Customer]([IsActive] ASC, [CouponID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Coupon_Customer]
    ON [SALES].[Coupon_Customer]([IsActive] ASC, [CustomerID] ASC);

