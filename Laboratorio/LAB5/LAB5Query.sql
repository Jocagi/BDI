
-- Ejercicio 1
Create View [NuevaVista] As
Select 
SalesOrderHeader.SalesOrderID As OrderID,
FirstName + ISNULL(MiddleName, '') + LastName AS Name,
AddressLine1 + ',' + ISNULL(AddressLine2,'') + ',' + City + ',' + StateProvince  + ',' + 
							CountryRegion + '(' + PostalCode + ')' AS Direccion,
SUM(OrderQty) AS Productos,
SUM(TotalDue) AS Total
From
SalesLT.SalesOrderHeader
Inner Join SalesLT.SalesOrderDetail On SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
Inner Join SalesLT.Address On SalesOrderHeader.ShipToAddressID = Address.AddressID
Inner Join SalesLT.Customer On SalesOrderHeader.CustomerID = Customer.CustomerID
Group By SalesOrderHeader.SalesOrderID, FirstName, MiddleName, LastName, AddressLine1, AddressLine2,
City, StateProvince, CountryRegion, PostalCode;

Select * from [NuevaVista]


-- Ejercicio 2
Create Table
#OrdenDeCompra
(OrderID int, Total money, TotalConDescuento money)

declare @OrderID int
declare @Total money
declare @NewTotal money

Declare Orders Cursor for
Select SalesOrderID as OrderID,
IsNull(SubTotal, 0.00) + IsNull(TaxAmt, 0.00) + IsNull(Freight, 0.00) as Total,
Case
	When TotalDue between 0 and 5000 then TotalDue - TotalDue*0.05
	When TotalDue between 5001 and 10000 then TotalDue - TotalDue*0.10
	When TotalDue between 10001 and 25000 then TotalDue - TotalDue*0.15
	When TotalDue > 25000 then TotalDue - TotalDue*0.20
End as NewTotal
From SalesLT.SalesOrderHeader

Open Orders
	Fetch next from Orders into @OrderID, @Total, @NewTotal
While @@FETCH_STATUS = 0
Begin
	Insert Into #OrdenDeCompra 
	(OrderID, Total, TotalConDescuento)
	Values
	(@OrderID, @Total, @NewTotal)
	Fetch next from Orders into @OrderID, @Total, @NewTotal
End
Close Orders
Deallocate Orders

Select * From #OrdenDeCompra