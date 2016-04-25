CREATE TABLE [CMS].[ContentData_Lang] (
    [ID]           INT            NOT NULL,
    [LanguageID]   INT            NOT NULL,
    [Body]         NVARCHAR (MAX) NOT NULL,
    [IsActive]     BIT            NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       NOT NULL,
    CONSTRAINT [PK_ContentData_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC)
);





