CREATE TABLE [LK].[Language] (
    [ID]                 INT           NOT NULL,
    [Name]               NVARCHAR (50) NOT NULL,
    [ExternalSystemCode] VARCHAR (5)   NULL,
    CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED ([ID] ASC)
);








GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Language]
    ON [LK].[Language]([ExternalSystemCode] ASC);

