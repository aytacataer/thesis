CREATE TABLE [PRD].[Category_Product] (
    [ID]                INT      IDENTITY (1, 1) NOT NULL,
    [CategoryID]        INT      NOT NULL,
    [ProductID]         INT      NOT NULL,
    [DisplayOrder]      INT      CONSTRAINT [DF_Category_Product_DisplayOrder] DEFAULT ((1)) NOT NULL,
    [IsFromIntegration] BIT      CONSTRAINT [DF__Category___IsFro__26CFC035] DEFAULT ((1)) NOT NULL,
    [CreateUserID]      INT      NOT NULL,
    [CreateTime]        DATETIME CONSTRAINT [DF_Category_Product_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]      INT      NOT NULL,
    [UpdateTime]        DATETIME CONSTRAINT [DF_Category_Product_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Category_Product] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Category_Product_Category] FOREIGN KEY ([CategoryID]) REFERENCES [PRD].[Category] ([ID]),
    CONSTRAINT [FK_Category_Product_Product] FOREIGN KEY ([ProductID]) REFERENCES [PRD].[Product] ([ID]),
    CONSTRAINT [IX_Category_Product] UNIQUE NONCLUSTERED ([CategoryID] ASC, [ProductID] ASC)
);










GO
CREATE NONCLUSTERED INDEX [IX_Category_Product_ProductID]
    ON [PRD].[Category_Product]([ProductID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Category_Product_Category]
    ON [PRD].[Category_Product]([CategoryID] ASC);

