CREATE TABLE [LK].[StockGroup] (
    [Code]         NVARCHAR (30) NOT NULL,
    [Name]         NVARCHAR (50) NOT NULL,
    [CreateUserID] INT           NOT NULL,
    [CreateTime]   DATETIME      CONSTRAINT [DF_StockGroup_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT           NOT NULL,
    [UpdateTime]   DATETIME      CONSTRAINT [DF_StockGroup_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    [IsActive]     BIT           CONSTRAINT [DF_StockGroup_IsActive] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_StockGroup_1] PRIMARY KEY CLUSTERED ([Code] ASC)
);

