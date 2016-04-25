CREATE TABLE [PRD].[ProductMedia_Lang] (
    [ID]           INT           NOT NULL,
    [LanguageID]   INT           NOT NULL,
    [AltText]      NVARCHAR (50) NULL,
    [Title]        NVARCHAR (50) NULL,
    [IsActive]     BIT           CONSTRAINT [DF_ProductMedia_Lang_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT           NOT NULL,
    [CreateTime]   DATETIME      CONSTRAINT [DF_ProductMedia_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT           NOT NULL,
    [UpdateTime]   DATETIME      CONSTRAINT [DF_ProductMedia_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_ProductMedia_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_ProductMedia_Lang_ProductMedia] FOREIGN KEY ([ID]) REFERENCES [PRD].[ProductMedia] ([ID])
);








GO
CREATE NONCLUSTERED INDEX [IX_ProductMedia_Lang_IsActive]
    ON [PRD].[ProductMedia_Lang]([IsActive] ASC);

