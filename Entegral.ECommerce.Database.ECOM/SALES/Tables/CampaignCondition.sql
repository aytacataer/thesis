CREATE TABLE [SALES].[CampaignCondition] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [CampaignID]   INT            NOT NULL,
    [Type]         SMALLINT       NOT NULL,
    [Code]         NVARCHAR (100) NOT NULL,
    [SubCode]      NVARCHAR (50)  NULL,
    [Operator]     NVARCHAR (50)  NOT NULL,
    [ValueList]    NVARCHAR (MAX) NOT NULL,
    [IsActive]     BIT            CONSTRAINT [DF_CampaignCondition_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_CampaignCondition_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       CONSTRAINT [DF_CampaignCondition_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_CampaignCondition] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_CampaignCondition_Campaign] FOREIGN KEY ([CampaignID]) REFERENCES [SALES].[Campaign] ([ID])
);

