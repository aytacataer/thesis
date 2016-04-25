CREATE TABLE [CRM].[CustomerQuestion] (
    [ID]                            INT             IDENTITY (1, 1) NOT NULL,
    [CustomerID]                    INT             NULL,
    [FirstName]                     NVARCHAR (255)  NOT NULL,
    [LastName]                      NVARCHAR (255)  NOT NULL,
    [EMail]                         NVARCHAR (255)  NOT NULL,
    [Phone]                         NVARCHAR (50)   NULL,
    [Header]                        NVARCHAR (255)  NOT NULL,
    [Description]                   NVARCHAR (1000) NOT NULL,
    [ReturnType]                    NVARCHAR (50)   NOT NULL,
    [CustomerQuestionStatusCode]    NVARCHAR (50)   NULL,
    [ProductID]                     INT             CONSTRAINT [DF__CustomerQ__Produ__57A801BA] DEFAULT ((0)) NULL,
    [ProductLink]                   NVARCHAR (255)  NULL,
    [IsTransferredToExternalSystem] BIT             CONSTRAINT [DF_CustomerQuestion_IsTransferredToExternalSystem] DEFAULT ((0)) NOT NULL,
    [CreateUserID]                  INT             CONSTRAINT [DF__CustomerQ__Creat__589C25F3] DEFAULT ((0)) NOT NULL,
    [CreateTime]                    DATETIME        CONSTRAINT [DF_CustomerQuestion_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]                  INT             CONSTRAINT [DF__CustomerQ__Updat__56B3DD81] DEFAULT ((0)) NOT NULL,
    [UpdateTime]                    DATETIME        CONSTRAINT [DF_CustomerQuestion_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_CustomerQuestions] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_CustomerQuestion_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [CRM].[Customer] ([ID]),
    CONSTRAINT [FK_CustomerQuestion_CustomerQuestionStatus] FOREIGN KEY ([CustomerQuestionStatusCode]) REFERENCES [LK].[CustomerQuestionStatus] ([Code])
);















