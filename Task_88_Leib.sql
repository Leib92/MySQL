-- 88. Erinevus Except ja not in operaatoril
Select EmployeeKey, FirstName, Gender
From DimEmployee
Select CustomerKey, FirstName, Gender
From DimCustomer

-- 88.1 | Päringud
Select EmployeeKey, FirstName, Gender
From DimEmployee
Except
Select CustomerKey, FirstName, Gender
From DimCustomer

-- 88.2
Select EmployeeKey, FirstName, Gender
From DimEmployee
Where EmployeeKey NOT IN (Select CustomerKey from DimCustomer)

Insert into DimCustomer values (1, 'Mark', 'Male')