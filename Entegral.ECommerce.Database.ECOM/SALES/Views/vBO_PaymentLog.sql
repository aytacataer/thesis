CREATE VIEW [SALES].[vBO_PaymentLog]
AS 

SELECT     [pLog].[ID] as [PaymentID],
		   [pInfo].[ID] as [PaymentInfoID],
		   [pLog].[OrderID], [pLog].[IsSucceed], [pLog].[IsReturn], [pLog].[LogData], [pLog].[CreateTime], 
		   [pm].[DisplayName] as [PaymentDisplayName], 
		   [bank].[DisplayName] as [BankDisplayName]

FROM       [SALES].[PaymentLog] AS [pLog] LEFT OUTER JOIN
           [SALES].[PaymentInfo] AS [pInfo] ON [pLog].[PaymentInfoID] = [pInfo].[ID] LEFT OUTER JOIN
           [SALES].[OrderMain] AS [ord] ON [pInfo].[OrderID] = [ord].[ID] LEFT OUTER JOIN
           [LK].[PaymentMethod] AS [pm] ON [pInfo].[PaymentMethodCode] = [pm].[Code] AND (ord.StoreID = PM.StoreID OR PM.StoreID = 0) LEFT OUTER JOIN
           [LK].[Bank] AS [bank] ON [bank].[SystemCode] = [pInfo].[BankCode] AND [bank].StoreID = [ord].StoreID 
           