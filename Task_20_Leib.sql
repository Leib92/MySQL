-- practice
Create Procedure spGetEmployeesByGenderAndSalesTerritory
@Gender nvarchar(50),
@SalesTerritoryKey int
as
Begin
Select FirstName, Gender from DimEmployee Where Gender = @Gender and SalesTerritoryKey = @SalesTerritoryKey
End

exec spGetEmployees
exec spGetEmployeesByGenderAndSalesTerritory 'M', 1

---------
-- 20. Stored procedure output parameetrid vıi tagastamise v‰‰rtused

-- 20.1 | TotalCount
-- I
Create Procedure spGetTotalCountOfEmployees1
@TotalCount int output
as
Begin
Select @TotalCount = COUNT(EmployeeKey) from DimEmployee
End

-- II
Create Procedure spGetTotalCountOfEmployees2
as
Begin
return (Select COUNT(EmployeeKey) from DimEmployee)
End

-- Result
Declare @TotalEmployees int
Execute spGetTotalCountOfEmployees1 @TotalEmployees Output
Select @TotalEmployees
Go

Declare @TotalEmployees int
Execute @TotalEmployees = spGetTotalCountOfEmployees2
Select @TotalEmployees

-- 20.2 | Esimene Variant
Create Procedure spGetNameById1
@Id int,
@Name nvarchar(20) Output
as
Begin
Select @Name = FirstName from DimEmployee Where EmployeeKey = @Id
End

Declare @EmployeeName nvarchar(20)
Execute spGetNameById1 3, @EmployeeName out
Print 'Name of the Employee = ' + @EmployeeName

-- 20.3 | Teine Variant
Create Procedure spGetNameById2
@Id int
as
Begin
Select (Select FirstName from DimEmployee Where EmployeeKey = @Id)
End

Declare @EmployeeName nvarchar(20)
Execute @EmployeeName = spGetNameById2 1
Print 'Name of the Employee = ' + @EmployeeName