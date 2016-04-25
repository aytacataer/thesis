CREATE TABLE [LK].[EducationLevel_Lang] (
    [ID]           INT            NOT NULL,
    [LanguageID]   INT            NOT NULL,
    [Name]         NVARCHAR (200) NOT NULL,
    [IsActive]     BIT            CONSTRAINT [DF_EducationLevel_Lang_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_EducationLevel_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       CONSTRAINT [DF_EducationLevel_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_EducationLevel_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_EducationLevel_Lang_EducationLevel] FOREIGN KEY ([ID]) REFERENCES [LK].[EducationLevel] ([ID])
);

