CREATE TABLE [LK].[MyProfileSetting] (
    [ID]           INT      IDENTITY (1, 1) NOT NULL,
    [AttributeID1] INT      NOT NULL,
    [AttributeID2] INT      NULL,
    [ChoiseLimit]  INT      NOT NULL,
    [DisplayOrder] INT      CONSTRAINT [DF_MyProfile_DisplayOrder] DEFAULT ((0)) NOT NULL,
    [IsActive]     BIT      CONSTRAINT [DF_MyProfile_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT      NOT NULL,
    [CreateTime]   DATETIME CONSTRAINT [DF_MyProfile_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT      NOT NULL,
    [UpdateTime]   DATETIME CONSTRAINT [DF_MyProfile_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_MyProfile] PRIMARY KEY CLUSTERED ([ID] ASC)
);

