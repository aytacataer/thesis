CREATE TABLE [LK].[PaymentMethod_Lang] (
    [ID]           INT            NOT NULL,
    [LanguageID]   INT            NOT NULL,
    [DisplayName]  NVARCHAR (50)  NOT NULL,
    [Description]  NVARCHAR (MAX) NULL,
    [IsActive]     BIT            CONSTRAINT [DF_PaymentMethod_Lang_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_PaymentMethod_Lang_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       CONSTRAINT [DF_PaymentMethod_Lang_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_PaymentMethod_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC),
    CONSTRAINT [FK_PaymentMethod_Lang_PaymentMethod] FOREIGN KEY ([ID]) REFERENCES [LK].[PaymentMethod] ([ID]),
    CONSTRAINT [IX_PaymentMethod_Lang] UNIQUE NONCLUSTERED ([ID] ASC, [DisplayName] ASC, [LanguageID] ASC)
);



