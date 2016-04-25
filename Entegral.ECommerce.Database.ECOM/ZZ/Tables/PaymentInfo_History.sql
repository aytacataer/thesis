CREATE TABLE [ZZ].[PaymentInfo_History] (
    [HID]                  INT            IDENTITY (1, 1) NOT NULL,
    [Action]               INT            NOT NULL,
    [ActionTime]           DATETIME       NOT NULL,
    [ActionUserID]         INT            NOT NULL,
    [ID]                   INT            NOT NULL,
    [OrderID]              INT            NOT NULL,
    [PaymentMethodCode]    VARCHAR (30)   NOT NULL,
    [Amount]               MONEY          NOT NULL,
    [BankName]             NVARCHAR (255) NULL,
    [InstallmentCount]     INT            NULL,
    [CreditCardHolderName] NVARCHAR (500) NULL,
    [CreditCardNo]         NVARCHAR (50)  NULL,
    [Ref]                  NVARCHAR (MAX) NULL,
    [TrxID]                NVARCHAR (MAX) NULL,
    [PaymentDate]          DATETIME       NOT NULL,
    [IsCreatedManually]    BIT            NOT NULL,
    [RewardAmount]         MONEY          CONSTRAINT [DF_PaymentInfo_History_RewardAmount] DEFAULT ((0)) NOT NULL,
    [CreateUserID]         INT            NOT NULL,
    [CreateTime]           DATETIME       CONSTRAINT [DF_PaymentInfo_History_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]         INT            NOT NULL,
    [UpdateTime]           DATETIME       CONSTRAINT [DF_PaymentInfo_History_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_PaymentInfo_History] PRIMARY KEY CLUSTERED ([HID] ASC)
);
























GO


