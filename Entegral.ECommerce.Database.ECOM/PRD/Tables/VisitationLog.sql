CREATE TABLE [PRD].[VisitationLog] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [StoreID]      INT           NOT NULL,
    [SessionID]    NVARCHAR (50) NOT NULL,
    [ProductID]    INT           NOT NULL,
    [CustomerID]   INT           NULL,
    [CreateUserID] INT           NOT NULL,
    [CreateTime]   DATETIME      NOT NULL,
    [UpdateUserID] INT           NOT NULL,
    [UpdateTime]   DATETIME      NOT NULL,
    CONSTRAINT [PK_VisitationLog] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_VisitationLog_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [CRM].[Customer] ([ID]),
    CONSTRAINT [FK_VisitationLog_Product] FOREIGN KEY ([ProductID]) REFERENCES [PRD].[Product] ([ID]),
    CONSTRAINT [FK_VisitationLog_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID])
);








GO
CREATE NONCLUSTERED INDEX [IX_VisitationLog_Customer]
    ON [PRD].[VisitationLog]([SessionID] ASC, [CustomerID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_VisitationLog]
    ON [PRD].[VisitationLog]([SessionID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_VisitationLog_Product]
    ON [PRD].[VisitationLog]([StoreID] ASC, [ProductID] ASC);

