CREATE TABLE [CRM].[CustomerSegment] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [CustomerID]    INT            NOT NULL,
    [SegmentTypeID] INT            NULL,
    [SegmentValue]  NVARCHAR (255) NULL,
    [Priority]      INT            CONSTRAINT [DF_CustomerSegment_Priority] DEFAULT ((0)) NOT NULL,
    [IsActive]      BIT            CONSTRAINT [DF_CustomerSegment_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]  INT            CONSTRAINT [DF__CustomerS__Creat__1C5D1EBA] DEFAULT ((0)) NOT NULL,
    [CreateTime]    DATETIME       CONSTRAINT [DF_CustomerSegment_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]  INT            CONSTRAINT [DF__CustomerS__Updat__1E45672C] DEFAULT ((0)) NOT NULL,
    [UpdateTime]    DATETIME       CONSTRAINT [DF_CustomerSegment_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_CustomerSegment] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_CustomerSegment_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [CRM].[Customer] ([ID]),
    CONSTRAINT [FK_CustomerSegment_SegmentType] FOREIGN KEY ([SegmentTypeID]) REFERENCES [CRM].[SegmentType] ([ID])
);

