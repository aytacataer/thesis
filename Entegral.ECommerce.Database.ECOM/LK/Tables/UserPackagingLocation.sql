CREATE TABLE [LK].[UserPackagingLocation] (
    [ID]					 INT           IDENTITY (1, 1) NOT NULL,
    [UserName]				 NVARCHAR (25) NOT NULL,
    [PackagingLocationID]	 INT           NOT NULL,
    [CanCreateReturnInvoice] BIT DEFAULT ((0)) NOT NULL, 
    CONSTRAINT [PK_UserPackagingLocation] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_UserPackagingLocation_PackagingLocation] FOREIGN KEY ([PackagingLocationID]) REFERENCES [LK].[PackagingLocation] ([ID])
);

