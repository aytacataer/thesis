CREATE TABLE [LK].[EducationLevel] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [ExternalSystemCode] NVARCHAR (50)  NULL,
    [Name]               NVARCHAR (200) NOT NULL,
    [IsActive]           BIT            CONSTRAINT [DF_EducationLevel_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]       INT            NOT NULL,
    [CreateTime]         DATETIME       CONSTRAINT [DF_EducationLevel_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT            NOT NULL,
    [UpdateTime]         DATETIME       CONSTRAINT [DF_EducationLevel_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_EducationLevel] PRIMARY KEY CLUSTERED ([ID] ASC)
);



