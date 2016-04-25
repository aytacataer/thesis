CREATE TABLE [PRD].[ProductAttribute] (
    [ID]                INT             IDENTITY (1, 1) NOT NULL,
    [ProductID]         INT             NOT NULL,
    [VariantID]         INT             NULL,
    [AttributeID]       INT             NOT NULL,
    [AttributeOptionID] INT             NULL,
    [CustomValueText]   NVARCHAR (1000) NULL,
    [CreateUserID]      INT             NOT NULL,
    [CreateTime]        DATETIME        CONSTRAINT [DF_ProductAttribute_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]      INT             NOT NULL,
    [UpdateTime]        DATETIME        CONSTRAINT [DF_ProductAttribute_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_ProductAttribute] PRIMARY KEY CLUSTERED ([ID] ASC) ,
    CONSTRAINT [FK_ProductAttribute_Attribute] FOREIGN KEY ([AttributeID]) REFERENCES [LK].[Atribute] ([ID]),
    CONSTRAINT [FK_ProductAttribute_AttributeOption] FOREIGN KEY ([AttributeOptionID]) REFERENCES [LK].[AttributeOption] ([ID]),
    CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY ([ProductID]) REFERENCES [PRD].[Product] ([ID]),
    CONSTRAINT [FK_ProductAttribute_Variant] FOREIGN KEY ([VariantID]) REFERENCES [PRD].[Variant] ([ID])
);










GO
CREATE NONCLUSTERED INDEX [IX_ProductAttribute]
    ON [PRD].[ProductAttribute]([VariantID] ASC, [ProductID] ASC, [AttributeID] ASC, [AttributeOptionID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ProductAttribute_ProductID]
    ON [PRD].[ProductAttribute]([ProductID] ASC)
    INCLUDE([AttributeID], [AttributeOptionID]);


GO
CREATE NONCLUSTERED INDEX [IX_ProductAttribute_AtttributeAndOption]
    ON [PRD].[ProductAttribute]([AttributeID] ASC, [AttributeOptionID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ProductAttribute_AttributeID]
    ON [PRD].[ProductAttribute]([AttributeID] ASC)
    INCLUDE([ProductID], [VariantID], [AttributeOptionID]);

