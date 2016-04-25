


CREATE VIEW [SEARCH].[vBO_SearchDirectRouting]
AS
SELECT SDR.ID
	  ,S.ID as [StoreID]
	  ,S.Name AS [StoreName]
	  ,SDR.SearchKey
	  ,SDR.Link
	  ,SDR.IsActive FROM SEARCH.SearchDirectRouting AS SDR
					INNER JOIN LK.Store AS S ON SDR.StoreID = S.ID