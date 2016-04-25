CREATE TABLE [ZZ].[Shipment_History] (
    [HID]                INT            IDENTITY (1, 1) NOT NULL,
    [Action]             INT            NOT NULL,
    [ActionTime]         DATETIME       NOT NULL,
    [ID]                 INT            NOT NULL,
    [CargoCompanyID]     INT            NULL,
    [TrackingNumber]     NVARCHAR (50)  NULL,
    [WayBillNumber]      NVARCHAR (50)  NULL,
    [CargoDeliveredTime] DATETIME       NULL,
    [Deci]               DECIMAL (5, 2) CONSTRAINT [DF_Shipment_History_Deci] DEFAULT ((0)) NULL,
    [CreateUserID]       INT            NOT NULL,
    [CreateTime]         DATETIME       CONSTRAINT [DF_Shipment_HistoryInfo_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT            NOT NULL,
    [UpdateTime]         DATETIME       CONSTRAINT [DF_Shipment_HistoryInfo_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Shipment_History] PRIMARY KEY CLUSTERED ([HID] ASC)
);

