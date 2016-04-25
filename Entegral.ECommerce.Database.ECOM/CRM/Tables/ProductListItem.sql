CREATE TABLE [CRM].[ProductListItem] (
    [ID]            INT      IDENTITY (1, 1) NOT NULL,
    [ProductListID] INT      NOT NULL,
    [ProductID]     INT      NOT NULL,
    [VariantID]     INT      NULL,
    [CreateUserID]  INT      NOT NULL,
    [CreateTime]    DATETIME CONSTRAINT [DF_ProductListItem_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_ProductListItem] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProductListItem_Product] FOREIGN KEY ([ProductID]) REFERENCES [PRD].[Product] ([ID]),
    CONSTRAINT [FK_ProductListItem_ProductList] FOREIGN KEY ([ProductListID]) REFERENCES [CRM].[ProductList] ([ID]),
    CONSTRAINT [FK_ProductListItem_Variant] FOREIGN KEY ([VariantID]) REFERENCES [PRD].[Variant] ([ID])
);

