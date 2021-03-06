USE [master]
GO
/****** Object:  Database [XiSapAssignment1]    Script Date: 11/5/2017 08:40:18 PM ******/
CREATE DATABASE [XiSapAssignment1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XiSapAssignment1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\XiSapAssignment1.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'XiSapAssignment1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\XiSapAssignment1_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [XiSapAssignment1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XiSapAssignment1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XiSapAssignment1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET ARITHABORT OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XiSapAssignment1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XiSapAssignment1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XiSapAssignment1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XiSapAssignment1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [XiSapAssignment1] SET  MULTI_USER 
GO
ALTER DATABASE [XiSapAssignment1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XiSapAssignment1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XiSapAssignment1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XiSapAssignment1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [XiSapAssignment1] SET DELAYED_DURABILITY = DISABLED 
GO
USE [XiSapAssignment1]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/5/2017 08:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [nvarchar](50) NOT NULL,
	[Password] [varchar](18) NULL,
	[Name] [varchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Sex] [varchar](8) NULL,
	[Phone] [varchar](11) NULL,
	[Email] [varchar](50) NULL,
	[DateOfCreate] [datetime] NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 11/5/2017 08:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Answer](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[Details] [varchar](100) NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 11/5/2017 08:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Quiz](
	[QuizID] [int] IDENTITY(1,1) NOT NULL,
	[Details] [varchar](300) NULL,
	[QuizAdderID] [varchar](20) NULL,
	[AnswerID] [varchar](10) NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuizManage]    Script Date: 11/5/2017 08:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizManage](
	[AnswerID] [int] NULL,
	[QuizID] [int] NULL,
	[IDQuizControl] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_QuizManage] PRIMARY KEY CLUSTERED 
