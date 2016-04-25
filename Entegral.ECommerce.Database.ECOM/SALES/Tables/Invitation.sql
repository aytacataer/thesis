CREATE TABLE [SALES].[Invitation] (
    [ID]                      UNIQUEIDENTIFIER NOT NULL,
    [StoreID]                 INT              NOT NULL,
    [InvitorID]               INT              NOT NULL,
    [IsLinkVisited]           BIT              CONSTRAINT [DF_Invitation_IsLinkVisited] DEFAULT ((0)) NOT NULL,
    [InvitedID]               INT              NULL,
    [InvitedEmail]            NVARCHAR (255)   NULL,
    [InvitorCouponCode]       NVARCHAR (200)   NULL,
    [InvitedCouponCode]       NVARCHAR (200)   NULL,
    [InvitationDate]          DATETIME         NOT NULL,
    [InvitedRegistrationDate] DATETIME         NULL,
    [InvitedShoppingDate]     DATETIME         NULL,
    [InvitorNote]             NVARCHAR (MAX)   NULL,
    [IsActive]                BIT              CONSTRAINT [DF_Invitation_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Invitation] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Invitation_Customer] FOREIGN KEY ([InvitorID]) REFERENCES [CRM].[Customer] ([ID]),
    CONSTRAINT [FK_Invitation_Customer1] FOREIGN KEY ([InvitedID]) REFERENCES [CRM].[Customer] ([ID]),
    CONSTRAINT [FK_Invitation_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID])
);













