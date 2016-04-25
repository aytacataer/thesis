CREATE TABLE [LK].[Gender] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [ExternalSystemCode] NVARCHAR (50) NULL,
    [Name]               NVARCHAR (50) NOT NULL,
    [IsActive]           BIT           NOT NULL,
    [CreateUserID]       INT           NOT NULL,
    [CreateTime]         DATETIME      CONSTRAINT [DF_Gender_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT           NOT NULL,
    [UpdateTime]         DATETIME      CONSTRAINT [DF_Gender_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED ([ID] ASC)
);



