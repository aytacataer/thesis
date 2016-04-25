CREATE TABLE [PRD].[ProductMedia] (
    [ID]                INT           IDENTITY (1, 1) NOT NULL,
    [DisplayOrder]      INT           CONSTRAINT [DF_ProductMedia_Order] DEFAULT ((0)) NOT NULL,
    [MediaFormat]       NVARCHAR (50) NOT NULL,
    [AltText]           NVARCHAR (50) NULL,
    [Title]             NVARCHAR (50) NULL,
    [ProductID]         INT           NOT NULL,
    [VariantID]         INT           NULL,
    [AttributeOptionID] INT           NULL,
    [CreateUserID]      INT           NOT NULL,
    [CreateTime]        DATETIME      CONSTRAINT [DF_ProductMedia_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]      INT           NOT NULL,
    [UpdateTime]        DATETIME      CONSTRAINT [DF_ProductMedia_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    [IsActive]          BIT           CONSTRAINT [DF_ProductMedia_IsActive] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ProductMedia] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProductMedia_AttributeOption] FOREIGN KEY ([AttributeOptionID]) REFERENCES [LK].[AttributeOption] ([ID]),
    CONSTRAINT [FK_ProductMedia_Product] FOREIGN KEY ([ProductID]) REFERENCES [PRD].[Product] ([ID]),
    CONSTRAINT [FK_ProductMedia_Variant] FOREIGN KEY ([VariantID]) REFERENCES [PRD].[Variant] ([ID])
);








GO
CREATE NONCLUSTERED INDEX [IX_ProductMedia_ProductID]
    ON [PRD].[ProductMedia]([IsActive] ASC, [ProductID] ASC)
    INCLUDE([ID]);




GO
CREATE NONCLUSTERED INDEX [IX_ProductMedia_ProductVariant]
    ON [PRD].[ProductMedia]([ProductID] ASC, [VariantID] ASC);

