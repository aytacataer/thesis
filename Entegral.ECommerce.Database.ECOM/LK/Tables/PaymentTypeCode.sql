CREATE TABLE [LK].[PaymentTypeCode] (
    [ID]              INT           IDENTITY (1, 1) NOT NULL,
    [PaymentMethodID] INT           NOT NULL,
    [BankID]          INT           NULL,
    [BINNumbers]      VARCHAR (100) NULL,
    [Code1]           VARCHAR (10)  NOT NULL,
    [Code2]           VARCHAR (10)  NOT NULL,
    [CreateUserID]    INT           NOT NULL,
    [CreateTime]      DATETIME      CONSTRAINT [DF_PaymentTypeCode_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]    INT           NOT NULL,
    [UpdateTime]      DATETIME      CONSTRAINT [DF_PaymentTypeCode_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_PaymentTypeCode] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_PaymentTypeCode_Bank] FOREIGN KEY ([BankID]) REFERENCES [LK].[Bank] ([ID]),
    CONSTRAINT [FK_PaymentTypeCode_PaymentMethod] FOREIGN KEY ([PaymentMethodID]) REFERENCES [LK].[PaymentMethod] ([ID])
);









