USE [master]
GO
/****** Object:  Database [HotelesSoleil]    Script Date: 3/24/2020 6:58:06 PM ******/
CREATE DATABASE [HotelesSoleil]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelesSoleil', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HotelesSoleil.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelesSoleil_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HotelesSoleil_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HotelesSoleil] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelesSoleil].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelesSoleil] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelesSoleil] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelesSoleil] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelesSoleil] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelesSoleil] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelesSoleil] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelesSoleil] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelesSoleil] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelesSoleil] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelesSoleil] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelesSoleil] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelesSoleil] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelesSoleil] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelesSoleil] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelesSoleil] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelesSoleil] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelesSoleil] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelesSoleil] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelesSoleil] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelesSoleil] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelesSoleil] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelesSoleil] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelesSoleil] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelesSoleil] SET  MULTI_USER 
GO
ALTER DATABASE [HotelesSoleil] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelesSoleil] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelesSoleil] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelesSoleil] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelesSoleil] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HotelesSoleil', N'ON'
GO
ALTER DATABASE [HotelesSoleil] SET QUERY_STORE = OFF
GO
USE [HotelesSoleil]
GO
/****** Object:  Table [dbo].[Acompañante]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acompañante](
	[CódigoReserva] [nvarchar](15) NOT NULL,
	[NumDoc] [nvarchar](13) NOT NULL,
 CONSTRAINT [PK_Acompañante] PRIMARY KEY CLUSTERED 
(
	[CódigoReserva] ASC,
	[NumDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adicional]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adicional](
	[CódigoHotel] [nvarchar](15) NOT NULL,
	[CódigoExtra] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Adicional] PRIMARY KEY CLUSTERED 
(
	[CódigoHotel] ASC,
	[CódigoExtra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgenciaViajes]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgenciaViajes](
	[NumDoc] [nvarchar](13) NOT NULL,
	[NombreAgente] [nvarchar](50) NOT NULL,
	[Agencia] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AgenciaViajes] PRIMARY KEY CLUSTERED 
(
	[NumDoc] ASC,
	[NombreAgente] ASC,
	[Agencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo](
	[CódigoHotel] [nvarchar](15) NOT NULL,
	[CódigoPaquete] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Catalogo] PRIMARY KEY CLUSTERED 
(
	[CódigoHotel] ASC,
	[CódigoPaquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoría]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoría](
	[TipoCategía] [nvarchar](15) NOT NULL,
	[IVA] [money] NOT NULL,
	[Descripción] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Categoría] PRIMARY KEY CLUSTERED 
(
	[TipoCategía] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[NumDoc] [nvarchar](13) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[TipoDoc] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[NumDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complemento]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complemento](
	[CódigoExtra] [nvarchar](15) NOT NULL,
	[CódigoReserva] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Complemento] PRIMARY KEY CLUSTERED 
(
	[CódigoExtra] ASC,
	[CódigoReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Extra]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Extra](
	[Código] [nvarchar](15) NOT NULL,
	[Descripción] [nvarchar](500) NOT NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_Extra] PRIMARY KEY CLUSTERED 
(
	[Código] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gerencia]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gerencia](
	[CódigoEmpleado] [nvarchar](15) NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
	[ÁreaGerencia] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gerencia] PRIMARY KEY CLUSTERED 
(
	[CódigoEmpleado] ASC,
	[FechaInicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuiaTurismo]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuiaTurismo](
	[DPI] [nvarchar](13) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_GuiaTurismo] PRIMARY KEY CLUSTERED 
(
	[DPI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitación]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitación](
	[CódigoHotel] [nvarchar](15) NOT NULL,
	[Código] [nvarchar](15) NOT NULL,
	[Nivel] [smallint] NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Habitación] PRIMARY KEY CLUSTERED 
(
	[CódigoHotel] ASC,
	[Código] ASC,
	[Nivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historial]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial](
	[CódigoHotel] [nvarchar](15) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Categoría] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Historial] PRIMARY KEY CLUSTERED 
(
	[CódigoHotel] ASC,
	[Fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[Código] [nvarchar](15) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Dirección] [nvarchar](250) NOT NULL,
	[Teléfono] [nvarchar](8) NOT NULL,
	[AñoConstrucción] [smallint] NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[Código] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Limpieza]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Limpieza](
	[CódigoHabitación] [nvarchar](15) NOT NULL,
	[NivelHabitación] [smallint] NOT NULL,
	[CódigoHotel] [nvarchar](15) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[CódigoEmpleado] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Limpieza] PRIMARY KEY CLUSTERED 
(
	[CódigoHabitación] ASC,
	[NivelHabitación] ASC,
	[CódigoHotel] ASC,
	[Fecha] ASC,
	[Hora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaqueteTurístico]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaqueteTurístico](
	[Código] [nvarchar](15) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Capacidad] [int] NOT NULL,
	[Frecuencia] [int] NOT NULL,
	[Duración] [int] NOT NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_PaqueteTurístico] PRIMARY KEY CLUSTERED 
(
	[Código] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Particular]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Particular](
	[NumDoc] [nvarchar](13) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[TipoDoc] [nvarchar](30) NOT NULL,
	[Dirección] [nvarchar](500) NOT NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[Teléfono] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_Particular] PRIMARY KEY CLUSTERED 
(
	[NumDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[Código] [nvarchar](15) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[DPI] [nvarchar](13) NOT NULL,
	[Salario] [money] NOT NULL,
	[Turno] [nvarchar](30) NOT NULL,
	[ÁreaEmpleado] [nvarchar](50) NOT NULL,
	[CódigoHotel] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[Código] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recibo]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recibo](
	[CódigoReserva] [nvarchar](15) NOT NULL,
	[CódigoTour] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Recibo] PRIMARY KEY CLUSTERED 
(
	[CódigoReserva] ASC,
	[CódigoTour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recorrido]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recorrido](
	[CódigoPaquete] [nvarchar](15) NOT NULL,
	[Dirección] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Recorrido] PRIMARY KEY CLUSTERED 
(
	[CódigoPaquete] ASC,
	[Dirección] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[Código] [nvarchar](15) NOT NULL,
	[CódigoHabitación] [nvarchar](15) NOT NULL,
	[NivelHabitación] [smallint] NOT NULL,
	[CódigoHotel] [nvarchar](15) NOT NULL,
	[CódigoEmpleado] [nvarchar](15) NOT NULL,
	[NumDoc] [nvarchar](13) NOT NULL,
	[Precio] [money] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[Código] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sitio]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sitio](
	[Dirección] [nvarchar](250) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sitio] PRIMARY KEY CLUSTERED 
(
	[Dirección] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 3/24/2020 6:58:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[Código] [nvarchar](15) NOT NULL,
	[NumDocCliente] [nvarchar](13) NOT NULL,
	[CódigoPaquete] [nvarchar](15) NOT NULL,
	[DPIGuia] [nvarchar](13) NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[Código] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Acompañante]  WITH CHECK ADD  CONSTRAINT [FK_Acompañante_Cliente] FOREIGN KEY([NumDoc])
REFERENCES [dbo].[Cliente] ([NumDoc])
GO
ALTER TABLE [dbo].[Acompañante] CHECK CONSTRAINT [FK_Acompañante_Cliente]
GO
ALTER TABLE [dbo].[Acompañante]  WITH CHECK ADD  CONSTRAINT [FK_Acompañante_Reserva] FOREIGN KEY([CódigoReserva])
REFERENCES [dbo].[Reserva] ([Código])
GO
ALTER TABLE [dbo].[Acompañante] CHECK CONSTRAINT [FK_Acompañante_Reserva]
GO
ALTER TABLE [dbo].[Adicional]  WITH CHECK ADD  CONSTRAINT [FK_Adicional_Extra] FOREIGN KEY([CódigoExtra])
REFERENCES [dbo].[Extra] ([Código])
GO
ALTER TABLE [dbo].[Adicional] CHECK CONSTRAINT [FK_Adicional_Extra]
GO
ALTER TABLE [dbo].[Adicional]  WITH CHECK ADD  CONSTRAINT [FK_Adicional_Hotel] FOREIGN KEY([CódigoHotel])
REFERENCES [dbo].[Hotel] ([Código])
GO
ALTER TABLE [dbo].[Adicional] CHECK CONSTRAINT [FK_Adicional_Hotel]
GO
ALTER TABLE [dbo].[AgenciaViajes]  WITH CHECK ADD  CONSTRAINT [FK_AgenciaViajes_Particular] FOREIGN KEY([NumDoc])
REFERENCES [dbo].[Particular] ([NumDoc])
GO
ALTER TABLE [dbo].[AgenciaViajes] CHECK CONSTRAINT [FK_AgenciaViajes_Particular]
GO
ALTER TABLE [dbo].[Catalogo]  WITH CHECK ADD  CONSTRAINT [FK_Catalogo_Hotel] FOREIGN KEY([CódigoHotel])
REFERENCES [dbo].[Hotel] ([Código])
GO
ALTER TABLE [dbo].[Catalogo] CHECK CONSTRAINT [FK_Catalogo_Hotel]
GO
ALTER TABLE [dbo].[Catalogo]  WITH CHECK ADD  CONSTRAINT [FK_Catalogo_PaqueteTurístico] FOREIGN KEY([CódigoPaquete])
REFERENCES [dbo].[PaqueteTurístico] ([Código])
GO
ALTER TABLE [dbo].[Catalogo] CHECK CONSTRAINT [FK_Catalogo_PaqueteTurístico]
GO
ALTER TABLE [dbo].[Complemento]  WITH CHECK ADD  CONSTRAINT [FK_Complemento_Extra] FOREIGN KEY([CódigoExtra])
REFERENCES [dbo].[Extra] ([Código])
GO
ALTER TABLE [dbo].[Complemento] CHECK CONSTRAINT [FK_Complemento_Extra]
GO
ALTER TABLE [dbo].[Complemento]  WITH CHECK ADD  CONSTRAINT [FK_Complemento_Reserva1] FOREIGN KEY([CódigoReserva])
REFERENCES [dbo].[Reserva] ([Código])
GO
ALTER TABLE [dbo].[Complemento] CHECK CONSTRAINT [FK_Complemento_Reserva1]
GO
ALTER TABLE [dbo].[Gerencia]  WITH CHECK ADD  CONSTRAINT [FK_Gerencia_Personal] FOREIGN KEY([CódigoEmpleado])
REFERENCES [dbo].[Personal] ([Código])
GO
ALTER TABLE [dbo].[Gerencia] CHECK CONSTRAINT [FK_Gerencia_Personal]
GO
ALTER TABLE [dbo].[Habitación]  WITH CHECK ADD  CONSTRAINT [FK_Habitación_Hotel] FOREIGN KEY([CódigoHotel])
REFERENCES [dbo].[Hotel] ([Código])
GO
ALTER TABLE [dbo].[Habitación] CHECK CONSTRAINT [FK_Habitación_Hotel]
GO
ALTER TABLE [dbo].[Habitación]  WITH CHECK ADD  CONSTRAINT [FK_Habitación_Hotel1] FOREIGN KEY([CódigoHotel])
REFERENCES [dbo].[Hotel] ([Código])
GO
ALTER TABLE [dbo].[Habitación] CHECK CONSTRAINT [FK_Habitación_Hotel1]
GO
ALTER TABLE [dbo].[Historial]  WITH CHECK ADD  CONSTRAINT [FK_Historial_Categoría] FOREIGN KEY([Categoría])
REFERENCES [dbo].[Categoría] ([TipoCategía])
GO
ALTER TABLE [dbo].[Historial] CHECK CONSTRAINT [FK_Historial_Categoría]
GO
ALTER TABLE [dbo].[Historial]  WITH CHECK ADD  CONSTRAINT [FK_Historial_Hotel] FOREIGN KEY([CódigoHotel])
REFERENCES [dbo].[Hotel] ([Código])
GO
ALTER TABLE [dbo].[Historial] CHECK CONSTRAINT [FK_Historial_Hotel]
GO
ALTER TABLE [dbo].[Limpieza]  WITH CHECK ADD  CONSTRAINT [FK_Limpieza_Habitación] FOREIGN KEY([CódigoHotel], [CódigoHabitación], [NivelHabitación])
REFERENCES [dbo].[Habitación] ([CódigoHotel], [Código], [Nivel])
GO
ALTER TABLE [dbo].[Limpieza] CHECK CONSTRAINT [FK_Limpieza_Habitación]
GO
ALTER TABLE [dbo].[Limpieza]  WITH CHECK ADD  CONSTRAINT [FK_Limpieza_Personal] FOREIGN KEY([CódigoEmpleado])
REFERENCES [dbo].[Personal] ([Código])
GO
ALTER TABLE [dbo].[Limpieza] CHECK CONSTRAINT [FK_Limpieza_Personal]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Hotel] FOREIGN KEY([CódigoHotel])
REFERENCES [dbo].[Hotel] ([Código])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Hotel]
GO
ALTER TABLE [dbo].[Recibo]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_Reserva] FOREIGN KEY([CódigoReserva])
REFERENCES [dbo].[Reserva] ([Código])
GO
ALTER TABLE [dbo].[Recibo] CHECK CONSTRAINT [FK_Recibo_Reserva]
GO
ALTER TABLE [dbo].[Recibo]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_Tour] FOREIGN KEY([CódigoTour])
REFERENCES [dbo].[Tour] ([Código])
GO
ALTER TABLE [dbo].[Recibo] CHECK CONSTRAINT [FK_Recibo_Tour]
GO
ALTER TABLE [dbo].[Recorrido]  WITH CHECK ADD  CONSTRAINT [FK_Recorrido_PaqueteTurístico] FOREIGN KEY([CódigoPaquete])
REFERENCES [dbo].[PaqueteTurístico] ([Código])
GO
ALTER TABLE [dbo].[Recorrido] CHECK CONSTRAINT [FK_Recorrido_PaqueteTurístico]
GO
ALTER TABLE [dbo].[Recorrido]  WITH CHECK ADD  CONSTRAINT [FK_Recorrido_Sitio] FOREIGN KEY([Dirección])
REFERENCES [dbo].[Sitio] ([Dirección])
GO
ALTER TABLE [dbo].[Recorrido] CHECK CONSTRAINT [FK_Recorrido_Sitio]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Habitación] FOREIGN KEY([CódigoHotel], [CódigoHabitación], [NivelHabitación])
REFERENCES [dbo].[Habitación] ([CódigoHotel], [Código], [Nivel])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Habitación]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Particular] FOREIGN KEY([NumDoc])
REFERENCES [dbo].[Particular] ([NumDoc])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Particular]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Personal] FOREIGN KEY([CódigoEmpleado])
REFERENCES [dbo].[Personal] ([Código])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Personal]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_GuiaTurismo] FOREIGN KEY([DPIGuia])
REFERENCES [dbo].[GuiaTurismo] ([DPI])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_GuiaTurismo]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_PaqueteTurístico] FOREIGN KEY([CódigoPaquete])
REFERENCES [dbo].[PaqueteTurístico] ([Código])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_PaqueteTurístico]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_Particular] FOREIGN KEY([NumDocCliente])
REFERENCES [dbo].[Particular] ([NumDoc])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_Particular]
GO
USE [master]
GO
ALTER DATABASE [HotelesSoleil] SET  READ_WRITE 
GO
