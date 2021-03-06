USE [master]
GO
/****** Object:  Database [L2_Empresa_V2]    Script Date: 2/15/2020 6:34:36 PM ******/
CREATE DATABASE [L2_Empresa_V2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'L2_Empresa_V2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\L2_Empresa_V2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'L2_Empresa_V2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\L2_Empresa_V2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [L2_Empresa_V2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [L2_Empresa_V2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [L2_Empresa_V2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET ARITHABORT OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [L2_Empresa_V2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [L2_Empresa_V2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [L2_Empresa_V2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [L2_Empresa_V2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET RECOVERY FULL 
GO
ALTER DATABASE [L2_Empresa_V2] SET  MULTI_USER 
GO
ALTER DATABASE [L2_Empresa_V2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [L2_Empresa_V2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [L2_Empresa_V2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [L2_Empresa_V2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [L2_Empresa_V2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'L2_Empresa_V2', N'ON'
GO
ALTER DATABASE [L2_Empresa_V2] SET QUERY_STORE = OFF
GO
USE [L2_Empresa_V2]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 2/15/2020 6:34:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[DPI] [nvarchar](13) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Direccion] [nvarchar](500) NULL,
	[FechaNacimiento] [datetime] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[DPI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 2/15/2020 6:34:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[DPICliente] [nvarchar](13) NOT NULL,
	[CodigoProducto] [int] NOT NULL,
	[Cantidad] [smallint] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[DPICliente] ASC,
	[CodigoProducto] ASC,
	[Fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 2/15/2020 6:34:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[PrecioUnitario] [money] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 2/15/2020 6:34:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[NIT] [nvarchar](9) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Direccion] [nvarchar](500) NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[NIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suministro]    Script Date: 2/15/2020 6:34:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suministro](
	[NITProveedor] [nvarchar](9) NOT NULL,
	[CodigoProducto] [int] NOT NULL,
 CONSTRAINT [PK_Suministro] PRIMARY KEY CLUSTERED 
(
	[NITProveedor] ASC,
	[CodigoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cliente] ([DPI], [Nombre], [Apellido], [Direccion], [FechaNacimiento]) VALUES (N'1612329730101', N'Hugo', N'Lopez', N'zona 13', CAST(N'1991-10-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Cliente] ([DPI], [Nombre], [Apellido], [Direccion], [FechaNacimiento]) VALUES (N'1945745960201', N'Diego', N'Figueroa', N'zona 1', CAST(N'1993-03-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Cliente] ([DPI], [Nombre], [Apellido], [Direccion], [FechaNacimiento]) VALUES (N'2150407240101', N'Andrea', N'Cuellar', N'zona 16', CAST(N'1992-10-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Cliente] ([DPI], [Nombre], [Apellido], [Direccion], [FechaNacimiento]) VALUES (N'2179633900101', N'Diana', N'Gutierrez', N'zona 17', CAST(N'1990-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Cliente] ([DPI], [Nombre], [Apellido], [Direccion], [FechaNacimiento]) VALUES (N'2264675540301', N'Maria', N'Martinez', N'zona 13', CAST(N'1995-08-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Compra] ([DPICliente], [CodigoProducto], [Cantidad], [Fecha]) VALUES (N'1612329730101', 4, 5, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Compra] ([DPICliente], [CodigoProducto], [Cantidad], [Fecha]) VALUES (N'1612329730101', 5, 2, CAST(N'2020-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Compra] ([DPICliente], [CodigoProducto], [Cantidad], [Fecha]) VALUES (N'2150407240101', 1, 2, CAST(N'2020-01-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Compra] ([DPICliente], [CodigoProducto], [Cantidad], [Fecha]) VALUES (N'2150407240101', 2, 1, CAST(N'2020-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Compra] ([DPICliente], [CodigoProducto], [Cantidad], [Fecha]) VALUES (N'2150407240101', 4, 3, CAST(N'2020-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Compra] ([DPICliente], [CodigoProducto], [Cantidad], [Fecha]) VALUES (N'2150407240101', 5, 2, CAST(N'2020-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Compra] ([DPICliente], [CodigoProducto], [Cantidad], [Fecha]) VALUES (N'2179633900101', 1, 2, CAST(N'2020-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Compra] ([DPICliente], [CodigoProducto], [Cantidad], [Fecha]) VALUES (N'2179633900101', 2, 1, CAST(N'2020-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Compra] ([DPICliente], [CodigoProducto], [Cantidad], [Fecha]) VALUES (N'2179633900101', 3, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Compra] ([DPICliente], [CodigoProducto], [Cantidad], [Fecha]) VALUES (N'2179633900101', 3, 3, CAST(N'2020-01-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([Codigo], [Nombre], [PrecioUnitario]) VALUES (1, N'Shampoo', 25.0000)
INSERT [dbo].[Producto] ([Codigo], [Nombre], [PrecioUnitario]) VALUES (2, N'Toallas', 52.3000)
INSERT [dbo].[Producto] ([Codigo], [Nombre], [PrecioUnitario]) VALUES (3, N'Pollo Amarillo', 12.5000)
INSERT [dbo].[Producto] ([Codigo], [Nombre], [PrecioUnitario]) VALUES (4, N'Pelotas de cuero', 120.0000)
INSERT [dbo].[Producto] ([Codigo], [Nombre], [PrecioUnitario]) VALUES (5, N'Aguacate', 8.9900)
INSERT [dbo].[Producto] ([Codigo], [Nombre], [PrecioUnitario]) VALUES (6, N'Camisa', 100.0000)
INSERT [dbo].[Producto] ([Codigo], [Nombre], [PrecioUnitario]) VALUES (7, N'Mesa de Futbolito', 1399.0000)
INSERT [dbo].[Producto] ([Codigo], [Nombre], [PrecioUnitario]) VALUES (8, N'Pelota de Tenis', 14.9900)
SET IDENTITY_INSERT [dbo].[Producto] OFF
INSERT [dbo].[Proveedor] ([NIT], [Nombre], [Direccion]) VALUES (N'12345-6', N'Grupo Universal SA', N'zona 7')
INSERT [dbo].[Proveedor] ([NIT], [Nombre], [Direccion]) VALUES (N'1456789-3', N'Nike', N'zona 13')
INSERT [dbo].[Proveedor] ([NIT], [Nombre], [Direccion]) VALUES (N'2947849-2', N'Apple', N'zona 1')
INSERT [dbo].[Proveedor] ([NIT], [Nombre], [Direccion]) VALUES (N'3783885-4', N'Guateplast', N'zona 7')
INSERT [dbo].[Proveedor] ([NIT], [Nombre], [Direccion]) VALUES (N'483818-2', N'Distribuidora El Aguacate', N'zona 5')
INSERT [dbo].[Proveedor] ([NIT], [Nombre], [Direccion]) VALUES (N'493326-5', N'Multiservicios GyL', N'zona 12')
INSERT [dbo].[Proveedor] ([NIT], [Nombre], [Direccion]) VALUES (N'569965-k', N'Los Pollos Hermanos', N'zona 11')
INSERT [dbo].[Proveedor] ([NIT], [Nombre], [Direccion]) VALUES (N'5783958-7', N'Hierros de Guatemala', N'zona 12')
INSERT [dbo].[Proveedor] ([NIT], [Nombre], [Direccion]) VALUES (N'6483758-1', N'Samsung', N'zona 2')
INSERT [dbo].[Proveedor] ([NIT], [Nombre], [Direccion]) VALUES (N'6483989-3', N'Megapaca', N'zona 5')
INSERT [dbo].[Proveedor] ([NIT], [Nombre], [Direccion]) VALUES (N'6836790-k', N'Ecomoda', N'zona 20')
INSERT [dbo].[Proveedor] ([NIT], [Nombre], [Direccion]) VALUES (N'706099-6', N'Distribuidora Exito', N'zona 5')
INSERT [dbo].[Suministro] ([NITProveedor], [CodigoProducto]) VALUES (N'12345-6', 4)
INSERT [dbo].[Suministro] ([NITProveedor], [CodigoProducto]) VALUES (N'493326-5', 7)
INSERT [dbo].[Suministro] ([NITProveedor], [CodigoProducto]) VALUES (N'569965-k', 3)
INSERT [dbo].[Suministro] ([NITProveedor], [CodigoProducto]) VALUES (N'6483989-3', 6)
INSERT [dbo].[Suministro] ([NITProveedor], [CodigoProducto]) VALUES (N'6483989-3', 8)
INSERT [dbo].[Suministro] ([NITProveedor], [CodigoProducto]) VALUES (N'6836790-k', 6)
ALTER TABLE [dbo].[Compra]  WITH NOCHECK ADD  CONSTRAINT [FK_Compra_Cliente] FOREIGN KEY([DPICliente])
REFERENCES [dbo].[Cliente] ([DPI])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Cliente]
GO
ALTER TABLE [dbo].[Compra]  WITH NOCHECK ADD  CONSTRAINT [FK_Compra_Producto] FOREIGN KEY([CodigoProducto])
REFERENCES [dbo].[Producto] ([Codigo])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Producto]
GO
ALTER TABLE [dbo].[Suministro]  WITH CHECK ADD  CONSTRAINT [FK_Suministro_Producto] FOREIGN KEY([CodigoProducto])
REFERENCES [dbo].[Producto] ([Codigo])
GO
ALTER TABLE [dbo].[Suministro] CHECK CONSTRAINT [FK_Suministro_Producto]
GO
ALTER TABLE [dbo].[Suministro]  WITH CHECK ADD  CONSTRAINT [FK_Suministro_Proveedor] FOREIGN KEY([NITProveedor])
REFERENCES [dbo].[Proveedor] ([NIT])
GO
ALTER TABLE [dbo].[Suministro] CHECK CONSTRAINT [FK_Suministro_Proveedor]
GO
USE [master]
GO
ALTER DATABASE [L2_Empresa_V2] SET  READ_WRITE 
GO
