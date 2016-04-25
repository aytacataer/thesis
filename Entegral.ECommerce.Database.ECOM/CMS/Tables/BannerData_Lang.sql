CREATE TABLE [CMS].[BannerData_Lang] (
    [ID]           INT            NOT NULL,
    [LanguageID]   INT            NOT NULL,
    [ImagePath]    NVARCHAR (250) NOT NULL,
    [IsActive]     BIT            NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       NOT NULL,
    CONSTRAINT [PK_BannerData_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC)
);









