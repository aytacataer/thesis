CREATE TABLE [LK].[CargoDeliveryArea] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [StoreID]        INT            NOT NULL,
    [CargoCompanyID] INT            NOT NULL,
    [CountryID]      INT            NOT NULL,
    [Name]           NVARCHAR (100) NOT NULL,
    [Price]          MONEY          CONSTRAINT [DF_CargoDeliveryArea_Price] DEFAULT ((0)) NOT NULL,
    [FreeThreshold]  MONEY          NULL,
    [IsActive]       BIT            CONSTRAINT [DF_CargoDeliveryArea_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]   INT            NOT NULL,
    [CreateTime]     DATETIME       CONSTRAINT [DF_CargoDeliveryArea_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]   INT            NOT NULL,
    [UpdateTime]     DATETIME       CONSTRAINT [DF_CargoDeliveryArea_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_CargoDeliveryArea] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_CargoDeliveryArea_CargoCompany] FOREIGN KEY ([CargoCompanyID]) REFERENCES [LK].[CargoCompany] ([ID]),
    CONSTRAINT [FK_CargoDeliveryArea_Country] FOREIGN KEY ([CountryID]) REFERENCES [LK].[Country] ([ID]),
    CONSTRAINT [FK_CargoDeliveryArea_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID])
);













