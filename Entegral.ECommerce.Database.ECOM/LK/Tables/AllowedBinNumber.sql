CREATE TABLE [LK].[AllowedBinNumber] (
    [ID]  INT          IDENTITY (1, 1) NOT NULL,
    [BIN] VARCHAR (10) NOT NULL,
    CONSTRAINT [PK_AllowedBinNumber_1] PRIMARY KEY CLUSTERED ([ID] ASC)
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AllowedBinNumber]
    ON [LK].[AllowedBinNumber]([BIN] ASC);



