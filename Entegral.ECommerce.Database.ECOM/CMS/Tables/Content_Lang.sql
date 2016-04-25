CREATE TABLE [CMS].[Content_Lang] (
    [ID]              INT            NOT NULL,
    [LanguageID]      INT            NOT NULL,
    [Title]           NVARCHAR (300) NULL,
    [MetaKeywords]    NVARCHAR (500) NULL,
    [MetaDescription] NVARCHAR (500) NULL,
    [IsActive]        BIT            CONSTRAINT [DF_Content_Lang_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]    INT            NOT NULL,
    [CreateTime]      DATETIME       CONSTRAINT [DF_Content_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]    INT            NOT NULL,
    [UpdateTime]      DATETIME       CONSTRAINT [DF_Content_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Content_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC)
);



