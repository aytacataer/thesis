CREATE TABLE [LK].[StorageSettings] (
    [ID]                          INT           IDENTITY (1, 1) NOT NULL,
    [Code]                        VARCHAR (100) NULL,
    [Name]                        VARCHAR (50)  NULL,
    [ProductImagesFolder]         VARCHAR (50)  NULL,
    [AttributeOptionImagesFolder] VARCHAR (50)  NULL,
    [SmartTagImageFolder]         VARCHAR (50)  NULL,
    [BankCardTypeImageFolder]     VARCHAR (50)  NULL,
    [BankImageFolder]             VARCHAR (50)  NULL,
    [ProductFolder]               VARCHAR (50)  NULL,
    [BannerFolder]                VARCHAR (50)  NULL,
    [ContentFolder]               VARCHAR (50)  NULL,
    [OfflineStoreImageFolder]     VARCHAR (50)  NULL,
    [DefaultNoImage]              VARCHAR (50)  NULL,
    [CDNPath]                     VARCHAR (255) NULL,
    [IsActive]                    BIT           CONSTRAINT [DF_StorageSettings_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateTime]                  DATETIME      CONSTRAINT [DF_StorageSettings_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [CreateUserID]                INT           CONSTRAINT [DF_StorageSettings_CreateUserID] DEFAULT ((0)) NOT NULL,
    [UpdateTime]                  DATETIME      CONSTRAINT [DF_StorageSettings_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]                INT           CONSTRAINT [DF_StorageSettings_UpdateUserID] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_StorageSettings] PRIMARY KEY CLUSTERED ([ID] ASC)
);

