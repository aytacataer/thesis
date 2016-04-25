CREATE TABLE [CMS].[Content] (
    [ID]                  INT            IDENTITY (1, 1) NOT NULL,
    [StoreID]             INT            NOT NULL,
    [ContentType]         CHAR (1)       NOT NULL,
    [Title]               NVARCHAR (300) NULL,
    [MetaKeywords]        NVARCHAR (500) NULL,
    [MetaDescription]     NVARCHAR (500) NULL,
    [FriendlyURI]         NVARCHAR (255) NOT NULL,
    [VisibilityStartDate] DATETIME       CONSTRAINT [DF__Content__Visibil__02C769E9] DEFAULT (getutcdate()) NOT NULL,
    [VisibilityEndDate]   DATETIME       CONSTRAINT [DF__Content__Visibil__03BB8E22] DEFAULT (dateadd(year,(1),getutcdate())) NOT NULL,
    [Width]               INT            NULL,
    [Height]              INT            NULL,
    [Class]               VARCHAR (50)   NULL,
    [IsActive]            BIT            NOT NULL,
    [CreateUserID]        INT            NOT NULL,
    [CreateTime]          DATETIME       CONSTRAINT [DF_Content_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]        INT            NOT NULL,
    [UpdateTime]          DATETIME       CONSTRAINT [DF_Content_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED ([ID] ASC)
);








GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Content_StoreID_FriendlyURI]
    ON [CMS].[Content]([StoreID] ASC, [FriendlyURI] ASC);

