CREATE TABLE [SALES].[CampaignAction] (
    [ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [CampaignID]           INT            NOT NULL,
    [Code]                 NVARCHAR (100) NOT NULL,
    [DestinationPriceType] NVARCHAR (100) NULL,
    [ValueList]            NVARCHAR (MAX) NULL,
    [MaxValue]             NVARCHAR (50)  NULL,
    [IsActive]             BIT            CONSTRAINT [DF_CampaignAction_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]         INT            NOT NULL,
    [CreateTime]           DATETIME       CONSTRAINT [DF_CampaignAction_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]         INT            NOT NULL,
    [UpdateTime]           DATETIME       CONSTRAINT [DF_CampaignAction_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_CampaignAction] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_CampaignAction_Campaign] FOREIGN KEY ([CampaignID]) REFERENCES [SALES].[Campaign] ([ID])
);









