USE [master]
GO
/****** Object:  Database [Gimansios Dinamic]    Script Date: 3/26/2020 4:28:39 PM ******/
CREATE DATABASE [Gimansios Dinamic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gimansios Dinamic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Gimansios Dinamic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gimansios Dinamic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Gimansios Dinamic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Gimansios Dinamic] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gimansios Dinamic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gimansios Dinamic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gimansios Dinamic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gimansios Dinamic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gimansios Dinamic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gimansios Dinamic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET RECOVERY FULL 
GO
ALTER DATABASE [Gimansios Dinamic] SET  MULTI_USER 
GO
ALTER DATABASE [Gimansios Dinamic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gimansios Dinamic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gimansios Dinamic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gimansios Dinamic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gimansios Dinamic] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Gimansios Dinamic', N'ON'
GO
ALTER DATABASE [Gimansios Dinamic] SET QUERY_STORE = OFF
GO
USE [Gimansios Dinamic]
GO
/****** Object:  Table [dbo].[CancelacionContrato]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CancelacionContrato](
	[Numero] [nvarchar](10) NOT NULL,
	[Fecha_Fin] [date] NOT NULL,
	[Motivo] [nvarchar](50) NULL,
 CONSTRAINT [PK_CancelacionContrato] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo](
	[CodigoSede] [nvarchar](3) NOT NULL,
	[NombreEntrenamiento] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Catalogo] PRIMARY KEY CLUSTERED 
(
	[CodigoSede] ASC,
	[NombreEntrenamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificacion]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificacion](
	[Lugar] [nvarchar](50) NOT NULL,
	[DPI_Instructor] [nvarchar](13) NOT NULL,
	[Año] [smallint] NOT NULL,
 CONSTRAINT [PK_Certificacion] PRIMARY KEY CLUSTERED 
(
	[Lugar] ASC,
	[DPI_Instructor] ASC,
	[Año] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clase]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clase](
	[Codigo] [nvarchar](10) NOT NULL,
	[DPI_Instructor] [nvarchar](13) NULL,
	[CodigoSede] [nvarchar](3) NULL,
	[Tipo] [nvarchar](250) NULL,
	[Franja] [nvarchar](100) NULL,
 CONSTRAINT [PK_Clase] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Codigo] [nvarchar](10) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[NIT] [nvarchar](8) NOT NULL,
	[Direccion] [nvarchar](500) NULL,
	[Telefono] [nvarchar](8) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contrato]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contrato](
	[Numero] [nvarchar](10) NOT NULL,
	[Fecha_Inicio] [date] NOT NULL,
	[TipoContrato] [nvarchar](50) NOT NULL,
	[CodigoCliente] [nvarchar](10) NOT NULL,
	[Ubicacion] [nvarchar](3) NOT NULL,
	[CodigoVendedor] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Contrato] PRIMARY KEY CLUSTERED 
(
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ejercicio]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ejercicio](
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](500) NOT NULL,
	[Complejidad] [nvarchar](50) NOT NULL,
	[TipoMaquina] [nvarchar](50) NULL,
 CONSTRAINT [PK_Ejercicio] PRIMARY KEY CLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrenamiento]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrenamiento](
	[Nombre] [nvarchar](50) NOT NULL,
	[Frecuencia] [nvarchar](50) NOT NULL,
	[Dificultad] [nvarchar](50) NOT NULL,
	[Duracion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Entrenamiento] PRIMARY KEY CLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario](
	[CodigoClase] [nvarchar](10) NOT NULL,
	[Dia] [nchar](10) NOT NULL,
	[Hora] [time](7) NOT NULL,
 CONSTRAINT [PK_Horario] PRIMARY KEY CLUSTERED 
(
	[CodigoClase] ASC,
	[Dia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[DPI] [nvarchar](13) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
	[Fecha_Nacimiento] [date] NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[DPI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mantenimiento]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mantenimiento](
	[CodigoMaquina] [nvarchar](10) NOT NULL,
	[Fecha_Inicio] [datetime] NOT NULL,
	[Fecha_Fin] [datetime] NULL,
 CONSTRAINT [PK_Mantenimiento] PRIMARY KEY CLUSTERED 
(
	[CodigoMaquina] ASC,
	[Fecha_Inicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maquina]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maquina](
	[Codigo] [nvarchar](10) NOT NULL,
	[Ubicacion] [nvarchar](500) NOT NULL,
	[MusculoPrincipal] [nvarchar](50) NOT NULL,
	[NombreSede] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_Maquina] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[Codigo] [nvarchar](10) NOT NULL,
	[CodigoJefe] [nvarchar](10) NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[DPI] [nvarchar](13) NOT NULL,
	[Salario] [money] NOT NULL,
	[Turno] [nvarchar](10) NOT NULL,
	[Puesto] [nvarchar](50) NOT NULL,
	[Rol] [nvarchar](50) NULL,
	[CodigoSede] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rutina]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutina](
	[NombreEntrenamiento] [nvarchar](50) NOT NULL,
	[NombreEjercicio] [nvarchar](50) NOT NULL,
	[Sets] [smallint] NOT NULL,
	[Repeticiones] [smallint] NOT NULL,
 CONSTRAINT [PK_Rutina] PRIMARY KEY CLUSTERED 
(
	[NombreEntrenamiento] ASC,
	[NombreEjercicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sede]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sede](
	[Codigo] [nvarchar](3) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Direccion] [nvarchar](500) NULL,
	[Telefono] [nvarchar](8) NULL,
	[MaxCapacidad] [int] NULL,
	[Lockers] [int] NULL,
	[Duchas] [int] NULL,
 CONSTRAINT [PK_Sede] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoContrato]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoContrato](
	[Nombre] [nvarchar](50) NOT NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_TipoContrato] PRIMARY KEY CLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visita]    Script Date: 3/26/2020 4:28:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visita](
	[CodigoCliente] [nvarchar](10) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[CodigoSede] [nvarchar](3) NOT NULL,
	[NombreEntrenamiento] [nvarchar](50) NULL,
	[CodigoEntrenador] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Visita] PRIMARY KEY CLUSTERED 
(
	[CodigoCliente] ASC,
	[Fecha] ASC,
	[Hora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CancelacionContrato]  WITH CHECK ADD  CONSTRAINT [FK_CancelacionContrato_Contrato] FOREIGN KEY([Numero])
REFERENCES [dbo].[Contrato] ([Numero])
GO
ALTER TABLE [dbo].[CancelacionContrato] CHECK CONSTRAINT [FK_CancelacionContrato_Contrato]
GO
ALTER TABLE [dbo].[Catalogo]  WITH CHECK ADD  CONSTRAINT [FK_Catalogo_Entrenamiento] FOREIGN KEY([NombreEntrenamiento])
REFERENCES [dbo].[Entrenamiento] ([Nombre])
GO
ALTER TABLE [dbo].[Catalogo] CHECK CONSTRAINT [FK_Catalogo_Entrenamiento]
GO
ALTER TABLE [dbo].[Catalogo]  WITH CHECK ADD  CONSTRAINT [FK_Catalogo_Sede] FOREIGN KEY([CodigoSede])
REFERENCES [dbo].[Sede] ([Codigo])
GO
ALTER TABLE [dbo].[Catalogo] CHECK CONSTRAINT [FK_Catalogo_Sede]
GO
ALTER TABLE [dbo].[Certificacion]  WITH CHECK ADD  CONSTRAINT [FK_Certificacion_Instructor] FOREIGN KEY([DPI_Instructor])
REFERENCES [dbo].[Instructor] ([DPI])
GO
ALTER TABLE [dbo].[Certificacion] CHECK CONSTRAINT [FK_Certificacion_Instructor]
GO
ALTER TABLE [dbo].[Clase]  WITH CHECK ADD  CONSTRAINT [FK_Clase_Instructor] FOREIGN KEY([DPI_Instructor])
REFERENCES [dbo].[Instructor] ([DPI])
GO
ALTER TABLE [dbo].[Clase] CHECK CONSTRAINT [FK_Clase_Instructor]
GO
ALTER TABLE [dbo].[Clase]  WITH CHECK ADD  CONSTRAINT [FK_Clase_Sede] FOREIGN KEY([CodigoSede])
REFERENCES [dbo].[Sede] ([Codigo])
GO
ALTER TABLE [dbo].[Clase] CHECK CONSTRAINT [FK_Clase_Sede]
GO
ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD  CONSTRAINT [FK_Contrato_Cliente] FOREIGN KEY([CodigoCliente])
REFERENCES [dbo].[Cliente] ([Codigo])
GO
ALTER TABLE [dbo].[Contrato] CHECK CONSTRAINT [FK_Contrato_Cliente]
GO
ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD  CONSTRAINT [FK_Contrato_Personal] FOREIGN KEY([CodigoVendedor])
REFERENCES [dbo].[Personal] ([Codigo])
GO
ALTER TABLE [dbo].[Contrato] CHECK CONSTRAINT [FK_Contrato_Personal]
GO
ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD  CONSTRAINT [FK_Contrato_Sede] FOREIGN KEY([Ubicacion])
REFERENCES [dbo].[Sede] ([Codigo])
GO
ALTER TABLE [dbo].[Contrato] CHECK CONSTRAINT [FK_Contrato_Sede]
GO
ALTER TABLE [dbo].[Contrato]  WITH CHECK ADD  CONSTRAINT [FK_Contrato_TipoContrato] FOREIGN KEY([TipoContrato])
REFERENCES [dbo].[TipoContrato] ([Nombre])
GO
ALTER TABLE [dbo].[Contrato] CHECK CONSTRAINT [FK_Contrato_TipoContrato]
GO
ALTER TABLE [dbo].[Horario]  WITH CHECK ADD  CONSTRAINT [FK_Horario_Clase] FOREIGN KEY([CodigoClase])
REFERENCES [dbo].[Clase] ([Codigo])
GO
ALTER TABLE [dbo].[Horario] CHECK CONSTRAINT [FK_Horario_Clase]
GO
ALTER TABLE [dbo].[Mantenimiento]  WITH CHECK ADD  CONSTRAINT [FK_Mantenimiento_Maquina] FOREIGN KEY([CodigoMaquina])
REFERENCES [dbo].[Maquina] ([Codigo])
GO
ALTER TABLE [dbo].[Mantenimiento] CHECK CONSTRAINT [FK_Mantenimiento_Maquina]
GO
ALTER TABLE [dbo].[Maquina]  WITH CHECK ADD  CONSTRAINT [FK_Maquina_Sede] FOREIGN KEY([NombreSede])
REFERENCES [dbo].[Sede] ([Codigo])
GO
ALTER TABLE [dbo].[Maquina] CHECK CONSTRAINT [FK_Maquina_Sede]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Personal] FOREIGN KEY([CodigoJefe])
REFERENCES [dbo].[Personal] ([Codigo])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Personal]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Sede] FOREIGN KEY([CodigoSede])
REFERENCES [dbo].[Sede] ([Codigo])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Sede]
GO
ALTER TABLE [dbo].[Rutina]  WITH CHECK ADD  CONSTRAINT [FK_Rutina_Ejercicio] FOREIGN KEY([NombreEjercicio])
REFERENCES [dbo].[Ejercicio] ([Nombre])
GO
ALTER TABLE [dbo].[Rutina] CHECK CONSTRAINT [FK_Rutina_Ejercicio]
GO
ALTER TABLE [dbo].[Rutina]  WITH CHECK ADD  CONSTRAINT [FK_Rutina_Entrenamiento] FOREIGN KEY([NombreEntrenamiento])
REFERENCES [dbo].[Entrenamiento] ([Nombre])
GO
ALTER TABLE [dbo].[Rutina] CHECK CONSTRAINT [FK_Rutina_Entrenamiento]
GO
ALTER TABLE [dbo].[Visita]  WITH CHECK ADD  CONSTRAINT [FK_Visita_Cliente] FOREIGN KEY([CodigoCliente])
REFERENCES [dbo].[Cliente] ([Codigo])
GO
ALTER TABLE [dbo].[Visita] CHECK CONSTRAINT [FK_Visita_Cliente]
GO
ALTER TABLE [dbo].[Visita]  WITH CHECK ADD  CONSTRAINT [FK_Visita_Entrenamiento] FOREIGN KEY([NombreEntrenamiento])
REFERENCES [dbo].[Entrenamiento] ([Nombre])
GO
ALTER TABLE [dbo].[Visita] CHECK CONSTRAINT [FK_Visita_Entrenamiento]
GO
ALTER TABLE [dbo].[Visita]  WITH CHECK ADD  CONSTRAINT [FK_Visita_Personal] FOREIGN KEY([CodigoEntrenador])
REFERENCES [dbo].[Personal] ([Codigo])
GO
ALTER TABLE [dbo].[Visita] CHECK CONSTRAINT [FK_Visita_Personal]
GO
ALTER TABLE [dbo].[Visita]  WITH CHECK ADD  CONSTRAINT [FK_Visita_Sede] FOREIGN KEY([CodigoSede])
REFERENCES [dbo].[Sede] ([Codigo])
GO
ALTER TABLE [dbo].[Visita] CHECK CONSTRAINT [FK_Visita_Sede]
GO
USE [master]
GO
ALTER DATABASE [Gimansios Dinamic] SET  READ_WRITE 
GO
