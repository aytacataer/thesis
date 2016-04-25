CREATE TABLE [SALES].[OrderItem] (
    [ID]                         INT              IDENTITY (1, 1) NOT NULL,
    [VariantID]                  INT              NULL,
    [OrderID]                    INT              NOT NULL,
    [VariantExternalSystemCode]  NVARCHAR (50)    NOT NULL,
    [VariantBarcode]             VARCHAR (50)     NULL,
    [DisplayName]                NVARCHAR (100)   NOT NULL,
    [ItemName]                   NVARCHAR (100)   NOT NULL,
    [ImageUrl]                   NVARCHAR (500)   NOT NULL,
    [StorePrice]                 MONEY            NOT NULL,
    [StorePriceNumber]           SMALLINT         NOT NULL,
    [SalePrice]                  MONEY            NOT NULL,
    [InvoiceID]                  INT              NULL,
    [ReturnInvoiceID]            INT              NULL,
    [ReturnReasonID]             INT              NULL,
    [ReturnRemarks]              NVARCHAR (500)   NULL,
    [CancelationID]              INT              NULL,
    [CancelReasonID]             INT              NULL,
    [CancelRemarks]              NVARCHAR (500)   NULL,
    [CancelTime]                 DATETIME         NULL,
    [ItemStatusCode]             NVARCHAR (255)   NOT NULL,
    [ShipmentID]                 INT              NULL,
    [ItemSeqNo]                  INT              NOT NULL,
    [ItemRemarks]                NVARCHAR (MAX)   NULL,
    [StorePrice1]                MONEY            NULL,
    [StorePrice2]                MONEY            NULL,
    [StorePrice3]                MONEY            NULL,
    [AttributeValue1]            NVARCHAR (100)   NULL,
    [AttributeValue2]            NVARCHAR (100)   NULL,
    [AttributeValue3]            NVARCHAR (100)   NULL,
    [AttributeValue4]            NVARCHAR (100)   NULL,
    [AttributeValue5]            NVARCHAR (100)   NULL,
    [AttributeValue6]            NVARCHAR (100)   NULL,
    [AttributeValue7]            NVARCHAR (100)   NULL,
    [AttributeValue8]            NVARCHAR (100)   NULL,
    [VATRate]                    INT              NOT NULL,
    [CategoryCode]               VARCHAR (100)    NULL,
    [IsProductDiscountForbidden] BIT              CONSTRAINT [DF_OrderItem_IsProductDiscountForbidden] DEFAULT ((0)) NOT NULL,
    [IsProductReturnForbidden]   BIT              CONSTRAINT [DF_OrderItem_IsProductReturnForbidden] DEFAULT ((0)) NOT NULL,
    [IsReturnedToExternalSystem] BIT              CONSTRAINT [DF_OrderItem_IsReturnedToExternalSystem] DEFAULT ((0)) NOT NULL,
    [ChangeCardPrintTime]        DATETIME         NULL,
    [ExternalSystemReturnTime]   DATETIME         NULL,
    [PackagingLocationID]        INT              NULL,
    [AssurerUser]                VARCHAR (10)     NULL,
    [IsPreOrder]                 BIT              CONSTRAINT [DF_OrderItem_IsPreOrder] DEFAULT ((0)) NOT NULL,
    [IsFreeOfCharge]             BIT              CONSTRAINT [DF_OrderItem_IsFreeOfCharge] DEFAULT ((0)) NOT NULL,
    [IsGift]                     BIT              CONSTRAINT [DF_OrderItem_IsGift] DEFAULT ((0)) NULL,
    [GiftNote]                   NVARCHAR (1000)  NULL,
    [GroupIdentifier]            NVARCHAR (10)    NULL,
    [GroupIdentifierUpdateTime]  DATETIME         NULL,
    [CreateUserID]               INT              NOT NULL,
    [CreateTime]                 DATETIME         CONSTRAINT [DF_OrderItem_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]               INT              NOT NULL,
    [UpdateTime]                 DATETIME         CONSTRAINT [DF_OrderItem_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    [CancellationToken]          UNIQUEIDENTIFIER CONSTRAINT [DF__OrderItem__Cance__63A3C44B] DEFAULT (newid()) NOT NULL,
    CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_OrderItem_Cancelation] FOREIGN KEY ([CancelationID]) REFERENCES [SALES].[Cancelation] ([ID]),
    CONSTRAINT [FK_OrderItem_CancelReason] FOREIGN KEY ([CancelReasonID]) REFERENCES [LK].[CancelReason] ([ID]),
    CONSTRAINT [FK_OrderItem_Invoice] FOREIGN KEY ([ReturnInvoiceID]) REFERENCES [SALES].[Invoice] ([ID]),
    CONSTRAINT [FK_OrderItem_Invoice1] FOREIGN KEY ([InvoiceID]) REFERENCES [SALES].[Invoice] ([ID]),
    CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY ([OrderID]) REFERENCES [SALES].[OrderMain] ([ID]),
    CONSTRAINT [FK_OrderItem_PackagingLocation] FOREIGN KEY ([PackagingLocationID]) REFERENCES [LK].[PackagingLocation] ([ID]),
    CONSTRAINT [FK_OrderItem_ReturnReason] FOREIGN KEY ([ReturnReasonID]) REFERENCES [LK].[ReturnReason] ([ID]),
    CONSTRAINT [FK_OrderItem_Shipment] FOREIGN KEY ([ShipmentID]) REFERENCES [SALES].[Shipment] ([ID]),
    CONSTRAINT [FK_OrderItem_StatusCode] FOREIGN KEY ([ItemStatusCode]) REFERENCES [LK].[StatusCode] ([Code]) ON UPDATE CASCADE
);


































































