USE [master]
GO
/****** Object:  Database [Movies]    Script Date: 24.01.2021 21:07:49 ******/
CREATE DATABASE [Movies]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Movies', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Movies.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Movies_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Movies_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Movies] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Movies].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Movies] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Movies] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Movies] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Movies] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Movies] SET ARITHABORT OFF 
GO
ALTER DATABASE [Movies] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Movies] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Movies] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Movies] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Movies] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Movies] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Movies] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Movies] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Movies] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Movies] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Movies] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Movies] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Movies] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Movies] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Movies] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Movies] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Movies] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Movies] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Movies] SET  MULTI_USER 
GO
ALTER DATABASE [Movies] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Movies] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Movies] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Movies] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Movies] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Movies] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Movies] SET QUERY_STORE = OFF
GO
USE [Movies]
GO
/****** Object:  Table [dbo].[Actor]    Script Date: 24.01.2021 21:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[SurName] [varchar](50) NOT NULL,
	[Birthday] [datetime] NULL,
 CONSTRAINT [PK_Actor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Character]    Script Date: 24.01.2021 21:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[SurName] [varchar](50) NULL,
 CONSTRAINT [PK_Character] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Director]    Script Date: 24.01.2021 21:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Director](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[SurName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Director] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kind]    Script Date: 24.01.2021 21:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kind](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
 CONSTRAINT [PK_Kind] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 24.01.2021 21:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CreateYear] [char](4) NOT NULL,
	[boxoffice] [money] NULL,
	[DirectorId] [int] NOT NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieCharacterActor]    Script Date: 24.01.2021 21:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieCharacterActor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NULL,
	[CharacterId] [int] NULL,
	[ActorId] [int] NULL,
 CONSTRAINT [PK_MovieCharacterActor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieKind]    Script Date: 24.01.2021 21:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieKind](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[KindId] [int] NOT NULL,
 CONSTRAINT [PK_MovieKind] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actor] ON 

INSERT [dbo].[Actor] ([Id], [Name], [SurName], [Birthday]) VALUES (1, N'Jude', N'Law', NULL)
INSERT [dbo].[Actor] ([Id], [Name], [SurName], [Birthday]) VALUES (2, N'Jamie', N'Foxx', NULL)
INSERT [dbo].[Actor] ([Id], [Name], [SurName], [Birthday]) VALUES (3, N'Zoe', N'Saldana', NULL)
SET IDENTITY_INSERT [dbo].[Actor] OFF
GO
SET IDENTITY_INSERT [dbo].[Character] ON 

INSERT [dbo].[Character] ([Id], [Name], [SurName]) VALUES (1, N'Neytiri', NULL)
INSERT [dbo].[Character] ([Id], [Name], [SurName]) VALUES (2, N'Sherlock', N'Holmes')
INSERT [dbo].[Character] ([Id], [Name], [SurName]) VALUES (3, N'Lambert', NULL)
SET IDENTITY_INSERT [dbo].[Character] OFF
GO
SET IDENTITY_INSERT [dbo].[Director] ON 

INSERT [dbo].[Director] ([Id], [Name], [SurName]) VALUES (1, N'James', N'Cameron')
INSERT [dbo].[Director] ([Id], [Name], [SurName]) VALUES (2, N'Guy', N'Ritchie')
INSERT [dbo].[Director] ([Id], [Name], [SurName]) VALUES (3, N'David', N'Fincher')
SET IDENTITY_INSERT [dbo].[Director] OFF
GO
SET IDENTITY_INSERT [dbo].[Kind] ON 

INSERT [dbo].[Kind] ([Id], [Name]) VALUES (1, N'Gerilim')
INSERT [dbo].[Kind] ([Id], [Name]) VALUES (2, N'BilimKurgu')
INSERT [dbo].[Kind] ([Id], [Name]) VALUES (3, N'Aksiyon')
SET IDENTITY_INSERT [dbo].[Kind] OFF
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([Id], [Name], [CreateYear], [boxoffice], [DirectorId]) VALUES (1, N'Yaratık', N'1979', 7000000.0000, 1)
INSERT [dbo].[Movie] ([Id], [Name], [CreateYear], [boxoffice], [DirectorId]) VALUES (2, N'Yaratık 2', N'1986', 10000000.0000, 2)
INSERT [dbo].[Movie] ([Id], [Name], [CreateYear], [boxoffice], [DirectorId]) VALUES (3, N'Yaratık 3', N'1992', 4000000.0000, 3)
INSERT [dbo].[Movie] ([Id], [Name], [CreateYear], [boxoffice], [DirectorId]) VALUES (4, N' Adalet Peşinde', N'2009', 300000.0000, 1)
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieCharacterActor] ON 

INSERT [dbo].[MovieCharacterActor] ([Id], [MovieId], [CharacterId], [ActorId]) VALUES (1, 1, 1, 1)
INSERT [dbo].[MovieCharacterActor] ([Id], [MovieId], [CharacterId], [ActorId]) VALUES (2, 2, 1, 1)
INSERT [dbo].[MovieCharacterActor] ([Id], [MovieId], [CharacterId], [ActorId]) VALUES (3, 2, 2, 1)
INSERT [dbo].[MovieCharacterActor] ([Id], [MovieId], [CharacterId], [ActorId]) VALUES (4, 2, 2, 2)
INSERT [dbo].[MovieCharacterActor] ([Id], [MovieId], [CharacterId], [ActorId]) VALUES (5, 3, 1, 1)
INSERT [dbo].[MovieCharacterActor] ([Id], [MovieId], [CharacterId], [ActorId]) VALUES (6, 3, 2, 2)
INSERT [dbo].[MovieCharacterActor] ([Id], [MovieId], [CharacterId], [ActorId]) VALUES (7, 3, 2, 1)
INSERT [dbo].[MovieCharacterActor] ([Id], [MovieId], [CharacterId], [ActorId]) VALUES (8, 3, 1, 2)
SET IDENTITY_INSERT [dbo].[MovieCharacterActor] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieKind] ON 

INSERT [dbo].[MovieKind] ([Id], [MovieId], [KindId]) VALUES (1, 1, 1)
INSERT [dbo].[MovieKind] ([Id], [MovieId], [KindId]) VALUES (2, 1, 2)
INSERT [dbo].[MovieKind] ([Id], [MovieId], [KindId]) VALUES (3, 1, 3)
INSERT [dbo].[MovieKind] ([Id], [MovieId], [KindId]) VALUES (4, 2, 3)
INSERT [dbo].[MovieKind] ([Id], [MovieId], [KindId]) VALUES (5, 2, 2)
INSERT [dbo].[MovieKind] ([Id], [MovieId], [KindId]) VALUES (6, 3, 1)
SET IDENTITY_INSERT [dbo].[MovieKind] OFF
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Director] FOREIGN KEY([DirectorId])
REFERENCES [dbo].[Director] ([Id])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_Director]
GO
ALTER TABLE [dbo].[MovieCharacterActor]  WITH CHECK ADD  CONSTRAINT [FK_MovieCharacterActor_Actor] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actor] ([Id])
GO
ALTER TABLE [dbo].[MovieCharacterActor] CHECK CONSTRAINT [FK_MovieCharacterActor_Actor]
GO
ALTER TABLE [dbo].[MovieCharacterActor]  WITH CHECK ADD  CONSTRAINT [FK_MovieCharacterActor_Character] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[MovieCharacterActor] CHECK CONSTRAINT [FK_MovieCharacterActor_Character]
GO
ALTER TABLE [dbo].[MovieCharacterActor]  WITH CHECK ADD  CONSTRAINT [FK_MovieCharacterActor_Movie] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([Id])
GO
ALTER TABLE [dbo].[MovieCharacterActor] CHECK CONSTRAINT [FK_MovieCharacterActor_Movie]
GO
ALTER TABLE [dbo].[MovieKind]  WITH CHECK ADD  CONSTRAINT [FK_MovieKind_MovieKind] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([Id])
GO
ALTER TABLE [dbo].[MovieKind] CHECK CONSTRAINT [FK_MovieKind_MovieKind]
GO
ALTER TABLE [dbo].[MovieKind]  WITH CHECK ADD  CONSTRAINT [FK_MovieKind_MovieKind1] FOREIGN KEY([KindId])
REFERENCES [dbo].[Kind] ([Id])
GO
ALTER TABLE [dbo].[MovieKind] CHECK CONSTRAINT [FK_MovieKind_MovieKind1]
GO
USE [master]
GO
ALTER DATABASE [Movies] SET  READ_WRITE 
GO
