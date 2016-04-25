CREATE TABLE [SALES].[OrderItemDiscount] (
    [ID]                         INT            IDENTITY (1, 1) NOT NULL,
    [OrderItemID]                INT            NOT NULL,
    [IsDiscountToGrandTotal]     BIT            CONSTRAINT [DF_OrderItemDiscount_IsDiscountToGrandTotal] DEFAULT ((0)) NOT NULL,
    [Amount]                     MONEY          NOT NULL,
    [TargetPrice]                MONEY          NOT NULL,
    [CampaignExternalSystemCode] NVARCHAR (200) NULL,
    [CampaignCode]               NVARCHAR (200) NULL,
    [IsBonusCampaign]            BIT            CONSTRAINT [DF_OrderItemDiscount_IsBonusCampaign] DEFAULT ((0)) NOT NULL,
    [DocumentNumber]             NVARCHAR (200) NULL,
    CONSTRAINT [PK_OrderItemDiscount] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_OrderItemDiscount_OrderItem] FOREIGN KEY ([OrderItemID]) REFERENCES [SALES].[OrderItem] ([ID])
);






















GO
CREATE NONCLUSTERED INDEX [IX_OrderItemDiscount_OrderItemID]
    ON [SALES].[OrderItemDiscount]([OrderItemID] ASC);

