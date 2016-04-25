CREATE TABLE [LK].[OACReturnReasonMapping] (
    [ID]                      INT            IDENTITY (1, 1) NOT NULL,
    [ReturnReasonID]          INT            NOT NULL,
    [PackageReturnReasonCode] NVARCHAR (255) NOT NULL,
    [IsActive]                BIT            NOT NULL,
    [CreateUserID]            INT            NOT NULL,
    [CreateTime]              DATETIME       NOT NULL,
    [UpdateUserID]            INT            NOT NULL,
    [UpdateTime]              DATETIME       NOT NULL,
    CONSTRAINT [PK_OACReturnReasonMapping] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_OACReturnReasonMapping_ReturnReason] FOREIGN KEY ([ReturnReasonID]) REFERENCES [LK].[ReturnReason] ([ID])
);

