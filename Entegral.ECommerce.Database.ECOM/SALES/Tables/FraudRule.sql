CREATE TABLE [SALES].[FraudRule] (
    [ID]           INT             IDENTITY (1, 1) NOT NULL,
    [FraudID]      INT             NOT NULL,
    [Code]         NVARCHAR (100)  NOT NULL,
    [Operator]     NVARCHAR (50)   NULL,
    [ValueList]    NVARCHAR (MAX)  NULL,
    [Score]        DECIMAL (18, 2) CONSTRAINT [DF_FraudRule_Score] DEFAULT ((0)) NOT NULL,
    [IsActive]     BIT             CONSTRAINT [DF_FraudRule_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT             NOT NULL,
    [CreateTime]   DATETIME        CONSTRAINT [DF_FraudRule_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT             NOT NULL,
    [UpdateTime]   DATETIME        CONSTRAINT [DF_FraudRule_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_FraudRule] PRIMARY KEY CLUSTERED ([ID] ASC)
);





