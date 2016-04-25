

CREATE VIEW [SALES].[vBO_PendingOrdersInWaitingGroup]
AS
SELECT OM.ID,OM.CreateTime
FROM SALES.OrderMain OM
INNER JOIN SALES.OrderMainDetail OMD ON OMD.OrderMainID = OM.ID
INNER JOIN SALES.OrderItem OI ON OI.OrderID = OM.ID
INNER JOIN LK.StatusCode SC ON OI.ItemStatusCode = SC.Code
INNER JOIN LK.StatusGroup SG ON SG.ID = SC.StatusGroupID
WHERE SG.Code = 'Waiting'
	AND OMD.IsPendingMailSent = 0
	AND OM.OrderStatusCode NOT IN (
		'completed'
		,'return_waiting'
		,'returned'
		)
	AND OM.IsPlacedSuccessfully = 1
	GROUP BY OM.ID,OM.CreateTime