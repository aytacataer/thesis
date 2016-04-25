CREATE TABLE [PRD].[Product] (
    [ID]                         INT             IDENTITY (1, 1) NOT NULL,
    [ExternalSystemCode]         NVARCHAR (50)   NOT NULL,
    [DisplayName]                NVARCHAR (150)  NOT NULL,
    [DisplayOrder]               INT             CONSTRAINT [DF_Product_DisplayOrder] DEFAULT ((0)) NOT NULL,
    [Description]                NVARCHAR (1000) NULL,
    [FriendlyURI]                NVARCHAR (500)  NOT NULL,
    [MetaKeywords]               NVARCHAR (1000) NULL,
    [MetaDescription]            NVARCHAR (1000) NULL,
    [PageTitle]                  NVARCHAR (100)  NULL,
    [VatRate]                    INT             NOT NULL,
    [Score]                      DECIMAL (6, 2)  CONSTRAINT [DF_Product_Score] DEFAULT ((0)) NOT NULL,
    [IsDiscountForbidden]        BIT             CONSTRAINT [DF_Product_IsDiscountForbidden] DEFAULT ((0)) NOT NULL,
    [IsReturnForbidden]          BIT             CONSTRAINT [DF_Product_IsReturnForbidden] DEFAULT ((0)) NOT NULL,
    [IsGiftCard]                 BIT             CONSTRAINT [DF__Product__IsGiftC__689D8392] DEFAULT ((0)) NOT NULL,
    [IsUseInfoInSeo]             BIT             CONSTRAINT [DF__Product__IsUseIn__67A95F59] DEFAULT ((0)) NOT NULL,
    [IsActive]                   BIT             CONSTRAINT [DF_Product_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]               INT             NOT NULL,
    [CreateTime]                 DATETIME        CONSTRAINT [DF_Product_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]               INT             NOT NULL,
    [UpdateTime]                 DATETIME        CONSTRAINT [DF_Product_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    [IsCreatedByIntegration]     BIT             CONSTRAINT [DF_Product_IsCreatedByIntegration] DEFAULT ((0)) NULL,
    [IsPreOrder]                 BIT             CONSTRAINT [DF_Product_IsPreOrder] DEFAULT ((0)) NOT NULL,
    [EstimatedSupplyDate]        DATETIME        NULL,
    [DontUpdateStockFromCentral] BIT             CONSTRAINT [DF_Product_DontUpdateStockFromCentral] DEFAULT ((0)) NOT NULL,
    [ShowOnProductFeed]          BIT             CONSTRAINT [DF_Product_ShowOnProductFeed] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([ID] ASC)
);




































GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Product_ExternalSystemCode]
    ON [PRD].[Product]([ExternalSystemCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Product_IsActive]
    ON [PRD].[Product]([IsActive] ASC);


GO
CREATE NONCLUSTERED INDEX [Index_ProductMediaFile_DontUpdateStockFromCentral]
    ON [PRD].[Product]([DontUpdateStockFromCentral] ASC)
    INCLUDE([ID]);


GO
CREATE NONCLUSTERED INDEX [Index_ProductMediaFile_CreateTime]
    ON [PRD].[Product]([CreateTime] ASC)
    INCLUDE([ID], [IsActive]);

