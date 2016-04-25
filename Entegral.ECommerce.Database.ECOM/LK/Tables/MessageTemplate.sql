CREATE TABLE [LK].[MessageTemplate] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [StoreID]        INT            NOT NULL,
    [Code]           VARCHAR (50)   NOT NULL,
    [Subject]        NVARCHAR (MAX) NOT NULL,
    [MessageContent] NVARCHAR (MAX) NOT NULL,
    [IsActive]       BIT            CONSTRAINT [DF_MessageTemplate_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]   INT            NOT NULL,
    [CreateTime]     DATETIME       CONSTRAINT [DF_MessageTemplate_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]   INT            NOT NULL,
    [UpdateTime]     DATETIME       CONSTRAINT [DF_MessageTemplate_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_MessageTemplate] PRIMARY KEY CLUSTERED ([ID] ASC) 
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MessageTemplate]
    ON [LK].[MessageTemplate]([Code] ASC, [StoreID] ASC);

