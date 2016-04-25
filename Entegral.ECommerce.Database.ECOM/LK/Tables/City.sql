CREATE TABLE [LK].[City] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [ExternalSystemCode] NVARCHAR (50) NULL,
    [CountryID]          INT           NOT NULL,
    [Name]               NVARCHAR (50) NOT NULL,
    [DisplayOrder]       INT           CONSTRAINT [DF_City_DisplayOrder] DEFAULT ((0)) NOT NULL,
    [IsActive]           BIT           CONSTRAINT [DF_City_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]       INT           NOT NULL,
    [CreateTime]         DATETIME      CONSTRAINT [DF_City_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT           NOT NULL,
    [UpdateTime]         DATETIME      CONSTRAINT [DF_City_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_City_Country] FOREIGN KEY ([CountryID]) REFERENCES [LK].[Country] ([ID])
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_City_ExternalSystemCode]
    ON [LK].[City]([ExternalSystemCode] ASC);

