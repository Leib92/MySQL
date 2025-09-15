-- 35. Ineksid serveris

-- 35.1 | Salary
Alter Table tblEmployees
Add Salary money

Insert into tblEmployees values(1,'Sam','1980-12-30 00:00:00.000','Male',1,2500)
Insert into tblEmployees values(2,'Pam','1982-09-01 12:02:36.260','Female',2,3100)
Insert into tblEmployees values(3,'John','1985-08-22 12:03:30.370','Male',1,4500)
Insert into tblEmployees values(4,'Sara','1979-11-29 12:59:30.670','Female',3,5500)
Insert into tblEmployees values(5,'Todd','1978-11-29 12:59:30.670','Male',1,6500)

Create Index IX_tblEmployee_Salary
ON tblEmployees (Salary ASC)