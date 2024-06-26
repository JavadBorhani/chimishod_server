USE [database_what_if]
GO
/****** Object:  User [JebAsp]    Script Date: 1/31/2017 1:51:30 PM ******/
CREATE USER [JebAsp] FOR LOGIN [JebAsp] WITH DEFAULT_SCHEMA=[JebAsp]
GO
/****** Object:  User [Kiv]    Script Date: 1/31/2017 1:51:30 PM ******/
CREATE USER [Kiv] FOR LOGIN [Kiv] WITH DEFAULT_SCHEMA=[Kiv]
GO
ALTER ROLE [db_owner] ADD MEMBER [JebAsp]
GO
ALTER ROLE [db_owner] ADD MEMBER [Kiv]
GO
/****** Object:  Schema [JebAsp]    Script Date: 1/31/2017 1:51:30 PM ******/
CREATE SCHEMA [JebAsp]
GO
/****** Object:  Schema [Kiv]    Script Date: 1/31/2017 1:51:30 PM ******/
CREATE SCHEMA [Kiv]
GO
/****** Object:  Table [dbo].[AchievedGifts]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AchievedGifts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GiftID] [int] NOT NULL,
	[AchievedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AchievedGifts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AchievedPosession]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AchievedPosession](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[QuestID] [int] NOT NULL,
	[AchieveStateID] [int] NOT NULL,
	[AchievedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AchievedQuests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Achievement]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Achievement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Star] [int] NOT NULL,
	[Icon] [varchar](150) NOT NULL,
	[RectangleColor] [varchar](10) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Quest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AchieveStateType]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AchieveStateType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_AchieveStateType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[Liked] [bit] NULL,
	[Dislike] [bit] NULL,
	[YesNoState] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppTheme]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppTheme](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShortDesciption] [nvarchar](50) NOT NULL,
	[LongDescription] [nvarchar](150) NOT NULL,
	[SquareColor] [varchar](10) NOT NULL,
	[CircleColor] [varchar](10) NOT NULL,
	[Price] [int] NOT NULL,
	[Style] [text] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AppTheme] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShortDescription] [nvarchar](50) NOT NULL,
	[LongDescription] [nvarchar](150) NOT NULL,
	[SquareColor] [varchar](10) NOT NULL,
	[CircleColor] [varchar](10) NOT NULL,
	[RectangleColor] [varchar](10) NOT NULL,
	[Price] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[CommentContent] [nvarchar](400) NOT NULL,
	[Response] [nvarchar](200) NULL,
	[IsVerified] [bit] NOT NULL,
	[InsertDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CreatedQuestions]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreatedQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[What_if] [nvarchar](250) NOT NULL,
	[But] [nvarchar](250) NOT NULL,
	[RegisterDateTime] [datetime] NOT NULL,
	[VerifyStateID] [int] NOT NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_CreatedQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CreatedQuestionsVerifyType]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CreatedQuestionsVerifyType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VerifyName] [varchar](20) NOT NULL,
	[Description] [varbinary](50) NULL,
 CONSTRAINT [PK_CreatedQuestionsVerifyType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[SelectedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Favorite] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gift]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gift](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Star] [int] NOT NULL,
	[Icon] [varchar](150) NOT NULL,
	[RectangleColor] [varchar](10) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Gift] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Level]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Level](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Star] [int] NOT NULL,
	[TotalQuestion] [int] NOT NULL,
	[Avatar] [varchar](150) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manufacture]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacture](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[InsertedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Manufacture] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[StoreItemID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderKey] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OurAdvertisements]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OurAdvertisements](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShortDescription] [nvarchar](50) NOT NULL,
	[LongDescription] [nvarchar](150) NOT NULL,
	[RectangleColor] [varchar](10) NOT NULL,
	[AppStoresLink] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OurAdvertisements] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseCategory]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PurchaseCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseTheme]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseTheme](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ThemeID] [int] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PurchaseTheme] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[What_if] [nvarchar](250) NOT NULL,
	[But] [nvarchar](250) NOT NULL,
	[Catgory_ID] [int] NOT NULL,
	[Yes_Count] [int] NOT NULL,
	[No_Count] [int] NOT NULL,
	[Like_Count] [int] NOT NULL,
	[Dislike_Count] [int] NOT NULL,
	[Weight] [float] NOT NULL,
	[CreatorID] [varchar](20) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[Banned] [bit] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReportedQuestions]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportedQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[ReportTypeID] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ReportedQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportType]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_ReportType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SelectedCategory]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelectedCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_SelectedCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SelectedTheme]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelectedTheme](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AppThemeID] [int] NOT NULL,
 CONSTRAINT [PK_SelectedTheme] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Store]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Store](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Star] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Icon] [nvarchar](150) NOT NULL,
	[RectangleColor] [varchar](10) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Store_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UUID] [varchar](36) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[UserTypeID] [int] NULL,
	[TotalStars] [int] NOT NULL,
	[LastSceneDateTime] [datetime] NOT NULL,
	[LevelAnsweredNumber] [int] NOT NULL,
	[CurrentLevelID] [int] NOT NULL,
	[IsAbleToWriteComment] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[FirstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](30) NULL,
	[Email] [varchar](50) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[GoogleID] [varchar](40) NULL,
	[IsVerified] [bit] NOT NULL,
	[IsBanned] [bit] NOT NULL,
	[RegisterDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 1/31/2017 1:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1600, 8, 12, NULL, NULL, 1, CAST(0x0000A70A01178F2E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1601, 22, 12, NULL, NULL, 1, CAST(0x0000A70A01536626 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1602, 22, 11, NULL, NULL, 1, CAST(0x0000A70A015384B0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1603, 22, 10, NULL, NULL, 1, CAST(0x0000A70A01592D00 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1604, 22, 9, NULL, NULL, 1, CAST(0x0000A70A0168E2A9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1605, 22, 8, NULL, NULL, 1, CAST(0x0000A70A0168E429 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1606, 22, 1, NULL, NULL, 1, CAST(0x0000A70A016901CE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1607, 22, 7, NULL, NULL, 1, CAST(0x0000A70A016E00BA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1608, 22, 20, NULL, NULL, 1, CAST(0x0000A70B00B1CFAF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1609, 22, 24, NULL, NULL, 1, CAST(0x0000A70B00B1E529 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1610, 22, 22, NULL, NULL, 1, CAST(0x0000A70B00B1E93A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1611, 22, 6, NULL, NULL, 1, CAST(0x0000A70B00B1EDF3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1612, 22, 18, NULL, NULL, 1, CAST(0x0000A70B00B1F389 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1613, 22, 19, NULL, NULL, 1, CAST(0x0000A70B00B1F93F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1614, 22, 17, NULL, NULL, 1, CAST(0x0000A70B00B1FF53 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1615, 22, 5, NULL, NULL, 1, CAST(0x0000A70B00B209B1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1616, 22, 23, 1, NULL, 1, CAST(0x0000A70B00B542AC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1617, 8, 11, NULL, NULL, 1, CAST(0x0000A70B0100E37A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1618, 8, 17, NULL, NULL, 1, CAST(0x0000A70B01071AAF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1619, 9, 6, NULL, NULL, 1, CAST(0x0000A70B010E82D6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1620, 9, 5, NULL, NULL, 1, CAST(0x0000A70B010E8D5D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1621, 9, 4, NULL, NULL, 1, CAST(0x0000A70B010E9115 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1622, 9, 1, NULL, NULL, 1, CAST(0x0000A70B01112A78 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1623, 22, 21, NULL, NULL, 1, CAST(0x0000A70B0118D43E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1624, 8, 1, NULL, NULL, 1, CAST(0x0000A70B01198C0C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1625, 8, 24, NULL, NULL, 1, CAST(0x0000A70B01199A62 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1626, 8, 20, NULL, NULL, 1, CAST(0x0000A70B0119A754 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1627, 22, 3, NULL, NULL, 0, CAST(0x0000A70B0119B522 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1628, 8, 18, NULL, NULL, 1, CAST(0x0000A70B0119C811 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1629, 8, 19, NULL, NULL, 0, CAST(0x0000A70B0119CB58 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1630, 22, 2, NULL, NULL, 1, CAST(0x0000A70B012872B0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1631, 25, 1, NULL, NULL, 0, CAST(0x0000A70B01381727 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1632, 25, 24, NULL, NULL, 0, CAST(0x0000A70B0138205D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1633, 25, 22, NULL, NULL, 1, CAST(0x0000A70B01382D87 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1634, 25, 23, NULL, NULL, 0, CAST(0x0000A70B01383402 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1635, 9, 24, NULL, NULL, 1, CAST(0x0000A70C00125DE9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1636, 9, 22, NULL, NULL, 0, CAST(0x0000A70C00126509 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1637, 9, 23, NULL, 1, 1, CAST(0x0000A70C00128AE6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1638, 8, 23, NULL, NULL, 0, CAST(0x0000A70C00A88023 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1639, 8, 21, NULL, NULL, 1, CAST(0x0000A70C00A8CC62 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1640, 8, 22, NULL, NULL, 1, CAST(0x0000A70C00AB05B7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1641, 8, 3, NULL, NULL, 1, CAST(0x0000A70C00AB2945 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1642, 8, 9, NULL, NULL, 1, CAST(0x0000A70C00AC640C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1643, 25, 21, NULL, NULL, 0, CAST(0x0000A70C00D24804 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1644, 25, 3, NULL, NULL, 0, CAST(0x0000A70C00D258E6 AS DateTime))
SET IDENTITY_INSERT [dbo].[Answer] OFF
SET IDENTITY_INSERT [dbo].[AppTheme] ON 

INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [Style], [CreatedDate], [UpdatedDate]) VALUES (1, N'آبی', N'آبی', N'آبی', N'#0d27e9', N'#102095', 100, NULL, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EF00000000 AS DateTime))
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [Style], [CreatedDate], [UpdatedDate]) VALUES (2, N'سبز', N'سبز', N'سبز', N'#1ec2bc', N'#157e7a', 30, NULL, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [Style], [CreatedDate], [UpdatedDate]) VALUES (4, N'بنفش', N'بنفش', N'بنفش', N'#cb13d7', N'#8f0d97', 150, NULL, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [Style], [CreatedDate], [UpdatedDate]) VALUES (5, N'قرمز', N'قرمز', N'قرمز', N'#d30838', N'#9f062a', 120, NULL, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [Style], [CreatedDate], [UpdatedDate]) VALUES (6, N'زرد', N'زرد', N'زرد', N'#c6bf09', N'#c6bf09', 100, NULL, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[AppTheme] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate]) VALUES (1, N'عمومی', N'عمومی', N'عمومی', N'#cb13d7', N'#8f0d97', N'#9410a6', 100, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate]) VALUES (2, N'ورزشی', N'ورزشی', N'ورزشی', N'#1ec2bc', N'#157e7a', N'#158b87', 150, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6F000000000 AS DateTime))
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate]) VALUES (5, N'خانوادگی', N'خانوادگی', N'خانوادگی', N'#0d27e9', N'#102095', N'#091ba1', 50, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6F000000000 AS DateTime))
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate]) VALUES (6, N'سیاسی', N'سیاسی', N'سیاسی', N'#0d27e9', N'#0048bb', N'#0027e9', 100, CAST(0x0000A70B00000000 AS DateTime), CAST(0x0000A81200000000 AS DateTime))
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate]) VALUES (7, N'بزرگسال', N'بزرگسال', N'بزرگسال', N'#0d27e9', N'#d30838', N'#0027e9', 15, CAST(0x0000A70B00000000 AS DateTime), CAST(0x0000A6F700000000 AS DateTime))
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate]) VALUES (8, N'پزشکی', N'پزشکی', N'پزشکی', N'#0d27e9', N'#c6bf09', N'#0027e9', 200, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1, 16, 1, N'خیلی سوال مسخره ای بود', NULL, 1, CAST(0x0000A70500AD2D66 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3, 7, 9, N'حال کردم', NULL, 1, CAST(0x0000A6EF016A8C80 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (4, 8, 9, N'بدک نبود ولی خیلی میتونست بهتر هم باشه . ولی کلا برنامه خوبی دارین. با تشکر ', NULL, 1, CAST(0x0000A6F00020F580 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (5, 9, 9, N'بابا جمع کنید این مسخره بازیا رو. ملت رو اسکل گیر اوردید. ین لوس بازیا چیه. برنامتون خیلی آشغاله. حتما خودتون هم ...', N'آقا لطفا ذر نزنید. با تشکر تیم توسعه', 1, CAST(0x0000A6F100000000 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (6, 8, 9, N'0641062b06330641kjgjfsgsf', NULL, 1, CAST(0x0000A70500FF9281 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (7, 8, 9, N'hdsfbdsfbdsifbsdf
sg
sf
g
sfgsf
g', NULL, 1, CAST(0x0000A7050108A82B AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (8, 8, 9, N'sdjhfkshdg
dfghdfhdf
dhdfhdfhdfh
dfhdfhdfhdfh
dfgdfhdfhdfh', NULL, 1, CAST(0x0000A7050108DBC4 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (9, 8, 4, N'comment 1', NULL, 1, CAST(0x0000A705010D8CD5 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (10, 8, 10, N'comment 2', NULL, 1, CAST(0x0000A70501190A23 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (11, 8, 11, N'hgjgj', NULL, 1, CAST(0x0000A705011EE470 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (12, 8, 11, N'fghfgh
fghfgh
fghfg
h
fgh
fg
h
fg
h', NULL, 1, CAST(0x0000A705011F2800 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (13, 8, 11, N'fgfhfhfghg
hfghfghfg
hfghfghfgh
fghfghfgh
gfhfghfgh
gfhfghgfhgh', NULL, 1, CAST(0x0000A705011F40C7 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (14, 8, 11, N'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', NULL, 1, CAST(0x0000A70501201622 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (15, 16, 9, N'خیلی جالبه', NULL, 1, CAST(0x0000A705013EC695 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (16, 16, 9, N'باورم نمیشه چرت بود', NULL, 1, CAST(0x0000A705013EDD82 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (17, 16, 9, N'ی از دور', NULL, 1, CAST(0x0000A705013F01A7 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (18, 16, 9, N'هر چقدر کامنت میخواید بنویسی ', NULL, 1, CAST(0x0000A705013F73E0 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (19, 16, 9, N'در کل جالبه به خاطر اینکه میتونیم کلی چرت و پرت بنویسیم بدون اینکه لازم باشه چیزی رو روش ادامه بدیم', NULL, 1, CAST(0x0000A705013FA965 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (20, 16, 9, N'با سر می زنی سلام ز از مس رزماری یرطمطرمیذذطمسرطمسذطنسذطوسریجیرسمر تیاقترسمسذطمرستی ت ای سریمیذینیذسدس تیذمذایتسنسر', NULL, 1, CAST(0x0000A705013FC7F9 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (21, 16, 9, N'سلام کیوان این باگ داره', NULL, 1, CAST(0x0000A70501442DEE AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (22, 16, 9, N'کیوان کجابی', NULL, 1, CAST(0x0000A70501443BEB AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (23, 16, 9, N'دقیقا کجایی', NULL, 1, CAST(0x0000A70501444555 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (24, 8, 12, N'comment 1', NULL, 1, CAST(0x0000A70600B8BBC6 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (25, 8, 12, N'comment 2', NULL, 1, CAST(0x0000A70600B8C27E AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (26, 8, 12, N'comment3', NULL, 1, CAST(0x0000A70600B8C761 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (27, 16, 12, N'این خیلی سوال مسخره ای  بود', NULL, 1, CAST(0x0000A70600C9606D AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (28, 8, 12, N'06cc0628063006280630', NULL, 1, CAST(0x0000A70600EF01D4 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (29, 8, 8, N'thy', NULL, 1, CAST(0x0000A70600F252EE AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (30, 8, 11, N'ddgfdfgfsgd', NULL, 1, CAST(0x0000A70700CCD02F AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (31, 8, 10, N'drgdrgdrgr', NULL, 1, CAST(0x0000A70700EE902A AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (32, 20, 5, N'سوال چالشی. ', NULL, 1, CAST(0x0000A7070141C3E7 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (33, 16, 4, N'چه مطالب جلیل ', NULL, 1, CAST(0x0000A707018AA404 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (34, 16, 4, N'دوست داری با دوستی که دوست داره با دوست من دوست بشی', NULL, 1, CAST(0x0000A707018AC3B1 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (35, 16, 3, N'کامنت بنویس تست کنیم', NULL, 1, CAST(0x0000A70800008AE1 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (36, 16, 2, N'مطلب جالبی بود', NULL, 1, CAST(0x0000A7080000F22B AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (37, 8, 11, N'jbjhbbjhhbhhbbh', NULL, 1, CAST(0x0000A7080008462E AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (38, 8, 11, N'hgvvhgvhgvvuv', NULL, 1, CAST(0x0000A70800084B41 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (39, 8, 5, N'test', NULL, 1, CAST(0x0000A708000D96A9 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (40, 21, 8, N'نسیم ', NULL, 1, CAST(0x0000A708001077EF AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (41, 22, 3, N'کامنت بنویس و لذت ببر', NULL, 1, CAST(0x0000A70901416867 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (42, 22, 3, N'یکی از سیستم و زندگی کاری کلی چیز وجود دارد ه', NULL, 1, CAST(0x0000A709014188D5 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (43, 22, 3, N'سیستم تصویری باید به درد چیزی میخوره', NULL, 1, CAST(0x0000A70901419E04 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (44, 22, 3, N'داشتن مطالب مورد نیاز چیست', NULL, 1, CAST(0x0000A7090141AF94 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (45, 22, 2, N'مطب خوبی بود بازم بگذار', NULL, 1, CAST(0x0000A7090141CDF9 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (46, 22, 16, N'داداچ سوال سیاسی نگذار مردک', NULL, 1, CAST(0x0000A7090141EC68 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (47, 22, 16, N'با رئیس جمهور درست صحبت کن', NULL, 1, CAST(0x0000A70901420E6D AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (48, 22, 16, N'داداچ پاشو بیخیال', NULL, 1, CAST(0x0000A70901421B9C AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (49, 22, 16, N'یکی از مواردی که کمک میکنه به چیزی که میخواستی برسیم', NULL, 1, CAST(0x0000A70901423523 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (50, 22, 16, N'چقدر خوبه هرچقدر کامنت بخوایم ', NULL, 1, CAST(0x0000A7090142BC53 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (51, 22, 16, N'میتونیم بگذاریم', NULL, 1, CAST(0x0000A7090142C7F3 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (52, 22, 20, N'اره این خوبه ', NULL, 1, CAST(0x0000A70A009F655F AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (53, 22, 20, N'اره اره ', NULL, 1, CAST(0x0000A70A009F69FC AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1052, 8, 24, N'yes this is a good thing', NULL, 1, CAST(0x0000A70A00CEA7C0 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1053, 8, 19, N'sheeeeeeet', NULL, 1, CAST(0x0000A70A00CEDF32 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1054, 8, 17, N'no', NULL, 1, CAST(0x0000A70A00CEF056 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1055, 8, 23, N'chertee', NULL, 1, CAST(0x0000A70A00CF1641 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1056, 8, 21, N'nooooooooooo', NULL, 1, CAST(0x0000A70A00CF2516 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1057, 8, 1, N'fhdfh', NULL, 1, CAST(0x0000A70B01198676 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1058, 8, 24, N'tyty', NULL, 1, CAST(0x0000A70B0119921B AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1059, 22, 3, N'اسکندر ', NULL, 1, CAST(0x0000A70B0119BB4E AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1060, 22, 3, N'محسنی ذمررر', NULL, 1, CAST(0x0000A70B0119C227 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1061, 8, 20, N'htfh', NULL, 1, CAST(0x0000A70B0119C235 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1062, 22, 3, N'تسحرسانسرطمر', NULL, 1, CAST(0x0000A70B0119C6E1 AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Favorite] ON 

INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (1, 8, 5, CAST(0x0000A704012EEE37 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2, 10, 6, CAST(0x0000A704013485EB AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3, 11, 11, CAST(0x0000A704013CFC52 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (4, 14, 10, CAST(0x0000A7040171375A AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (5, 16, 10, CAST(0x0000A7070151147A AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (6, 16, 4, CAST(0x0000A708000076DE AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (7, 16, 3, CAST(0x0000A7080000D839 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (8, 22, 12, CAST(0x0000A708009A6E0B AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (9, 22, 11, CAST(0x0000A708009A7181 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (10, 22, 10, CAST(0x0000A708009A7B48 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (11, 22, 21, CAST(0x0000A70A00A3CA4D AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (1011, 8, 12, CAST(0x0000A70A00DBF9FC AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (1012, 9, 12, CAST(0x0000A70A00DC7EB3 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (1013, 9, 1, CAST(0x0000A70B01112A78 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (1014, 9, 23, CAST(0x0000A70C00128AEB AS DateTime))
SET IDENTITY_INSERT [dbo].[Favorite] OFF
SET IDENTITY_INSERT [dbo].[Level] ON 

INSERT [dbo].[Level] ([ID], [Star], [TotalQuestion], [Avatar], [CreatedDate], [UpdatedDate]) VALUES (1, 100, 20, N'c:\', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[Level] ([ID], [Star], [TotalQuestion], [Avatar], [CreatedDate], [UpdatedDate]) VALUES (2, 120, 30, N'c:\', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Level] OFF
SET IDENTITY_INSERT [dbo].[PurchaseCategory] ON 

INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (6, 9, 2, CAST(0x0000A70B010E7BDC AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (7, 22, 5, CAST(0x0000A70B0117FCA3 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (8, 22, 8, CAST(0x0000A70B0118B61B AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (9, 8, 8, CAST(0x0000A70B0119A3AA AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (10, 9, 7, CAST(0x0000A70C00129B4A AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (11, 9, 5, CAST(0x0000A70C0012A1F9 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (12, 8, 2, CAST(0x0000A70C00A88962 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (13, 8, 5, CAST(0x0000A70C00AB22DD AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseCategory] OFF
SET IDENTITY_INSERT [dbo].[PurchaseTheme] ON 

INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (3, 8, 2, CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (5, 8, 5, CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (7, 8, 1, CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (8, 9, 2, CAST(0x0000A70B010E7293 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (9, 9, 4, CAST(0x0000A70B0110D72C AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (10, 9, 6, CAST(0x0000A70B0110F495 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (11, 22, 6, CAST(0x0000A70B0118BF5A AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (12, 22, 5, CAST(0x0000A70B01190DFF AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (13, 22, 2, CAST(0x0000A70B01191031 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (14, 25, 2, CAST(0x0000A70B01383D96 AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseTheme] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (1, N'HHHHHHHH', N'HHHHHHHH', 1, 34, 3, 0, 0, 75, N'1', CAST(0x0000A6EE00AD2C08 AS DateTime), CAST(0x0000A6EE00AD2C08 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (2, N'از هر مغازه ای که میخواستی، رایگان لباس میخریدی', N'مجبور بودی مثل سوپر من، شرتت رو رو شلوار میپوشیدی', 1, 25, 2, 1, 0, 20, NULL, CAST(0x0000A80800AD2C08 AS DateTime), CAST(0x0000A80800AD2C08 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (3, N'هیچوقت گرسنه ات نمیشد', N'رنگت مثل درختا سبز بود و باید روزی 1 ساعت پاهات رو تو زمین فرو میکردی', 1, 26, 5, 0, 1, 30, NULL, CAST(0x0000A6F700000000 AS DateTime), CAST(0x0000A6F700000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (4, N'کنکور رو کلا حذف میکردن', N'دانشگاه ها تفکیک جنسیتی میشدن', 2, 27, 3, 1, 0, 40, NULL, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (5, N'وقتی شیر آب رو باز میکردی ازش پول میومد', N'برای بدست اوردن آب باید روزی هشت ساعت کار میکردی', 2, 28, 2, 1, 0, 50, NULL, CAST(0x0000A81C00000000 AS DateTime), CAST(0x0000A81C00000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (6, N'یه خونه رایگان بهت میدادن', N'10 سال از عمرت کم میشد', 2, 29, 3, 0, 0, 60, NULL, CAST(0x0000A7FF00000000 AS DateTime), CAST(0x0000A7FF00000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (7, N'به جای اینکه یارانه بدن، همه ماهی 10 هزار تومن هم میدادن', N'دیگه کسی اختلاس و دزدی نمیکرد', 5, 27, 4, 0, 0, 70, NULL, CAST(0x0000A80800000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (8, N'پولداری میشدی', N'باید با کسی که کنارت نشسته ازدواج میکردی', 5, 33, 3, 0, 0, 80, NULL, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (9, N'یارانت دوبرابر میشد ', N'باید به غرضی رای میدادی', 5, 36, 4, 0, 0, 90, NULL, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (10, N'حقوقت سه میلیون بود ', N'نصفش رو باید پول ایزی لایف میدادی', 6, 35, 3, 1, 0, 91, NULL, CAST(0x0000A80800000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (11, N'یه شغل با آبرو داشتی', N'یه زن بی آبرو گیرت میومد', 6, 36, 3, 0, 0, 92, NULL, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (12, N'رتبه یک کنکور میشدی', N'باید بعدش رفتگر می شدی', 6, 44, 2, 0, 1, 93, NULL, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (15, N'سال نو آیفون هدیه بگیری', N'ولی تا آخر سال اجازه نداشتی روش برنامه بریزی', 7, 5, 0, 0, 0, 40, N'1', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A81C00000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (16, N'روحانی رئیس جمهور بشه', N'دیگه قید انرژی هسته ای رو بزنیم', 7, 5, 0, 0, 0, 2, N'1', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (17, N'هر کتابی رو که میخواستی به مغزت تزریق میکردی', N'کور میشدی', 7, 14, 11, 11, 10, 50, N'2', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (18, N'اندازه بیل گیتس پول داشتی', N'یه دست و یه پا نداشتی', 8, 20, 30, 10, 10, 60, N'2', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (19, N'زورت ده برابر میشد', N'عقلت نصف میشد', 8, 19, 13, 12, 3, 55, N'2', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (20, N'هر چه قدر میخواستی میخوردی و چاق نمیشدی', N'روزی 10 بار باید دستشویی میرفتی', 8, 25, 13, 10, 10, 70, N'2', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (21, N'میتونستی ذهن بقیه رو بخونی', N'بقیه هم میتونستن ذهنت رو بخونن', 1, 8, 23, 3, 5, 39, N'2', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (22, N'میتونستی زیر آب هم نفس بکشی', N'برای اینکه زنده بمونی باید همیشه بدنت رو خیس نگه میداشتی', 1, 25, 12, 5, 6, 60, N'2', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (23, N'پدر و مادرت رو خودت انتخاب میکردی', N'40 سال بشتر عمر نمیکردی', 1, 7, 17, 16, 17, 45, N'2', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatorID], [CreatedDate], [UpdateDate], [Banned]) VALUES (24, N'یارانه هر نفر 500 هزار تومن میشد', N'ترامپ رئیس جمهور ایران میشد', 1, 8, 11, 10, 10, 65, N'2', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[SelectedCategory] ON 

INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1, 7, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2, 8, 2)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3, 9, 2)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (4, 10, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (5, 11, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (6, 12, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (7, 13, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (8, 14, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (9, 15, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (10, 16, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (11, 17, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (12, 18, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (13, 19, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (14, 20, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (15, 21, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (16, 22, 5)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (17, 23, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (18, 24, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (19, 25, 1)
SET IDENTITY_INSERT [dbo].[SelectedCategory] OFF
SET IDENTITY_INSERT [dbo].[SelectedTheme] ON 

INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1, 7, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2, 8, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3, 9, 6)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (4, 10, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (5, 11, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (6, 12, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (7, 13, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (8, 14, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (9, 15, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (10, 16, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (11, 17, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (12, 18, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (13, 19, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (14, 20, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (15, 21, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (16, 22, 6)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (17, 23, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (18, 24, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (19, 25, 2)
SET IDENTITY_INSERT [dbo].[SelectedTheme] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (7, N'b9b83498-86eb-4377-a3df-e4454cff1f38', N'Not-Set', 1, 500, CAST(0x0000A704012CA5B9 AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (8, N'b89bb13b-ea92-467a-a248-fe618fae2b70', N'Not-Set', 1, 100, CAST(0x0000A704012CE8E2 AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (9, N'4e46314f-46c2-4ede-b1a2-364e269574c8', N'Not-Set', 1, 5, CAST(0x0000A704013194FD AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (10, N'958063ac-b6ff-42a2-9e9d-43d6704b0fe7', N'Not-Set', 1, 500, CAST(0x0000A70401341BCF AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (11, N'ef4be27e-d355-4f29-a6e5-93cd96d9a3ed', N'Not-Set', 1, 500, CAST(0x0000A704013B60F8 AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (12, N'a055be6d-249a-4745-afc3-aa3ba335f643', N'Not-Set', 1, 500, CAST(0x0000A70401427775 AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (13, N'edbedcad-de56-4ae6-88e9-cfd6792c3d5e', N'Not-Set', 1, 500, CAST(0x0000A704014D6929 AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (14, N'0ac4fd63-fccd-49b1-b158-70fe7f1b2d30', N'Not-Set', 1, 500, CAST(0x0000A704016F33F7 AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (15, N'98ea9631-2d91-4bed-a87d-ce1f136eed2a', N'Not-Set', 1, 500, CAST(0x0000A70401784915 AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (16, N'6f4e0b6c-f869-4ea9-88fe-4361c8d4587e', N'Not-Set', 1, 500, CAST(0x0000A70500AD2BEF AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (17, N'6622', N'Not-Set', 1, 500, CAST(0x0000A7060100E19C AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (18, N'6677', N'Not-Set', 1, 500, CAST(0x0000A706014CA346 AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (19, N'bea28629-75af-4448-97a2-dae0a79c09c4', N'Not-Set', 1, 500, CAST(0x0000A706015C1221 AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (20, N'ab7f6827-9fbd-4768-9f10-c175e0de2bf3', N'Not-Set', 1, 500, CAST(0x0000A7070141255F AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (21, N'94135950-c3d8-4748-a04d-53e915ce8268', N'Not-Set', 1, 500, CAST(0x0000A708000D9E59 AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (22, N'a909b0f0-829d-4e99-86e1-2836f2d8474d', N'Not-Set', 1, 0, CAST(0x0000A708009A5F1A AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (23, N'e96fc299-0752-46d3-802a-8d5c9b6f5d9b', N'Not-Set', 1, 500, CAST(0x0000A70800A8BFBB AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (24, N'9a45dd60-c2de-44d0-a82e-888522c35de8', N'Not-Set', 1, 500, CAST(0x0000A70800A91C4B AS DateTime), 0, 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [LastSceneDateTime], [LevelAnsweredNumber], [CurrentLevelID], [IsAbleToWriteComment]) VALUES (25, N'5c196d45-a52f-408d-b0f5-5e5b519abe6d', N'Not-Set', 1, 20, CAST(0x0000A70B013807AE AS DateTime), 0, 1, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (1, 7, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A704012CA5CB AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (2, 8, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A704012CE8E2 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (3, 9, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A704013194FD AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (4, 10, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A70401341BCF AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (5, 11, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A704013B60F8 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (6, 12, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A70401427775 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (7, 13, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A704014D6933 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (8, 14, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A704016F34A4 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (9, 15, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A7040178496D AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (10, 16, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A70500AD2C51 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (11, 17, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A7060100E229 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (12, 18, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A706014CA3C4 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (13, 19, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A706015C122B AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (14, 20, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A707014125F0 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (15, 21, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A708000D9E5E AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (16, 22, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A708009A5F28 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (17, 23, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A70800A8BFC9 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (18, 24, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A70800A91C4B AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [RegisterDateTime]) VALUES (19, 25, NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(0x0000A70B01380836 AS DateTime))
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([ID], [Name], [Description]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[UserType] ([ID], [Name], [Description]) VALUES (2, N'client', N'client')
INSERT [dbo].[UserType] ([ID], [Name], [Description]) VALUES (3, N'QuestionProvider', N'QuestionProvider')
SET IDENTITY_INSERT [dbo].[UserType] OFF
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_IsVerified]  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[CreatedQuestions] ADD  CONSTRAINT [DF_CreatedQuestions_Verified]  DEFAULT ((0)) FOR [VerifyStateID]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_Banned]  DEFAULT ((0)) FOR [Banned]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsAbleToWriteComment]  DEFAULT ((1)) FOR [IsAbleToWriteComment]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsVerified]  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsBanned]  DEFAULT ((0)) FOR [IsBanned]
GO
ALTER TABLE [dbo].[AchievedGifts]  WITH CHECK ADD  CONSTRAINT [FK_AchievedGifts_Gift] FOREIGN KEY([GiftID])
REFERENCES [dbo].[Gift] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AchievedGifts] CHECK CONSTRAINT [FK_AchievedGifts_Gift]
GO
ALTER TABLE [dbo].[AchievedGifts]  WITH CHECK ADD  CONSTRAINT [FK_AchievedGifts_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AchievedGifts] CHECK CONSTRAINT [FK_AchievedGifts_User]
GO
ALTER TABLE [dbo].[AchievedPosession]  WITH CHECK ADD  CONSTRAINT [FK_AchievedPosession_AchieveStateType] FOREIGN KEY([AchieveStateID])
REFERENCES [dbo].[AchieveStateType] ([ID])
GO
ALTER TABLE [dbo].[AchievedPosession] CHECK CONSTRAINT [FK_AchievedPosession_AchieveStateType]
GO
ALTER TABLE [dbo].[AchievedPosession]  WITH CHECK ADD  CONSTRAINT [FK_AchievedQuests_Quest] FOREIGN KEY([QuestID])
REFERENCES [dbo].[Achievement] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AchievedPosession] CHECK CONSTRAINT [FK_AchievedQuests_Quest]
GO
ALTER TABLE [dbo].[AchievedPosession]  WITH CHECK ADD  CONSTRAINT [FK_AchievedQuests_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AchievedPosession] CHECK CONSTRAINT [FK_AchievedQuests_User]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_User]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Question]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[CreatedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_CreatedQuestions_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[CreatedQuestions] CHECK CONSTRAINT [FK_CreatedQuestions_Category]
GO
ALTER TABLE [dbo].[CreatedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_CreatedQuestions_CreatedQuestionsVerifyType] FOREIGN KEY([VerifyStateID])
REFERENCES [dbo].[CreatedQuestionsVerifyType] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CreatedQuestions] CHECK CONSTRAINT [FK_CreatedQuestions_CreatedQuestionsVerifyType]
GO
ALTER TABLE [dbo].[CreatedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_CreatedQuestions_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CreatedQuestions] CHECK CONSTRAINT [FK_CreatedQuestions_User]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Question]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_User]
GO
ALTER TABLE [dbo].[Manufacture]  WITH CHECK ADD  CONSTRAINT [FK_Manufacture_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Manufacture] CHECK CONSTRAINT [FK_Manufacture_Question]
GO
ALTER TABLE [dbo].[Manufacture]  WITH CHECK ADD  CONSTRAINT [FK_Manufacture_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Manufacture] CHECK CONSTRAINT [FK_Manufacture_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Store] FOREIGN KEY([StoreItemID])
REFERENCES [dbo].[Store] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Store]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[PurchaseCategory]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseCategory] CHECK CONSTRAINT [FK_PurchaseCategory_Category]
GO
ALTER TABLE [dbo].[PurchaseCategory]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseCategory_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseCategory] CHECK CONSTRAINT [FK_PurchaseCategory_User]
GO
ALTER TABLE [dbo].[PurchaseTheme]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseTheme_AppTheme] FOREIGN KEY([ThemeID])
REFERENCES [dbo].[AppTheme] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseTheme] CHECK CONSTRAINT [FK_PurchaseTheme_AppTheme]
GO
ALTER TABLE [dbo].[PurchaseTheme]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseTheme_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseTheme] CHECK CONSTRAINT [FK_PurchaseTheme_User]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Category] FOREIGN KEY([Catgory_ID])
REFERENCES [dbo].[Category] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Category]
GO
ALTER TABLE [dbo].[ReportedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_ReportedQuestions_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReportedQuestions] CHECK CONSTRAINT [FK_ReportedQuestions_Question]
GO
ALTER TABLE [dbo].[ReportedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_ReportedQuestions_ReportType] FOREIGN KEY([ReportTypeID])
REFERENCES [dbo].[ReportType] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ReportedQuestions] CHECK CONSTRAINT [FK_ReportedQuestions_ReportType]
GO
ALTER TABLE [dbo].[ReportedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_ReportedQuestions_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReportedQuestions] CHECK CONSTRAINT [FK_ReportedQuestions_User]
GO
ALTER TABLE [dbo].[SelectedCategory]  WITH CHECK ADD  CONSTRAINT [FK_SelectedCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SelectedCategory] CHECK CONSTRAINT [FK_SelectedCategory_Category]
GO
ALTER TABLE [dbo].[SelectedCategory]  WITH CHECK ADD  CONSTRAINT [FK_SelectedCategory_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SelectedCategory] CHECK CONSTRAINT [FK_SelectedCategory_User]
GO
ALTER TABLE [dbo].[SelectedTheme]  WITH CHECK ADD  CONSTRAINT [FK_SelectedTheme_AppTheme] FOREIGN KEY([AppThemeID])
REFERENCES [dbo].[AppTheme] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SelectedTheme] CHECK CONSTRAINT [FK_SelectedTheme_AppTheme]
GO
ALTER TABLE [dbo].[SelectedTheme]  WITH CHECK ADD  CONSTRAINT [FK_SelectedTheme_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SelectedTheme] CHECK CONSTRAINT [FK_SelectedTheme_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Level] FOREIGN KEY([CurrentLevelID])
REFERENCES [dbo].[Level] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Level]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserType] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_User]
GO
