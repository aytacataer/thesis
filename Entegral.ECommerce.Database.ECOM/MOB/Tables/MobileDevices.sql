CREATE TABLE [MOB].[MobileDevices] (
    [MobileDeviceID] INT           IDENTITY (1, 1) NOT NULL,
    [CustomerID]     INT           NULL,
    [AppName]        VARCHAR (100) NOT NULL,
    [AppVersion]     VARCHAR (10)  NOT NULL,
    [DeviceUID]      VARCHAR (100) NOT NULL,
    [DeviceToken]    VARCHAR (100) NOT NULL,
    [DeviceName]     VARCHAR (100) NOT NULL,
    [DeviceModel]    VARCHAR (100) NOT NULL,
    [DeviceVersion]  VARCHAR (10)  NOT NULL,
    [PushBadge]      VARCHAR (10)  NOT NULL,
    [PushAlert]      VARCHAR (10)  NOT NULL,
    [PushSound]      VARCHAR (10)  NOT NULL,
    [Environment]    VARCHAR (10)  NOT NULL,
    [Status]         VARCHAR (10)  NOT NULL,
    [CreateUserID]   INT           NOT NULL,
    [CreateTime]     DATETIME      CONSTRAINT [DF_MobileDevices_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]   INT           NOT NULL,
    [UpdateTime]     DATETIME      CONSTRAINT [DF_MobileDevices_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [MobileDevicesPK] PRIMARY KEY CLUSTERED ([MobileDeviceID] ASC)
);

