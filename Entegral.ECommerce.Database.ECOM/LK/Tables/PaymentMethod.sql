CREATE TABLE [LK].[PaymentMethod] (
    [ID]                                      INT             IDENTITY (1, 1) NOT NULL,
    [DefaultBankID]                           INT             NULL,
    [StoreID]                                 INT             NOT NULL,
    [DisplayName]                             NVARCHAR (50)   NOT NULL,
    [Code]                                    VARCHAR (30)    NOT NULL,
    [DiscountPercentage]                      DECIMAL (18, 2) NOT NULL,
    [DiscountExternalSystemCode]              VARCHAR (20)    NOT NULL,
    [Description]                             NVARCHAR (MAX)  NULL,
    [IsBackOfficeCreationAllowed]             BIT             CONSTRAINT [DF_PaymentMethod_IsBackOfficeCreationAllowed] DEFAULT ((0)) NOT NULL,
    [IsIncludedDistributionAlgorithmOnReturn] BIT             CONSTRAINT [DF_PaymentMethod_] DEFAULT ((1)) NOT NULL,
    [AdditionalFee]                           MONEY           CONSTRAINT [DF_PaymentMethod_Price] DEFAULT ((0)) NOT NULL,
    [IsActive]                                BIT             CONSTRAINT [DF_PaymentMethod_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]                            INT             NOT NULL,
    [CreateTime]                              DATETIME        CONSTRAINT [DF_PaymentMethod_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]                            INT             NOT NULL,
    [UpdateTime]                              DATETIME        CONSTRAINT [DF_PaymentMethod_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_PaymentMethod_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID]),
    CONSTRAINT [IX_PaymentMethod] UNIQUE NONCLUSTERED ([StoreID] ASC, [Code] ASC)
);





















