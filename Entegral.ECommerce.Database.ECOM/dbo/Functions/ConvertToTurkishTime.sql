CREATE FUNCTION [dbo].[ConvertToTurkishTime](@time DateTime)
RETURNS DateTime
AS
BEGIN
	DECLARE @resultVar DateTime
	IF(MONTH(@time) > 3 AND MONTH(@time) < 11)
		SET @resultVar = DATEADD(HOUR, 3, @time);
	ELSE
		SET @resultVar = DATEADD(HOUR, 2, @time);
	
	RETURN @resultVar;
END