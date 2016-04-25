CREATE TABLE [SALES].[ReturnForm] (
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [StoreID]        INT           NOT NULL,
    [OrderID]        INT           NOT NULL,
    [CustomerID]     INT           NOT NULL,
    [TrackingNumber] NVARCHAR (50) NOT NULL,
    [Status]         NVARCHAR (50) NOT NULL,
    [IsActive]       BIT           NOT NULL,
    [CreateUserID]   INT           NOT NULL,
    [CreateTime]     DATETIME      NOT NULL,
    [UpdateUserID]   INT           NOT NULL,
    [UpdateTime]     DATETIME      NOT NULL,
    CONSTRAINT [PK_ReturnForm] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ReturnForm_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [CRM].[Customer] ([ID]),
    CONSTRAINT [FK_ReturnForm_Order] FOREIGN KEY ([OrderID]) REFERENCES [SALES].[OrderMain] ([ID]),
    CONSTRAINT [FK_ReturnForm_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID])
);



