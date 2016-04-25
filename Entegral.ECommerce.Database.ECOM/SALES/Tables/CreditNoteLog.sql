CREATE TABLE [SALES].[CreditNoteLog] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [OrderID]       INT            NOT NULL,
    [CreditNoteID]  INT            NOT NULL,
    [ResultSummary] NVARCHAR (MAX) NULL,
    [LogData]       NVARCHAR (MAX) NULL,
    [IsSuccess]     BIT            NOT NULL,
    [CreateUserID]  INT            NOT NULL,
    [CreateTime]    DATETIME       CONSTRAINT [DF_CreditNoteLog_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]  INT            NOT NULL,
    [UpdateTime]    DATETIME       CONSTRAINT [DF_CreditNoteLog_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_CreditNoteLog] PRIMARY KEY CLUSTERED ([ID] ASC)
);







