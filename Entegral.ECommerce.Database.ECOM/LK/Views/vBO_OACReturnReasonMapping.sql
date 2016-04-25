





CREATE VIEW [LK].[vBO_OACReturnReasonMapping]
AS
SELECT 
	OACR.*,
	R.ReasonText
FROM LK.OACReturnReasonMapping AS OACR
INNER JOIN LK.ReturnReason AS R ON R.ID = OACR.ReturnReasonID