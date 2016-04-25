CREATE TABLE [SEARCH].[SearchDirectRouting] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [StoreID]      INT            NULL,
    [SearchKey]    NVARCHAR (100) NULL,
    [Link]         NVARCHAR (255) NULL,
    [IsActive]     BIT            CONSTRAINT [DF_SearhDirectRouting_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_SearhDirectRouting_CreateDate] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       CONSTRAINT [DF_SearhDirectRouting_UpdateDate] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_SearhDirectRouting] PRIMARY KEY CLUSTERED ([ID] ASC)
);





