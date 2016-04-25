CREATE TABLE [CMS].[Banner] (
    [ID]                  INT            IDENTITY (1, 1) NOT NULL,
    [StoreID]             INT            NOT NULL,
    [BannerTemplateID]    INT            NULL,
    [Code]                VARCHAR (50)   NOT NULL,
    [AltText]             NVARCHAR (250) NULL,
    [Title]               NVARCHAR (250) NULL,
    [SubTitle]            NVARCHAR (250) NULL,
    [Link]                VARCHAR (255)  NOT NULL,
    [IsOpenNewPage]       BIT            CONSTRAINT [DF_Banner_IsOpenNewPage] DEFAULT ((0)) NOT NULL,
    [VisibilityStartDate] DATETIME       NOT NULL,
    [VisibilityEndDate]   DATETIME       NOT NULL,
    [Width]               INT            NULL,
    [Height]              INT            NULL,
    [Class]               VARCHAR (50)   NULL,
    [IsActive]            BIT            CONSTRAINT [DF_Banner_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]        INT            NOT NULL,
    [CreateTime]          DATETIME       CONSTRAINT [DF_Banner_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]        INT            NOT NULL,
    [UpdateTime]          DATETIME       CONSTRAINT [DF_Banner_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Banner_BannerTemplate] FOREIGN KEY ([BannerTemplateID]) REFERENCES [CMS].[BannerTemplate] ([ID]),
    CONSTRAINT [FK_Banner_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID])
);










GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Banner_StoreAndCode]
    ON [CMS].[Banner]([StoreID] ASC, [Code] ASC);

