CREATE TABLE [LK].[StatusCode_Lang] (
    [ID]                     INT            NOT NULL,
    [LanguageID]             INT            NOT NULL,
    [UserVisibleDisplayName] NVARCHAR (255) NOT NULL,
    [IsActive]               BIT            CONSTRAINT [DF_StatusCode_Lang_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]           INT            NOT NULL,
    [CreateTime]             DATETIME       CONSTRAINT [DF_StatusCode_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]           INT            NOT NULL,
    [UpdateTime]             DATETIME       CONSTRAINT [DF_StatusCode_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_StatusCode_Lang_1] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_StatusCode_Lang_StatusCode] FOREIGN KEY ([ID]) REFERENCES [LK].[StatusCode] ([ID])
);



