CREATE TABLE [LK].[Job] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [ExternalSystemCode] NVARCHAR (50)  NULL,
    [Name]               NVARCHAR (200) NOT NULL,
    [IsActive]           BIT            CONSTRAINT [DF_Job_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]       INT            NOT NULL,
    [CreateTime]         DATETIME       CONSTRAINT [DF_Job_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT            NOT NULL,
    [UpdateTime]         DATETIME       CONSTRAINT [DF_Job_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED ([ID] ASC)
);



