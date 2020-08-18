--2. La información de los socios que realizaron más de 15 visitas en el último mes a cualquier sede.

CREATE VIEW SociosFrecuentes
([Codigo], [Nombre], [Apellido], [NIT], [Direccion], [Telefono], [Cantidad_Visitas])
WITH ENCRYPTION
AS
SELECT Codigo, Nombre, Apellido, NIT, Direccion, Telefono, Cantidad_Visitas
FROM Cliente C 
INNER JOIN
(
	SELECT COUNT(V.CodigoCliente) AS Cantidad_Visitas, V.CodigoCliente
	FROM Visita V
	WHERE DATEPART(month, V.Fecha) = DATEPART(month, GETDATE()) - 1 
		  AND DATEPART(year, V.Fecha) = DATEPART(year, GETDATE())
	GROUP BY V.CodigoCliente
	HAVING COUNT(V.CodigoCliente) > 15
) R1
ON C.Codigo=R1.CodigoCliente


--4. El promedio de deuda total pendiente por sede de los contratos terminados.

CREATE VIEW DeudaContratosTerminados
([Codigo], [DeudaPromedio])
WITH ENCRYPTION
AS
SELECT S.Codigo, ROUND(AVG(TP.Precio), 2) AS DeudaPromedio 
FROM Contrato C 
INNER JOIN CancelacionContrato CC
	ON C.Numero=CC.Numero
INNER JOIN TipoContrato TP
	ON C.TipoContrato=TP.Nombre
INNER JOIN Sede S
	ON C.Ubicacion=S.Codigo
GROUP BY S.Codigo

--6. Los datos del instructor con menos certificaciones que ha dado más clases grupales en cada sede.

CREATE VIEW DatosInstructor
([DPI], [Nombre], [Apellido], [Fecha_Nacimiento])
WITH ENCRYPTION
AS
SELECT DPI, Nombre, Apellido,Fecha_Nacimiento
FROM Instructor I 
INNER JOIN
(
	SELECT TOP 1 COUNT(CL.DPI_Instructor) AS Total_Clases, CL.DPI_Instructor, Cantidad_Certificaciones
	FROM CLASE CL 
	INNER JOIN
	(
		SELECT COUNT(CER.DPI_Instructor) AS Cantidad_Certificaciones, CER.DPI_Instructor
		FROM Instructor I
		INNER JOIN Certificacion CER
		ON I.DPI=CER.DPI_Instructor
		GROUP BY CER.DPI_Instructor
	) R1
	ON CL.DPI_Instructor=R1.DPI_Instructor
	GROUP BY CL.DPI_Instructor, Cantidad_Certificaciones
	ORDER BY Cantidad_Certificaciones ASC, Total_Clases DESC 
) R2
ON I.DPI=R2.DPI_Instructor

--8. Top 3 de los empleados de ventas que más han devengado en comisiones de ventas por nuevas inscripciones.

CREATE VIEW Top3EmpleadosVentas
([CodigoVendedor], [Comisiones])
WITH ENCRYPTION
AS
SELECT TOP 3 C.CodigoVendedor, ROUND(SUM(TC.Precio) * 0.1, 2) AS Comisiones
FROM Contrato C 
INNER JOIN Personal P
	ON C.CodigoVendedor=P.Codigo
INNER JOIN TipoContrato TC
	ON C.TipoContrato=TC.Nombre
WHERE P.Puesto='Ventas'
GROUP BY C.CodigoVendedor
ORDER BY Comisiones DESC