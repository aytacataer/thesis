CREATE TABLE [CMS].[ContentTemplate] (
    [ID]           INT          IDENTITY (1, 1) NOT NULL,
    [StoreID]      INT          NOT NULL,
    [Code]         VARCHAR (50) NOT NULL,
    [IsActive]     BIT          CONSTRAINT [DF_ContentTemplate_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT          NOT NULL,
    [CreateTime]   DATETIME     CONSTRAINT [DF_ContentTemplate_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT          NOT NULL,
    [UpdateTime]   DATETIME     CONSTRAINT [DF_ContentTemplate_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_ContentTemplate] PRIMARY KEY CLUSTERED ([ID] ASC)
);



