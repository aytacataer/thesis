CREATE TABLE [MOB].[MobileDeviceNotifications] (
    [NotificationMessageID] INT           IDENTITY (1, 1) NOT NULL,
    [MobileDeviceID]        INT           NOT NULL,
    [Message]               VARCHAR (150) NOT NULL,
    [Status]                VARCHAR (10)  NOT NULL,
    [SentDate]              DATETIME      NULL,
    [CreateUserID]          INT           NOT NULL,
    [CreateTime]            DATETIME      CONSTRAINT [DF_MobileDeviceNotifications_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]          INT           NOT NULL,
    [UpdateTime]            DATETIME      CONSTRAINT [DF_MobileDeviceNotifications_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [MobileDeviceNotificationsPK] PRIMARY KEY CLUSTERED ([NotificationMessageID] ASC),
    CONSTRAINT [FK_MobileDeviceNotifications_MobileDevices] FOREIGN KEY ([MobileDeviceID]) REFERENCES [MOB].[MobileDevices] ([MobileDeviceID])
);

