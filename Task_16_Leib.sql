-- 16. COALESCE() funktsioon

-- 16.1 | Employee
SELECT EmployeeKey, FirstName, MiddleName, LastName
FROM DimEmployee

-- 16.2 | COALESCE()
SELECT EmployeeKey, COALESCE(FirstName, MiddleName, LastName) as 'Name'
FROM DimEmployee
