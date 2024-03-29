USE [master]
GO
/****** Object:  Database [ZTourist]    Script Date: 30/03/2019 5:08:04 PM ******/
CREATE DATABASE [ZTourist]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ZTourist', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.DANZESQL\MSSQL\DATA\ZTourist.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ZTourist_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.DANZESQL\MSSQL\DATA\ZTourist_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ZTourist] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ZTourist].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ZTourist] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ZTourist] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ZTourist] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ZTourist] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ZTourist] SET ARITHABORT OFF 
GO
ALTER DATABASE [ZTourist] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ZTourist] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ZTourist] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ZTourist] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ZTourist] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ZTourist] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ZTourist] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ZTourist] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ZTourist] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ZTourist] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ZTourist] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ZTourist] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ZTourist] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ZTourist] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ZTourist] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ZTourist] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ZTourist] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ZTourist] SET RECOVERY FULL 
GO
ALTER DATABASE [ZTourist] SET  MULTI_USER 
GO
ALTER DATABASE [ZTourist] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ZTourist] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ZTourist] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ZTourist] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ZTourist] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ZTourist', N'ON'
GO
ALTER DATABASE [ZTourist] SET QUERY_STORE = OFF
GO
USE [ZTourist]
GO
/****** Object:  Table [dbo].[tblBooking]    Script Date: 30/03/2019 5:08:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBooking](
	[ID] [nvarchar](50) NOT NULL,
	[CustomerID] [nvarchar](30) NULL,
	[CouponCode] [nvarchar](30) NULL,
	[Comment] [nvarchar](500) NULL,
	[BookingDate] [datetime] NULL,
	[Status] [nvarchar](30) NULL,
 CONSTRAINT [PK_tblBooking_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBookingDetail]    Script Date: 30/03/2019 5:08:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBookingDetail](
	[BookingID] [nvarchar](50) NOT NULL,
	[TourID] [nvarchar](30) NOT NULL,
	[TicketAdult] [int] NULL,
	[TicketKid] [int] NULL,
 CONSTRAINT [PK_tblBookingDetail] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCouponCode]    Script Date: 30/03/2019 5:08:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCouponCode](
	[Code] [nvarchar](30) NOT NULL,
	[OffPercent] [tinyint] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_tblPromotionCode] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 30/03/2019 5:08:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[Username] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](30) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Gender] [nvarchar](10) NULL,
	[Avatar] [nvarchar](500) NULL,
	[Phone] [nvarchar](30) NULL,
	[Address] [nvarchar](200) NULL,
	[BirthDate] [date] NULL,
	[Job] [nvarchar](100) NULL,
	[RegisterDate] [datetime] NULL,
	[Role] [nvarchar](30) NULL,
 CONSTRAINT [PK_tblGuest] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 30/03/2019 5:08:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[Username] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](30) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Gender] [nvarchar](10) NULL,
	[Avatar] [nvarchar](500) NULL,
	[Address] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](30) NULL,
	[BirthDate] [date] NULL,
	[Job] [nvarchar](100) NULL,
	[Language] [nvarchar](500) NULL,
	[StartDate] [datetime] NULL,
	[Salary] [decimal](18, 2) NULL,
	[Role] [nvarchar](30) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPlace]    Script Date: 30/03/2019 5:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPlace](
	[ID] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[TitleImage] [nvarchar](500) NULL,
	[Description] [nvarchar](200) NULL,
	[Country] [nvarchar](50) NULL,
	[Status] [nvarchar](30) NULL,
 CONSTRAINT [PK_tblPlace] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTour]    Script Date: 30/03/2019 5:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTour](
	[ID] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[FareAdult] [decimal](18, 2) NULL,
	[FareKid] [decimal](18, 2) NULL,
	[Transport] [nvarchar](50) NULL,
	[MinGuest] [int] NULL,
	[MaxGuest] [int] NULL,
	[TitleImage] [nvarchar](500) NULL,
	[Status] [nvarchar](30) NULL,
 CONSTRAINT [PK_tblTour] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTourDetail]    Script Date: 30/03/2019 5:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTourDetail](
	[TourID] [nvarchar](30) NOT NULL,
	[PlaceID] [nvarchar](30) NOT NULL,
	[Number] [tinyint] NULL,
 CONSTRAINT [PK_tblTourDetail] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC,
	[PlaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTourGuide]    Script Date: 30/03/2019 5:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTourGuide](
	[TourID] [nvarchar](30) NOT NULL,
	[EmployeeID] [nvarchar](30) NOT NULL,
	[AssignDate] [datetime] NULL,
	[Status] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblTourGuide] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblBooking] ([ID], [CustomerID], [CouponCode], [Comment], [BookingDate], [Status]) VALUES (N'B0000', N'spidey', NULL, NULL, CAST(N'2019-02-11T08:41:00.000' AS DateTime), N'Cancel')
GO
INSERT [dbo].[tblBooking] ([ID], [CustomerID], [CouponCode], [Comment], [BookingDate], [Status]) VALUES (N'B0001', N'spidey', NULL, NULL, CAST(N'2019-03-16T22:00:00.000' AS DateTime), N'New')
GO
INSERT [dbo].[tblBooking] ([ID], [CustomerID], [CouponCode], [Comment], [BookingDate], [Status]) VALUES (N'B0003', N'danze', NULL, NULL, CAST(N'2019-03-17T13:23:00.000' AS DateTime), N'New')
GO
INSERT [dbo].[tblBooking] ([ID], [CustomerID], [CouponCode], [Comment], [BookingDate], [Status]) VALUES (N'B0004', N'spidey', NULL, NULL, CAST(N'2019-03-17T15:53:00.000' AS DateTime), N'New')
GO
INSERT [dbo].[tblBooking] ([ID], [CustomerID], [CouponCode], [Comment], [BookingDate], [Status]) VALUES (N'B0006', N'danze', NULL, NULL, CAST(N'2019-03-17T19:03:00.000' AS DateTime), N'New')
GO
INSERT [dbo].[tblBooking] ([ID], [CustomerID], [CouponCode], [Comment], [BookingDate], [Status]) VALUES (N'LEETHOMCUTE20190330125630367', N'leethomcute', NULL, N'love you <3 hê hê :Đ', CAST(N'2019-03-30T12:57:00.000' AS DateTime), N'Processing')
GO
INSERT [dbo].[tblBooking] ([ID], [CustomerID], [CouponCode], [Comment], [BookingDate], [Status]) VALUES (N'TESTUSER20190330101110967', N'testuser', N'DBZ20', N'', CAST(N'2019-03-30T10:11:00.000' AS DateTime), N'Processing')
GO
INSERT [dbo].[tblBookingDetail] ([BookingID], [TourID], [TicketAdult], [TicketKid]) VALUES (N'B0000', N'T0007', 2, 1)
GO
INSERT [dbo].[tblBookingDetail] ([BookingID], [TourID], [TicketAdult], [TicketKid]) VALUES (N'B0000', N'T0008', 3, 2)
GO
INSERT [dbo].[tblBookingDetail] ([BookingID], [TourID], [TicketAdult], [TicketKid]) VALUES (N'B0001', N'T0001', 3, 2)
GO
INSERT [dbo].[tblBookingDetail] ([BookingID], [TourID], [TicketAdult], [TicketKid]) VALUES (N'B0001', N'T0003', 5, 1)
GO
INSERT [dbo].[tblBookingDetail] ([BookingID], [TourID], [TicketAdult], [TicketKid]) VALUES (N'B0003', N'T0001', 4, 0)
GO
INSERT [dbo].[tblBookingDetail] ([BookingID], [TourID], [TicketAdult], [TicketKid]) VALUES (N'B0003', N'T0007', 6, 2)
GO
INSERT [dbo].[tblBookingDetail] ([BookingID], [TourID], [TicketAdult], [TicketKid]) VALUES (N'B0004', N'T0007', 3, 0)
GO
INSERT [dbo].[tblBookingDetail] ([BookingID], [TourID], [TicketAdult], [TicketKid]) VALUES (N'B0006', N'T0000', 5, 0)
GO
INSERT [dbo].[tblBookingDetail] ([BookingID], [TourID], [TicketAdult], [TicketKid]) VALUES (N'LEETHOMCUTE20190330125630367', N'T0007', 2, 0)
GO
INSERT [dbo].[tblBookingDetail] ([BookingID], [TourID], [TicketAdult], [TicketKid]) VALUES (N'TESTUSER20190330101110967', N'T00013', 2, 5)
GO
INSERT [dbo].[tblCouponCode] ([Code], [OffPercent], [StartDate], [EndDate]) VALUES (N'DBZ20', 20, CAST(N'2019-02-14T00:00:00.000' AS DateTime), CAST(N'2019-04-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblCustomer] ([Username], [Email], [Password], [FirstName], [LastName], [Gender], [Avatar], [Phone], [Address], [BirthDate], [Job], [RegisterDate], [Role]) VALUES (N'Anorak', N'hoangvpse130555@fpt.edu.vn', N'anorak', NULL, NULL, N'Male', N'images/avatars/ZAvatar.png', N'02398342422', N'Minami', CAST(N'1890-12-19' AS Date), NULL, CAST(N'2019-03-19T21:47:29.160' AS DateTime), N'customer')
GO
INSERT [dbo].[tblCustomer] ([Username], [Email], [Password], [FirstName], [LastName], [Gender], [Avatar], [Phone], [Address], [BirthDate], [Job], [RegisterDate], [Role]) VALUES (N'antman', N'antman@stark.com', N'antman', N'Scott', N'Lang', N'Male', N'images/avatars/ZAvatar.png', N'0912441348', N'NYC', CAST(N'1971-10-05' AS Date), NULL, CAST(N'2019-03-22T09:33:46.317' AS DateTime), N'customer')
GO
INSERT [dbo].[tblCustomer] ([Username], [Email], [Password], [FirstName], [LastName], [Gender], [Avatar], [Phone], [Address], [BirthDate], [Job], [RegisterDate], [Role]) VALUES (N'brucelee', N'breluce@yahoo.com.vn', N'brucelee', NULL, NULL, N'Male', N'images/avatars/ZAvatar.png', N'01239412833', N'Kyoto', CAST(N'2000-10-31' AS Date), NULL, CAST(N'2019-03-19T22:12:53.537' AS DateTime), N'customer')
GO
INSERT [dbo].[tblCustomer] ([Username], [Email], [Password], [FirstName], [LastName], [Gender], [Avatar], [Phone], [Address], [BirthDate], [Job], [RegisterDate], [Role]) VALUES (N'Danze', N'Danzejr@gmail.com', N'danze', N'David', N'Wolff', N'Male', N'images/avatars/ZAvatar.png', N'0327052525', N'HCM', CAST(N'1999-02-14' AS Date), NULL, CAST(N'2019-03-19T15:00:00.000' AS DateTime), N'customer')
GO
INSERT [dbo].[tblCustomer] ([Username], [Email], [Password], [FirstName], [LastName], [Gender], [Avatar], [Phone], [Address], [BirthDate], [Job], [RegisterDate], [Role]) VALUES (N'Hanabi', N'Hanzo@bethesa.com', N'hanabizo', N'Han', N'Motana', N'Female', N'images/avatars/ZAvatar.png', N'0212438343', N'Hokaido', CAST(N'1995-01-09' AS Date), NULL, CAST(N'2019-03-24T09:32:13.487' AS DateTime), N'customer')
GO
INSERT [dbo].[tblCustomer] ([Username], [Email], [Password], [FirstName], [LastName], [Gender], [Avatar], [Phone], [Address], [BirthDate], [Job], [RegisterDate], [Role]) VALUES (N'HanSolo', N'hosolan@microsoft.com', N'hansolo', NULL, NULL, N'Others', N'images/avatars/ZAvatar.png', N'03622824223', N'Tokyo', CAST(N'1996-01-11' AS Date), NULL, CAST(N'2019-03-19T22:09:46.687' AS DateTime), N'customer')
GO
INSERT [dbo].[tblCustomer] ([Username], [Email], [Password], [FirstName], [LastName], [Gender], [Avatar], [Phone], [Address], [BirthDate], [Job], [RegisterDate], [Role]) VALUES (N'leethomcute', N'phuongleninn@gmail.com', N'phuonglekhongthui', N'Le', N'Thom', N'Female', N'images/avatars/ZAvatar.png', N'0982861480', N'Da Nang', CAST(N'1998-03-05' AS Date), NULL, CAST(N'2019-03-30T12:51:29.277' AS DateTime), N'customer')
GO
INSERT [dbo].[tblCustomer] ([Username], [Email], [Password], [FirstName], [LastName], [Gender], [Avatar], [Phone], [Address], [BirthDate], [Job], [RegisterDate], [Role]) VALUES (N'Liukang', N'Liukang@gmail.com', N'liukang', N'Hiroshima', N'Ada', N'Others', N'images/avatars/ZAvatar.png', N'01283473842', N'Seatle, US', CAST(N'1997-07-16' AS Date), NULL, CAST(N'2019-03-24T19:30:39.487' AS DateTime), N'customer')
GO
INSERT [dbo].[tblCustomer] ([Username], [Email], [Password], [FirstName], [LastName], [Gender], [Avatar], [Phone], [Address], [BirthDate], [Job], [RegisterDate], [Role]) VALUES (N'Lucifer', N'lucifer@hell.vn', N'lucifer', NULL, NULL, N'Female', N'images/avatars/ZAvatar.png', N'0944765322', N'HCM', CAST(N'1998-02-18' AS Date), NULL, CAST(N'2019-03-19T22:18:17.137' AS DateTime), N'customer')
GO
INSERT [dbo].[tblCustomer] ([Username], [Email], [Password], [FirstName], [LastName], [Gender], [Avatar], [Phone], [Address], [BirthDate], [Job], [RegisterDate], [Role]) VALUES (N'Phoenix', N'morgana@darkside.com', N'phoenix', NULL, NULL, N'Female', N'images/avatars/ZAvatar.png', N'042114092', N'London', CAST(N'1985-09-28' AS Date), NULL, CAST(N'2019-03-19T22:00:03.773' AS DateTime), N'customer')
GO
INSERT [dbo].[tblCustomer] ([Username], [Email], [Password], [FirstName], [LastName], [Gender], [Avatar], [Phone], [Address], [BirthDate], [Job], [RegisterDate], [Role]) VALUES (N'songoku', N'hoangdanze@yahoo.com', N'songoku', NULL, NULL, N'Male', N'images/avatars/ZAvatar.png', N'024786522', N'Texas', CAST(N'1971-06-10' AS Date), NULL, CAST(N'2019-03-19T21:55:13.090' AS DateTime), N'customer')
GO
INSERT [dbo].[tblCustomer] ([Username], [Email], [Password], [FirstName], [LastName], [Gender], [Avatar], [Phone], [Address], [BirthDate], [Job], [RegisterDate], [Role]) VALUES (N'Spidey', N'hoangspidey@gmail.com', N'spidey', N'Peter', N'Parker', N'Male', N'images/avatars/spidey/vdc.png', N'+84327052525', N'Queen,  NYC, United State', CAST(N'1999-02-14' AS Date), N'Photographer', CAST(N'2019-03-19T21:40:00.387' AS DateTime), N'customer')
GO
INSERT [dbo].[tblCustomer] ([Username], [Email], [Password], [FirstName], [LastName], [Gender], [Avatar], [Phone], [Address], [BirthDate], [Job], [RegisterDate], [Role]) VALUES (N'Talion', N'talion@gmail.com', N'talion', NULL, NULL, N'Male', N'images/avatars/ZAvatar.png', N'02392523525', N'Manhattan', CAST(N'1996-08-08' AS Date), NULL, CAST(N'2019-03-19T22:05:47.370' AS DateTime), N'customer')
GO
INSERT [dbo].[tblCustomer] ([Username], [Email], [Password], [FirstName], [LastName], [Gender], [Avatar], [Phone], [Address], [BirthDate], [Job], [RegisterDate], [Role]) VALUES (N'testUser', N'Test@gmail.com', N'testuser', N'Test', N'Test', N'Male', N'images/avatars/ZAvatar.png', N'2842424244', N'US', CAST(N'1906-03-08' AS Date), NULL, CAST(N'2019-03-30T10:06:08.723' AS DateTime), N'customer')
GO
INSERT [dbo].[tblEmployee] ([Username], [Password], [FirstName], [LastName], [Gender], [Avatar], [Address], [Email], [Phone], [BirthDate], [Job], [Language], [StartDate], [Salary], [Role]) VALUES (N'Danze', N'danzejr', N'Hoang', N'Vo', N'Male', N'images/staffs/ZAvatar.png', N'HCM, VN', N'Hoangspidey@gmail.com', N'0389283348', CAST(N'1998-12-29' AS Date), N'Manager', N'vi, en, jp', CAST(N'2019-03-05T09:14:00.000' AS DateTime), CAST(5000.00 AS Decimal(18, 2)), N'admin')
GO
INSERT [dbo].[tblEmployee] ([Username], [Password], [FirstName], [LastName], [Gender], [Avatar], [Address], [Email], [Phone], [BirthDate], [Job], [Language], [StartDate], [Salary], [Role]) VALUES (N'Hulu', N'hulukan', N'Hulu', N'hulaku', N'Female', N'images/staffs/hulu/deathstrokeava.png', N'Tokyo, Japan', N'hulu@gmail.com', N'01241241848', CAST(N'2000-01-04' AS Date), N'', N'', CAST(N'2019-03-30T03:05:07.167' AS DateTime), CAST(0.00 AS Decimal(18, 2)), N'guide')
GO
INSERT [dbo].[tblEmployee] ([Username], [Password], [FirstName], [LastName], [Gender], [Avatar], [Address], [Email], [Phone], [BirthDate], [Job], [Language], [StartDate], [Salary], [Role]) VALUES (N'Kenkun', N'kenkun', N'Ken', N'Yoshimura', N'Male', N'images/staffs/ZAvatar.png', N'HCM, VN', N'Kenkun@gmail.com', N'0378273899', CAST(N'1984-03-07' AS Date), N'Guide', N'jp, vi', CAST(N'2019-03-11T16:44:00.000' AS DateTime), CAST(1500.00 AS Decimal(18, 2)), N'guide')
GO
INSERT [dbo].[tblEmployee] ([Username], [Password], [FirstName], [LastName], [Gender], [Avatar], [Address], [Email], [Phone], [BirthDate], [Job], [Language], [StartDate], [Salary], [Role]) VALUES (N'Lucius', N'lucius', N'Lucius', N'Mellon', N'Male', N'images/staffs/lucius/zombie_cats-wallpaper-1920x1080.png', N'Los Angeles, US', N'Lucius@microsoft.com', N'0248324242', CAST(N'1995-10-17' AS Date), N'Guide', N'', CAST(N'2019-03-30T01:53:38.860' AS DateTime), CAST(1000.00 AS Decimal(18, 2)), N'guide')
GO
INSERT [dbo].[tblPlace] ([ID], [Name], [TitleImage], [Description], [Country], [Status]) VALUES (N'P00001', N'Da Lat', N'images/places/default.jpg', NULL, N'Viet Nam', N'Active')
GO
INSERT [dbo].[tblPlace] ([ID], [Name], [TitleImage], [Description], [Country], [Status]) VALUES (N'P00002', N'Sa Pa', N'images/places/default.jpg', NULL, N'Viet Nam', N'Active')
GO
INSERT [dbo].[tblPlace] ([ID], [Name], [TitleImage], [Description], [Country], [Status]) VALUES (N'P00003', N'Quang Ninh', N'images/places/default.jpg', NULL, N'Viet Nam', N'Active')
GO
INSERT [dbo].[tblPlace] ([ID], [Name], [TitleImage], [Description], [Country], [Status]) VALUES (N'P00005', N'Seol', N'images/places/default.jpg', NULL, N'South Korea', N'Active')
GO
INSERT [dbo].[tblPlace] ([ID], [Name], [TitleImage], [Description], [Country], [Status]) VALUES (N'P00006', N'Da Nang', N'images/places/p00006/danang1.jpg', N'', N'Viet Nam', N'Active')
GO
INSERT [dbo].[tblPlace] ([ID], [Name], [TitleImage], [Description], [Country], [Status]) VALUES (N'P00007', N'Tokyo', N'images/places/default.jpg', NULL, N'Japan', N'Active')
GO
INSERT [dbo].[tblPlace] ([ID], [Name], [TitleImage], [Description], [Country], [Status]) VALUES (N'P00008', N'London', N'images/places/default.jpg', NULL, N'United Kingdom', N'Active')
GO
INSERT [dbo].[tblPlace] ([ID], [Name], [TitleImage], [Description], [Country], [Status]) VALUES (N'P00009', N'Singapore', N'images/places/default.jpg', NULL, N'Singapore', N'Active')
GO
INSERT [dbo].[tblPlace] ([ID], [Name], [TitleImage], [Description], [Country], [Status]) VALUES (N'P00010', N'Hue', N'images/places/p00010/hue.jpg', N'', N'Viet Nam', N'Active')
GO
INSERT [dbo].[tblTour] ([ID], [Name], [Description], [FromDate], [ToDate], [FareAdult], [FareKid], [Transport], [MinGuest], [MaxGuest], [TitleImage], [Status]) VALUES (N'P00006', N'Võ Phi Hoàng', N'', CAST(N'2019-03-26T06:02:33.000' AS DateTime), CAST(N'2019-04-03T06:02:20.000' AS DateTime), CAST(12.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), N'VietJet Air', 12, 100, N'images/tours/p00006/v.png', N'Active')
GO
INSERT [dbo].[tblTour] ([ID], [Name], [Description], [FromDate], [ToDate], [FareAdult], [FareKid], [Transport], [MinGuest], [MaxGuest], [TitleImage], [Status]) VALUES (N'T0000', N'Da Lat - Sa Pa Tour', N'Higher, Further, Faster! Try it now!', CAST(N'2019-04-03T09:30:00.000' AS DateTime), CAST(N'2019-04-25T09:31:00.000' AS DateTime), CAST(1000.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), N'VietJet Air', 5, 20, N'images/tours/sapa1.jpg', N'Active')
GO
INSERT [dbo].[tblTour] ([ID], [Name], [Description], [FromDate], [ToDate], [FareAdult], [FareKid], [Transport], [MinGuest], [MaxGuest], [TitleImage], [Status]) VALUES (N'T0001', N'Da Lat - London Dreamy Tour', N'Doctor Who, Sherlock Holmes, and...Benedict Cumberbatchhhhh!', CAST(N'2019-03-21T08:00:00.000' AS DateTime), CAST(N'2019-04-12T00:00:00.000' AS DateTime), CAST(3000.00 AS Decimal(18, 2)), CAST(1500.00 AS Decimal(18, 2)), N'Vietnamese Airline', 10, 50, N'images/tours/london.jpg', N'Active')
GO
INSERT [dbo].[tblTour] ([ID], [Name], [Description], [FromDate], [ToDate], [FareAdult], [FareKid], [Transport], [MinGuest], [MaxGuest], [TitleImage], [Status]) VALUES (N'T00013', N'Test', N'', CAST(N'2019-03-31T10:08:06.000' AS DateTime), CAST(N'2019-04-06T10:09:06.000' AS DateTime), CAST(300.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), N'Bus', 10, 50, N'images/tours/default.jpg', N'Active')
GO
INSERT [dbo].[tblTour] ([ID], [Name], [Description], [FromDate], [ToDate], [FareAdult], [FareKid], [Transport], [MinGuest], [MaxGuest], [TitleImage], [Status]) VALUES (N'T0003', N'Da Nang - Quang Ninh Amazing Landscapes', N'', CAST(N'2019-03-30T08:32:45.000' AS DateTime), CAST(N'2019-04-06T16:33:45.000' AS DateTime), CAST(700.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'VietJet Air', 10, 30, N'images/tours/default.jpg', N'Active')
GO
INSERT [dbo].[tblTour] ([ID], [Name], [Description], [FromDate], [ToDate], [FareAdult], [FareKid], [Transport], [MinGuest], [MaxGuest], [TitleImage], [Status]) VALUES (N'T0007', N'Sa Pa - Singapore - Tokyo Travel Aroud The World', N'As title, perfect! You will be amazed!', CAST(N'2019-04-01T06:00:00.000' AS DateTime), CAST(N'2019-04-22T00:00:00.000' AS DateTime), CAST(5000.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), N'Green Lantern Corp', 15, 50, N'images/tours/tokyo.jpg', N'Active')
GO
INSERT [dbo].[tblTour] ([ID], [Name], [Description], [FromDate], [ToDate], [FareAdult], [FareKid], [Transport], [MinGuest], [MaxGuest], [TitleImage], [Status]) VALUES (N'T0008', N'Quang Ninh - Tokyo Masterpieces Tour', N'Landscape, peple, and other amazing things is waiting for you to discover! Check it out', CAST(N'2019-03-19T15:00:00.000' AS DateTime), CAST(N'2019-04-22T10:00:00.000' AS DateTime), CAST(2400.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), N'Vietnamese Airline and Tour Bus', 10, 30, N'images/tours/tokyo1.jpg', N'Active')
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'P00006', N'P00005', 1)
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'P00006', N'P00008', 2)
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'P00006', N'P00009', 0)
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'T0000', N'P00001', 0)
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'T0000', N'P00002', 1)
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'T0001', N'P00001', 0)
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'T0001', N'P00008', 1)
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'T00013', N'P00006', 1)
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'T00013', N'P00010', 0)
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'T0003', N'P00003', 1)
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'T0003', N'P00006', 0)
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'T0007', N'P00002', 0)
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'T0007', N'P00007', 2)
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'T0007', N'P00009', 1)
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'T0008', N'P00003', 0)
GO
INSERT [dbo].[tblTourDetail] ([TourID], [PlaceID], [Number]) VALUES (N'T0008', N'P00007', 1)
GO
INSERT [dbo].[tblTourGuide] ([TourID], [EmployeeID], [AssignDate], [Status]) VALUES (N'P00006', N'Hulu', CAST(N'2019-03-30T06:15:34.347' AS DateTime), N'Active')
GO
INSERT [dbo].[tblTourGuide] ([TourID], [EmployeeID], [AssignDate], [Status]) VALUES (N'P00006', N'Kenkun', CAST(N'2019-03-30T06:15:34.367' AS DateTime), N'Active')
GO
INSERT [dbo].[tblTourGuide] ([TourID], [EmployeeID], [AssignDate], [Status]) VALUES (N'T0000', N'Kenkun', CAST(N'2019-03-30T06:15:05.170' AS DateTime), N'Active')
GO
INSERT [dbo].[tblTourGuide] ([TourID], [EmployeeID], [AssignDate], [Status]) VALUES (N'T0000', N'Lucius', CAST(N'2019-03-30T06:15:05.147' AS DateTime), N'Active')
GO
INSERT [dbo].[tblTourGuide] ([TourID], [EmployeeID], [AssignDate], [Status]) VALUES (N'T00013', N'Hulu', CAST(N'2019-03-30T10:08:48.010' AS DateTime), N'Active')
GO
INSERT [dbo].[tblTourGuide] ([TourID], [EmployeeID], [AssignDate], [Status]) VALUES (N'T0003', N'Kenkun', CAST(N'2019-03-28T14:35:01.007' AS DateTime), N'Active')
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_tblBooking_tblGuest] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tblCustomer] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_tblBooking_tblGuest]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_tblBooking_tblPromotionCode] FOREIGN KEY([CouponCode])
REFERENCES [dbo].[tblCouponCode] ([Code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_tblBooking_tblPromotionCode]
GO
ALTER TABLE [dbo].[tblBookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblBookingDetail_tblBooking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[tblBooking] ([ID])
GO
ALTER TABLE [dbo].[tblBookingDetail] CHECK CONSTRAINT [FK_tblBookingDetail_tblBooking]
GO
ALTER TABLE [dbo].[tblBookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblBookingDetail_tblTour] FOREIGN KEY([TourID])
REFERENCES [dbo].[tblTour] ([ID])
GO
ALTER TABLE [dbo].[tblBookingDetail] CHECK CONSTRAINT [FK_tblBookingDetail_tblTour]
GO
ALTER TABLE [dbo].[tblTourDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblTourDetail_tblPlace] FOREIGN KEY([PlaceID])
REFERENCES [dbo].[tblPlace] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblTourDetail] CHECK CONSTRAINT [FK_tblTourDetail_tblPlace]
GO
ALTER TABLE [dbo].[tblTourDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblTourDetail_tblTour] FOREIGN KEY([TourID])
REFERENCES [dbo].[tblTour] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblTourDetail] CHECK CONSTRAINT [FK_tblTourDetail_tblTour]
GO
ALTER TABLE [dbo].[tblTourGuide]  WITH CHECK ADD  CONSTRAINT [FK_tblTourGuide_tblEmployee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[tblEmployee] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblTourGuide] CHECK CONSTRAINT [FK_tblTourGuide_tblEmployee]
GO
ALTER TABLE [dbo].[tblTourGuide]  WITH CHECK ADD  CONSTRAINT [FK_tblTourGuide_tblTour] FOREIGN KEY([TourID])
REFERENCES [dbo].[tblTour] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblTourGuide] CHECK CONSTRAINT [FK_tblTourGuide_tblTour]
GO
USE [master]
GO
ALTER DATABASE [ZTourist] SET  READ_WRITE 
GO
