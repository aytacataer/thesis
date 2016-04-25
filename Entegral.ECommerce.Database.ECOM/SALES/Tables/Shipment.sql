CREATE TABLE [SALES].[Shipment] (
    [ID]                            INT            IDENTITY (1, 1) NOT NULL,
    [CargoCompanyID]                INT            NULL,
    [TrackingNumber]                NVARCHAR (50)  NULL,
    [WayBillNumber]                 NVARCHAR (50)  NULL,
    [CargoDeliveredTime]            DATETIME       NULL,
    [Deci]                          DECIMAL (5, 2) CONSTRAINT [DF_Shipment_Deci] DEFAULT ((0)) NULL,
    [IsTransferredToExternalSystem] BIT            CONSTRAINT [DF_Shipment_IsTransferredToExternalSystem] DEFAULT ((0)) NOT NULL,
    [ExternalSystemTransferredTime] DATETIME       NULL,
    [CreateUserID]                  INT            NOT NULL,
    [CreateTime]                    DATETIME       CONSTRAINT [DF_ShipmentInfo_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]                  INT            NOT NULL,
    [UpdateTime]                    DATETIME       CONSTRAINT [DF_ShipmentInfo_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Shipment_CargoCompany] FOREIGN KEY ([CargoCompanyID]) REFERENCES [LK].[CargoCompany] ([ID])
);























