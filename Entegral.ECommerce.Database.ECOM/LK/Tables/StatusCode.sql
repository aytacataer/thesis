CREATE TABLE [LK].[StatusCode] (
    [ID]                     INT            IDENTITY (1, 1) NOT NULL,
    [Type]                   VARCHAR (2)    NOT NULL,
    [StatusGroupID]          INT            NULL,
    [Code]                   NVARCHAR (255) NOT NULL,
    [DisplayName]            NVARCHAR (255) NOT NULL,
    [UserVisibleDisplayName] NVARCHAR (255) NULL,
    [IsSystemLevel]          BIT            CONSTRAINT [DF_StatusCode_IsSystemLevel] DEFAULT ((1)) NOT NULL,
    [Order]                  SMALLINT       NULL,
    [IsActive]               BIT            NOT NULL,
    [CreateUserID]           INT            NOT NULL,
    [CreateTime]             DATETIME       CONSTRAINT [DF_StatusCode_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]           INT            NOT NULL,
    [UpdateTime]             DATETIME       CONSTRAINT [DF_StatusCode_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_StatusCode_1] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_StatusCode_StatusGroup] FOREIGN KEY ([StatusGroupID]) REFERENCES [LK].[StatusGroup] ([ID]),
    CONSTRAINT [IX_StatusCode] UNIQUE NONCLUSTERED ([Code] ASC)
);







