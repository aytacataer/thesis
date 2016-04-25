CREATE TABLE [CRM].[Profile] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [CustomerID]   INT            NOT NULL,
    [Name]         VARCHAR (50)   NOT NULL,
    [Description]  NVARCHAR (250) NULL,
    [IsActive]     BIT            CONSTRAINT [DF_Profile_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID] INT            NOT NULL,
    [CreateTime]   DATETIME       CONSTRAINT [DF_Profile_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID] INT            NOT NULL,
    [UpdateTime]   DATETIME       CONSTRAINT [DF_Profile_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Profile_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [CRM].[Customer] ([ID])
);

