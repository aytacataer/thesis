CREATE TABLE [ZZ].[OrderItem_History] (
    [HID]                        INT            IDENTITY (1, 1) NOT NULL,
    [Action]                     INT            NOT NULL,
    [ActionTime]                 DATETIME       NOT NULL,
    [ActionUserID]               INT            NOT NULL,
    [ID]                         INT            NOT NULL,
    [VariantID]                  INT            NOT NULL,
    [OrderID]                    INT            NOT NULL,
    [ShipmentID]                 INT            NULL,
    [VariantBarcode]             VARCHAR (50)   NULL,
    [DisplayName]                NVARCHAR (100) NOT NULL,
    [ItemName]                   NVARCHAR (100) NOT NULL,
    [ImageUrl]                   NVARCHAR (500) NOT NULL,
    [StorePrice]                 MONEY          NOT NULL,
    [StorePriceNumber]           SMALLINT       NOT NULL,
    [SalePrice]                  MONEY          NOT NULL,
    [ReturnRemarks]              NVARCHAR (500) NULL,
    [InvoiceID]                  INT            NULL,
    [ReturnInvoiceID]            INT            NULL,
    [ReturnReasonID]             INT            NULL,
    [ItemStatusCode]             NVARCHAR (255) NOT NULL,
    [ItemSeqNo]                  INT            NOT NULL,
    [ItemRemarks]                NVARCHAR (MAX) NULL,
    [StorePrice1]                MONEY          NULL,
    [StorePrice2]                MONEY          NULL,
    [StorePrice3]                MONEY          NULL,
    [AttributeValue1]            NVARCHAR (100) NULL,
    [AttributeValue2]            NVARCHAR (100) NULL,
    [AttributeValue3]            NVARCHAR (100) NULL,
    [AttributeValue4]            NVARCHAR (100) NULL,
    [AttributeValue5]            NVARCHAR (100) NULL,
    [AttributeValue6]            NVARCHAR (100) NULL,
    [VATRate]                    INT            NOT NULL,
    [CategoryCode]               VARCHAR (100)  NULL,
    [IsReturnedToExternalSystem] BIT            CONSTRAINT [DF_OrderItem_History_IsReturnedToExternalSystem] DEFAULT ((0)) NOT NULL,
    [ExternalSystemReturnTime]   DATETIME       NULL,
    [GroupIdentifier]            NVARCHAR (10)  NULL,
    [GroupIdentifierUpdateTime]  DATETIME       NULL,
    [CreateUserID]               INT            NOT NULL,
    [CreateTime]                 DATETIME       CONSTRAINT [DF_OrderItem_History_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]               INT            NOT NULL,
    [UpdateTime]                 DATETIME       CONSTRAINT [DF_OrderItem_History_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_OrderItem_History] PRIMARY KEY CLUSTERED ([HID] ASC)
);





















