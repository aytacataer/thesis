CREATE TABLE [SALES].[OrderStatusHistory] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [OrderID]            INT            NOT NULL,
    [OrderStatusCode]    NVARCHAR (255) NOT NULL,
    [Remark]             NVARCHAR (MAX) NULL,
    [IsCustomerNotified] BIT            CONSTRAINT [DF_OrderStatusHistory_IsCustomerNotified] DEFAULT ((0)) NOT NULL,
    [CreateUserID]       INT            NOT NULL,
    [CreateTime]         DATETIME       CONSTRAINT [DF_OrderStatusHistory_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT            NOT NULL,
    [UpdateTime]         DATETIME       CONSTRAINT [DF_OrderStatusHistory_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_OrderStatusHistory] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_OrderStatusHistory_OrderMain] FOREIGN KEY ([OrderID]) REFERENCES [SALES].[OrderMain] ([ID])
);

