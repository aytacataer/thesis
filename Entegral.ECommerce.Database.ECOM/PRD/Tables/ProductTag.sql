CREATE TABLE [PRD].[ProductTag] (
    [ID]        INT            IDENTITY (1, 1) NOT NULL,
    [ProductID] INT            NOT NULL,
    [Tag]       NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_ProductTag] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProductTag_Product] FOREIGN KEY ([ProductID]) REFERENCES [PRD].[Product] ([ID])
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProductTag_Tag]
    ON [PRD].[ProductTag]([ProductID] ASC, [Tag] ASC);

