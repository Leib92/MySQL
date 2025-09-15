-- 34. Ajutised tabelid

-- 34.1 | Create Table
Create Table #PersonDetails(Id int, Name nvarchar(20))
Insert into #PersonDetails Values(1,'Mike')
Insert into #PersonDetails Values(2,'John')
Insert into #PersonDetails Values(3,'Todd')

Select * from #PersonDetails

-- 34.2 | sysobjects
Select name from tempdb.sysobjects
where name like '#PersonDetails%'

DROP TABLE #PersonDetails

-- 34.3 | LocalTempTable
Create Procedure spCreateLocalTempTable
as
Begin
Create Table #PersonDetails(Id int, Name nvarchar(20))

Insert into #PersonDetails Values(1, 'Mike')
Insert into #PersonDetails Values(2, 'John')
Insert into #PersonDetails Values(3, 'Todd')

Select * from #PersonDetails
End

-- 34.4 EmployeeDetails
Create Table ##EmployeeDetails(Id int, Name nvarchar(20))