CREATE TABLE [PRD].[Category_Content] (
    [ID]           INT      IDENTITY (1, 1) NOT NULL,
    [CategoryID]   INT      NOT NULL,
    [ContentID]    INT      NOT NULL,
    [IsMenuItem]   BIT      DEFAULT ((0)) NOT NULL,
    [IsListItem]   BIT      DEFAULT ((1)) NOT NULL,
    [DisplayOrder] SMALLINT NOT NULL,
    CONSTRAINT [PK_Category_Content] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Category_Content_Category] FOREIGN KEY ([CategoryID]) REFERENCES [PRD].[Category] ([ID]),
    CONSTRAINT [FK_Category_Content_Content] FOREIGN KEY ([ContentID]) REFERENCES [CMS].[Content] ([ID])
);




GO
CREATE NONCLUSTERED INDEX [IX_Category_Content_CategoryID]
    ON [PRD].[Category_Content]([CategoryID] ASC);

