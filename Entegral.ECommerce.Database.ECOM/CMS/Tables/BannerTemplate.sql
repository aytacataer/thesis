CREATE TABLE [CMS].[BannerTemplate] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (250) NULL,
    [Content]      NVARCHAR (MAX) NULL,
    [IsActive]     BIT            CONSTRAINT [DF_BannerTemplate_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_BannerTemplate_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       CONSTRAINT [DF_BannerTemplate_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_BannerTemplate] PRIMARY KEY CLUSTERED ([ID] ASC)
);



