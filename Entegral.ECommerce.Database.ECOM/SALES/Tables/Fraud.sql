CREATE TABLE [SALES].[Fraud] (
    [ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [StoreID]              INT            NOT NULL,
    [FraudType]            SMALLINT       NOT NULL,
    [SuspectFraudMinScore] DECIMAL (5, 2) NOT NULL,
    [FraudMinScore]        DECIMAL (5, 2) NOT NULL,
    [IsActive]             BIT            CONSTRAINT [DF_Fraud_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]         INT            NOT NULL,
    [CreateTime]           DATETIME       CONSTRAINT [DF_Fraud_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]         INT            NOT NULL,
    [UpdateTime]           DATETIME       CONSTRAINT [DF_Fraud_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Fraud] PRIMARY KEY CLUSTERED ([ID] ASC)
);







