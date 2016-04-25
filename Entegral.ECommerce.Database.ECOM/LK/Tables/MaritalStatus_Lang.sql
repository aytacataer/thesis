CREATE TABLE [LK].[MaritalStatus_Lang] (
    [ID]         INT            NOT NULL,
    [LanguageID] INT            NOT NULL,
    [Name]       NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_MaritalStatus_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_MaritalStatus_Lang_MaritalStatus] FOREIGN KEY ([ID]) REFERENCES [LK].[MaritalStatus] ([ID])
);

