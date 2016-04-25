CREATE TABLE [PRD].[Category] (
    [ID]                              INT             IDENTITY (1, 1) NOT NULL,
    [Code]                            VARCHAR (100)   NOT NULL,
    [StoreID]                         INT             NOT NULL,
    [ParentCategoryID]                INT             NULL,
    [ShortName]                       NVARCHAR (100)  NOT NULL,
    [DisplayName]                     NVARCHAR (100)  NOT NULL,
    [Description]                     NVARCHAR (1000) NULL,
    [MetaKeywords]                    NVARCHAR (500)  NULL,
    [MetaDescription]                 NVARCHAR (500)  NULL,
    [PageTitle]                       NVARCHAR (100)  NULL,
    [CustomURL]                       NVARCHAR (500)  NULL,
    [FriendlyURI]                     NVARCHAR (500)  NOT NULL,
    [IsVisible]                       BIT             NOT NULL,
    [VisibilityStartDate]             DATETIME        NOT NULL,
    [VisibilityEndDate]               DATETIME        NOT NULL,
    [ShowOnLeftMenu]                  BIT             CONSTRAINT [DF_Category_ShowOnLeftMenu] DEFAULT ((1)) NOT NULL,
    [ShowLeftMenu]                    BIT             NOT NULL,
    [ShowOnTopMenu]                   BIT             CONSTRAINT [DF_Category_ShowOnTopMenu] DEFAULT ((1)) NOT NULL,
    [ShowFilters]                     BIT             CONSTRAINT [DF_Category_HideFilters] DEFAULT ((1)) NOT NULL,
    [DisplayOrder]                    INT             CONSTRAINT [DF_Category_DisplayOrder] DEFAULT ((0)) NOT NULL,
    [DefaultSort]                     SMALLINT        CONSTRAINT [DF_Category_DefaultSort] DEFAULT ((0)) NOT NULL,
    [DefaultSortAttributeCode]        NVARCHAR (50)   NULL,
    [ShowProducts]                    BIT             CONSTRAINT [DF_Category_ShowProduct] DEFAULT ((1)) NOT NULL,
    [ShowSubCategoryProducts]         BIT             CONSTRAINT [DF_Category_ShowSubCategoryProduct] DEFAULT ((0)) NOT NULL,
    [ShowContentTemplates]            BIT             CONSTRAINT [DF_Category_ShowContentTemplate] DEFAULT ((0)) NOT NULL,
    [ProductListingPageSize]          INT             CONSTRAINT [DF_Category_ProductListingPageSize] DEFAULT ((0)) NOT NULL,
    [IsOpenNewPage]                   BIT             CONSTRAINT [DF_Category_IsOpenNewPage] DEFAULT ((0)) NOT NULL,
    [IsNotHyperlink]                  BIT             CONSTRAINT [DF_Category_IsNotHyperlink] DEFAULT ((0)) NOT NULL,
    [IsNotVisibleOnMobile]            BIT             CONSTRAINT [DF_Category_IsNotVisibleOnMobile] DEFAULT ((0)) NOT NULL,
    [IsProductsManagedByIntegration]  BIT             CONSTRAINT [DF__Category__IsProd__314D4EA8] DEFAULT ((1)) NOT NULL,
    [IsUseInfoInSeo]                  BIT             CONSTRAINT [DF__Category__IsUseI__324172E1] DEFAULT ((0)) NOT NULL,
    [IsShowBrandsPageOnWeb]           BIT             CONSTRAINT [DF__Category__IsShowBrandsPage] DEFAULT ((0)) NOT NULL,
    [IsShowBrandsPageOnMobile]        BIT             CONSTRAINT [DF_Category_IsShowBrandsPageOnMobile] DEFAULT ((0)) NOT NULL,
    [IsBrandCategory]                 BIT             CONSTRAINT [DF_Category_IsBrandCategory] DEFAULT ((0)) NOT NULL,
    [ShowOnlySaleProducts]            BIT             CONSTRAINT [DF_Category_ShowSaleProducts] DEFAULT ((0)) NOT NULL,
    [ShowOnlyNewProducts]             BIT             CONSTRAINT [DF_Category_ShowNewProducts] DEFAULT ((0)) NOT NULL,
    [ShowSubCategoryOnTopMenu]        BIT             CONSTRAINT [DF_Category_ShowSubCategoryOnTopMenu] DEFAULT ((0)) NOT NULL,
    [UseSubCategoriesAsFilter]        BIT             CONSTRAINT [DF_Category_UseAsFilter] DEFAULT ((0)) NOT NULL,
    [ShowOnProductFeed]               BIT             CONSTRAINT [DF_Category_ShowOnProductFeed] DEFAULT ((0)) NOT NULL,
    [IsActive]                        BIT             NOT NULL,
    [IsCollapsedOnTopMenu]            BIT             CONSTRAINT [DF_Category_IsCollapsedOnTopMenu] DEFAULT ((0)) NOT NULL,
    [IsDiscountRateDisplayed]         BIT             CONSTRAINT [DF_Category_IsDiscountRateDisplayed] DEFAULT ((1)) NOT NULL,
    [CreateUserID]                    INT             NOT NULL,
    [CreateTime]                      DATETIME        CONSTRAINT [DF_Category_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]                    INT             NOT NULL,
    [UpdateTime]                      DATETIME        CONSTRAINT [DF_Category_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    [ImagePath]                       NVARCHAR (255)  NULL,
    [IsRedirectCategoryIndexPage]     BIT             NOT NULL,
    [ShowSubCategoriesOnTopMenuHover] BIT             CONSTRAINT [DF_Category_ShowSubCategoriesOnTopMenuHover] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Category_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID])
);














































































GO
CREATE NONCLUSTERED INDEX [IX_Category_ParentCategory]
    ON [PRD].[Category]([ParentCategoryID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Category_IsActive]
    ON [PRD].[Category]([IsActive] ASC);

GO
CREATE NONCLUSTERED INDEX [IX_Category_IsBrandCategory]
    ON [PRD].[Category]([IsBrandCategory] ASC)
    INCLUDE([ID], [Code], [StoreID], [ParentCategoryID]);

GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Category_Code]
    ON [PRD].[Category]([StoreID] ASC, [Code] ASC);


GO


