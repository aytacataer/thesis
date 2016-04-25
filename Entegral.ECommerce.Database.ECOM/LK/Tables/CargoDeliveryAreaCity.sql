CREATE TABLE [LK].[CargoDeliveryAreaCity] (
    [ID]                  INT IDENTITY (1, 1) NOT NULL,
    [CargoDeliveryAreaID] INT NOT NULL,
    [CityID]              INT NOT NULL,
    CONSTRAINT [PK_CargoDeliveryAreaCity_1] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_CargoDeliveryAreaCity_CargoDeliveryAreaCity] FOREIGN KEY ([CargoDeliveryAreaID]) REFERENCES [LK].[CargoDeliveryArea] ([ID]),
    CONSTRAINT [FK_CargoDeliveryAreaCity_City] FOREIGN KEY ([CityID]) REFERENCES [LK].[City] ([ID])
);





