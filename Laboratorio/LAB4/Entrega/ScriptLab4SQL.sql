
--1. Devolver nombre completo, total de factura (sumando subtotal, impuesto y flete) y dirección
--de envío de las órdenes de venta registradas.

SELECT 
FirstName + ' ' + ISNULL(MiddleName,'') + LastName AS NombreCompleto, 
SubTotal+TaxAmt+Freight AS TotalFactura,
AddressLine1 + ' ' + ISNULL(AddressLine2, '') + ', ' + City + ', ' + CountryRegion + '. (' + PostalCode + ')' AS Direccion
FROM SalesLT.SalesOrderHeader
INNER JOIN SalesLT.Customer ON SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID
INNER JOIN SalesLT.Address ON SalesLT.Address.AddressID = SalesLT.SalesOrderHeader.ShipToAddressID;


--2.Mostrar todas las direcciones listadas para la empresa "Friendly Bike Shop". 

SELECT AddressLine1 + ISNULL(AddressLine2, '') + ', ' + CountryRegion + ', ' + StateProvince 
		+ ', ' + City + ' (' + PostalCode + ')'  AS Address
FROM SalesLT.Customer 
LEFT JOIN SalesLT.CustomerAddress ON SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
LEFT JOIN SalesLT.Address ON SalesLT.Address.AddressID = SalesLT.CustomerAddress.AddressID
WHERE CompanyName = 'Friendly Bike Shop' AND SalesLT.CustomerAddress.CustomerID IS NOT NULL;



--3.	Mostrar cantidad de producto, nombre del producto y precio de lista 
--		de la orden de compra generada para el cliente con ID 29929 

SELECT Name AS NombreProducto, Cantidad, ListPrice AS Precio
FROM 
(
SELECT SalesOrderDetail.ProductID, SUM(OrderQty) AS Cantidad
FROM SalesLT.SalesOrderHeader
INNER JOIN SalesLT.SalesOrderDetail ON SalesLT.SalesOrderHeader.SalesOrderID = SalesLT.SalesOrderDetail.SalesOrderID
WHERE CustomerID = 29929
GROUP BY SalesOrderDetail.ProductID
)Sale
INNER JOIN SalesLT.Product ON Sale.ProductID = Product.ProductID

--(Extra: ¿Cuántos productos compró?) 
SELECT SUM(Cantidad) AS TotalProductos
FROM 
(
SELECT SalesOrderDetail.ProductID, SUM(OrderQty) AS Cantidad
FROM SalesLT.SalesOrderHeader
INNER JOIN SalesLT.SalesOrderDetail ON SalesLT.SalesOrderHeader.SalesOrderID = SalesLT.SalesOrderDetail.SalesOrderID
WHERE CustomerID = 29929
GROUP BY SalesOrderDetail.ProductID
)Sale



--4. Mostrar el nombre de la compañía donde laboran todos los clientes que tengan una dirección en la ciudad de Dallas.

SELECT CompanyName
FROM SalesLT.Customer 
LEFT JOIN SalesLT.CustomerAddress ON SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
LEFT JOIN SalesLT.Address ON SalesLT.Address.AddressID = SalesLT.CustomerAddress.AddressID
WHERE City = 'Dallas'
GROUP BY CompanyName



--5. ¿Cuántos artículos con precio de lista mayor a $1,000 se han vendido? 

SELECT SUM(Cantidad) AS TotalProductos
FROM 
(
SELECT SalesOrderDetail.ProductID, SUM(OrderQty) AS Cantidad
FROM SalesLT.SalesOrderHeader
INNER JOIN SalesLT.SalesOrderDetail ON SalesLT.SalesOrderHeader.SalesOrderID = SalesLT.SalesOrderDetail.SalesOrderID
INNER JOIN SalesLT.Product ON SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID
WHERE ListPrice > 1000
GROUP BY SalesOrderDetail.ProductID
)Sale


--6. Mostrar el nombre de la compañía de aquellos clientes con compras mayores de $100,000. 

SELECT CompanyName
FROM SalesLT.Customer
INNER JOIN SalesLT.SalesOrderHeader ON SalesOrderHeader.CustomerID = Customer.CustomerID
WHERE TotalDue > 100000
GROUP BY CompanyName


--7. ¿Cuántas calcetas de competencia ('Racing Socks, L') ha comprado la empresa 'Riding Cycles'? 

SELECT SUM(OrderQty) AS CantidadTotal 
FROM SalesLT.Customer
INNER JOIN SalesLT.SalesOrderHeader ON SalesOrderHeader.CustomerID = Customer.CustomerID
INNER JOIN SalesLT.SalesOrderDetail ON SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
INNER JOIN SalesLT.Product ON SalesOrderDetail.ProductID = Product.ProductID
WHERE CompanyName = 'Riding Cycles' AND Name = 'Racing Socks, L'
GROUP BY CompanyName


--8.	Una orden de producto único (OPU) es aquella donde el cliente compró un sólo artículo. 
--		Muestre el número de orden y el precio unitario de cada OPU.

SELECT SalesOrderNumber, UnitPrice
FROM
(
SELECT SalesOrderID, COUNT(SalesOrderID) AS TotalProducts 
FROM SalesLT.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(OrderQty) = 1
)Orders
INNER JOIN SalesLT.SalesOrderHeader ON SalesOrderHeader.SalesOrderID = Orders.SalesOrderID
INNER JOIN SalesLT.SalesOrderDetail ON SalesOrderDetail.SalesOrderID = Orders.SalesOrderID
INNER JOIN SalesLT.Product ON SalesOrderDetail.ProductID = Product.ProductID
WHERE TotalProducts = 1;

--9.	Use la columna de SubTotal en la tabla SalesOrderHeader para listar las órdenes de mayor a menor. 
--		Para cada orden de compra muestre el nombre de la compañía, el subtotal y el peso total de la orden. 

SELECT CompanyName, Weight, SubTotal  
FROM
(
SELECT SalesOrderID, ISNULL(SUM(Weight),0) AS Weight
FROM SalesLT.SalesOrderDetail
INNER JOIN SalesLT.Product ON SalesOrderDetail.ProductID = Product.ProductID
GROUP BY SalesOrderDetail.SalesOrderID
)Sale
INNER JOIN SalesLT.SalesOrderHeader ON SalesOrderHeader.SalesOrderID = Sale.SalesOrderID
INNER JOIN SalesLT.Customer ON SalesOrderHeader.CustomerID = Customer.CustomerID
ORDER BY SubTotal DESC


--10. ¿Cuántos productos en la categoría 'Cranksets' se han vendido a una dirección registrada en Londres?

SELECT SUM(OrderQty) AS TotalProductos
FROM SalesLT.SalesOrderHeader
INNER JOIN SalesLT.Address ON SalesOrderHeader.ShipToAddressID = Address.AddressID
INNER JOIN SalesLT.SalesOrderDetail ON SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
INNER JOIN SalesLT.Product ON SalesOrderDetail.ProductID = Product.ProductID
INNER JOIN SalesLT.ProductCategory ON Product.ProductCategoryID = ProductCategory.ProductCategoryID
WHERE ProductCategory.Name = 'Cranksets' AND City = 'London'
GROUP BY City


