CREATE TABLE [SALES].[CreditNote] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [OrderID]           INT            NOT NULL,
    [CustomerID]        INT            NOT NULL,
    [PaymentInfoID]     INT            NOT NULL,
    [Amount]            MONEY          NOT NULL,
    [BankCode]          VARCHAR (30)   NULL,
    [AccountNumber]     NVARCHAR (50)  NULL,
    [TrxID]             NVARCHAR (MAX) NULL,
    [ReturnTrxID]       NVARCHAR (MAX) NULL,
    [PaymentMethodCode] VARCHAR (30)   NULL,
    [Status]            SMALLINT       CONSTRAINT [DF_CreditNote_Status] DEFAULT ((0)) NOT NULL,
    [Miscellaneous]     NVARCHAR (MAX) NULL,
    [RewardAmount]      MONEY          CONSTRAINT [DF_CreditNote_RewardAmount] DEFAULT ((0)) NOT NULL,
    [IsLoyalty]         BIT            DEFAULT ((0)) NOT NULL,
    [ReturnInvoiceID]   INT            NULL,
    [CancelationID]     INT            NULL,
    [CreateUserID]      INT            NOT NULL,
    [CreateTime]        DATETIME       CONSTRAINT [DF_CreditNote_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]      INT            NOT NULL,
    [UpdateTime]        DATETIME       CONSTRAINT [DF_CreditNote_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_CreditNote] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_CreditNote_Cancelation] FOREIGN KEY ([CancelationID]) REFERENCES [SALES].[Cancelation] ([ID]),
    CONSTRAINT [FK_CreditNote_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [CRM].[Customer] ([ID]),
    CONSTRAINT [FK_CreditNote_OrderMain] FOREIGN KEY ([OrderID]) REFERENCES [SALES].[OrderMain] ([ID])
);
























GO
CREATE NONCLUSTERED INDEX [IX_CreditNote_ReturnInvoiceID]
    ON [SALES].[CreditNote]([ReturnInvoiceID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CreditNote_PaymentInfoID]
    ON [SALES].[CreditNote]([PaymentInfoID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CreditNote_CancelationID]
    ON [SALES].[CreditNote]([CancelationID] ASC);

