CREATE TABLE [PRD].[ProductAttribute_Lang] (
    [ID]              INT            NOT NULL,
    [LanguageID]      INT            NOT NULL,
    [CustomValueText] NVARCHAR (500) NULL,
    [CreateUserID]    INT            NOT NULL,
    [CreateTime]      DATETIME       CONSTRAINT [DF_ProductAttribute_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]    INT            NOT NULL,
    [UpdateTime]      DATETIME       CONSTRAINT [DF_ProductAttribute_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_ProductAttribute_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_ProductAttribute_Lang_ProductAttribute] FOREIGN KEY ([ID]) REFERENCES [PRD].[ProductAttribute] ([ID])
);

