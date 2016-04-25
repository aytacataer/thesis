








CREATE VIEW [CRM].[vBO_CustomerSegment]
AS
SELECT 
	[CS].[ID],
	[CS].[SegmentTypeID],
	[ST].[DisplayName] as SegmentDisplayName,
	[CS].[SegmentValue],
	[ST].[Code] as SegmentTypeCode,
	[CS].[CustomerID],
	[C].[ExternalSystemCode] as CustomerCode,
	[C].[FirstName] as CustomerFirstName,
	[C].[LastName] as CustomerLastName,
	[CS].[Priority],
	[CS].[IsActive],
	[CS].[CreateTime],
	[CS].[CreateUserID],
	[CS].[UpdateTime],
	[CS].[UpdateUserID]
FROM CRM.CustomerSegment CS
LEFT JOIN CRM.SegmentType ST ON CS.SegmentTypeID = ST.ID 
LEFT JOIN CRM.Customer C ON C.ID = CS.CustomerID