


















CREATE VIEW [PRD].[vBO_Category]
AS
	SELECT C.ID,
		   C.Code,
		   C.StoreID,
		   C.ParentCategoryID,
		   C.ShortName,
		   C.DisplayName,
		   C.Description,
		   C.MetaDescription,
		   c.MetaKeywords,
		   c.PageTitle,
		   C.CustomURL,
		   C.FriendlyURI,
		   C.IsVisible,
		   C.VisibilityStartDate,
		   C.VisibilityEndDate,
		   C.ShowLeftMenu,
		   C.ShowOnLeftMenu,
		   C.ShowOnTopMenu,
		   C.DisplayOrder,
		   C.DefaultSort ,
		   C.DefaultSortAttributeCode,
		   C.ProductListingPageSize,
		   C.ShowProducts,
		   C.ShowSubCategoryProducts,
		   C.ShowContentTemplates,
		   c.IsNotHyperlink,
		   c.IsOpenNewPage,
		   C.IsProductsManagedByIntegration,
		   C.IsNotVisibleOnMobile,
		   C.IsUseInfoInSeo,
		   C.IsShowBrandsPageOnWeb,
		   C.IsShowBrandsPageOnMobile,
		   C.IsBrandCategory,
		   C.ShowFilters,
		   C.ShowOnlySaleProducts,
		   C.ShowOnlyNewProducts,
		   C.ShowSubCategoryOnTopMenu,
		   C.ShowOnProductFeed,
		   C.UseSubCategoriesAsFilter,
		   C.IsCollapsedOnTopMenu,
		   C.IsDiscountRateDisplayed,
		   C.IsActive,
		   C.CreateUserID,
		   C.CreateTime,
		   C.UpdateUserID,
		   C.UpdateTime,
		   C.ImagePath,
		   S.Name AS StoreName,
		   C.ShowSubCategoriesOnTopMenuHover
	FROM PRD.Category AS C
	INNER JOIN LK.Store AS S ON S.ID = C.StoreID
