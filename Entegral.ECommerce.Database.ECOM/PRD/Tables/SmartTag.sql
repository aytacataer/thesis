CREATE TABLE [PRD].[SmartTag] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [Value]        NVARCHAR (50)  NULL,
    [StartTime]    DATETIME       NOT NULL,
    [EndTime]      DATETIME       NOT NULL,
    [ImageUrl]     NVARCHAR (MAX) NULL,
    [IsActive]     BIT            NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       NOT NULL,
    CONSTRAINT [PK_SmartTag] PRIMARY KEY CLUSTERED ([ID] ASC)
);