GO

CREATE NONCLUSTERED INDEX [DF_OrderItem_ShipmentID]
    ON [SALES].[OrderItem]([ShipmentID] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_OrderItem_CancelReasonID]
    ON [SALES].[OrderItem]([CancelReasonID] ASC)
    INCLUDE([OrderID], [SalePrice], [InvoiceID], [VATRate]);
GO

CREATE NONCLUSTERED INDEX [IX_OrderItem_CancelReasonID_CancelTime]
    ON [SALES].[OrderItem]([CancelReasonID] ASC)
    INCLUDE([OrderID], [SalePrice], [CancelTime], [VATRate]);
GO

CREATE NONCLUSTERED INDEX [IX_OrderItem_CancelReasonID_InvoiceID]
    ON [SALES].[OrderItem]([CancelReasonID] ASC)
    INCLUDE([InvoiceID], [CreateTime]);
GO

CREATE NONCLUSTERED INDEX [IX_OrderItem_InvoiceID]
    ON [SALES].[OrderItem]([InvoiceID] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_OrderItem_ItemStatusCode]
    ON [SALES].[OrderItem]([ItemStatusCode] ASC)
    INCLUDE([OrderID]);
GO

CREATE NONCLUSTERED INDEX [IX_OrderItem_OrderID]
    ON [SALES].[OrderItem]([OrderID] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_OrderItem_PackagingLocationID]
    ON [SALES].[OrderItem]([PackagingLocationID] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_OrderItem_ReturnInvoiceID]
    ON [SALES].[OrderItem]([ReturnInvoiceID] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_OrderItem_ReturnInvoiceID_IsReturnedToExternalSystem]
    ON [SALES].[OrderItem]([ReturnInvoiceID] ASC, [IsReturnedToExternalSystem] ASC)
    INCLUDE([ID], [VariantID], [OrderID]);
GO

CREATE NONCLUSTERED INDEX [IX_OrderItem_StatusCode]
    ON [SALES].[OrderItem]([ItemStatusCode] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_OrderItem_VariantBarcode]
    ON [SALES].[OrderItem]([VariantBarcode] ASC)
    INCLUDE([OrderID]);
GO

CREATE NONCLUSTERED INDEX [IX_OrderItem_VariantBarcode_ItemStatusCode]
    ON [SALES].[OrderItem]([VariantBarcode] ASC, [ItemStatusCode] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_OrderItem_VariantBarcode_ItemStatusCode_OrderID]
    ON [SALES].[OrderItem]([VariantBarcode] ASC, [ItemStatusCode] ASC)
    INCLUDE([OrderID]);
GO

CREATE NONCLUSTERED INDEX [IX_OrderItem_VariantBarcode_ItemStatusCode_PackagingLocationID]
    ON [SALES].[OrderItem]([VariantBarcode] ASC, [ItemStatusCode] ASC, [PackagingLocationID] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_OrderItem_VariantExternalSystemCode]
    ON [SALES].[OrderItem]([VariantExternalSystemCode] ASC)
    INCLUDE([OrderID]);
GO

