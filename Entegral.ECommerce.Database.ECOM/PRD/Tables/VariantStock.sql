CREATE TABLE [PRD].[VariantStock] (
    [VariantID]    INT      NOT NULL,
    [Quantity]     INT      CONSTRAINT [DF_VariantStock_Quantity] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT      NULL,
    [CreateTime]   DATETIME CONSTRAINT [DF_VariantStock_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT      NULL,
    [UpdateTime]   DATETIME CONSTRAINT [DF_VariantStock_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_VariantStock_1] PRIMARY KEY CLUSTERED ([VariantID] ASC),
    CONSTRAINT [FK_VariantStock_Variant] FOREIGN KEY ([VariantID]) REFERENCES [PRD].[Variant] ([ID])
);





