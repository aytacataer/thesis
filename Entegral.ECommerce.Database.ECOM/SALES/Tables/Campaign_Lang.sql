CREATE TABLE [SALES].[Campaign_Lang] (
    [ID]                          INT            NOT NULL,
    [LanguageID]                  INT            NOT NULL,
    [Description]                 NVARCHAR (255) NOT NULL,
    [CustomerInformationNote]     NVARCHAR (500) NULL,
    [NoMatchWarningNote]          NVARCHAR (500) NULL,
    [PaymentConditionWarningNote] NVARCHAR (500) NULL,
    [CreateUserID]                INT            NOT NULL,
    [CreateTime]                  DATETIME       CONSTRAINT [DF_Campaign_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]                INT            NOT NULL,
    [UpdateTime]                  DATETIME       CONSTRAINT [DF_Campaign_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    [IsActive]                    BIT            CONSTRAINT [DF_Campaign_Lang_IsActive] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Campaign_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC)
);

