CREATE TABLE [LK].[CargoPaymentMethod] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [Code]         NVARCHAR (50) NOT NULL,
    [Name]         NVARCHAR (50) NOT NULL,
    [IsActive]     BIT           CONSTRAINT [DF_CargoPaymentMethod_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID] INT           NOT NULL,
    [CreateTime]   DATETIME      CONSTRAINT [DF_CargoPaymentMethod_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT           NOT NULL,
    [UpdateTime]   DATETIME      CONSTRAINT [DF_CargoPaymentMethod_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_CargoPaymentMethod] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CargoPaymentMethod]
    ON [LK].[CargoPaymentMethod]([Code] ASC);

