-- 41. Indekseeritud view-d

-- 41.1 | Create Tables
Create Table tblProduct
(
ProductId int primary key,
Name nvarchar(20),
UnitPrice int
)

Insert into tblProduct Values(1, 'Books', 20)
Insert into tblProduct Values(2, 'Pens', 14)
Insert into tblProduct Values(3, 'Pencils', 11)
Insert into tblProduct Values(4, 'Clips', 10)

Create Table tblProductSales
(
ProductId int,
QuantitySold int
)

Insert into tblProductSales Values(1, 10)
Insert into tblProductSales Values(3, 23)
Insert into tblProductSales Values(4, 21)
Insert into tblProductSales Values(2, 12)
Insert into tblProductSales Values(1, 13)
Insert into tblProductSales Values(3, 12)
Insert into tblProductSales Values(4, 13)
Insert into tblProductSales Values(1, 11)
Insert into tblProductSales Values(2, 12)
Insert into tblProductSales Values(1, 14)

-- 41.2 | Function
Create view vWTotalSalesByProduct
with SchemaBinding
as
Select Name,
SUM(ISNULL((QuantitySold * UnitPrice), 0)) as TotalSales,
COUNT_BIG(*) as TotalTransactions
from tblProductSales
join tblProduct
on tblProduct.ProductId = tblProductSales.ProductId
group by Name

--
Create Unique Clustered Index UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name)