-- 31. Tabelisisesed v‰‰rtusega funktsioonid

-- 31.1 | Employee Function by Gender
CREATE FUNCTION fn_EmployeesByGender(@Gender nvarchar(10))
RETURNS TABLE
AS
RETURN (Select EmployeeKey, FirstName, HireDate, Gender, SalesTerritoryKey
FROM DimEmployee
WHERE Gender = @Gender)

Select * from fn_EmployeesByGender('M')
Select * from fn_EmployeesByGender('F')

-- 31.2 | fn_EmployeesByGnder SalesTerritory

Select FirstName, Gender, SalesTerritoryCountry
from fn_EmployeesByGender('M') E
Join DimSalesTerritory D on D.SalesTerritoryKey = E.EmployeeKey
