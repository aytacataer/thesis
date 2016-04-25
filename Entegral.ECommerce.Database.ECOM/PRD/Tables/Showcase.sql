CREATE TABLE [PRD].[Showcase] (
    [ID]                      INT            IDENTITY (1, 1) NOT NULL,
    [StoreID]                 INT            NOT NULL,
    [Code]                    NVARCHAR (50)  NOT NULL,
    [DisplayName]             NVARCHAR (200) NULL,
    [SubTitle]                NVARCHAR (200) NULL,
    [StartDate]               DATETIME       NULL,
    [EndDate]                 DATETIME       NULL,
    [GetProductsFromExternal] BIT            CONSTRAINT [DF_Showcase_TakeProductsFromExternal] DEFAULT ((0)) NOT NULL,
    [IsActive]                BIT            NOT NULL,
    [CreateUserID]            INT            NOT NULL,
    [CreateTime]              DATETIME       CONSTRAINT [DF_Showcase_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]            INT            NOT NULL,
    [UpdateTime]              DATETIME       CONSTRAINT [DF_Showcase_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Showcase] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Showcase_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID])
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Showcase]
    ON [PRD].[Showcase]([Code] ASC);

