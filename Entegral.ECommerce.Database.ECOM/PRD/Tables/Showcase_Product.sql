CREATE TABLE [PRD].[Showcase_Product] (
    [ID]            INT IDENTITY (1, 1) NOT NULL,
    [ProductID] INT NOT NULL,
    [ShowcaseID]    INT NOT NULL,
    [DisplayOrder]  INT CONSTRAINT [DF_Showcase_Product_DiplayOrder] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Showcase_Product] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Showcase_Product_Product] FOREIGN KEY ([ProductID]) REFERENCES [PRD].[Product] ([ID]),
    CONSTRAINT [FK_Showcase_Product_Showcase] FOREIGN KEY ([ShowcaseID]) REFERENCES [PRD].[Showcase] ([ID]),
    CONSTRAINT [IX_Showcase_Product] UNIQUE NONCLUSTERED ([ProductID] ASC, [ShowcaseID] ASC)
);

