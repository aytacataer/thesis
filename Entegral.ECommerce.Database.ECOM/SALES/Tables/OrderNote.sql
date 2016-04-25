CREATE TABLE [SALES].[OrderNote] (
    [ID]                  INT            IDENTITY (1, 1) NOT NULL,
    [OrderID]             INT            NOT NULL,
    [Note]                NVARCHAR (MAX) NOT NULL,
    [IsVisibleToCustomer] BIT            CONSTRAINT [DF_OrderNote_IsVisibleToCustomer] DEFAULT ((0)) NOT NULL,
    [CreateUserID]        INT            NOT NULL,
    [CreateTime]          DATETIME       CONSTRAINT [DF_OrderNote_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]        INT            NOT NULL,
    [UpdateTime]          DATETIME       CONSTRAINT [DF_OrderNote_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_OrderNote] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_OrderNote_OrderMain] FOREIGN KEY ([OrderID]) REFERENCES [SALES].[OrderMain] ([ID])
);

