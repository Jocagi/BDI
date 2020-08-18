--Laboratorio 3

--¿Cuáles son las 5 provincias de estado con menos cantidad de direcciones?
SELECT TOP 5 StateProvince, COUNT(StateProvince) AS Count
FROM SalesLT.Address
GROUP BY StateProvince
ORDER BY COUNT(*) ASC
GO

--¿Cuántos códigos postales terminan con 0?
SELECT 'Codigos Postales', COUNT(PostalCode) AS Count 
FROM SalesLT.Address
WHERE PostalCode LIKE '%0'
GO

--¿Cuál es el nombre de la empresa que tiene más clientes? ¿Cuántos son?
SELECT TOP 1 CompanyName, COUNT(CompanyName) AS Count
FROM SalesLT.Customer
GROUP BY CompanyName
ORDER BY COUNT(*) DESC
GO

--¿Cuántas direcciones de usuario de tipo shipping existen?
SELECT AddressType, COUNT(AddressType) AS Count
FROM SalesLT.CustomerAddress
WHERE AddressType = 'Shipping'
GROUP BY AddressType
ORDER BY COUNT(*) DESC
GO

--¿Cuál es el producto con el costo estándar más alto?
SELECT ProductID, Name, StandardCost
FROM SalesLT.Product
ORDER BY StandardCost DESC
GO

--¿Cuales son los promedios de peso de los productos por modelo?
SELECT ProductModelID, AVG(Weight) AS AverageWeight
FROM SalesLT.Product
WHERE Weight >= 0
GROUP BY ProductModelID
ORDER BY AVG(Weight) DESC
GO
--¿Cuántas categorías tienen un promedio mayor a 0?
SELECT SalesLT.ProductCategory.Name, AVG(SalesLT.Product.Weight) AS AverageWeight
FROM SalesLT.Product
INNER JOIN SalesLT.ProductCategory ON SalesLT.Product.ProductCategoryID=SalesLT.ProductCategory.ProductCategoryID
WHERE Weight > 0
GROUP BY SalesLT.ProductCategory.Name
ORDER BY AVG(Weight) DESC
GO

--¿Cuántos productos tienen la palabra "Road" en su nombre?
SELECT 'Producto Road', COUNT(Name) AS Count 
FROM SalesLT.Product
WHERE Name LIKE '%Road%'
GO

--¿A cuánto asciende la diferencia total entre costos y precio de los productos?
SELECT 'Ganancia', SUM(ListPrice) - SUM(StandardCost) AS Diferencia
FROM SalesLT.Product
GO

--¿De qué color hay más productos en existencias? ¿Cuántos son?
SELECT TOP 1 Color, COUNT(Color) AS Count
FROM SalesLT.Product
GROUP BY Color
ORDER BY Count DESC
GO

--¿A cuánto asciende el total de ventas?
SELECT 'Total', SUM(TotalDue) AS Venta
FROM SalesLT.SalesOrderHeader
GO

--¿Cuál es el ID de cliente que pagó más flete por su compra?
SELECT TOP 1 CustomerID, Freight
FROM SalesLT.SalesOrderHeader
ORDER BY Freight DESC
GO

--¿Cual es el ID de la venta más alta?
SELECT TOP 1 SalesOrderID, TotalDue
FROM SalesLT.SalesOrderHeader
ORDER BY TotalDue DESC
GO

--. ¿Cuál fue el total de ventas por cliente? ¿Cuántos tuvieron un total mayor a 50000?
SELECT CustomerID, COUNT(*) AS Ventas, SUM(TotalDue) AS Valor
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID
ORDER BY Valor DESC
GO

SELECT CustomerID, SUM(TotalDue) AS Valor
FROM SalesLT.SalesOrderHeader
WHERE TotalDue > 50000
GROUP BY CustomerID
ORDER BY Valor DESC
GO

--. ¿Cuál es el producto que más se vendió? 
--¿Cuántas unidades se vendieron? 
SELECT TOP 1 ProductID, SUM(OrderQty) AS Cantidad
FROM SalesLT.SalesOrderDetail
GROUP BY ProductID
ORDER BY Cantidad DESC
GO


--¿Cuántos productos por venta se despacharon? ¿En cuántas ventas se despacharon más de 8 productos?
SELECT SalesOrderID, SUM(OrderQty) AS Cantidad
FROM SalesLT.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY Cantidad DESC
GO

SELECT 'Cantidad de Ventas' AS ' ', COUNT(SalesOrderID) AS Cantidad
FROM 
(
	SELECT SalesOrderID, SUM(OrderQty) AS Cantidad
	FROM SalesLT.SalesOrderDetail
	GROUP BY SalesOrderID
) AS Data
WHERE Cantidad > 8
GO