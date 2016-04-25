CREATE TABLE [LK].[CustomerCancelReason] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [ReasonText]   NVARCHAR (255) NOT NULL,
    [IsActive]     BIT            NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_CustomerCancelReason_CreateTime] DEFAULT (getdate()) NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       CONSTRAINT [DF_CustomerCancelReason_UpdateTime] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CustomerCancelReason] PRIMARY KEY CLUSTERED ([ID] ASC)
);

