CREATE TABLE [PRD].[Category_ContentTemplate] (
    [ID]                INT      IDENTITY (1, 1) NOT NULL,
    [CategoryID]        INT      NOT NULL,
    [ContentTemplateID] INT      NOT NULL,
    [DisplayOrder]      SMALLINT NOT NULL,
    CONSTRAINT [PK_Category_ContentTemplate] PRIMARY KEY CLUSTERED ([ID] ASC)
);

