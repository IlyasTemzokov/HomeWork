USE [master]
GO
/****** Object:  Database [ShopIluyas1]    Script Date: 28.04.2021 10:58:39 ******/
CREATE DATABASE [ShopIluyas1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopIluyas1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopIluyas1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopIluyas1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopIluyas1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopIluyas1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopIluyas1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopIluyas1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopIluyas1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopIluyas1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopIluyas1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopIluyas1] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopIluyas1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopIluyas1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopIluyas1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopIluyas1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopIluyas1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopIluyas1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopIluyas1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopIluyas1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopIluyas1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopIluyas1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopIluyas1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopIluyas1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopIluyas1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopIluyas1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopIluyas1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopIluyas1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopIluyas1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopIluyas1] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopIluyas1] SET  MULTI_USER 
GO
ALTER DATABASE [ShopIluyas1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopIluyas1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopIluyas1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopIluyas1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopIluyas1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopIluyas1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopIluyas1] SET QUERY_STORE = OFF
GO
USE [ShopIluyas1]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 28.04.2021 10:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientHasOrder]    Script Date: 28.04.2021 10:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientHasOrder](
	[ClientId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_ClientHasOrder_1] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListOfProductsInOrder]    Script Date: 28.04.2021 10:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListOfProductsInOrder](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_ListOfProductsInOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 28.04.2021 10:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[id] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 28.04.2021 10:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] NOT NULL,
	[OrderName] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 28.04.2021 10:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](10) NULL,
	[Price] [decimal](7, 2) NULL,
	[Description] [nvarchar](30) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28.04.2021 10:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] NOT NULL,
	[SurName] [nvarchar](15) NULL,
	[FirstName] [nvarchar](15) NULL,
	[LastName] [nvarchar](15) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Client] ([ID], [UserID]) VALUES (1, NULL)
INSERT [dbo].[Client] ([ID], [UserID]) VALUES (2, NULL)
INSERT [dbo].[Client] ([ID], [UserID]) VALUES (3, NULL)
GO
INSERT [dbo].[ListOfProductsInOrder] ([OrderID], [ProductID]) VALUES (1, 1)
INSERT [dbo].[ListOfProductsInOrder] ([OrderID], [ProductID]) VALUES (1, 2)
INSERT [dbo].[ListOfProductsInOrder] ([OrderID], [ProductID]) VALUES (1, 3)
INSERT [dbo].[ListOfProductsInOrder] ([OrderID], [ProductID]) VALUES (2, 2)
INSERT [dbo].[ListOfProductsInOrder] ([OrderID], [ProductID]) VALUES (3, 1)
INSERT [dbo].[ListOfProductsInOrder] ([OrderID], [ProductID]) VALUES (3, 3)
GO
INSERT [dbo].[Order] ([id], [OrderName]) VALUES (1, N'order_1')
INSERT [dbo].[Order] ([id], [OrderName]) VALUES (2, N'order_2')
INSERT [dbo].[Order] ([id], [OrderName]) VALUES (3, N'order_3')
GO
INSERT [dbo].[Products] ([ID], [Name], [Price], [Description]) VALUES (1, N'Tea', NULL, N'')
INSERT [dbo].[Products] ([ID], [Name], [Price], [Description]) VALUES (2, N'Chocolate', NULL, N'')
INSERT [dbo].[Products] ([ID], [Name], [Price], [Description]) VALUES (3, N'Apple', NULL, N'')
GO
INSERT [dbo].[User] ([id], [SurName], [FirstName], [LastName]) VALUES (1, N'Иванов', N'Иван', N'Петрович')
INSERT [dbo].[User] ([id], [SurName], [FirstName], [LastName]) VALUES (2, N'Петр', N'Иванович', N'Данилов')
INSERT [dbo].[User] ([id], [SurName], [FirstName], [LastName]) VALUES (3, N'Елизавета', N'Олеговна', N'Пашковская')
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_User]
GO
ALTER TABLE [dbo].[ClientHasOrder]  WITH CHECK ADD  CONSTRAINT [FK_ClientHasOrder_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientHasOrder] CHECK CONSTRAINT [FK_ClientHasOrder_Client]
GO
ALTER TABLE [dbo].[ClientHasOrder]  WITH CHECK ADD  CONSTRAINT [FK_ClientHasOrder_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[ClientHasOrder] CHECK CONSTRAINT [FK_ClientHasOrder_Order]
GO
ALTER TABLE [dbo].[ListOfProductsInOrder]  WITH CHECK ADD  CONSTRAINT [FK_ListOfProductsInOrder_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[ListOfProductsInOrder] CHECK CONSTRAINT [FK_ListOfProductsInOrder_Order]
GO
ALTER TABLE [dbo].[ListOfProductsInOrder]  WITH CHECK ADD  CONSTRAINT [FK_ListOfProductsInOrder_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[ListOfProductsInOrder] CHECK CONSTRAINT [FK_ListOfProductsInOrder_Products]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_User]
GO
USE [master]
GO
ALTER DATABASE [ShopIluyas1] SET  READ_WRITE 
GO
