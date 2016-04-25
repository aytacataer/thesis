CREATE TABLE [LK].[Country] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [ExternalSystemCode] NVARCHAR (50) NULL,
    [Name]               NVARCHAR (50) NOT NULL,
    [DisplayOrder]       INT           CONSTRAINT [DF_Country_DisplayOrder] DEFAULT ((0)) NOT NULL,
    [IsActive]           BIT           CONSTRAINT [DF_Country_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]       INT           NOT NULL,
    [CreateTime]         DATETIME      CONSTRAINT [DF_Country_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT           NOT NULL,
    [UpdateTime]         DATETIME      CONSTRAINT [DF_Country_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED ([ID] ASC)
);



