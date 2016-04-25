CREATE TABLE [LK].[CompanyEmployeeRecord] (
    [ID]                     INT           IDENTITY (1, 1) NOT NULL,
    [EmployeeIdentityNumber] NVARCHAR (15) NOT NULL,
    [EmployeeExternalID]     NVARCHAR (15) NOT NULL,
    [EmployeeFirstname]      NVARCHAR (50) NOT NULL,
    [EmployeeSurname]        NVARCHAR (50) NULL,
    [IsActive]               BIT           CONSTRAINT [DF_CompanyEmployeeRecord_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateTime]             DATETIME      CONSTRAINT [DF_CompanyEmployeeRecord_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [CreateUserID]           INT           NOT NULL,
    [UpdateTime]             DATETIME      CONSTRAINT [DF_CompanyEmployeeRecord_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]           INT           NOT NULL,
    CONSTRAINT [PK__CompanyEmployeeRecord__3214EC2750BF6D2C] PRIMARY KEY CLUSTERED ([ID] ASC)
);



