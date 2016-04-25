CREATE TABLE [SALES].[CartItem] (
    [ID]             INT              IDENTITY (1, 1) NOT NULL,
    [CartGUID]       UNIQUEIDENTIFIER NOT NULL,
    [VariantID]      INT              NOT NULL,
    [ProductID]      INT              CONSTRAINT [DF__CartItem__Produc__62E4AA3C] DEFAULT ((0)) NOT NULL,
    [CategoryCode]   VARCHAR (100)    NULL,
    [IsGift]         BIT              CONSTRAINT [DF_CartItem_IsGift] DEFAULT ((0)) NOT NULL,
    [IsFreeOfCharge] BIT              CONSTRAINT [DF_CartItem_IsFreeOfCharge] DEFAULT ((0)) NOT NULL,
    [UpdateUserID]   INT              NOT NULL,
    [UpdateTime]     DATETIME         CONSTRAINT [DF_CartItem_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_CartItem_Cart] FOREIGN KEY ([CartGUID]) REFERENCES [SALES].[Cart] ([GUID]),
    CONSTRAINT [FK_CartItem_Variant] FOREIGN KEY ([VariantID]) REFERENCES [PRD].[Variant] ([ID])
);
















GO
CREATE NONCLUSTERED INDEX [IX_CartItem_VariantID]
    ON [SALES].[CartItem]([VariantID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CartItem_CartGUID]
    ON [SALES].[CartItem]([CartGUID] ASC);

