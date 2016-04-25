CREATE TABLE [CRM].[Message] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [ParentID]     INT            NULL,
    [StoreID]      INT            NOT NULL,
    [CustomerID]   INT            NOT NULL,
    [Subject]      NVARCHAR (255) NOT NULL,
    [Content]      NVARCHAR (MAX) NOT NULL,
    [Status]       NVARCHAR (50)  NOT NULL,
    [IsRead]       BIT            NOT NULL,
    [CreateUserID] INT            NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_Message_CreateTime] DEFAULT (getdate()) NULL,
    [UpdateUserID] INT            NULL,
    [UpdateTime]   DATETIME       CONSTRAINT [DF_Message_UpdateTime] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED ([ID] ASC)
);





