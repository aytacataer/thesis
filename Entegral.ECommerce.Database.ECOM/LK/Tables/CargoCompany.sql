CREATE TABLE [LK].[CargoCompany] (
    [ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [Code]                 VARCHAR (10)   NOT NULL,
    [Name]                 NVARCHAR (250) NOT NULL,
    [LogoUrl]              VARCHAR (255)  NULL,
    [Priority]             SMALLINT       NOT NULL,
    [TrackingUrl]          VARCHAR (255)  NOT NULL,
    [ServiceUrl]           VARCHAR (255)  NOT NULL,
    [ServiceUserName]      NVARCHAR (50)  NULL,
    [ServicePassword]      NVARCHAR (50)  NULL,
    [IsDeliverySameDay]    BIT            CONSTRAINT [DF_CargoCompany_IsDeliverySameDay] DEFAULT ((0)) NOT NULL,
    [IsPayAtDoor]          BIT            CONSTRAINT [DF_CargoCompany_IsPayAtDoor] DEFAULT ((0)) NOT NULL,
    [CargoPaymentMethodID] INT            NULL,
    [IsActive]             BIT            CONSTRAINT [DF_CargoCompany_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]         INT            NOT NULL,
    [CreateTime]           DATETIME       CONSTRAINT [DF_CargoCompany_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]         INT            NOT NULL,
    [UpdateTime]           DATETIME       CONSTRAINT [DF_CargoCompany_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_CargoCompany] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_CargoCompany_CargoPaymentMethod] FOREIGN KEY ([CargoPaymentMethodID]) REFERENCES [LK].[CargoPaymentMethod] ([ID])
);


















GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CargoCompany]
    ON [LK].[CargoCompany]([Code] ASC);

