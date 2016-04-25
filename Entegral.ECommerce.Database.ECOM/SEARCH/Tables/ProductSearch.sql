CREATE TABLE [SEARCH].[ProductSearch] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [ProductID]     INT            NOT NULL,
    [LanguageID]    INT            NOT NULL,
    [SearchContent] NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_ProductSearch] PRIMARY KEY CLUSTERED ([ID] ASC)
);

