CREATE TABLE [LK].[AttributeOption] (
    [ID]                  INT             IDENTITY (1, 1) NOT NULL,
    [AttributeID]         INT             NOT NULL,
    [AttributeOptionCode] NVARCHAR (50)   NOT NULL,
    [ExternalSystemCode]  NVARCHAR (50)   NOT NULL,
    [DisplayOrder]        INT             CONSTRAINT [DF_AttributeOption_DisplayOrder] DEFAULT ((0)) NOT NULL,
    [ValueText]           NVARCHAR (1000) NOT NULL,
    [VisibleValueText]    NVARCHAR (1000) NULL,
    [Description]         NVARCHAR (1000) NULL,
    [Style]               NVARCHAR (100)  NULL,
    [AttributeLogo]       NVARCHAR (MAX)  NULL,
    [IsDefault]           BIT             CONSTRAINT [DF_AttributeOption_IsDefault] DEFAULT ((0)) NOT NULL,
    [IsActive]            BIT             CONSTRAINT [DF_AttributeOption_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]        INT             NOT NULL,
    [CreateTime]          DATETIME        NOT NULL,
    [UpdateUserID]        INT             NOT NULL,
    [UpdateTime]          DATETIME        CONSTRAINT [DF_AttributeOption_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_AttributeOption] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_AttributeOption_Attribute] FOREIGN KEY ([AttributeID]) REFERENCES [LK].[Atribute] ([ID])
);




















GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AttributeOption_ExternalSystemCode]
    ON [LK].[AttributeOption]([AttributeID] ASC, [ExternalSystemCode] ASC);




GO
CREATE NONCLUSTERED INDEX [IX_AttributeOption_IsActive]
    ON [LK].[AttributeOption]([IsActive] ASC);

