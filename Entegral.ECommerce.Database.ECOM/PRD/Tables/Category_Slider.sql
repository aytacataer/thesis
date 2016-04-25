CREATE TABLE [PRD].[Category_Slider] (
    [ID]           INT      IDENTITY (1, 1) NOT NULL,
    [CategoryID]   INT      NOT NULL,
    [SliderID]     INT      NOT NULL,
    [DisplayOrder] SMALLINT NOT NULL,
    CONSTRAINT [PK_Category_Slider] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Category_Slider_Category] FOREIGN KEY ([CategoryID]) REFERENCES [PRD].[Category] ([ID]),
    CONSTRAINT [FK_Category_Slider_Slider] FOREIGN KEY ([SliderID]) REFERENCES [CMS].[Slider] ([ID])
);




GO
CREATE NONCLUSTERED INDEX [IX_Category_Slider_CategoryID]
    ON [PRD].[Category_Slider]([CategoryID] ASC);

