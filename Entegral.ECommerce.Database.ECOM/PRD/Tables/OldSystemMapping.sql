CREATE TABLE [PRD].[OldSystemMapping] (
    [ID]                  INT          IDENTITY (1, 1) NOT NULL,
    [StoreID]             SMALLINT     CONSTRAINT [DF_OldSystemMapping_StoreID] DEFAULT ((1)) NOT NULL,
    [CurrentSystemID]     INT          NOT NULL,
    [Type]                SMALLINT     CONSTRAINT [DF_OldSystemMapping_Type] DEFAULT ((0)) NOT NULL,
    [OldSystemIdentifier] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_OldSystemMapping] PRIMARY KEY CLUSTERED ([ID] ASC)
);










GO
CREATE NONCLUSTERED INDEX [IX_OldSystemMapping]
    ON [PRD].[OldSystemMapping]([CurrentSystemID] ASC, [Type] ASC);






GO
CREATE NONCLUSTERED INDEX [IX_OldSystemMapping_Type_OldSystemIdentifier]
    ON [PRD].[OldSystemMapping]([Type] ASC, [OldSystemIdentifier] ASC);

