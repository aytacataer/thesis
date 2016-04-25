CREATE TABLE [ZZ].[Invoice_History] (
    [HID]                           INT           IDENTITY (1, 1) NOT NULL,
    [Action]                        INT           NOT NULL,
    [ActionTime]                    DATETIME      NOT NULL,
    [ID]                            INT           NOT NULL,
    [SaleInvoiceID]                 INT           NULL,
    [InvoiceNo]                     NVARCHAR (20) NOT NULL,
    [InvoiceType]                   INT           NOT NULL,
    [InvoiceDate]                   DATE          CONSTRAINT [DF_Invoice_History_InvoiceDate] DEFAULT (getdate()) NOT NULL,
    [IsPrinted]                     BIT           CONSTRAINT [DF_Invoice_History_IsPrinted] DEFAULT ((0)) NOT NULL,
    [LastPrintTime]                 DATETIME      NULL,
    [LastPrintUserID]               INT           NULL,
    [PackagingLocationID]           INT           NULL,
    [IsTransferredToExternalSystem] BIT           CONSTRAINT [DF_Invoice_History_IsTransferredToExternalSystem] DEFAULT ((0)) NOT NULL,
    [ExternalSystemTransferTime]    DATETIME      NULL,
    [IsCustomerNotified]            BIT           CONSTRAINT [DF_Invoice_History_IsCustomerNotified] DEFAULT ((0)) NOT NULL,
    [IsCreditNoteCreated]           BIT           CONSTRAINT [DF_Invoice_History_IsCreditNoteCreated] DEFAULT ((0)) NOT NULL,
    [IsReturnLoyaltyCard]           BIT           NULL,
    [IsEInvoice]                    BIT           CONSTRAINT [DF_Invoice_History_IsEInvoice] DEFAULT ((0)) NULL,
    [BonusResidual]                 MONEY         CONSTRAINT [DF_Invoice_History_BonusResidual] DEFAULT ((0)) NOT NULL,
    [CreateUserID]                  INT           NOT NULL,
    [CreateTime]                    DATETIME      CONSTRAINT [DF_Invoice_History_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]                  INT           NOT NULL,
    [UpdateTime]                    DATETIME      CONSTRAINT [DF_Invoice_History_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Invoice_History] PRIMARY KEY CLUSTERED ([HID] ASC)
);











