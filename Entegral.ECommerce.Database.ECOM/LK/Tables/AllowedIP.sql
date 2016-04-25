CREATE TABLE [LK].[AllowedIP] (
    [ID]        INT           IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (80) NOT NULL,
    [IpAddress] NVARCHAR (25) NOT NULL,
    CONSTRAINT [PK_AllowedIP] PRIMARY KEY CLUSTERED ([ID] ASC)
);



