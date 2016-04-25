CREATE TABLE [SALES].[ReturnFormItem] (
    [ID]           INT      IDENTITY (1, 1) NOT NULL,
    [ReturnFormID] INT      NOT NULL,
    [OrderItemID]  INT      NOT NULL,
    [CustomerID]   INT      NOT NULL,
    [IsActive]     BIT      NOT NULL,
    [CreateUserID] INT      NOT NULL,
    [CreateTime]   DATETIME CONSTRAINT [DF_ReturnFormItem_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT      NOT NULL,
    [UpdateTime]   DATETIME CONSTRAINT [DF_ReturnFormItem_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_ReturnFormItem] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ReturnFormItem_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [CRM].[Customer] ([ID]),
    CONSTRAINT [FK_ReturnFormItem_OrderItem] FOREIGN KEY ([OrderItemID]) REFERENCES [SALES].[OrderItem] ([ID]),
    CONSTRAINT [FK_ReturnFormItem_ReturnForm] FOREIGN KEY ([ReturnFormID]) REFERENCES [SALES].[ReturnForm] ([ID])
);





