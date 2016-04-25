CREATE TABLE [PRD].[Category_Lang] (
    [ID]              INT             NOT NULL,
    [LanguageID]      INT             NOT NULL,
    [DisplayName]     NVARCHAR (100)  NOT NULL,
    [MetaKeywords]    NVARCHAR (500)  NULL,
    [MetaDescription] NVARCHAR (500)  NULL,
    [PageTitle]       NVARCHAR (100)  NULL,
    [Description]     NVARCHAR (1000) NULL,
    [CustomURL]       NVARCHAR (500)  NULL,
    [FriendlyURI]     NVARCHAR (500)  NOT NULL,
    [IsActive]        BIT             NOT NULL,
    [CreateUserID]    INT             NOT NULL,
    [CreateTime]      DATETIME        CONSTRAINT [DF_Category_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]    INT             NOT NULL,
    [UpdateTime]      DATETIME        CONSTRAINT [DF_Category_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Category_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_Category_Lang_Category] FOREIGN KEY ([ID]) REFERENCES [PRD].[Category] ([ID])
);



