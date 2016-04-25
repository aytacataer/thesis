CREATE TABLE [CRM].[ProfileItem] (
    [ID]                       INT      IDENTITY (1, 1) NOT NULL,
    [ProfileID]                INT      NOT NULL,
    [MyProfileSettingOptionID] INT      NOT NULL,
    [IsActive]                 BIT      NOT NULL,
    [CreateUserID]             INT      NOT NULL,
    [CreateTime]               DATETIME NOT NULL,
    [UpdateUserID]             INT      NOT NULL,
    [UpdateTime]               DATETIME NOT NULL,
    CONSTRAINT [PK_ProfileItem] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProfileItem_MyProfileSettingOptions] FOREIGN KEY ([MyProfileSettingOptionID]) REFERENCES [LK].[MyProfileSettingOption] ([ID]),
    CONSTRAINT [FK_ProfileItem_Profile] FOREIGN KEY ([ProfileID]) REFERENCES [CRM].[Profile] ([ID])
);









