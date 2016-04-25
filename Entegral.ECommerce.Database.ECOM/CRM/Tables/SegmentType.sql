CREATE TABLE [CRM].[SegmentType] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [StoreID]      INT            NOT NULL,
    [Code]         NVARCHAR (50)  NULL,
    [DisplayName]  NVARCHAR (255) NULL,
    [IsActive]     BIT            CONSTRAINT [DF_SegmentType_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT            CONSTRAINT [DF__SegmentTy__Creat__15B0212B] DEFAULT ((0)) NOT NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_SegmentType_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT            CONSTRAINT [DF__SegmentTy__Updat__1798699D] DEFAULT ((0)) NOT NULL,
    [UpdateTime]   DATETIME       CONSTRAINT [DF_SegmentType_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_SegmentType] PRIMARY KEY CLUSTERED ([ID] ASC)
);

