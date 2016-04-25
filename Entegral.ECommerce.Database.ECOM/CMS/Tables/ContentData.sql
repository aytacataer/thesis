CREATE TABLE [CMS].[ContentData] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [ContentID]         INT            NOT NULL,
    [ContentDeviceType] CHAR (1)       NOT NULL,
    [Body]              NVARCHAR (MAX) NOT NULL,
    [IsActive]          BIT            CONSTRAINT [DF_ContentData_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]      INT            NOT NULL,
    [CreateTime]        DATETIME       CONSTRAINT [DF_ContentData_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]      INT            NOT NULL,
    [UpdateTime]        DATETIME       CONSTRAINT [DF_ContentData_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_ContentData] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ContentData_Content] FOREIGN KEY ([ContentID]) REFERENCES [CMS].[Content] ([ID])
);

