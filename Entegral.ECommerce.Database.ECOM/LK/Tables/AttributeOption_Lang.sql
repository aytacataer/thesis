CREATE TABLE [LK].[AttributeOption_Lang] (
    [ID]           INT             NOT NULL,
    [LanguageID]   INT             NOT NULL,
    [ValueText]    NVARCHAR (100)  NOT NULL,
    [Description]  NVARCHAR (1000) NULL,
    [IsActive]     BIT             CONSTRAINT [DF_AttributeOption_Lang_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT             NOT NULL,
    [CreateTime]   DATETIME        CONSTRAINT [DF_AttributeOption_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT             NOT NULL,
    [UpdateTime]   DATETIME        CONSTRAINT [DF_AttributeOption_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_AttributeOption_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_AttributeOption_Lang_AttributeOption] FOREIGN KEY ([ID]) REFERENCES [LK].[AttributeOption] ([ID])
);






GO
CREATE NONCLUSTERED INDEX [IX_AttributeOption_Lang_IsActive]
    ON [LK].[AttributeOption_Lang]([IsActive] ASC);

