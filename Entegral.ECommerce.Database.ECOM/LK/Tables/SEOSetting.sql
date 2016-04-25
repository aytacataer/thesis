CREATE TABLE [LK].[SEOSetting] (
    [ID]                  INT            IDENTITY (1, 1) NOT NULL,
    [StoreID]             INT            NOT NULL,
    [SiteTitle]           NVARCHAR (500) NOT NULL,
    [SiteKeywords]        NVARCHAR (500) NOT NULL,
    [SiteDescription]     NVARCHAR (500) NOT NULL,
    [CategoryTitle]       NVARCHAR (500) NULL,
    [CategoryKeywords]    NVARCHAR (500) NULL,
    [CategoryDescription] NVARCHAR (500) NULL,
    [ProductTitle]        NVARCHAR (500) NULL,
    [ProductKeywords]     NVARCHAR (500) NULL,
    [ProductDescription]  NVARCHAR (500) NULL,
    [ProductFriendlyUri]  NVARCHAR (500) NULL,
    [ContentTitle]        NVARCHAR (500) NULL,
    [ContentKeywords]     NVARCHAR (500) NULL,
    [ContentDescription]  NVARCHAR (500) NULL,
    [ImageTitle]          NVARCHAR (500) NULL,
    [ImageAltText]        NVARCHAR (500) NULL,
    [IsActive]            BIT            CONSTRAINT [DF_SEOSetting_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]        INT            NOT NULL,
    [CreateTime]          DATETIME       CONSTRAINT [DF_SEOSetting_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]        INT            NOT NULL,
    [UpdateTime]          DATETIME       CONSTRAINT [DF_SEOSetting_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_SEOSetting] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_SEOSetting_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID])
);









