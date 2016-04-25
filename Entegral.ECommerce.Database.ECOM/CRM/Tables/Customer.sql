CREATE TABLE [CRM].[Customer] (
    [ID]                                  INT              IDENTITY (1, 1) NOT NULL,
    [StoreID]                             INT              CONSTRAINT [DF_Customer_StoreID] DEFAULT ((0)) NOT NULL,
    [GUID]                                UNIQUEIDENTIFIER NOT NULL,
    [ExternalSystemCode]                  NVARCHAR (50)    NULL,
    [EmailInteractionValidationGUID]      UNIQUEIDENTIFIER NULL,
    [Email]                               NVARCHAR (255)   NOT NULL,
    [Password]                            NVARCHAR (50)    NOT NULL,
    [FirstName]                           NVARCHAR (255)   NOT NULL,
    [LastName]                            NVARCHAR (255)   NOT NULL,
    [GenderID]                            INT              NOT NULL,
    [MaritalStatusID]                     INT              NULL,
    [EducationLevelID]                    INT              NULL,
    [JobID]                               INT              NULL,
    [Birthday]                            DATETIME         NULL,
    [CellPhone]                           VARCHAR (20)     NULL,
    [LoyaltyCardNumber]                   NVARCHAR (50)    NULL,
    [RegistrationOrigin]                  CHAR (1)         CONSTRAINT [DF_Customer_RegistrationOrigin] DEFAULT ('W') NOT NULL,
    [RegisterIpAddress]                   NVARCHAR (100)   NULL,
    [IsActivatedByEmail]                  BIT              CONSTRAINT [DF_Customer_IsActivatedByEmail] DEFAULT ((0)) NOT NULL,
    [IsTransferredToExternalSystem]       BIT              CONSTRAINT [DF_Customer_IsTransferredToExternalSystem] DEFAULT ((0)) NOT NULL,
    [ExternalSystemTransferTime]          DATETIME         NULL,
    [StockOutCampaignAppliedStores]       NVARCHAR (30)    NULL,
    [IsTestCustomer]                      BIT              CONSTRAINT [DF_Customer_IsTestCustomer] DEFAULT ((0)) NOT NULL,
    [IsGuestCustomer]                     BIT              CONSTRAINT [DF_Customer_IsGuestCustomer] DEFAULT ((0)) NOT NULL,
    [IsSuspiciousCustomer]                BIT              CONSTRAINT [DF_Customer_IsSuspiciousCustomer] DEFAULT ((0)) NOT NULL,
    [ReceiveCampaignMessages]             BIT              CONSTRAINT [DF_Customer_ReceiveCampaignMessages] DEFAULT ((1)) NOT NULL,
    [ReceiveCampaignMessageUnCheckDate]   DATETIME         NULL,
    [ReceiveCampaignMailVerificationCode] UNIQUEIDENTIFIER NULL,
    [ReceiveCampaignMailVerificationTime] DATETIME         NULL,
    [ReceiveCampaignMailIsVerified]       BIT              CONSTRAINT [DF_Customer_ReceiveCampaignMailIsVerified] DEFAULT ((0)) NOT NULL,
    [ReceiveCampaignMailIpAddress]        VARCHAR (50)     NULL,
    [FacebookID]                          NVARCHAR (100)   NULL,
    [ShoeSize]                            NVARCHAR (50)    NULL,
    [BodySize]                            NVARCHAR (50)    NULL,
    [CustomerCancelReasonID]              INT              NULL,
    [CancelReasonText]                    NVARCHAR (500)   NULL,
    [IsActive]                            BIT              CONSTRAINT [DF_Customer_IsActive] DEFAULT ((1)) NOT NULL,
    [CreateUserID]                        INT              NOT NULL,
    [CreateTime]                          DATETIME         CONSTRAINT [DF_Customer_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]                        INT              NOT NULL,
    [UpdateTime]                          DATETIME         CONSTRAINT [DF_Customer_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Customer_Gender] FOREIGN KEY ([GenderID]) REFERENCES [LK].[Gender] ([ID]),
    CONSTRAINT [FK_Customer_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID]),
    CONSTRAINT [IX_Customer_Email] UNIQUE NONCLUSTERED ([Email] ASC)
);


















































GO



GO
CREATE NONCLUSTERED INDEX [IX_Customer_Login]
    ON [CRM].[Customer]([IsActive] ASC, [Email] ASC, [Password] ASC);




GO
CREATE NONCLUSTERED INDEX [IX_Customer_InteractionGUID]
    ON [CRM].[Customer]([EmailInteractionValidationGUID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Customer_GUID]
    ON [CRM].[Customer]([GUID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Customer_ExternalSytemCode]
    ON [CRM].[Customer]([ExternalSystemCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Customer_ExternalSystem]
    ON [CRM].[Customer]([IsTransferredToExternalSystem] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Customer_Password_IsActive]
    ON [CRM].[Customer]([Password] ASC, [IsActive] ASC);
GO


