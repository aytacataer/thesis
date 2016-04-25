CREATE TABLE [SALES].[OrderItemBonus] (
    [ID]                         INT            IDENTITY (1, 1) NOT NULL,
    [OrderItemID]                INT            NOT NULL,
    [Amount]                     MONEY          NOT NULL,
    [CampaignExternalSystemCode] NVARCHAR (200) NULL,
    [CampaignCode]               NVARCHAR (200) NULL,
    CONSTRAINT [PK_OrderItemBonus] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_OrderItemBonus_OrderItem] FOREIGN KEY ([OrderItemID]) REFERENCES [SALES].[OrderItem] ([ID])
);



