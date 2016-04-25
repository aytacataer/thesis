CREATE TABLE [LK].[StatusGroup] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [Code]         VARCHAR (50)  NOT NULL,
    [Name]         NVARCHAR (50) NOT NULL,
    [CreateUserID] INT           NOT NULL,
    [CreateTime]   DATETIME      CONSTRAINT [DF_StatusGroup_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT           NOT NULL,
    [UpdateTime]   DATETIME      CONSTRAINT [DF_StatusGroup_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_StatusGroup] PRIMARY KEY CLUSTERED ([ID] ASC)
);



