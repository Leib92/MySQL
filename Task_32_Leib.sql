-- 32. Mitme avaldisega tabeliv‰‰rtusega funktsioonid

-- 32.2 | ILTVF
Create Function fn_ILTVF_GetCustomer()

Returns Table
as
Return (Select CustomerKey, FirstName, Cast(DateFirstPurchase as Date) as DFP
From DimCustomer)

-- 32.3 | MSTVF
Create Function fn_MSTVF_GetCustomer()

Returns @Table Table (CustomerKey int, FirstName nvarchar(20), DFP Date)
as
Begin
Insert into @Table
Select CustomerKey, FirstName, CAST(DateFirstPurchase as date)
from DimCustomer
Return
End

Select * from fn_ILTVF_GetCustomer()
Select * from fn_MSTVF_GetCustomer()