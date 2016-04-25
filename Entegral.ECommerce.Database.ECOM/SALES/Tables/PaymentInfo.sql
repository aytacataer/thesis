CREATE TABLE [SALES].[PaymentInfo] (
    [ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [OrderID]              INT            NOT NULL,
    [PaymentMethodCode]    VARCHAR (30)   NOT NULL,
    [Amount]               MONEY          NOT NULL,
    [BankCode]             VARCHAR (30)   NULL,
    [InstallmentCount]     INT            NULL,
    [CreditCardHolderName] NVARCHAR (500) NULL,
    [AccountNumber]        NVARCHAR (50)  NULL,
    [Miscellaneous]        NVARCHAR (MAX) NULL,
    [Ref]                  NVARCHAR (MAX) NULL,
    [TrxID]                NVARCHAR (MAX) NULL,
    [PaymentTypeCode1]     VARCHAR (10)   NULL,
    [PaymentTypeCode2]     VARCHAR (10)   NULL,
    [PaymentDate]          DATETIME       NOT NULL,
    [AuthCode]             VARCHAR (20)   NULL,
    [IsCreatedManually]    BIT            CONSTRAINT [DF_PaymentInfo_IsGeneratedManually] DEFAULT ((0)) NOT NULL,
    [RewardAmount]         MONEY          CONSTRAINT [DF_PaymentInfo_RewardAmount] DEFAULT ((0)) NOT NULL,
    [CreateUserID]         INT            NOT NULL,
    [CreateTime]           DATETIME       CONSTRAINT [DF_PaymentInfo_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]         INT            NOT NULL,
    [UpdateTime]           DATETIME       CONSTRAINT [DF_PaymentInfo_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_PaymentInfo] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_PaymentInfo_Order] FOREIGN KEY ([OrderID]) REFERENCES [SALES].[OrderMain] ([ID])
);


































GO
CREATE NONCLUSTERED INDEX [DF_PaymentInfo_OrderID]
    ON [SALES].[PaymentInfo]([OrderID] ASC);

