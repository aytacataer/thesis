

CREATE VIEW [PRD].[vBO_UncategorizedProduct]
AS
SELECT DISTINCT P.ID, P.DisplayName, P.ExternalSystemCode
From
       PRD.Product P 
             left join
       PRD.Category_Product CP on P.ID = CP.ProductID and CP.CategoryID not in (Select ID From PRD.Category Where IsBrandCategory = 1)
Where 
       CP.ID is null