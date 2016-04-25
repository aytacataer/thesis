CREATE TABLE [LK].[Atribute_Lang] (
    [ID]           INT            NOT NULL,
    [LanguageID]   INT            NOT NULL,
    [DisplayName]  NVARCHAR (100) NULL,
    [IsActive]     BIT            CONSTRAINT [DF_Atribute_Lang_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_Atribute_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       CONSTRAINT [DF_Atribute_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Atribute_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_Atribute_Lang_Attribute] FOREIGN KEY ([ID]) REFERENCES [LK].[Atribute] ([ID])
);




GO
CREATE NONCLUSTERED INDEX [IX_Atribute_Lang_IsActive]
    ON [LK].[Atribute_Lang]([IsActive] ASC);

