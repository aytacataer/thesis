CREATE TABLE [SALES].[PaymentStartRecord] (
    [OrderCode]             NVARCHAR (100) NOT NULL,
    [OrderID]               INT            NULL,
    [StoreID]               INT            NOT NULL,
    [Amount]                MONEY          NOT NULL,
    [PaymentMethodCode]     VARCHAR (30)   NOT NULL,
    [BankCode]              VARCHAR (30)   NULL,
    [InstallmentCount]      INT            NOT NULL,
    [CreditCardHolderName]  NVARCHAR (500) NULL,
    [AccountNumber]         NVARCHAR (50)  NULL,
    [GiftAmount]            MONEY          NOT NULL,
    [GiftCardNumber]        NVARCHAR (20)  NULL,
    [GiftKey]               NVARCHAR (10)  NULL,
    [GiftPin]               NVARCHAR (10)  NULL,
    [BonusAmount]           MONEY          CONSTRAINT [DF_PaymentStartRecord_BonusAmount] DEFAULT ((0)) NOT NULL,
    [BonusKey]              NVARCHAR (20)  NULL,
    [IsPaymentFromGiftCard] BIT            NOT NULL,
    [ReferenceNumber]       NVARCHAR (50)  NULL,
    [RewardAmount]          MONEY          NOT NULL,
    CONSTRAINT [PK_PaymentStartRecord] PRIMARY KEY CLUSTERED ([OrderCode] ASC),
    CONSTRAINT [FK_PaymentStartRecord_OrderMain] FOREIGN KEY ([OrderID]) REFERENCES [SALES].[OrderMain] ([ID])
);


















































GO
CREATE NONCLUSTERED INDEX [IX_PaymentStartRecord_OrderCode]
    ON [SALES].[PaymentStartRecord]([OrderCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PaymentStartRecord_OrderID]
    ON [SALES].[PaymentStartRecord]([OrderID] ASC);

