CREATE TABLE [LK].[MessageTemplate_Lang] (
    [ID]             INT            NOT NULL,
    [LanguageID]     INT            NOT NULL,
    [Subject]        NVARCHAR (MAX) NOT NULL,
    [MessageContent] NVARCHAR (MAX) NOT NULL,
    [IsActive]       BIT            NOT NULL,
    CONSTRAINT [PK_MessageTemplate_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC)
);

