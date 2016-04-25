CREATE TABLE [LK].[OACStatusMapping] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [StatusCodeID]      INT            NOT NULL,
    [PackageStatusCode] NVARCHAR (255) NOT NULL,
    [IsActive]          BIT            NOT NULL,
    [CreateUserID]      INT            NOT NULL,
    [CreateTime]        DATETIME       NOT NULL,
    [UpdateUserID]      INT            NOT NULL,
    [UpdateTime]        DATETIME       NOT NULL,
    CONSTRAINT [PK_OACStatusMapping] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_OACStatusMapping_StatusCode] FOREIGN KEY ([StatusCodeID]) REFERENCES [LK].[StatusCode] ([ID])
);

