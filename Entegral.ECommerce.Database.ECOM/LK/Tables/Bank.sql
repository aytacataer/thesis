CREATE TABLE [LK].[Bank] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [StoreID]            INT            NOT NULL,
    [DisplayName]        NVARCHAR (50)  NOT NULL,
    [ExternalSystemCode] NVARCHAR (50)  NOT NULL,
    [Priority]           INT            CONSTRAINT [DF_Bank_Priority] DEFAULT ((1)) NOT NULL,
    [SystemCode]         VARCHAR (30)   NOT NULL,
    [ImageUrl]           NVARCHAR (255) NULL,
    [SuccessUrl]         NVARCHAR (255) NULL,
    [FailUrl]            NVARCHAR (255) NULL,
    [Host]               NVARCHAR (255) NULL,
    [Host3DPay]          NVARCHAR (255) NULL,
    [Name]               NVARCHAR (100) NULL,
    [Password]           NVARCHAR (100) NULL,
    [ClientID]           NVARCHAR (50)  NULL,
    [Storekey]           NVARCHAR (50)  NULL,
    [TerminalID]         NVARCHAR (50)  NULL,
    [IsSupports3D]       BIT            CONSTRAINT [DF_Bank_IsSupports3D] DEFAULT ((0)) NOT NULL,
    [IsActive]           BIT            CONSTRAINT [DF_Bank_IsActive1] DEFAULT ((1)) NOT NULL,
    [IsBKMActive]        BIT            CONSTRAINT [DF_Bank_IsBKMActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]       INT            NOT NULL,
    [CreateTime]         DATETIME       CONSTRAINT [DF_Bank_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]       INT            NOT NULL,
    [UpdateTime]         DATETIME       CONSTRAINT [DF_Bank_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Bank_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID]),
    CONSTRAINT [IX_Bank] UNIQUE NONCLUSTERED ([StoreID] ASC, [SystemCode] ASC)
);













