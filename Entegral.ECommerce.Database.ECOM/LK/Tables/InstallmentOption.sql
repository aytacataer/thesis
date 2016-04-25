CREATE TABLE [LK].[InstallmentOption] (
    [ID]                     INT            IDENTITY (1, 1) NOT NULL,
    [BankID]                 INT            NOT NULL,
    [InstallmentCount]       INT            NOT NULL,
    [DisplayText]            NVARCHAR (50)  NOT NULL,
    [InstallmentDescription] NVARCHAR (255) NULL,
    CONSTRAINT [PK_InstallmentOption] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_InstallmentOption_Bank] FOREIGN KEY ([BankID]) REFERENCES [LK].[Bank] ([ID])
);





