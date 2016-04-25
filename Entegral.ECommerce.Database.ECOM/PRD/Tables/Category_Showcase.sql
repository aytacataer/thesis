CREATE TABLE [PRD].[Category_Showcase] (
    [ID]           INT IDENTITY (1, 1) NOT NULL,
    [CategoryID]   INT NOT NULL,
    [ShowcaseID]   INT NOT NULL,
    [DisplayOrder] INT CONSTRAINT [DF_Category_Showcase_DisplayOrder] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Category_Showcase] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Category_Showcase_Category] FOREIGN KEY ([CategoryID]) REFERENCES [PRD].[Category] ([ID]),
    CONSTRAINT [FK_Category_Showcase_Showcase] FOREIGN KEY ([ShowcaseID]) REFERENCES [PRD].[Showcase] ([ID]),
    CONSTRAINT [IX_Category_Showcase] UNIQUE NONCLUSTERED ([CategoryID] ASC, [ShowcaseID] ASC)
);

