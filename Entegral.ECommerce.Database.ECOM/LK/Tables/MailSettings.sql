CREATE TABLE [LK].[MailSettings] (
    [ID]                      INT           IDENTITY (1, 1) NOT NULL,
    [StoreID]                 INT           NOT NULL,
    [FromAddress]             VARCHAR (100) NULL,
    [HostName]                VARCHAR (50)  NULL,
    [UserName]                VARCHAR (50)  NULL,
    [Password]                VARCHAR (50)  NULL,
    [DeliveryMethod]          VARCHAR (50)  NULL,
    [SmtpPort]                INT           CONSTRAINT [DF_MailSettings_SmtpPort] DEFAULT ((587)) NOT NULL,
    [EnableSsl]               BIT           CONSTRAINT [DF_MailSettings_EnableSsl] DEFAULT ((0)) NOT NULL,
    [DefaultCredentials]      BIT           CONSTRAINT [DF_MailSettings_DefaultCredentials] DEFAULT ((0)) NOT NULL,
    [PickupDirectoryLocation] VARCHAR (100) NULL,
    [CallCenterEmailAddress]  NCHAR (255)   NULL,
    [WareHouseEmailAddress]   NCHAR (255)   NULL,
    [IsActive]                BIT           CONSTRAINT [DF_MailSettings_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateTime]              DATETIME      CONSTRAINT [DF_MailSettings_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [CreateUserID]            INT           CONSTRAINT [DF_MailSettings_CreateUserID] DEFAULT ((0)) NOT NULL,
    [UpdateTime]              DATETIME      CONSTRAINT [DF_MailSettings_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]            INT           CONSTRAINT [DF_MailSettings_UpdateUserID] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_MailSettings] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_MailSettings_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID])
);



