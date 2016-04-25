CREATE TABLE [CMS].[ContentTemplateItem] (
    [ID]                INT      IDENTITY (1, 1) NOT NULL,
    [ContentTemplateID] INT      NOT NULL,
    [EntityType]        CHAR (1) NOT NULL,
    [EntityID]          INT      NOT NULL,
    [DisplayOrder]      SMALLINT NOT NULL,
    [CreateUserID]      INT      NOT NULL,
    [CreateTime]        DATETIME CONSTRAINT [DF_ContentTemplateItems_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]      INT      NOT NULL,
    [UpdateTime]        DATETIME CONSTRAINT [DF_ContentTemplateItems_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_ContentTemplateItems] PRIMARY KEY CLUSTERED ([ID] ASC)
);

