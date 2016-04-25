CREATE TABLE [LK].[ProductTemplateAttribute] (
    [ID]                INT IDENTITY (1, 1) NOT NULL,
    [ProductTemplateID] INT NOT NULL,
    [AttributeID]       INT NOT NULL,
    CONSTRAINT [PK_TemplateAttributes] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProductTemplateAttribute_Attribute] FOREIGN KEY ([AttributeID]) REFERENCES [LK].[Atribute] ([ID]),
    CONSTRAINT [FK_ProductTemplateAttribute_ProductTemplate] FOREIGN KEY ([ProductTemplateID]) REFERENCES [LK].[ProductTemplate] ([ID])
);

