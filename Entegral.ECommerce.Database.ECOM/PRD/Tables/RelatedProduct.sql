CREATE TABLE [PRD].[RelatedProduct] (
    [ID]               INT      IDENTITY (1, 1) NOT NULL,
    [RelationType]     CHAR (1) CONSTRAINT [DF_RelatedProduct_RelationType] DEFAULT ('R') NOT NULL,
    [ProductID]        INT      NOT NULL,
    [RelatedProductID] INT      NOT NULL,
    [DisplayOrder]     INT      CONSTRAINT [DF_RelatedProduct_Priority] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_RelatedProduct] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_RelatedProduct_Product] FOREIGN KEY ([ProductID]) REFERENCES [PRD].[Product] ([ID])
);




















GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RelatedProduct]
    ON [PRD].[RelatedProduct]([ProductID] ASC, [RelatedProductID] ASC, [RelationType] ASC);





