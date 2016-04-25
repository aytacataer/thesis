CREATE TABLE [CMS].[Slider] (
    [ID]              INT            IDENTITY (1, 1) NOT NULL,
    [StoreID]         INT            NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [Header]          NVARCHAR (250) NULL,
    [Duration]        INT            CONSTRAINT [DF_Slider_Duration] DEFAULT ((5000)) NOT NULL,
    [Width]           INT            NULL,
    [Height]          INT            NULL,
    [Class]           NVARCHAR (80)  NULL,
    [PrevButtonClass] NVARCHAR (80)  NULL,
    [NextButtonClass] NVARCHAR (80)  NULL,
    [IsActive]        BIT            CONSTRAINT [DF_Slider_IsActive] DEFAULT ((0)) NOT NULL,
    [CreateUserID]    INT            NOT NULL,
    [CreateTime]      DATETIME       CONSTRAINT [DF_Slider_CreateTime] DEFAULT (getutcdate()) NOT NULL,
    [UpdateUserID]    INT            NOT NULL,
    [UpdateTime]      DATETIME       CONSTRAINT [DF_Slider_UpdateTime] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Slider_Store] FOREIGN KEY ([StoreID]) REFERENCES [LK].[Store] ([ID])
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Slider_Code]
    ON [CMS].[Slider]([Code] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Slider_StoreAndCode]
    ON [CMS].[Slider]([StoreID] ASC, [Code] ASC);

