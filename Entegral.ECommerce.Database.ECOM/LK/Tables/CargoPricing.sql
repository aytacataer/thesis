CREATE TABLE [LK].[CargoPricing] (
    [ID]                  INT      IDENTITY (1, 1) NOT NULL,
    [CargoCompanyID]      INT      NOT NULL,
    [CargoDeliveryAreaID] INT      NULL,
    [GreaterThan]         MONEY    CONSTRAINT [DF_CargoPricing_GreaterAmount] DEFAULT ((0)) NOT NULL,
    [LessThan]            MONEY    CONSTRAINT [DF_CargoPricing_LessThan] DEFAULT ((0)) NOT NULL,
    [Price]               MONEY    CONSTRAINT [DF_CargoPricing_Price] DEFAULT ((0)) NOT NULL,
    [IsActive]            BIT      CONSTRAINT [DF_CargoPricing_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]        INT      NOT NULL,
    [CreateTime]          DATETIME CONSTRAINT [DF_CargoPricing_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]        INT      NOT NULL,
    [UpdateTime]          DATETIME CONSTRAINT [DF_CargoPricing_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_CargoPricing] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_CargoPricing_CargoCompany] FOREIGN KEY ([CargoCompanyID]) REFERENCES [LK].[CargoCompany] ([ID]),
    CONSTRAINT [FK_CargoPricing_CargoDeliveryArea] FOREIGN KEY ([CargoDeliveryAreaID]) REFERENCES [LK].[CargoDeliveryArea] ([ID])
);



