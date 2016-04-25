CREATE TABLE [PRD].[ProductMediaFile] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [SizeID]         INT            NULL,
    [ProductMediaID] INT            NOT NULL,
    [CDNPath]        NVARCHAR (255) NOT NULL,
    [CreateUserID]   INT            CONSTRAINT [DF_ProductMediaFile_CreateUserID] DEFAULT ((0)) NOT NULL,
    [CreateTime]     DATETIME       CONSTRAINT [DF_ProductMediaFile_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_ProductMediaFile] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProductMediaFile_MediaSize] FOREIGN KEY ([SizeID]) REFERENCES [LK].[MediaSize] ([ID]),
    CONSTRAINT [FK_ProductMediaFile_ProductMedia] FOREIGN KEY ([ProductMediaID]) REFERENCES [PRD].[ProductMedia] ([ID]),
    CONSTRAINT [IX_ProductMediaFile_Unique] UNIQUE NONCLUSTERED ([ProductMediaID] ASC, [SizeID] ASC, [CDNPath] ASC)
);










GO
CREATE NONCLUSTERED INDEX [IX_ProductMediaFile_SizeID]
    ON [PRD].[ProductMediaFile]([SizeID] ASC)
    INCLUDE([ProductMediaID]);


GO
CREATE NONCLUSTERED INDEX [Index_ProductMediaFile_SizeID]
    ON [PRD].[ProductMediaFile]([SizeID] ASC)
    INCLUDE([ProductMediaID], [CDNPath]);

