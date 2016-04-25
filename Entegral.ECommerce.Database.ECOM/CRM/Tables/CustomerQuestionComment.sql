CREATE TABLE [CRM].[CustomerQuestionComment] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [CustomerQuestionID] INT            NOT NULL,
    [Comment]            NVARCHAR (MAX) NOT NULL,
    [IsActive]           BIT            NOT NULL,
    [CreateUserID]       INT            NOT NULL,
    [CreateTime]         DATETIME       CONSTRAINT [DF_CustomerQuestionComment_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT            NOT NULL,
    [UpdateTime]         DATETIME       CONSTRAINT [DF_CustomerQuestionComment_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_CustomerQuestionsComment] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_CustomerQuestionComment_CustomerQuestion] FOREIGN KEY ([CustomerQuestionID]) REFERENCES [CRM].[CustomerQuestion] ([ID])
);







