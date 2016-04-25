CREATE TABLE [LK].[InvitationConfiguration_Lang] (
    [ID]                  INT            NOT NULL,
    [LanguageID]          INT            NOT NULL,
    [InvitationSlogan]    NVARCHAR (MAX) NOT NULL,
    [InvitationCondition] NVARCHAR (MAX) NOT NULL,
    [InvitationMailText]  NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_InvitationConfiguration_Lang] PRIMARY KEY CLUSTERED ([ID] ASC, [LanguageID] ASC)
);