(
	[IDQuizControl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test]    Script Date: 11/5/2017 08:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test](
	[TestID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[TestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestControl]    Script Date: 11/5/2017 08:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestControl](
	[TestID] [int] NULL,
	[QuizID] [int] NULL,
	[IDTestControl] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TestControl] PRIMARY KEY CLUSTERED 
(
	[IDTestControl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestReview]    Script Date: 11/5/2017 08:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestReview](
	[QuizID] [int] NULL,
	[IDTestScore] [int] NULL,
	[AnswerID] [int] NULL,
	[IDReview] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TestReview] PRIMARY KEY CLUSTERED 
(
	[IDReview] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestScore]    Script Date: 11/5/2017 08:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestScore](
	[IDTestScore] [int] IDENTITY(1,1) NOT NULL,
	[TestID] [int] NULL,
	[AccountID] [nvarchar](50) NULL,
	[Score] [int] NULL,
	[TimeDo] [int] NULL,
	[TimeStart] [datetime] NULL,
	[TimeDoTest] [nvarchar](50) NULL,
 CONSTRAINT [PK_TestScore] PRIMARY KEY CLUSTERED 
(
	[IDTestScore] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([AccountID], [Password], [Name], [DateOfBirth], [Sex], [Phone], [Email], [DateOfCreate]) VALUES (N'admin', N'145789632a', N'Minh', CAST(N'1997-05-08' AS Date), N'male', N'01262996997', N'ncm686@gmail.com', CAST(N'2017-01-11 00:00:00.000' AS DateTime))
INSERT [dbo].[Account] ([AccountID], [Password], [Name], [DateOfBirth], [Sex], [Phone], [Email], [DateOfCreate]) VALUES (N'test01', N'123', N'Tester1', CAST(N'1998-10-16' AS Date), N'female', N'0123456789', N'abc@email.com', CAST(N'2017-01-11 00:00:00.000' AS DateTime))
INSERT [dbo].[Account] ([AccountID], [Password], [Name], [DateOfBirth], [Sex], [Phone], [Email], [DateOfCreate]) VALUES (N'test02', N'123', N'Tester2', CAST(N'1998-10-16' AS Date), N'female', N'0123456789', N'abc@email.com', CAST(N'2017-01-11 00:00:00.000' AS DateTime))
INSERT [dbo].[Account] ([AccountID], [Password], [Name], [DateOfBirth], [Sex], [Phone], [Email], [DateOfCreate]) VALUES (N'test03', N'123', N'Tester3', CAST(N'1998-10-16' AS Date), N'female', N'0123456789', N'abc@email.com', CAST(N'2017-01-11 00:00:00.000' AS DateTime))
INSERT [dbo].[Account] ([AccountID], [Password], [Name], [DateOfBirth], [Sex], [Phone], [Email], [DateOfCreate]) VALUES (N'test04', N'123', N'Tester4', CAST(N'1998-10-16' AS Date), N'female', N'0123456789', N'abc@email.com', CAST(N'2017-01-11 00:00:00.000' AS DateTime))
INSERT [dbo].[Account] ([AccountID], [Password], [Name], [DateOfBirth], [Sex], [Phone], [Email], [DateOfCreate]) VALUES (N'test05', N'145789632a', N'Minhdzai', CAST(N'2017-11-09' AS Date), N'male', N'01262996997', N'sad@gmail.com', CAST(N'2017-11-05 00:00:00.000' AS DateTime))
INSERT [dbo].[Account] ([AccountID], [Password], [Name], [DateOfBirth], [Sex], [Phone], [Email], [DateOfCreate]) VALUES (N'test06', N'123', N'Tester6', CAST(N'2017-11-09' AS Date), N'male', N'0123456789', N'abc@email.com', CAST(N'2017-01-11 00:00:00.000' AS DateTime))
INSERT [dbo].[Account] ([AccountID], [Password], [Name], [DateOfBirth], [Sex], [Phone], [Email], [DateOfCreate]) VALUES (N'test07', N'123', N'Tester7', CAST(N'2017-11-09' AS Date), N'male', N'0123456789', N'abc@email.com', CAST(N'2017-01-11 00:00:00.000' AS DateTime))
INSERT [dbo].[Account] ([AccountID], [Password], [Name], [DateOfBirth], [Sex], [Phone], [Email], [DateOfCreate]) VALUES (N'test08', N'123', N'Tester8', CAST(N'2017-11-09' AS Date), N'female', N'0123456789', N'abc@email.com', CAST(N'2017-01-11 00:00:00.000' AS DateTime))
INSERT [dbo].[Account] ([AccountID], [Password], [Name], [DateOfBirth], [Sex], [Phone], [Email], [DateOfCreate]) VALUES (N'test09', N'123', N'Tester9', CAST(N'2017-11-09' AS Date), N'male', N'0123456789', N'abc@email.com', CAST(N'2017-01-11 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (0, N'Empty')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (1, N'Q1A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (2, N'Q1A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (3, N'Q1A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (4, N'Q1A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (5, N'Q2A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (6, N'Q2A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (7, N'Q2A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (8, N'Q2A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (9, N'Q3A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (10, N'Q3A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (11, N'Q3A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (12, N'Q3A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (13, N'Q4A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (14, N'Q4A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (15, N'Q4A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (16, N'Q4A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (17, N'Q5A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (18, N'Q5A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (19, N'Q5A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (20, N'Q5A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (21, N'Q6A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (22, N'Q6A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (23, N'Q6A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (24, N'Q6A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (25, N'Q7A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (26, N'Q7A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (27, N'Q7A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (28, N'Q7A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (29, N'Q8A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (30, N'Q8A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (31, N'Q8A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (32, N'Q8A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (33, N'Q9A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (34, N'Q9A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (35, N'Q9A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (36, N'Q9A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (37, N'Q10A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (38, N'Q10A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (39, N'Q10A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (40, N'Q10A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (41, N'Q11A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (42, N'Q11A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (43, N'Q11A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (44, N'Q11A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (45, N'Q12A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (46, N'Q12A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (47, N'Q12A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (48, N'Q12A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (49, N'Q13A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (50, N'Q13A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (51, N'Q13A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (52, N'Q13A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (53, N'Q14A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (54, N'Q14A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (55, N'Q14A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (56, N'Q14A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (57, N'Q15A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (58, N'Q15A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (59, N'Q15A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (60, N'Q15A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (61, N'Q16A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (62, N'Q16A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (63, N'Q16A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (64, N'Q16A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (65, N'Q17A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (66, N'Q17A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (67, N'Q17A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (68, N'Q17A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (69, N'Q18A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (70, N'Q18A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (71, N'Q18A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (72, N'Q18A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (73, N'Q19A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (74, N'Q19A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (75, N'Q19A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (76, N'Q19A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (77, N'Q20A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (78, N'Q20A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (79, N'Q20A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (80, N'Q20A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (81, N'Q21A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (82, N'Q21A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (83, N'Q21A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (84, N'Q21A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (85, N'Q22A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (86, N'Q22A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (87, N'Q22A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (88, N'Q22A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (89, N'Q23A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (90, N'Q23A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (91, N'Q23A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (92, N'Q23A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (93, N'Q24A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (94, N'Q24A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (95, N'Q24A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (96, N'Q24A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (97, N'Q25A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (98, N'Q25A2')
GO
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (99, N'Q25A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (100, N'Q25A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (101, N'Q26A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (102, N'Q26A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (103, N'Q26A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (104, N'Q26A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (105, N'Q27A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (106, N'Q27A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (107, N'Q27A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (108, N'Q27A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (109, N'Q28A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (110, N'Q28A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (111, N'Q28A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (112, N'Q28A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (113, N'Q29A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (114, N'Q29A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (115, N'Q29A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (116, N'Q29A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (117, N'Q30A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (118, N'Q30A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (119, N'Q30A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (120, N'Q30A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (121, N'Q31A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (122, N'Q31A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (123, N'Q31A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (124, N'Q31A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (125, N'Q32A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (126, N'Q32A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (127, N'Q32A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (128, N'Q32A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (129, N'Q33A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (130, N'Q33A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (131, N'Q33A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (132, N'Q33A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (133, N'Q34A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (134, N'Q34A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (135, N'Q34A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (136, N'Q34A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (137, N'Q35A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (138, N'Q35A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (139, N'Q35A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (140, N'Q35A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (141, N'Q36A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (142, N'Q36A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (143, N'Q36A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (144, N'Q36A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (145, N'Q37A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (146, N'Q37A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (147, N'Q37A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (148, N'Q37A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (149, N'Q1A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (150, N'Q1A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (151, N'Q1A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (152, N'Q1A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (153, N'Q2A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (154, N'Q2A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (155, N'Q2A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (156, N'Q2A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (157, N'Q3A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (158, N'Q3A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (159, N'Q3A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (160, N'Q3A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (161, N'Q4A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (162, N'Q4A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (163, N'Q4A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (164, N'Q4A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (165, N'Q5A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (166, N'Q5A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (167, N'Q5A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (168, N'Q5A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (169, N'Q6A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (170, N'Q6A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (171, N'Q6A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (172, N'Q6A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (173, N'Q7A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (174, N'Q7A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (175, N'Q7A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (176, N'Q7A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (177, N'Q8A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (178, N'Q8A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (179, N'Q8A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (180, N'Q8A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (181, N'Q9A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (182, N'Q9A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (183, N'Q9A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (184, N'Q9A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (185, N'Q10A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (186, N'Q10A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (187, N'Q10A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (188, N'Q10A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (189, N'Q11A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (190, N'Q11A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (191, N'Q11A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (192, N'Q11A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (193, N'Q12A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (194, N'Q12A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (195, N'Q12A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (196, N'Q12A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (197, N'Q13A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (198, N'Q13A3')
GO
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (199, N'Q13A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (200, N'Q13A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (201, N'Q14A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (202, N'Q14A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (203, N'Q14A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (204, N'Q14A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (205, N'Q15A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (206, N'Q15A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (207, N'Q15A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (208, N'Q15A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (209, N'Q16A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (210, N'Q16A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (211, N'Q16A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (212, N'Q16A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (213, N'Q17A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (214, N'Q17A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (215, N'Q17A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (216, N'Q17A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (217, N'Q18A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (218, N'Q18A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (219, N'Q18A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (220, N'Q18A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (221, N'Q19A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (222, N'Q19A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (223, N'Q19A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (224, N'Q19A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (225, N'Q20A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (226, N'Q20A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (227, N'Q20A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (228, N'Q20A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (229, N'Q21A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (230, N'Q21A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (231, N'Q21A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (232, N'Q21A4')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (233, N'Q22A1')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (234, N'Q22A3')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (235, N'Q22A2')
INSERT [dbo].[Answer] ([AnswerID], [Details]) VALUES (236, N'Q22A4')
SET IDENTITY_INSERT [dbo].[Answer] OFF
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (1, N'Quiz1', N'admin', N'1')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (2, N'Quiz2', N'admin', N'6')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (3, N'Quiz3', N'admin', N'10')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (4, N'Quiz4', N'admin', N'15')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (6, N'Quiz6', N'admin', N'22')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (7, N'Quiz7', N'admin', N'27')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (8, N'Quiz8', N'admin', N'30')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (9, N'Quiz9', N'admin', N'33')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (10, N'Quiz10', N'admin', N'40')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (11, N'Quiz11', N'admin', N'41')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (12, N'Quiz12', N'admin', N'45')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (13, N'Quiz13', N'admin', N'50')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (14, N'Quiz14', N'admin', N'53')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (15, N'Quiz15', N'admin', N'59')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (16, N'Quiz16', N'admin', N'61')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (17, N'Quiz17', N'admin', N'68')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (18, N'Quiz18', N'admin', N'70')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (19, N'Quiz19', N'admin', N'74')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (20, N'Quiz20', N'admin', N'79')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (21, N'Quiz21', N'admin', N'81')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (22, N'Quiz22', N'admin', N'88')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (23, N'Quiz23', N'admin', N'89')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (24, N'Quiz24', N'admin', N'95')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (25, N'Quiz25', N'admin', N'100')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (26, N'Quiz26', N'admin', N'101')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (28, N'Quiz27', N'admin', N'108')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (29, N'Quiz28', N'admin', N'109')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (30, N'Quiz29', N'admin', N'113')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (31, N'Quiz30', N'admin', N'117')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (32, N'Quiz31', N'admin', N'121')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (33, N'Quiz32', N'admin', N'125')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (34, N'Quiz33', N'admin', N'129')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (35, N'Quiz34', N'admin', N'133')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (36, N'Quiz35', N'admin', N'137')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (37, N'Quiz36', N'admin', N'141')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (38, N'Quiz37', N'admin', N'145')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (39, N'Quiz1', N'admin', N'149')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (40, N'Quiz2', N'admin', N'153')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (41, N'Quiz3', N'admin', N'157')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (42, N'Quiz4', N'admin', N'161')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (43, N'Quiz5', N'admin', N'165')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (44, N'Quiz6', N'admin', N'169')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (45, N'Quiz7', N'admin', N'173')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (46, N'Quiz8', N'admin', N'177')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (47, N'Quiz9', N'admin', N'181')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (48, N'Quiz10', N'admin', N'185')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (49, N'Quiz11', N'admin', N'189')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (50, N'Quiz12', N'admin', N'193')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (51, N'Quiz13', N'admin', N'197')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (52, N'Quiz14', N'admin', N'201')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (53, N'Quiz15', N'admin', N'205')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (54, N'Quiz16', N'admin', N'209')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (55, N'Quiz17', N'admin', N'213')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (56, N'Quiz18', N'admin', N'217')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (57, N'Quiz19', N'admin', N'221')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (58, N'Quiz20', N'admin', N'225')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (59, N'Quiz21', N'admin', N'229')
INSERT [dbo].[Quiz] ([QuizID], [Details], [QuizAdderID], [AnswerID]) VALUES (60, N'Quiz22', N'admin', N'233')
SET IDENTITY_INSERT [dbo].[Quiz] OFF
SET IDENTITY_INSERT [dbo].[QuizManage] ON 

INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (1, 1, 1)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (2, 1, 2)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (3, 1, 3)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (4, 1, 4)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (5, 2, 5)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (6, 2, 6)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (7, 2, 7)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (8, 2, 8)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (9, 3, 9)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (10, 3, 10)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (11, 3, 11)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (12, 3, 12)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (13, 4, 13)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (14, 4, 14)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (15, 4, 15)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (16, 4, 16)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (21, 6, 21)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (22, 6, 22)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (23, 6, 23)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (24, 6, 24)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (25, 7, 25)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (26, 7, 26)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (27, 7, 27)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (28, 7, 28)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (29, 8, 29)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (30, 8, 30)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (31, 8, 31)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (32, 8, 32)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (33, 9, 33)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (34, 9, 34)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (35, 9, 35)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (36, 9, 36)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (37, 10, 37)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (38, 10, 38)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (39, 10, 39)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (40, 10, 40)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (41, 11, 41)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (42, 11, 42)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (43, 11, 43)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (44, 11, 44)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (45, 12, 45)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (46, 12, 46)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (47, 12, 47)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (48, 12, 48)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (49, 13, 49)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (50, 13, 50)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (51, 13, 51)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (52, 13, 52)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (53, 14, 53)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (54, 14, 54)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (55, 14, 55)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (56, 14, 56)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (57, 15, 57)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (58, 15, 59)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (59, 15, 60)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (60, 15, 61)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (61, 16, 62)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (62, 16, 63)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (63, 16, 64)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (64, 16, 65)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (65, 17, 66)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (66, 17, 67)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (67, 17, 68)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (68, 17, 69)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (69, 18, 70)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (70, 18, 71)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (71, 18, 72)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (72, 18, 73)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (73, 19, 74)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (74, 19, 75)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (75, 19, 76)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (76, 19, 77)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (77, 20, 78)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (78, 20, 79)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (79, 20, 80)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (80, 20, 81)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (81, 21, 82)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (82, 21, 83)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (83, 21, 84)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (84, 21, 85)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (85, 22, 86)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (86, 22, 87)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (87, 22, 88)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (88, 22, 89)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (89, 23, 90)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (90, 23, 91)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (91, 23, 92)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (92, 23, 93)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (93, 24, 94)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (94, 24, 95)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (95, 24, 96)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (96, 24, 97)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (97, 25, 98)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (98, 25, 99)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (99, 25, 100)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (100, 25, 101)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (101, 26, 103)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (102, 26, 104)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (103, 26, 105)
GO
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (104, 26, 106)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (105, 28, 115)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (106, 28, 116)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (107, 28, 117)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (108, 28, 118)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (109, 29, 119)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (110, 29, 120)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (111, 29, 121)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (112, 29, 122)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (113, 30, 123)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (114, 30, 124)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (115, 30, 125)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (116, 30, 126)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (117, 31, 127)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (118, 31, 128)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (119, 31, 129)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (120, 31, 130)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (121, 32, 131)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (122, 32, 132)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (123, 32, 133)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (124, 32, 134)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (125, 33, 135)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (126, 33, 136)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (127, 33, 137)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (128, 33, 138)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (129, 34, 139)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (130, 34, 140)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (131, 34, 141)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (132, 34, 142)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (133, 35, 143)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (134, 35, 144)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (135, 35, 145)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (136, 35, 146)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (137, 36, 147)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (138, 36, 148)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (139, 36, 149)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (140, 36, 150)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (141, 37, 151)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (142, 37, 152)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (143, 37, 153)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (144, 37, 154)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (145, 38, 155)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (146, 38, 156)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (147, 38, 157)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (148, 38, 158)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (149, 39, 159)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (150, 39, 160)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (151, 39, 161)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (152, 39, 162)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (153, 40, 163)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (154, 40, 164)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (155, 40, 165)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (156, 40, 166)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (157, 41, 167)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (158, 41, 168)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (159, 41, 169)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (160, 41, 170)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (161, 42, 171)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (162, 42, 172)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (163, 42, 173)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (164, 42, 174)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (165, 43, 175)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (166, 43, 176)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (167, 43, 177)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (168, 43, 178)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (169, 44, 179)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (170, 44, 180)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (171, 44, 181)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (172, 44, 182)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (173, 45, 183)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (174, 45, 184)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (175, 45, 185)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (176, 45, 186)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (177, 46, 187)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (178, 46, 188)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (179, 46, 189)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (180, 46, 190)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (181, 47, 191)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (182, 47, 192)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (183, 47, 193)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (184, 47, 194)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (185, 48, 195)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (186, 48, 196)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (187, 48, 197)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (188, 48, 198)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (189, 49, 199)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (190, 49, 200)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (191, 49, 201)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (192, 49, 202)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (193, 50, 203)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (194, 50, 204)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (195, 50, 205)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (196, 50, 206)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (197, 51, 207)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (198, 51, 208)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (199, 51, 209)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (200, 51, 210)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (201, 52, 211)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (202, 52, 212)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (203, 52, 213)
GO
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (204, 52, 214)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (205, 53, 215)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (206, 53, 216)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (207, 53, 217)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (208, 53, 218)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (209, 54, 219)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (210, 54, 220)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (211, 54, 221)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (212, 54, 222)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (213, 55, 223)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (214, 55, 224)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (215, 55, 225)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (216, 55, 226)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (217, 56, 227)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (218, 56, 228)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (219, 56, 229)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (220, 56, 230)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (221, 57, 231)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (222, 57, 232)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (223, 57, 233)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (224, 57, 234)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (225, 58, 235)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (226, 58, 236)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (227, 58, 237)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (228, 58, 238)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (229, 59, 239)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (230, 59, 240)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (231, 59, 241)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (232, 59, 242)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (233, 60, 243)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (234, 60, 244)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (235, 60, 245)
INSERT [dbo].[QuizManage] ([AnswerID], [QuizID], [IDQuizControl]) VALUES (236, 60, 246)
SET IDENTITY_INSERT [dbo].[QuizManage] OFF
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([TestID], [Status], [Name]) VALUES (1, 1, N'Test tu vung (Test1)')
INSERT [dbo].[Test] ([TestID], [Status], [Name]) VALUES (2, 1, N'Test ngu phap(Test 2)')
INSERT [dbo].[Test] ([TestID], [Status], [Name]) VALUES (6, 0, N'Test ielts 3.5(Test3)')
SET IDENTITY_INSERT [dbo].[Test] OFF
SET IDENTITY_INSERT [dbo].[TestControl] ON 

INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 1, 1)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 2, 2)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 3, 3)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 4, 4)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 6, 6)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 7, 7)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 8, 8)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 9, 9)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 10, 10)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 11, 11)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 12, 12)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 13, 13)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 14, 14)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 15, 15)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 16, 16)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 17, 17)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 18, 18)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 19, 19)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 20, 20)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 21, 22)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 22, 23)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 23, 24)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 24, 25)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 25, 26)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 26, 28)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 28, 29)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 29, 30)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 30, 35)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 31, 37)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 32, 39)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 33, 41)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 34, 42)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 35, 44)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 36, 48)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 37, 49)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (1, 38, 50)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 39, 51)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 40, 52)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 41, 53)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 42, 54)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 43, 55)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 44, 56)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 45, 57)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 46, 58)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 47, 59)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 48, 60)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 49, 61)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 50, 62)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 51, 63)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 52, 64)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 53, 65)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 54, 66)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 55, 67)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 56, 68)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 57, 69)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 58, 70)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 59, 71)
INSERT [dbo].[TestControl] ([TestID], [QuizID], [IDTestControl]) VALUES (2, 60, 72)
SET IDENTITY_INSERT [dbo].[TestControl] OFF
SET IDENTITY_INSERT [dbo].[TestReview] ON 

INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (10, 13, 37, 61)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (1, 13, 4, 62)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (17, 13, 68, 63)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (21, 13, 83, 64)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (14, 13, 55, 65)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (11, 13, 41, 66)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (7, 13, 28, 67)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (23, 13, 92, 68)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (16, 13, 64, 69)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (12, 13, 46, 70)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (3, 13, 11, 71)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (2, 13, 8, 72)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (15, 13, 57, 73)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (20, 13, 80, 74)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (22, 13, 85, 75)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (19, 13, 74, 76)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (4, 13, 15, 77)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (13, 13, 50, 78)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (24, 13, 93, 79)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (9, 13, 36, 80)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (8, 75, 31, 1301)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (3, 75, 10, 1302)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (19, 75, 73, 1303)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (7, 75, 26, 1304)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (13, 75, 51, 1305)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (1, 75, 2, 1306)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (20, 75, 77, 1307)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (18, 75, 70, 1308)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (16, 75, 62, 1309)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (2, 75, 5, 1310)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (4, 75, 16, 1311)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (15, 75, 58, 1312)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (9, 75, 35, 1313)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (28, 75, 105, 1314)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (22, 75, 88, 1315)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (10, 75, 40, 1316)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (17, 75, 65, 1317)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (23, 75, 90, 1318)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (6, 75, 22, 1319)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (11, 75, 44, 1320)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (10, 77, 37, 1341)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (6, 77, 22, 1342)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (18, 77, 69, 1343)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (7, 77, 27, 1344)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (28, 77, 107, 1345)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (15, 77, 57, 1346)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (25, 77, 99, 1347)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (20, 77, 79, 1348)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (12, 77, 46, 1349)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (24, 77, 94, 1350)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (23, 77, 89, 1351)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (26, 77, 103, 1352)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (1, 77, 2, 1353)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (9, 77, 33, 1354)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (3, 77, 10, 1355)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (11, 77, 43, 1356)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (17, 77, 68, 1357)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (2, 77, 8, 1358)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (4, 77, 16, 1359)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (13, 77, 49, 1360)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (1, 78, 1, 1361)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (25, 78, 97, 1362)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (23, 78, 89, 1363)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (3, 78, 9, 1364)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (24, 78, 93, 1365)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (15, 78, 60, 1366)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (14, 78, 55, 1367)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (11, 78, 43, 1368)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (8, 78, 29, 1369)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (10, 78, 40, 1370)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (21, 78, 81, 1371)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (28, 78, 107, 1372)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (16, 78, 63, 1373)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (2, 78, 7, 1374)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (7, 78, 27, 1375)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (18, 78, 71, 1376)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (9, 78, 36, 1377)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (22, 78, 86, 1378)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (13, 78, 49, 1379)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (6, 78, 24, 1380)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (32, 95, 122, 1381)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (24, 95, 93, 1382)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (4, 95, 15, 1383)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (13, 95, 50, 1384)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (34, 95, 129, 1385)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (10, 95, 39, 1386)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (11, 95, 43, 1387)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (29, 95, 109, 1388)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (2, 95, 6, 1389)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (9, 95, 33, 1390)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (36, 95, 140, 1391)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (25, 95, 98, 1392)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (31, 95, 117, 1393)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (19, 95, 75, 1394)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (30, 95, 113, 1395)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (12, 95, 45, 1396)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (7, 95, 26, 1397)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (23, 95, 90, 1398)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (6, 95, 22, 1399)
GO
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (17, 95, 66, 1400)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (11, 96, 43, 1401)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (8, 96, 29, 1402)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (35, 96, 135, 1403)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (23, 96, 92, 1404)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (15, 96, 57, 1405)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (17, 96, 68, 1406)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (1, 96, 4, 1407)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (4, 96, 16, 1408)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (34, 96, 129, 1409)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (30, 96, 114, 1410)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (24, 96, 93, 1411)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (18, 96, 69, 1412)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (16, 96, 63, 1413)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (9, 96, 36, 1414)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (19, 96, 74, 1415)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (3, 96, 10, 1416)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (12, 96, 45, 1417)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (6, 96, 23, 1418)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (22, 96, 88, 1419)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (7, 96, 25, 1420)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (59, 97, 232, 1421)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (49, 97, 190, 1422)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (56, 97, 218, 1423)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (51, 97, 0, 1424)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (53, 97, 208, 1425)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (42, 97, 164, 1426)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (57, 97, 221, 1427)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (40, 97, 156, 1428)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (46, 97, 177, 1429)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (50, 97, 196, 1430)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (48, 97, 188, 1431)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (45, 97, 176, 1432)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (41, 97, 158, 1433)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (43, 97, 167, 1434)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (44, 97, 172, 1435)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (52, 97, 204, 1436)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (54, 97, 210, 1437)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (58, 97, 227, 1438)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (39, 97, 151, 1439)
INSERT [dbo].[TestReview] ([QuizID], [IDTestScore], [AnswerID], [IDReview]) VALUES (55, 97, 215, 1440)
SET IDENTITY_INSERT [dbo].[TestReview] OFF
SET IDENTITY_INSERT [dbo].[TestScore] ON 

INSERT [dbo].[TestScore] ([IDTestScore], [TestID], [AccountID], [Score], [TimeDo], [TimeStart], [TimeDoTest]) VALUES (13, 1, N'admin', 5, 1, CAST(N'2017-11-04 10:35:22.000' AS DateTime), N'4:24')
INSERT [dbo].[TestScore] ([IDTestScore], [TestID], [AccountID], [Score], [TimeDo], [TimeStart], [TimeDoTest]) VALUES (75, 1, N'test02', 5, 1, CAST(N'2017-11-05 15:45:31.427' AS DateTime), N'0:32')
INSERT [dbo].[TestScore] ([IDTestScore], [TestID], [AccountID], [Score], [TimeDo], [TimeStart], [TimeDoTest]) VALUES (77, 1, N'test01', 7, 1, CAST(N'2017-11-05 16:26:22.373' AS DateTime), N'0:27')
INSERT [dbo].[TestScore] ([IDTestScore], [TestID], [AccountID], [Score], [TimeDo], [TimeStart], [TimeDoTest]) VALUES (78, 1, N'test04', 5, 1, CAST(N'2017-11-05 16:30:11.577' AS DateTime), N'0:20')
INSERT [dbo].[TestScore] ([IDTestScore], [TestID], [AccountID], [Score], [TimeDo], [TimeStart], [TimeDoTest]) VALUES (95, 1, N'test08', 10, 1, CAST(N'2017-11-05 20:14:12.753' AS DateTime), N'0:27')
INSERT [dbo].[TestScore] ([IDTestScore], [TestID], [AccountID], [Score], [TimeDo], [TimeStart], [TimeDoTest]) VALUES (96, 1, N'test05', 6, 1, CAST(N'2017-11-05 20:21:58.677' AS DateTime), N'2:6')
INSERT [dbo].[TestScore] ([IDTestScore], [TestID], [AccountID], [Score], [TimeDo], [TimeStart], [TimeDoTest]) VALUES (97, 2, N'admin', 2, 1, CAST(N'2017-11-05 20:33:09.230' AS DateTime), N'7:50')
SET IDENTITY_INSERT [dbo].[TestScore] OFF
ALTER TABLE [dbo].[QuizManage]  WITH CHECK ADD  CONSTRAINT [FK_QuizManage_Answer] FOREIGN KEY([AnswerID])
REFERENCES [dbo].[Answer] ([AnswerID])
GO
ALTER TABLE [dbo].[QuizManage] CHECK CONSTRAINT [FK_QuizManage_Answer]
GO
ALTER TABLE [dbo].[QuizManage]  WITH CHECK ADD  CONSTRAINT [FK_QuizManage_Quiz1] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([QuizID])
GO
ALTER TABLE [dbo].[QuizManage] CHECK CONSTRAINT [FK_QuizManage_Quiz1]
GO
ALTER TABLE [dbo].[TestControl]  WITH CHECK ADD  CONSTRAINT [FK_TestControl_Quiz1] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([QuizID])
GO
ALTER TABLE [dbo].[TestControl] CHECK CONSTRAINT [FK_TestControl_Quiz1]
GO
ALTER TABLE [dbo].[TestControl]  WITH CHECK ADD  CONSTRAINT [FK_TestControl_Test] FOREIGN KEY([TestID])
REFERENCES [dbo].[Test] ([TestID])
GO
ALTER TABLE [dbo].[TestControl] CHECK CONSTRAINT [FK_TestControl_Test]
GO
ALTER TABLE [dbo].[TestReview]  WITH CHECK ADD  CONSTRAINT [FK_TestReview_Answer] FOREIGN KEY([AnswerID])
REFERENCES [dbo].[Answer] ([AnswerID])
GO
ALTER TABLE [dbo].[TestReview] CHECK CONSTRAINT [FK_TestReview_Answer]
GO
ALTER TABLE [dbo].[TestReview]  WITH CHECK ADD  CONSTRAINT [FK_TestReview_Quiz] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([QuizID])
GO
ALTER TABLE [dbo].[TestReview] CHECK CONSTRAINT [FK_TestReview_Quiz]
GO
ALTER TABLE [dbo].[TestReview]  WITH CHECK ADD  CONSTRAINT [FK_TestReview_TestScore] FOREIGN KEY([IDTestScore])
REFERENCES [dbo].[TestScore] ([IDTestScore])
GO
ALTER TABLE [dbo].[TestReview] CHECK CONSTRAINT [FK_TestReview_TestScore]
GO
ALTER TABLE [dbo].[TestScore]  WITH CHECK ADD  CONSTRAINT [FK_TestScore_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[TestScore] CHECK CONSTRAINT [FK_TestScore_Account]
GO
ALTER TABLE [dbo].[TestScore]  WITH CHECK ADD  CONSTRAINT [FK_TestScore_Test] FOREIGN KEY([TestID])
REFERENCES [dbo].[Test] ([TestID])
GO
ALTER TABLE [dbo].[TestScore] CHECK CONSTRAINT [FK_TestScore_Test]
GO
/****** Object:  StoredProcedure [dbo].[TimName]    Script Date: 11/5/2017 08:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TimName]
@ten nvarchar(50)
as
begin
	select * from Account where Name like '%'+@ten+'%'
end

GO
USE [master]
GO
ALTER DATABASE [XiSapAssignment1] SET  READ_WRITE 
GO
