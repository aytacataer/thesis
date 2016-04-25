CREATE TABLE [LK].[Job_Lang] (
    [ID]           INT            NOT NULL,
    [LanguageID]   INT            NOT NULL,
    [Name]         NVARCHAR (200) NOT NULL,
    [IsActive]     BIT            CONSTRAINT [DF_Job_Lang_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_Job_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       CONSTRAINT [DF_Job_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Job_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_Job_Lang_Job] FOREIGN KEY ([ID]) REFERENCES [LK].[Job] ([ID])
);

