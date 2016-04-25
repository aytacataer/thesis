CREATE TABLE [CMS].[SliderItem] (
    [ID]           INT      IDENTITY (1, 1) NOT NULL,
    [SliderID]     INT      NOT NULL,
    [EntityType]   CHAR (1) NOT NULL,
    [EntityID]     INT      NOT NULL,
    [DisplayOrder] SMALLINT NOT NULL,
    [CreateUserID] INT      NOT NULL,
    [CreateTime]   DATETIME CONSTRAINT [DF_SliderItem_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT      NOT NULL,
    [UpdateTime]   DATETIME CONSTRAINT [DF_SliderItem_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_SliderItem] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_SliderItem_Slider] FOREIGN KEY ([SliderID]) REFERENCES [CMS].[Slider] ([ID])
);

