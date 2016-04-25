



CREATE VIEW [CRM].[vBO_SegmentType]
AS
SELECT S.[ID]
      ,S.[StoreID]
	  ,S.[Code]
      ,S.[DisplayName]
      ,S.[IsActive]
      ,S.[CreateUserID]
      ,S.[CreateTime]
      ,S.[UpdateUserID]
      ,S.[UpdateTime]
	  ,ST.[Name] as StoreName
  FROM [CRM].[SegmentType]  S
  LEFT JOIN [LK].[Store] ST ON S.StoreID = ST.ID