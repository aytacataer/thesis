CREATE TABLE [CMS].[Banner_Lang] (
    [ID]            INT            NOT NULL,
    [LanguageID]    INT            NOT NULL,
    [AltText]       NVARCHAR (250) NULL,
    [Title]         NVARCHAR (250) NULL,
    [SubTitle]      NVARCHAR (250) NULL,
    [Link]          VARCHAR (255)  NOT NULL,
    [IsOpenNewPage] BIT            CONSTRAINT [DF_Banner_Lang_IsOpenNewPage] DEFAULT ((0)) NOT NULL,
    [IsActive]      BIT            CONSTRAINT [DF_Banner_Lang_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]  INT            NOT NULL,
    [CreateTime]    DATETIME       CONSTRAINT [DF_Banner_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]  INT            NOT NULL,
    [UpdateTime]    DATETIME       CONSTRAINT [DF_Banner_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Banner_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_Banner_Lang_Banner] FOREIGN KEY ([ID]) REFERENCES [CMS].[Banner] ([ID]),
    CONSTRAINT [FK_Banner_Lang_Language] FOREIGN KEY ([LanguageID]) REFERENCES [LK].[Language] ([ID])
);

