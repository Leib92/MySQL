-- 17. Union ja Union all

-- 17.1 | Employee and Customer
SELECT CustomerKey, FirstName, EmailAddress
FROM DimCustomer

SELECT EmployeeKey, FirstName, EmailAddress
FROM DimEmployee

-- 17.2 | UNION ALL
SELECT CustomerKey as 'Key', FirstName, EmailAddress
FROM DimCustomer

UNION ALL
SELECT EmployeeKey, FirstName, EmailAddress
FROM DimEmployee

-- 17.3 | UNION
SELECT CustomerKey as 'Key', FirstName, EmailAddress
FROM DimCustomer

UNION
SELECT EmployeeKey, FirstName, EmailAddress
FROM DimEmployee