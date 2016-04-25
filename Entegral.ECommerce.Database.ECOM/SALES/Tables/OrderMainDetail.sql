CREATE TABLE [SALES].[OrderMainDetail] (
    [OrderMainID]                                   INT            NOT NULL,
    [SalesAgreement]                                NVARCHAR (MAX) NOT NULL,
    [PreInfoNote]                                   NVARCHAR (MAX) NOT NULL,
    [IsPendingMailSent]                             BIT            CONSTRAINT [DF_OrderMainDetail_IsPendingOver96HoursMailSent] DEFAULT ((0)) NOT NULL,
    [FraudHistory]                                  TEXT           NULL,
    [IsSuspectedOrderMailSent]                      BIT            CONSTRAINT [DF_OrderMainDetail_IsSuspectedMailSent] DEFAULT ((0)) NOT NULL,
    [IsCancelPendingItemMailSent]                   BIT            CONSTRAINT [DF_OrderMainDetail_IsCancelPendingItemMailSent] DEFAULT ((0)) NOT NULL,
    [IsOrdersInvoicedAndNotArrivedToStoreMailSent]  BIT            CONSTRAINT [DF_OrderMainDetail_IsPickupOrderInvoicedAndNotArrivedToStoreMailSent] DEFAULT ((0)) NOT NULL,
    [IsOrdersArrivedToStoreButNotCompletedMailSent] BIT            CONSTRAINT [DF_OrderMainDetail_IsPickupOrderSentAndNotArrivedToStoreMailSent] DEFAULT ((0)) NOT NULL,
    [PickupOrderArrivedToStoreTime]                 DATETIME       NULL,
    [PickupOrderDeliveredTime]                      DATETIME       NULL,
    [IsShipmentMailSent]                            BIT            CONSTRAINT [DF_OrderMainDetail_IsShipmentMailSent] DEFAULT ((0)) NOT NULL,
    [IsDataTransfered]                              BIT            CONSTRAINT [DF_OrderMainDetail_IsDataTransfered] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_OrderMainDetail] PRIMARY KEY CLUSTERED ([OrderMainID] ASC),
    CONSTRAINT [FK_OrderMainDetail_OrderMain] FOREIGN KEY ([OrderMainID]) REFERENCES [SALES].[OrderMain] ([ID])
);





















