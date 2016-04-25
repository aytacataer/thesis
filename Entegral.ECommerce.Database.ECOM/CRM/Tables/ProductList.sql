CREATE TABLE [CRM].[ProductList] (
    [ID]           INT             IDENTITY (1, 1) NOT NULL,
    [StoreID]      INT             NOT NULL,
    [CustomerID]   INT             NOT NULL,
    [ListType]     CHAR (1)        NOT NULL,
    [Name]         NVARCHAR (50)   NULL,
    [Note]         NVARCHAR (1000) NULL,
    [IsActive]     BIT             CONSTRAINT [DF_ProductList_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT             NOT NULL,
    [CreateTime]   DATETIME        CONSTRAINT [DF_ProductList_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT             NOT NULL,
    [UpdateTime]   DATETIME        CONSTRAINT [DF_ProductList_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_ProductList] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProductList_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [CRM].[Customer] ([ID]),
    CONSTRAINT [FK_ProductList_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID])
);

