CREATE TABLE [PRD].[Category_Banner] (
    [ID]           INT      IDENTITY (1, 1) NOT NULL,
    [CategoryID]   INT      NOT NULL,
    [BannerID]     INT      NOT NULL,
	[IsMenuItem]   BIT		DEFAULT((0))	NOT NULL,
	[IsListItem]   BIT		DEFAULT((1))	NOT NULL,
    [DisplayOrder] SMALLINT NOT NULL,
    CONSTRAINT [PK_Category_Banner] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Category_Banner_Banner] FOREIGN KEY ([BannerID]) REFERENCES [CMS].[Banner] ([ID]),
    CONSTRAINT [FK_Category_Banner_Category] FOREIGN KEY ([CategoryID]) REFERENCES [PRD].[Category] ([ID])
);

