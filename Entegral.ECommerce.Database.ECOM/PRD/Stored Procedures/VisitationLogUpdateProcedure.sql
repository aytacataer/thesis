CREATE PROCEDURE [PRD].[VisitationLogUpdateProcedure]
	@sessionID nvarchar(50) ,
	@customerID int ,
	@updateUserID int ,
	@updateTime DateTime 
AS
	UPDATE [PRD].[VisitationLog] SET 
		[CustomerID] = @customerID, 
		[UpdateUserID] = @updateUserID, 
		[UpdateTime] = @updateTime
	WHERE [SessionID] = @sessionID AND [CustomerID] IS NULL
	
RETURN 0
