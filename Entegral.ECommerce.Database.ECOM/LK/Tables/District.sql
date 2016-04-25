CREATE TABLE [LK].[District] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [CityID]             INT           NOT NULL,
    [ExternalSystemCode] NVARCHAR (50) NULL,
    [Name]               NVARCHAR (50) NOT NULL,
    [DisplayOrder]       INT           CONSTRAINT [DF_District_DisplayOrder] DEFAULT ((0)) NOT NULL,
    [IsActive]           BIT           CONSTRAINT [DF_District_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]       INT           NOT NULL,
    [CreateTime]         DATETIME      CONSTRAINT [DF_District_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT           NOT NULL,
    [UpdateTime]         DATETIME      CONSTRAINT [DF_District_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_District_City] FOREIGN KEY ([CityID]) REFERENCES [LK].[City] ([ID])
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_District_ExternalSystemCode]
    ON [LK].[District]([ExternalSystemCode] ASC);

