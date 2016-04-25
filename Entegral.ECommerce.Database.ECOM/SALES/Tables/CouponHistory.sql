CREATE TABLE [SALES].[CouponHistory] (
    [ID]         INT      IDENTITY (1, 1) NOT NULL,
    [CouponID]   INT      NOT NULL,
    [CampaignID] INT      NOT NULL,
    [CustomerID] INT      NULL,
    [CreateTime] DATETIME CONSTRAINT [DF_CouponHistory_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_CouponHistory] PRIMARY KEY CLUSTERED ([ID] ASC) ,
    CONSTRAINT [FK_CouponHistory_Campaign] FOREIGN KEY ([CampaignID]) REFERENCES [SALES].[Campaign] ([ID]),
    CONSTRAINT [FK_CouponHistory_Coupon] FOREIGN KEY ([CouponID]) REFERENCES [SALES].[Coupon] ([ID]),
    CONSTRAINT [FK_CouponHistory_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [CRM].[Customer] ([ID])
);








GO
CREATE NONCLUSTERED INDEX [IX_CouponHistory_CouponID]
    ON [SALES].[CouponHistory]([CouponID] ASC)
    INCLUDE([ID]);

