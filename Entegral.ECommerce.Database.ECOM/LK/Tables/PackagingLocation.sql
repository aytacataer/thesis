CREATE TABLE [LK].[PackagingLocation] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [ExternalSystemCode] NVARCHAR (50) NOT NULL,
    [Name]               NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_PackagingLocation] PRIMARY KEY CLUSTERED ([ID] ASC)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_PackagingLocation]
    ON [LK].[PackagingLocation]([ExternalSystemCode] ASC);

