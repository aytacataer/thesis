CREATE TABLE [PRD].[ProductStoreData] (
    [ID]               INT      IDENTITY (1, 1) NOT NULL,
    [StoreID]          INT      NOT NULL,
    [ProductID]        INT      NOT NULL,
    [PurchasePrice]    MONEY    NULL,
    [HopiPrice]        MONEY    NULL,
    [Price1]           MONEY    NOT NULL,
    [Price2]           MONEY    NULL,
    [Price2_StartTime] DATETIME NULL,
    [Price2_EndTime]   DATETIME NULL,
    [Price3]           MONEY    NULL,
    [Price3_StartTime] DATETIME NULL,
    [Price3_EndTime]   DATETIME NULL,
    [Price4]           MONEY    NULL,
    [Price4_StartTime] DATETIME NULL,
    [Price4_EndTime]   DATETIME NULL,
    [CreateUserID]     INT      NOT NULL,
    [CreateTime]       DATETIME CONSTRAINT [DF_ProductStoreData_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]     INT      NOT NULL,
    [UpdateTime]       DATETIME CONSTRAINT [DF_ProductStoreData_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_ProductStoreData_Price] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ProductStoreData_Product] FOREIGN KEY ([ProductID]) REFERENCES [PRD].[Product] ([ID]),
    CONSTRAINT [IX_ProductStoreData] UNIQUE NONCLUSTERED ([StoreID] ASC, [ProductID] ASC)
);




















GO
CREATE NONCLUSTERED INDEX [IX_ProductStoreData_Store]
    ON [PRD].[ProductStoreData]([StoreID] ASC);




GO
CREATE NONCLUSTERED INDEX [IX_ProductStoreData_ProductID]
    ON [PRD].[ProductStoreData]([ProductID] ASC);

