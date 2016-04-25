CREATE TABLE [LK].[ReturnReason] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [ExternalSystemCode] NVARCHAR (20)  NULL,
    [ReasonText]         NVARCHAR (255) NOT NULL,
    [IsActive]           BIT            CONSTRAINT [DF_ReturnReason_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]       INT            NOT NULL,
    [CreateTime]         DATETIME       CONSTRAINT [DF_ReturnReason_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT            NOT NULL,
    [UpdateTime]         DATETIME       CONSTRAINT [DF_ReturnReason_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_ReturnReason] PRIMARY KEY CLUSTERED ([ID] ASC)
);





