CREATE TABLE [LK].[CardBinNumber] (
    [ID]             INT IDENTITY (1, 1) NOT NULL,
    [BankCardTypeID] INT NOT NULL,
    [BIN]            INT NOT NULL,
    CONSTRAINT [PK_CardBinNumber] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_CardBinNumber_BankCardType] FOREIGN KEY ([BankCardTypeID]) REFERENCES [LK].[BankCardType] ([ID])
);



