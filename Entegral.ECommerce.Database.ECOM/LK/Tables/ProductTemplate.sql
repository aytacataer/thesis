CREATE TABLE [LK].[ProductTemplate] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [Code]         NVARCHAR (50)  NOT NULL,
    [DisplayName]  NVARCHAR (50)  NOT NULL,
    [Description]  NVARCHAR (100) NULL,
    [IsActive]     BIT            NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_Template_CreateTime] DEFAULT (getdate()) NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       CONSTRAINT [DF_Template_UpdateTime] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Template] PRIMARY KEY CLUSTERED ([ID] ASC)
);

