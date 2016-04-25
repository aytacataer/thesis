CREATE TABLE [PRD].[SmartTag_Product] (
    [ID]         INT IDENTITY (1, 1) NOT NULL,
    [SmartTagID] INT NOT NULL,
    [ProductID]  INT NOT NULL,
    CONSTRAINT [PK_Product_SmartTag] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_SmartTag_Product_Product] FOREIGN KEY ([ProductID]) REFERENCES [PRD].[Product] ([ID]),
    CONSTRAINT [FK_SmartTag_Product_SmartTag] FOREIGN KEY ([SmartTagID]) REFERENCES [PRD].[SmartTag] ([ID])
);

