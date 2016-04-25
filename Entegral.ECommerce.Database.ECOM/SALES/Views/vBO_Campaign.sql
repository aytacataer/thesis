




CREATE VIEW [SALES].[vBO_Campaign]
AS
SELECT [C].[ID], [C].[StoreID], [C].[ExternalSystemCode], [C].[Code], [C].[CouponGroup], 
[C].[Description], [C].[CustomerInformationNote], [C].[NoMatchWarningNote], 
[C].[PaymentConditionWarningNote], [C].[AfterApplyNote], [C].[StartTime], [C].[EndTime], 
[C].[IsActiveOnMonday], [C].[IsActiveOnTuesday], [C].[IsActiveOnWednesday], 
[C].[IsActiveOnThursday], [C].[IsActiveOnFriday], [C].[IsActiveOnSaturday], 
[C].[IsActiveOnSunday], [C].[DailyStartTime], [C].[DailyEndTime], [C].[IsActive], [C].[Priority], 
[C].[IsBonusCampaign], [C].[ShowBonusCampaignOnStore], [C].[CreateUserID], [C].[CreateTime], [C].[UpdateUserID], [C].[UpdateTime], 
[S].[Name] AS StoreName
FROM SALES.Campaign AS C
INNER JOIN LK.STORE AS S
ON S.ID = C.StoreID
