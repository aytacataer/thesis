CREATE TABLE [LK].[RegisterCouponConfiguration] (
    [ID]                     INT            NOT NULL,
    [StoreID]                INT            NOT NULL,
    [CampaignID]             INT            NOT NULL,
    [CouponValidityDayCount] INT            NOT NULL,
    [MailText]               NVARCHAR (255) NULL,
    [IsActive]               BIT            CONSTRAINT [DF_RegisterCouponConfiguration_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUser]             INT            NOT NULL,
    [CreateTime]             DATETIME       CONSTRAINT [DF_RegisterCouponConfiguration_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUser]             INT            NOT NULL,
    [UpdateTime]             DATETIME       CONSTRAINT [DF_RegisterCouponConfiguration_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_RegisterCouponConfiguration] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_RegisterCouponConfiguration_Campaign] FOREIGN KEY ([CampaignID]) REFERENCES [SALES].[Campaign] ([ID]),
    CONSTRAINT [FK_RegisterCouponConfiguration_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID])
);

