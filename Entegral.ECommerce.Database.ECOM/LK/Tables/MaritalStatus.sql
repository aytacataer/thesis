CREATE TABLE [LK].[MaritalStatus] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [ExternalSystemCode] NVARCHAR (50)  NULL,
    [Name]               NVARCHAR (100) NOT NULL,
    [IsActive]           BIT            NOT NULL,
    [CreateUserID]       INT            NOT NULL,
    [CreateTime]         DATETIME       CONSTRAINT [DF_MaritalStatus_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT            NOT NULL,
    [UpdateTime]         DATETIME       CONSTRAINT [DF_MaritalStatus_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_MaritalStatus] PRIMARY KEY CLUSTERED ([ID] ASC)
);



