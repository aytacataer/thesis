CREATE TABLE [LK].[Maintenance] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [GroupName]        VARCHAR (10)  NOT NULL,
    [SchemaName]       NVARCHAR (20) NOT NULL,
    [PrimaryKeyName]   VARCHAR (50)  NULL,
    [ForeignKeyName]   VARCHAR (50)  NULL,
    [ParentTableID]    INT           NULL,
    [OperationType]    VARCHAR (50)  NULL,
    [OperationKeyName] VARCHAR (50)  NULL,
    [Operator]         VARCHAR (50)  NULL,
    [OperationPeriod]  INT           NOT NULL,
    [Priority]         INT           NOT NULL,
    [IsActive]         BIT           CONSTRAINT [DF_Maintenance_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]     INT           NOT NULL,
    [CreateTime]       DATETIME      CONSTRAINT [DF_Maintenance_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]     INT           NOT NULL,
    [UpdateTime]       DATETIME      CONSTRAINT [DF_Maintenance_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Maintenance] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Maintenance_Maintenance] FOREIGN KEY ([ParentTableID]) REFERENCES [LK].[Maintenance] ([ID])
);

