CREATE TABLE [SALES].[Cancelation] (
    [ID]                  INT      IDENTITY (1, 1) NOT NULL,
    [IsCustomerNotified]  BIT      NOT NULL,
    [IsCreditNoteCreated] BIT      NOT NULL,
    [BonusResidual]       MONEY    CONSTRAINT [DF_Cancelation_BonusResidual] DEFAULT ((0)) NOT NULL,
    [CreateUserID]        INT      NOT NULL,
    [CreateTime]          DATETIME NOT NULL,
    [UpdateUserID]        INT      NOT NULL,
    [UpdateTime]          DATETIME NOT NULL,
    CONSTRAINT [PK_Cancelation] PRIMARY KEY CLUSTERED ([ID] ASC)
);



