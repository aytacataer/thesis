CREATE TABLE [CRM].[Message] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [ParentID]     INT            NULL,
    [StoreID]      INT            NOT NULL,
    [CustomerID]   INT            NOT NULL,
    [Subject]      NVARCHAR (255) NOT NULL,
    [Content]      NVARCHAR (MAX) NOT NULL,
    [Status]       NVARCHAR (50)  NOT NULL,
    [IsRead]       BIT            CONSTRAINT [DF_Message_IsRead] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_Message_CreateTime] DEFAULT (getdate()) NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       CONSTRAINT [DF_Message_UpdateTime] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED ([ID] ASC)
);



