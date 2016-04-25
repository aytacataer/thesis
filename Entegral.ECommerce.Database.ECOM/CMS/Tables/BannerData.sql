CREATE TABLE [CMS].[BannerData] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [BannerID]         INT            NOT NULL,
    [BannerDeviceType] CHAR (1)       NOT NULL,
    [ImagePath]        NVARCHAR (250) NOT NULL,
    [IsActive]         BIT            CONSTRAINT [DF_BannerData_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]     INT            NOT NULL,
    [CreateTime]       DATETIME       CONSTRAINT [DF_BannerData_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]     INT            NOT NULL,
    [UpdateTime]       DATETIME       CONSTRAINT [DF_BannerData_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_BannerData] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_BannerData_Banner] FOREIGN KEY ([BannerID]) REFERENCES [CMS].[Banner] ([ID])
);

