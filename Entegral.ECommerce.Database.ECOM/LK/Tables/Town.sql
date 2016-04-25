CREATE TABLE [LK].[Town] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [DistrictID]         INT           NOT NULL,
    [ExternalSystemCode] NVARCHAR (50) NULL,
    [Name]               NVARCHAR (50) NOT NULL,
    [DisplayOrder]       INT           CONSTRAINT [DF_Town_DisplayOrder] DEFAULT ((0)) NOT NULL,
    [IsActive]           BIT           CONSTRAINT [DF_Town_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]       INT           NOT NULL,
    [CreateTime]         DATETIME      CONSTRAINT [DF_Town_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT           NOT NULL,
    [UpdateTime]         DATETIME      CONSTRAINT [DF_Town_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Town] PRIMARY KEY CLUSTERED ([ID] ASC)
);

