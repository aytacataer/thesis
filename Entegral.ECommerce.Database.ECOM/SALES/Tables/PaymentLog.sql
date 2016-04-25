CREATE TABLE [SALES].[PaymentLog] (
    [ID]            INT             IDENTITY (1, 1) NOT NULL,
    [OrderID]       INT             NOT NULL,
    [PaymentInfoID] INT             NULL,
    [LogData]       NVARCHAR (MAX)  NULL,
    [IsSucceed]     BIT             CONSTRAINT [DF_PaymentLog_IsSucceed] DEFAULT ((0)) NOT NULL,
    [IsReturn]      BIT             CONSTRAINT [DF_PaymentLog_IsReturn] DEFAULT ((0)) NOT NULL,
    [ErrorMessage]  NVARCHAR (1000) NULL,
    [CreateUserID]  INT             NOT NULL,
    [CreateTime]    DATETIME        CONSTRAINT [DF_PaymentLog_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]  INT             NOT NULL,
    [UpdateTime]    DATETIME        CONSTRAINT [DF_PaymentLog_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_PaymentLog] PRIMARY KEY CLUSTERED ([ID] ASC)
);















