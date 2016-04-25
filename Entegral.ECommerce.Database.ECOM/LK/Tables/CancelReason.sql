CREATE TABLE [LK].[CancelReason] (
    [ID]                  INT            IDENTITY (1, 1) NOT NULL,
    [ExternalSystemCode]  NVARCHAR (20)  NULL,
    [ReasonText]          NVARCHAR (255) NOT NULL,
    [MessageTemplateCode] NVARCHAR (30)  NULL,
    [IsVisibleToCustomer] BIT            CONSTRAINT [DF_CancelReason_IsVisibleToCustomer] DEFAULT ((0)) NOT NULL,
    [IsActive]            BIT            CONSTRAINT [DF_LK.CancelReason_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]        INT            NOT NULL,
    [CreateTime]          DATETIME       CONSTRAINT [DF_LK.CancelReason_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]        INT            NOT NULL,
    [UpdateTime]          DATETIME       CONSTRAINT [DF_LK.CancelReason_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_LK.CancelReason] PRIMARY KEY CLUSTERED ([ID] ASC)
);







