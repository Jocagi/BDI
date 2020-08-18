
-- Ejercicio 2

Insert Into Visita 
Select '18002', '2020-04-01', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18002', '2020-04-02', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18002', '2020-04-03', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18002', '2020-04-04', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18002', '2020-04-05', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18002', '2020-04-06', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18002', '2020-04-07', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18002', '2020-04-08', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18002', '2020-04-09', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18002', '2020-04-10', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18002', '2020-04-11', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18002', '2020-04-12', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18002', '2020-04-13', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18002', '2020-04-14', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18002', '2020-04-15', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18002', '2020-04-16', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '18001', '2020-04-1', '3:30', 'CAY', 'Snatch', '10112587'
Union Select '18001', '2020-04-2', '3:30', 'CAY', 'Snatch', '10112587'
Union Select '18001', '2020-04-3', '3:30', 'CAY', 'Snatch', '10112587'
Union Select '18001', '2020-04-4', '3:30', 'CAY', 'Snatch', '10112587'
Union Select '18001', '2020-04-5', '3:30', 'CAY', 'Snatch', '10112587'
Union Select '18001', '2020-04-6', '3:30', 'CAY', 'Snatch', '10112587'
Union Select '18001', '2020-04-7', '3:30', 'CAY', 'Snatch', '10112587'
Union Select '18001', '2020-04-8', '3:30', 'CAY', 'Snatch', '10112587'
Union Select '18001', '2020-04-9', '3:30', 'CAY', 'Snatch', '10112587'
Union Select '18001', '2020-04-10', '3:30', 'CAY', 'Snatch', '10112587'
Union Select '18001', '2020-04-11', '3:30', 'CAY', 'Snatch', '10112587'
Union Select '17010', '2020-04-1', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '17010', '2020-04-2', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '17010', '2020-04-3', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '17010', '2020-04-4', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '17010', '2020-04-5', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '17010', '2020-04-6', '3:30', 'ATN', 'Snatch', '10112587'
Union Select '17001', '2020-04-1', '3:30', 'CAY', 'Snatch', '10112587'



SELECT Codigo, C.Nombre, Cantidad_Visitas, Precio AS Mensualidad
INTO #InfoCliente
FROM Cliente C 
INNER JOIN
(
	SELECT COUNT(V.CodigoCliente) AS Cantidad_Visitas, V.CodigoCliente
	FROM Visita V
	WHERE DATEPART(month, V.Fecha) = DATEPART(month, GETDATE()) - 1 
		  AND DATEPART(year, V.Fecha) = DATEPART(year, GETDATE())
	GROUP BY V.CodigoCliente
) R1
ON C.Codigo=R1.CodigoCliente
INNER JOIN Contrato ON Contrato.CodigoCliente = C.Codigo
INNER JOIN TipoContrato ON TipoContrato.Nombre= Contrato.TipoContrato

Create Table #Reporte 
(Nombre nvarchar(100), IDSocio nvarchar(100), NoAsistencias int, Mensualidad money, Descuento money, NuevaMensualidad money)

Declare @NombreSocio nvarchar(100)
Declare @IDSocio nvarchar(100)
Declare @NoAsistencias int
Declare @Mensualidad money
Declare @Descuento money
Declare @NuevaMensualidad money

Declare Orders Cursor for
Select Codigo, Nombre, Cantidad_Visitas, Mensualidad,
Case
	When Cantidad_Visitas between 0 and 5 then 0
	When Cantidad_Visitas between 6 and 10 then Mensualidad*0.05
	When Cantidad_Visitas between 11 and 15 then Mensualidad*0.10
	When Cantidad_Visitas > 15 then Mensualidad*0.15
End as Descuento,
Case
	When Cantidad_Visitas between 0 and 5 then Mensualidad
	When Cantidad_Visitas between 6 and 10 then Mensualidad-Mensualidad*0.05
	When Cantidad_Visitas between 11 and 15 then Mensualidad-Mensualidad*0.10
	When Cantidad_Visitas > 15 then Mensualidad-Mensualidad*0.15
End as NuevaMensualidad
From #InfoCliente

Open Orders
	Fetch next from Orders into @NombreSocio,@IDSocio,@NoAsistencias,@Mensualidad, @Descuento, @NuevaMensualidad
While @@FETCH_STATUS = 0
Begin
   Insert Into #Reporte
   (Nombre,IDSocio,NoAsistencias,Mensualidad, Descuento, NuevaMensualidad)
   Values
   (@NombreSocio,@IDSocio,@NoAsistencias,@Mensualidad, @Descuento, @NuevaMensualidad)
   Fetch next from Orders into @NombreSocio,@IDSocio,@NoAsistencias,@Mensualidad, @Descuento, @NuevaMensualidad
End
Close Orders
Deallocate Orders

Select Distinct * From #Reporte

Drop Table #InfoCliente
Drop Table #Reporte