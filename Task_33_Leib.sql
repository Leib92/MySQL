-- 33. Funktsiooniga seotud tähtsad kontseptsioonid

-- 33.1 | Create Table
CREATE TABLE dbo.tblEmployees
(
Id int Primary Key,
Name nvarchar(50) NULL,
DateOfBirth datetime NULL,
Gender nvarchar(10) NULL,
DepartmentId int NULL
)

Insert into tblEmployees values(1,'Sam','1980-12-30 00:00:00.000','Male',1)
Insert into tblEmployees values(2,'Pam','1982-09-01 12:02:36.260','Female',2)
Insert into tblEmployees values(3,'John','1985-08-22 12:03:30.370','Male',1)
Insert into tblEmployees values(4,'Sara','1979-11-29 12:59:30.670','Female',3)
Insert into tblEmployees values(5,'Todd','1978-11-29 12:59:30.670','Male',1)

-- 33.2 | New Function
Create Function fn_GetEmployeeNameById(@Id int)

Returns nvarchar(20)
as
Begin
Return(Select Name from tblEmployees Where Id = @Id)
End

sp_helptext fn_GetEmployeeNameById

-- 33.3 | Alter Function
Alter Function fn_GetEmployeeNameById(@Id int)

Returns nvarchar(20)
With SchemaBinding
as
Begin
Return(Select Name from tblEmployees Where Id = @Id)
End

sp_helptext fn_GetEmployeeNameById