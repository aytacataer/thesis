CREATE TABLE [SALES].[Coupon] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [Code]               NVARCHAR (200) NOT NULL,
    [GroupCode]          NVARCHAR (200) NOT NULL,
    [MaxUsePerCustomer]  INT            NOT NULL,
    [MaxUseTotal]        INT            NOT NULL,
    [ValidityStartTime]  DATETIME       NOT NULL,
    [ValidityEndTime]    DATETIME       NOT NULL,
    [IsPersonal]         BIT            CONSTRAINT [DF_Coupon_IsPersonal] DEFAULT ((0)) NOT NULL,
    [IsAvailableOffline] BIT            CONSTRAINT [DF_Coupon_IsAvailableOffline] DEFAULT ((0)) NOT NULL,
    [IsActive]           BIT            CONSTRAINT [DF_Coupon_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]       INT            NOT NULL,
    [CreateTime]         DATETIME       CONSTRAINT [DF_Coupon_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT            NOT NULL,
    [UpdateTime]         DATETIME       CONSTRAINT [DF_Coupon_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);










GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Coupon]
    ON [SALES].[Coupon]([Code] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Coupon_Validity]
    ON [SALES].[Coupon]([Code] ASC, [ValidityStartTime] ASC, [ValidityEndTime] ASC, [MaxUseTotal] ASC, [IsActive] ASC);

