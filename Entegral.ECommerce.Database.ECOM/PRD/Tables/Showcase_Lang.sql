CREATE TABLE [PRD].[Showcase_Lang] (
    [ID]           INT            NOT NULL,
    [LanguageID]   INT            NOT NULL,
    [DisplayName]  NVARCHAR (200) NOT NULL,
    [Subtitle]     NVARCHAR (200) NULL,
    [IsActive]     BIT            NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_Showcase_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       CONSTRAINT [DF_Showcase_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Showcase_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_Showcase_Lang_Showcase] FOREIGN KEY ([ID]) REFERENCES [PRD].[Showcase] ([ID])
);

