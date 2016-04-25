CREATE TABLE [LK].[BankCardType] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [BankID]       INT            NOT NULL,
    [DisplayName]  NVARCHAR (50)  NOT NULL,
    [ImageUrl]     NVARCHAR (255) NULL,
    [Code]         VARCHAR (30)   NOT NULL,
    [IsActive]     BIT            CONSTRAINT [DF_BankCardType_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_BankCardType_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       CONSTRAINT [DF_BankCardType_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_BankCardType] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_BankCardType_Bank] FOREIGN KEY ([BankID]) REFERENCES [LK].[Bank] ([ID])
);



