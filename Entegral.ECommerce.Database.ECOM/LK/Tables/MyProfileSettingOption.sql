CREATE TABLE [LK].[MyProfileSettingOption] (
    [ID]                 INT      IDENTITY (1, 1) NOT NULL,
    [MyProfileSettingID] INT      NOT NULL,
    [AttributeID1]       INT      NULL,
    [AttributeOptionID1] INT      NULL,
    [AttributeID2]       INT      NULL,
    [AttributeOptionID2] INT      NULL,
    [IsActive]           BIT      CONSTRAINT [DF_MyProfileSettingOptions_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]       INT      NOT NULL,
    [CreateTime]         DATETIME CONSTRAINT [DF_MyProfileSettingOptions_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT      NOT NULL,
    [UpdateTime]         DATETIME CONSTRAINT [DF_MyProfileSettingOptions_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_MyProfileSettingOptions] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_MyProfileSettingOptions_MyProfileSetting] FOREIGN KEY ([MyProfileSettingID]) REFERENCES [LK].[MyProfileSetting] ([ID])
);

