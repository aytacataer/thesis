CREATE TABLE [LK].[RegisterCouponConfiguration_Lang] (
    [ID]           INT         NOT NULL,
    [LanguageID]   INT         NOT NULL,
    [MailText]     NCHAR (500) NOT NULL,
    [IsActive]     BIT         CONSTRAINT [DF_RegisterCouponConfiguration_Lang_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT         NOT NULL,
    [CreateTime]   DATETIME    CONSTRAINT [DF_RegisterCouponConfiguration_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT         NOT NULL,
    [UpdateTime]   DATETIME    CONSTRAINT [DF_RegisterCouponConfiguration_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_RegisterCouponConfiguration_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_RegisterCouponConfiguration_Lang_Language] FOREIGN KEY ([LanguageID]) REFERENCES [LK].[Language] ([ID]),
    CONSTRAINT [FK_RegisterCouponConfiguration_Lang_RegisterCouponConfiguration] FOREIGN KEY ([ID]) REFERENCES [LK].[RegisterCouponConfiguration] ([ID])
);

