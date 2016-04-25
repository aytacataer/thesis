CREATE TABLE [LK].[MediaSize] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [Code]         NVARCHAR (50) NOT NULL,
    [Name]         NVARCHAR (50) NOT NULL,
    [Width]        INT           NOT NULL,
    [Height]       INT           NOT NULL,
    [CreateUserID] INT           NOT NULL,
    [CreateTime]   DATETIME      CONSTRAINT [DF_ImageSize_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT           NOT NULL,
    [UpdateTime]   DATETIME      CONSTRAINT [DF_ImageSize_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    [IsActive]     BIT           CONSTRAINT [DF_ImageSize_IsActive] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED ([ID] ASC)
);




GO
CREATE NONCLUSTERED INDEX [IX_MediaSize_IsActive]
    ON [LK].[MediaSize]([IsActive] ASC);

