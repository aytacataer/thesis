CREATE TABLE [LK].[PickupLocation] (
    [ID]                 INT             IDENTITY (1, 1) NOT NULL,
    [StoreID]            INT             NOT NULL,
    [ExternalSystemCode] NVARCHAR (50)   NULL,
    [Name]               NVARCHAR (50)   NOT NULL,
    [Description]        NVARCHAR (1000) NULL,
    [HowToGo]            NVARCHAR (1000) NULL,
    [Address]            NVARCHAR (255)  NOT NULL,
    [Phone]              NVARCHAR (15)   NULL,
    [Email]              NVARCHAR (50)   NULL,
    [IsActive]           BIT             CONSTRAINT [DF_PickupLocation_IsActive] DEFAULT ((1)) NOT NULL,
    [CountryID]          INT             NOT NULL,
    [CityID]             INT             NOT NULL,
    [DistrictID]         INT             NOT NULL,
    [TownID]             INT             NULL,
    [Coordinate]         NVARCHAR (50)   NULL,
    [WorkingTime]        NVARCHAR (50)   NULL,
    [ImagePath]          NVARCHAR (255)  NULL,
    [IsOfflineStore]     BIT             CONSTRAINT [DF_PickupLocation_IsOfflineStore] DEFAULT ((1)) NOT NULL,
    [IsPickupLocation]   BIT             CONSTRAINT [DF_PickupLocation_IsPickupLocation] DEFAULT ((1)) NOT NULL,
    [CreateUserID]       INT             NOT NULL,
    [CreateTime]         DATETIME        CONSTRAINT [DF_PickupLocation_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT             NOT NULL,
    [UpdateTime]         DATETIME        CONSTRAINT [DF_PickupLocation_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_StoreInfo] PRIMARY KEY CLUSTERED ([ID] ASC)
);































