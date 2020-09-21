--Crear una vista donde se muestra el detalle de las ventas por día. 
--Debe mostrar año, mes, día de la fecha de la orden, 
--id del producto, nombre del producto y la venta (Cantidad por precio de lista).

Create View [SalesOrderDeatail] As
Select orders.order_id, DATEPART(YEAR FROM order_date) as Año, DATEPART(MONTH FROM order_date) as Mes, DATEPART(DAY FROM order_date) as Dia, 
products.product_id, products.product_name, cast(ROUND(quantity*(order_items.list_price - order_items.list_price*discount), 2,3) as decimal(12,2)) as Venta 
From sales.orders
Inner Join sales.order_items on orders.order_id = order_items.order_id
Inner Join production.products on order_items.product_id = products.product_id


--Obtener el nombre y dirección de las tienda con más personal.
WITH Empleados_Tienda
AS 
( 
Select store_id, COUNT(1) as Empleados 
From sales.staffs
Group by store_id 
)
Select Top 1 stores.store_id, store_name, street + ',' + city + ',' + state + ',' + zip_code as Direccion 
From sales.stores
Inner Join Empleados_Tienda on stores.store_id =Empleados_Tienda.store_id
Order by Empleados Desc


--El detalle del producto más popular de la empresa; mostrando el nombre del prducto, 
--año del modelo, nombre de la categoria y la marca así como el número total de unidades vendidas

WITH Cantidad_Productos
AS 
( 
Select product_id, SUM(quantity) as Cantidad 
From sales.order_items
Group by product_id 
)
Select Top 1 products.product_id, product_name, model_year, category_name, brand_name, Cantidad
From production.products
Inner Join Cantidad_Productos on products.product_id = Cantidad_Productos.product_id
Inner Join production.brands on brands.brand_id = products.brand_id
Inner Join production.categories on categories.category_id = products.category_id
Order by Cantidad Desc


--Obtener el nombre y dirección de la tienda con más inventario en bodega (más unidades de producto)
WITH Inventario_Tienda
AS 
( 
Select store_id, SUM(stocks.quantity) as Inventario 
From production.stocks
Group by store_id 
)
Select Top 1 stores.store_id, store_name, street + ',' + city + ',' + state + ',' + zip_code as Direccion 
From sales.stores
Inner Join Inventario_Tienda on stores.store_id = Inventario_Tienda.store_id
Order by Inventario Desc

