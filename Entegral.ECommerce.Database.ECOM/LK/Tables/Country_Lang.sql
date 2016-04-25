CREATE TABLE [LK].[Country_Lang] (
    [ID]           INT           NOT NULL,
    [LanguageID]   INT           NOT NULL,
    [Name]         NVARCHAR (50) NOT NULL,
    [IsActive]     BIT           CONSTRAINT [DF_Country_Lang_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID] INT           NOT NULL,
    [CreateTime]   DATETIME      CONSTRAINT [DF_Country_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT           NOT NULL,
    [UpdateTime]   DATETIME      CONSTRAINT [DF_Country_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Country_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_Country_Lang_Country] FOREIGN KEY ([ID]) REFERENCES [LK].[Country] ([ID])
);

