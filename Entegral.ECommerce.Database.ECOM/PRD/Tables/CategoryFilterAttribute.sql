CREATE TABLE [PRD].[CategoryFilterAttribute] (
    [ID]           INT      IDENTITY (1, 1) NOT NULL,
    [CategoryID]   INT      NOT NULL,
    [AttributeID]  INT      NOT NULL,
    [CreateUserID] INT      NOT NULL,
    [CreateTime]   DATETIME CONSTRAINT [DF_CategoryFilterAttribute_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT      NOT NULL,
    [UpdateTime]   DATETIME CONSTRAINT [DF_CategoryFilterAttribute_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_CategoryFilterAttribute] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_CategoryFilterAttribute_Atribute] FOREIGN KEY ([AttributeID]) REFERENCES [LK].[Atribute] ([ID]),
    CONSTRAINT [FK_CategoryFilterAttribute_Category] FOREIGN KEY ([CategoryID]) REFERENCES [PRD].[Category] ([ID]),
    CONSTRAINT [IX_CategoryFilterAttribute] UNIQUE NONCLUSTERED ([CategoryID] ASC, [AttributeID] ASC)
);




GO
CREATE NONCLUSTERED INDEX [IX_CategoryFilterAttribute_CategoryID]
    ON [PRD].[CategoryFilterAttribute]([CategoryID] ASC);

