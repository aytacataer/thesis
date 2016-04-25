CREATE TABLE [SALES].[Campaign] (
    [ID]                          INT            IDENTITY (1, 1) NOT NULL,
    [StoreID]                     INT            NOT NULL,
    [ExternalSystemCode]          NVARCHAR (200) NOT NULL,
    [Code]                        NVARCHAR (200) NOT NULL,
    [CouponGroup]                 NVARCHAR (200) NULL,
    [Description]                 NVARCHAR (255) NOT NULL,
    [CustomerInformationNote]     NVARCHAR (500) NULL,
    [NoMatchWarningNote]          NVARCHAR (500) NULL,
    [PaymentConditionWarningNote] NVARCHAR (500) NULL,
    [AfterApplyNote]              NVARCHAR (500) NULL,
    [StartTime]                   DATETIME       NOT NULL,
    [EndTime]                     DATETIME       NOT NULL,
    [IsActiveOnMonday]            BIT            CONSTRAINT [DF_Campaign_IsActiveOnMonday] DEFAULT ((1)) NOT NULL,
    [IsActiveOnTuesday]           BIT            CONSTRAINT [DF_Campaign_IsActiveOnTuesday] DEFAULT ((1)) NOT NULL,
    [IsActiveOnWednesday]         BIT            CONSTRAINT [DF_Campaign_IsActiveOnWednesday] DEFAULT ((1)) NOT NULL,
    [IsActiveOnThursday]          BIT            CONSTRAINT [DF_Campaign_IsActiveOnThursday] DEFAULT ((1)) NOT NULL,
    [IsActiveOnFriday]            BIT            CONSTRAINT [DF_Campaign_IsActiveOnFriday] DEFAULT ((1)) NOT NULL,
    [IsActiveOnSaturday]          BIT            CONSTRAINT [DF_Campaign_IsActiveOnSaturday] DEFAULT ((1)) NOT NULL,
    [IsActiveOnSunday]            BIT            CONSTRAINT [DF_Campaign_IsActiveOnSunday] DEFAULT ((1)) NOT NULL,
    [DailyStartTime]              TIME (7)       NOT NULL,
    [DailyEndTime]                TIME (7)       NOT NULL,
    [Priority]                    INT            NULL,
    [IsBonusCampaign]             BIT            CONSTRAINT [DF_Campaign_IsBonusCampaign] DEFAULT ((0)) NOT NULL,
    [ShowBonusCampaignOnStore]    BIT            CONSTRAINT [DF_Campaign_ShowCampaign] DEFAULT ((1)) NOT NULL,
    [DisplayOrder]                INT            CONSTRAINT [DF_Campaign_DisplayOrder] DEFAULT ((1)) NOT NULL,
    [IsActive]                    BIT            CONSTRAINT [DF_Campaign_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]                INT            NOT NULL,
    [CreateTime]                  DATETIME       CONSTRAINT [DF_Campaign_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]                INT            NOT NULL,
    [UpdateTime]                  DATETIME       CONSTRAINT [DF_Campaign_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Campaign_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID])
);
























GO
CREATE NONCLUSTERED INDEX [IX_Campaign_ExternalSystemCode]
    ON [SALES].[Campaign]([ExternalSystemCode] ASC);



