CREATE TABLE [LK].[InvitationConfiguration] (
    [ID]                        INT            NOT NULL,
    [InvitorCampaignID]         INT            NULL,
    [InvitedCampaignID]         INT            NULL,
    [CreateCouponAfterRegister] BIT            CONSTRAINT [DF_InvitationConfiguration_CreateCouponAfterRegister] DEFAULT ((1)) NOT NULL,
    [CreateCouponAfterShopping] BIT            CONSTRAINT [DF_InvitationConfiguration_CreateCouponAfterShopping] DEFAULT ((0)) NOT NULL,
    [ApplyAtFirstPurchasement]  BIT            CONSTRAINT [DF_InvitationConfiguration_ApplyAfterFirstPurchasement] DEFAULT ((0)) NOT NULL,
    [CouponValidityDayCount]    INT            NULL,
    [InvitationSlogan]          NVARCHAR (MAX) NULL,
    [InvitationCondition]       NVARCHAR (MAX) NULL,
    [InvitationMailText]        NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_InvitationConfiguration] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_InvitationConfiguration_Store] FOREIGN KEY ([ID]) REFERENCES [LK].[Store] ([ID])
);









