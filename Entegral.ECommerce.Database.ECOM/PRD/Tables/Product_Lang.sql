CREATE TABLE [PRD].[Product_Lang] (
    [ID]              INT            NOT NULL,
    [LanguageID]      INT            NOT NULL,
    [DisplayName]     NVARCHAR (150) NOT NULL,
    [Description]     NVARCHAR (500) NULL,
    [FriendlyURI]     NVARCHAR (500) NOT NULL,
    [MetaKeywords]    NVARCHAR (500) NULL,
    [MetaDescription] NVARCHAR (500) NULL,
    [PageTitle]       NVARCHAR (100) NULL,
    [CreateUserID]    INT            NOT NULL,
    [CreateTime]      DATETIME       CONSTRAINT [DF_Product_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]    INT            NOT NULL,
    [UpdateTime]      DATETIME       CONSTRAINT [DF_Product_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    [IsActive]        BIT            CONSTRAINT [DF_Product_Lang_IsActive] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Product_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_Product_Lang_Product] FOREIGN KEY ([ID]) REFERENCES [PRD].[Product] ([ID])
);




GO
CREATE NONCLUSTERED INDEX [IX_Product_Lang_IsActive]
    ON [PRD].[Product_Lang]([IsActive] ASC);

