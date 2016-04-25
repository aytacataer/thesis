CREATE TABLE [LK].[SEOSetting_Lang] (
    [ID]              INT            NOT NULL,
    [LanguageID]      INT            NOT NULL,
    [SiteTitle]       NVARCHAR (500) NOT NULL,
    [SiteKeywords]    NVARCHAR (500) NOT NULL,
    [SiteDescription] NVARCHAR (500) NOT NULL,
    [IsActive]        BIT            CONSTRAINT [DF_SEOSetting_Lang_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]    INT            NOT NULL,
    [CreateTime]      DATETIME       CONSTRAINT [DF_SEOSetting_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]    INT            NOT NULL,
    [UpdateTime]      DATETIME       CONSTRAINT [DF_SEOSetting_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_SEOSetting_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_SEOSetting_Lang_Language] FOREIGN KEY ([LanguageID]) REFERENCES [LK].[Language] ([ID]),
    CONSTRAINT [FK_SEOSetting_Lang_SEOSetting] FOREIGN KEY ([ID]) REFERENCES [LK].[SEOSetting] ([ID])
);





