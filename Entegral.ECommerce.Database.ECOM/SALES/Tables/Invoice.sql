CREATE TABLE [SALES].[Invoice] (
    [ID]                            INT           IDENTITY (1, 1) NOT NULL,
    [SaleInvoiceID]                 INT           NULL,
    [InvoiceNo]                     NVARCHAR (20) NULL,
    [InvoiceRefCode]                NVARCHAR (50) NULL,
    [InvoiceType]                   INT           NOT NULL,
    [InvoiceDate]                   DATE          CONSTRAINT [DF_Invoice_InvoiceDate] DEFAULT (getdate()) NOT NULL,
    [IsPrinted]                     BIT           CONSTRAINT [DF_Invoice_IsPrinted] DEFAULT ((0)) NOT NULL,
    [LastPrintTime]                 DATETIME      NULL,
    [LastPrintUserID]               INT           NULL,
    [PackagingLocationID]           INT           NULL,
    [IsTransferredToExternalSystem] BIT           CONSTRAINT [DF_Invoice_IsTransferredToExternalSystem] DEFAULT ((0)) NOT NULL,
    [ExternalSystemTransferTime]    DATETIME      NULL,
    [IsCustomerNotified]            BIT           CONSTRAINT [DF_Invoice_IsCustomerNotified] DEFAULT ((0)) NOT NULL,
    [IsCreditNoteCreated]           BIT           CONSTRAINT [DF_Invoice_IsCreditNoteCreated] DEFAULT ((0)) NOT NULL,
    [IsReturnLoyaltyCard]           BIT           NULL,
    [IsEInvoice]                    BIT           CONSTRAINT [DF__tmp_ms_xx__IsEIn__00FF1D08] DEFAULT ((0)) NOT NULL,
    [BonusResidual]                 MONEY         CONSTRAINT [DF_Invoice_BonusResidual] DEFAULT ((0)) NOT NULL,
    [SequenceNumber]                INT           CONSTRAINT [DF_Invoice_SequenceNumber] DEFAULT ((0)) NOT NULL,
    [InvoicePosNumber]              NVARCHAR (20) CONSTRAINT [DF_Invoice_InvoicePosNumber] DEFAULT ((0)) NOT NULL,
    [InvoiceStorePrefix]            NVARCHAR (5)  CONSTRAINT [DF_Invoice_InvoiceStorePrefix] DEFAULT ((1)) NOT NULL,
    [InvoiceUserID]                 NVARCHAR (20) CONSTRAINT [DF_Invoice_InvoiceUserID] DEFAULT ((1)) NOT NULL,
    [CreateUserID]                  INT           CONSTRAINT [DF_Invoice_CreateUserID] DEFAULT ((0)) NOT NULL,
    [CreateTime]                    DATETIME      CONSTRAINT [DF_Invoice_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]                  INT           NOT NULL,
    [UpdateTime]                    DATETIME      CONSTRAINT [DF_Invoice_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Invoice_Invoice] FOREIGN KEY ([SaleInvoiceID]) REFERENCES [SALES].[Invoice] ([ID]),
    CONSTRAINT [FK_Invoice_PackagingLocation] FOREIGN KEY ([PackagingLocationID]) REFERENCES [LK].[PackagingLocation] ([ID])
);




































GO
CREATE NONCLUSTERED INDEX [IX_Invoice]
    ON [SALES].[Invoice]([InvoiceNo] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Invoice_CreateTime]
    ON [SALES].[Invoice]([CreateTime] ASC);

