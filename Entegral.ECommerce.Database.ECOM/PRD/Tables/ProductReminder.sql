CREATE TABLE [PRD].[ProductReminder] (
    [ID]              INT             IDENTITY (1, 1) NOT NULL,
    [StoreID]         INT             NOT NULL,
    [CustomerID]      INT             NULL,
    [FirstName]       NVARCHAR (100)  NULL,
    [LastName]        NVARCHAR (100)  NULL,
    [Email]           NVARCHAR (255)  NULL,
    [CellPhone]       VARCHAR (20)    NULL,
    [Note]            NVARCHAR (1000) NULL,
    [ProductID]       INT             NOT NULL,
    [VariantID]       INT             NULL,
    [AttributeValue1] NVARCHAR (100)  NULL,
    [AttributeValue2] NVARCHAR (100)  NULL,
    [AttributeValue3] NVARCHAR (100)  NULL,
    [CreateUserID]    INT             NOT NULL,
    [CreateTime]      DATETIME        CONSTRAINT [DF_ProductReminder_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]    INT             NOT NULL,
    [UpdateTime]      DATETIME        CONSTRAINT [DF_ProductReminder_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    [IsMailSent]      BIT             CONSTRAINT [DF_ProductReminder_IsMailSent] DEFAULT ((0)) NOT NULL,
    [IsActive]        BIT             CONSTRAINT [DF_ProductReminder_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_ProductReminder] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProductReminder_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [CRM].[Customer] ([ID]),
    CONSTRAINT [FK_ProductReminder_Product] FOREIGN KEY ([ProductID]) REFERENCES [PRD].[Product] ([ID]),
    CONSTRAINT [FK_ProductReminder_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID]),
    CONSTRAINT [FK_ProductReminder_Variant] FOREIGN KEY ([VariantID]) REFERENCES [PRD].[Variant] ([ID])
);







