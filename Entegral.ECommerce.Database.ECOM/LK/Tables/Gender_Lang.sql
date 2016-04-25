CREATE TABLE [LK].[Gender_Lang] (
    [ID]         INT           NOT NULL,
    [LanguageID] INT           NOT NULL,
    [Name]       NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Gender_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_Gender_Lang_Gender] FOREIGN KEY ([ID]) REFERENCES [LK].[Gender] ([ID])
);

