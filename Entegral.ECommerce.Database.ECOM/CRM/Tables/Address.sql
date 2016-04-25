CREATE TABLE [CRM].[Address] (
    [ID]                       INT              IDENTITY (1, 1) NOT NULL,
    [CustomerID]               INT              NOT NULL,
    [AddressDescription]       NVARCHAR (30)    NOT NULL,
    [Name]                     NVARCHAR (255)   NOT NULL,
    [AddressText]              NVARCHAR (500)   NOT NULL,
    [Phone]                    NVARCHAR (15)    NULL,
    [Email]                    NVARCHAR (255)   NULL,
    [TaxOffice]                NVARCHAR (100)   NULL,
    [TaxNo]                    NVARCHAR (15)    NULL,
    [CitizenID]                NVARCHAR (15)    NULL,
    [Zip]                      VARCHAR (10)     NULL,
    [CityID]                   INT              NOT NULL,
    [DistrictID]               INT              NOT NULL,
    [TownID]                   INT              NULL,
    [IsDefaultBillingAddress]  BIT              CONSTRAINT [DF_Address_BillingAddress] DEFAULT ((0)) NOT NULL,
    [IsDefaultDeliveryAddress] BIT              CONSTRAINT [DF_Address_DeliveryAddress] DEFAULT ((0)) NOT NULL,
    [IsActive]                 BIT              CONSTRAINT [DF_Address_IsActive] DEFAULT ((1)) NOT NULL,
    [Token]                    UNIQUEIDENTIFIER CONSTRAINT [DF_Address_Token] DEFAULT (newid()) NOT NULL,
    [CreateUserID]             INT              NOT NULL,
    [CreateTime]               DATETIME         CONSTRAINT [DF_Address_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]             INT              NOT NULL,
    [UpdateTime]               DATETIME         CONSTRAINT [DF_Address_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Address_City] FOREIGN KEY ([CityID]) REFERENCES [LK].[City] ([ID]),
    CONSTRAINT [FK_Address_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [CRM].[Customer] ([ID])
);














GO
CREATE NONCLUSTERED INDEX [IX_Address_CustomerID_IsActive2]
    ON [CRM].[Address]([CustomerID] ASC, [IsActive] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Address_CustomerID_IsActive]
    ON [CRM].[Address]([CustomerID] ASC, [IsActive] ASC)
    INCLUDE([ID], [AddressDescription], [Name], [AddressText], [Phone], [Email], [TaxOffice], [TaxNo], [CitizenID], [Zip], [CityID], [DistrictID], [IsDefaultBillingAddress], [IsDefaultDeliveryAddress], [CreateUserID], [CreateTime], [UpdateUserID], [UpdateTime]);

