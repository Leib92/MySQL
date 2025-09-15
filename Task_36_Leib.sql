-- 36. Klastreeritud ja mitte-klastreeritud indeksid

-- 36.1 | Redo the Table
DROP TABLE tblEmployees

CREATE TABLE [tblEmployee]
(
Id int Primary Key,
Name nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50)
)

Insert into tblEmployee values(3,'John',4500,'Male','New York')
Insert into tblEmployee values(1,'Sam',2500,'Male','London')
Insert into tblEmployee values(4,'Sara',5500,'Female','Tokyo')
Insert into tblEmployee values(5,'Todd',3100,'Male','Toronto')
Insert into tblEmployee values(2,'Pam',6500,'Female','Sydney')

Select * from tblEmployee

-- 36.2 | Clustered Index
Create Clustered Index IX_tblEmployee_Name
ON tblEmployee(Name)

Drop index tblEmployee.PK__tblEmplo__3214EC0711004E95

-- 36.3 | Gender Salary Clustered
Create Clustered Index IX_tblEmployee_Gender_Salary
ON tblEmployee(Gender DESC, Salary ASC)

-- 36.4 | NonClustered

Create NonClustered Index IX_tblEmployee_Name
ON tblEmployee(Name)


