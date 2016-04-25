CREATE TABLE [CRM].[NewsLetterSubscription] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [Email]        NVARCHAR (255) NOT NULL,
    [Name]         NVARCHAR (50)  NULL,
    [Surname]      NVARCHAR (50)  NULL,
    [GenderID]     INT            NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_NewsLetterSubscription_CreateTime] DEFAULT (getdate()) NOT NULL,
    [CampaignCode] NVARCHAR (50)  NULL,
    [IsActive]     BIT            CONSTRAINT [DF_NewsLetterSubscription_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_NewsLetterSubscription] PRIMARY KEY CLUSTERED ([ID] ASC)
);





