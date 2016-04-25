CREATE TABLE [PRD].[Variant] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [ProductID]          INT            NOT NULL,
    [ExternalSystemCode] NVARCHAR (50)  NOT NULL,
    [Barcode]            VARCHAR (20)   NULL,
    [Description]        NVARCHAR (500) NULL,
    [IsActive]           BIT            NOT NULL,
    [CreateUserID]       INT            NOT NULL,
    [CreateTime]         DATETIME       NOT NULL,
    [UpdateUserID]       INT            NOT NULL,
    [UpdateTime]         DATETIME       NOT NULL,
    CONSTRAINT [PK_Variant] PRIMARY KEY CLUSTERED ([ID] ASC) ,
    CONSTRAINT [FK_Variant_Product] FOREIGN KEY ([ProductID]) REFERENCES [PRD].[Product] ([ID])
);
















GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Variant_ExternalSystemCode]
    ON [PRD].[Variant]([ExternalSystemCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Variant_IsActive]
    ON [PRD].[Variant]([IsActive] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Variant_ProductID_Active]
    ON [PRD].[Variant]([ProductID] ASC, [IsActive] ASC)
    INCLUDE([ID]);


GO
CREATE NONCLUSTERED INDEX [DF_Variant_IsActive]
    ON [PRD].[Variant]([IsActive] ASC)
    INCLUDE([ID], [ProductID]);


GO
CREATE NONCLUSTERED INDEX [IX_Variant_Barcode]
    ON [PRD].[Variant]([Barcode] ASC);

