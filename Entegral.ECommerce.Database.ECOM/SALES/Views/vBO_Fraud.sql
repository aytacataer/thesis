﻿CREATE VIEW [SALES].[vBO_Fraud]
AS
SELECT F.*,S.Name AS StoreName
FROM SALES.Fraud F
INNER JOIN LK.Store S ON F.StoreID = S.ID