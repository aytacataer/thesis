CREATE TABLE [LK].[Atribute] (
    [ID]                              INT            IDENTITY (1, 1) NOT NULL,
    [CodeName]                        VARCHAR (100)  NOT NULL,
    [ExternalSystemCode]              VARCHAR (50)   NOT NULL,
    [DisplayName]                     NVARCHAR (100) NULL,
    [Style]                           NVARCHAR (100) NULL,
    [DisplayOrder]                    INT            CONSTRAINT [DF_Atribute_DisplayOrder] DEFAULT ((0)) NOT NULL,
    [DefaultOptionSort]               SMALLINT       CONSTRAINT [DF_Atribute_DefaultOptionSort] DEFAULT ((0)) NOT NULL,
    [AttributeDisplayType]            NVARCHAR (50)  NULL,
    [IsClassification]                BIT            CONSTRAINT [DF_Atribute_IsClassification] DEFAULT ((0)) NOT NULL,
    [IsVisibleToCustomer]             BIT            CONSTRAINT [DF_Atribute_IsVisibleToCustomer] DEFAULT ((0)) NOT NULL,
    [IsVisibleOnMobile]               BIT            CONSTRAINT [DF_Atribute_IsVisibleOnMobile] DEFAULT ((1)) NOT NULL,
    [IsVisibleOnWeb]                  BIT            CONSTRAINT [DF_Atribute_IsVisibleOnWeb] DEFAULT ((1)) NOT NULL,
    [IsVariant]                       BIT            CONSTRAINT [DF_Atribute_IsVariant] DEFAULT ((0)) NOT NULL,
    [IsFilter]                        BIT            CONSTRAINT [DF_Atribute_IsFilter] DEFAULT ((0)) NOT NULL,
    [IsSearchAttribute]               BIT            CONSTRAINT [DF_Atribute_IsSearchAttribute] DEFAULT ((0)) NOT NULL,
    [IsLookup]                        BIT            CONSTRAINT [DF_Atribute_IsLookup] DEFAULT ((0)) NOT NULL,
    [IsImageSwitcher]                 BIT            CONSTRAINT [DF_Atribute_IsImageSwitcher] DEFAULT ((0)) NOT NULL,
    [IsDetailAtribute]                BIT            CONSTRAINT [DF_Atribute_IsDetailAtribute] DEFAULT ((0)) NOT NULL,
    [IsAttributeManagedByIntegration] BIT            CONSTRAINT [DF_Atribute_IsAtributeManagedByIntegration] DEFAULT ((1)) NOT NULL,
    [IsTemplateAttribute]             BIT            CONSTRAINT [DF_Atribute_IsTemplateAttribute] DEFAULT ((0)) NOT NULL,
    [IsForbidden]                     BIT            CONSTRAINT [DF_Atribute_IsForbidden] DEFAULT ((0)) NOT NULL,
    [IsActive]                        BIT            CONSTRAINT [DF_Atribute_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]                    INT            NOT NULL,
    [CreateTime]                      DATETIME       CONSTRAINT [DF_Atribute_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]                    INT            NOT NULL,
    [UpdateTime]                      DATETIME       CONSTRAINT [DF_Atribute_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Atribute] PRIMARY KEY CLUSTERED ([ID] ASC)
);












































GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Atribute_ExternalSystemCode]
    ON [LK].[Atribute]([ExternalSystemCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Atribute_IsActive]
    ON [LK].[Atribute]([IsActive] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Attribute_Visible]
    ON [LK].[Atribute]([IsVisibleToCustomer] ASC, [IsActive] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Atribute_CodeName]
    ON [LK].[Atribute]([CodeName] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Atribute_Filter]
    ON [LK].[Atribute]([IsActive] ASC, [IsFilter] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Atribute_Detail]
    ON [LK].[Atribute]([IsActive] ASC, [IsDetailAtribute] ASC);

