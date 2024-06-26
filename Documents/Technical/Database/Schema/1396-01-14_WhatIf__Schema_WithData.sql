USE [database_what_if]
GO
/****** Object:  Table [dbo].[AchievedCodeGift]    Script Date: 4/3/2017 1:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AchievedCodeGift](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodeGiftID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[AchievedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AchievedCodeGift] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AchievedGifts]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[AchievedPosession]    Script Date: 4/3/2017 1:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AchievedPosession](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AchievementID] [int] NOT NULL,
	[AchieveStateID] [int] NOT NULL,
	[AchievedDate] [datetime] NULL,
	[AchievableDate] [datetime] NULL,
 CONSTRAINT [PK_AchievedQuests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Achievement]    Script Date: 4/3/2017 1:26:21 PM ******/
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
	[QueryTypeID] [int] NULL,
	[Query] [nvarchar](1000) NULL,
	[LevelID] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CategoryID] [int] NULL,
	[CategoryQuantity] [int] NULL,
	[Prize] [int] NOT NULL,
 CONSTRAINT [PK_Quest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AchievementQueryType]    Script Date: 4/3/2017 1:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AchievementQueryType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QueyName] [nvarchar](20) NOT NULL,
	[QueryDescription] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_AchievementQueryType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AchieveStateType]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[ApplicationState]    Script Date: 4/3/2017 1:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApplicationState](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Favorite_FavoritePrice] [int] NOT NULL,
	[Favorite_FreeNumberToFavorite] [int] NOT NULL,
	[User_DefaultUserName] [varchar](20) NOT NULL,
	[User_DefaultUserCoin] [int] NOT NULL,
	[Question_CreateQuestionPrice] [int] NOT NULL,
	[Question_DefaultReturnAmount] [int] NOT NULL,
	[Question_NumberToSkip] [int] NOT NULL,
	[Question_NoQuestionFoundWhat] [nvarchar](50) NOT NULL,
	[Question_NoQuestionFoundBut] [nvarchar](50) NOT NULL,
	[Question_NoQuestionFoundID] [int] NOT NULL,
	[Question_ServerBurntReturnAmount] [int] NOT NULL,
	[Prize_AnswerPrize] [int] NOT NULL,
	[Prize_LikePrize] [int] NOT NULL,
	[Prize_CreateNewQuestionPrize] [int] NOT NULL,
	[Prize_NewQuestionAcceptedPrize] [int] NOT NULL,
	[Paging_DefaultPageSize] [int] NOT NULL,
	[Leader_TopNumberToShow] [int] NOT NULL,
	[Comment_DefaultNumberAmount] [int] NOT NULL,
	[Comment_DefaultVerifyState] [bit] NOT NULL,
	[Host_WebSiteNoReplyMail] [varchar](50) NOT NULL,
	[Host_WebSiteNoReplyMailPassword] [varchar](50) NOT NULL,
	[Host_SupportMail] [varchar](50) NOT NULL,
	[Host_SupportMailPassword] [varchar](50) NOT NULL,
	[Host_SmtpServer] [varchar](20) NOT NULL,
	[Store_DefaultReturnAmount] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppTheme]    Script Date: 4/3/2017 1:26:21 PM ******/
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
	[BackImage] [nvarchar](50) NULL,
	[DialogImage] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AppTheme] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/3/2017 1:26:21 PM ******/
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
	[PrizeCoefficient] [int] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CodeGift]    Script Date: 4/3/2017 1:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CodeGift](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[Serial] [varchar](50) NOT NULL,
	[Prize] [int] NOT NULL,
	[TotalUserCount] [int] NOT NULL,
	[TotalUserRegistered] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[ExpireDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CodeGift] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[CreatedQuestions]    Script Date: 4/3/2017 1:26:21 PM ******/
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
	[QuestionBoostID] [int] NULL,
 CONSTRAINT [PK_CreatedQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CreatedQuestionsVerifyType]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[Favorite]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[Gift]    Script Date: 4/3/2017 1:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gift](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [varchar](150) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[GiftTypeID] [int] NOT NULL,
	[Prize] [int] NOT NULL,
	[Day] [int] NULL,
	[StartDate] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
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
/****** Object:  Table [dbo].[GiftType]    Script Date: 4/3/2017 1:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiftType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_GiftType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Level]    Script Date: 4/3/2017 1:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LevelNumber] [int] NOT NULL,
	[Star] [int] NOT NULL,
	[ScoreCeil] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manufacture]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[OurAdvertisements]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[PurchaseAvatar]    Script Date: 4/3/2017 1:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseAvatar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserAvatarID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[PurchasedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PurchaseAvatar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseCategory]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[PurchaseTheme]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 4/3/2017 1:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[CreatedDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[Banned] [bit] NOT NULL,
	[QuestionBoostID] [int] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionBoost]    Script Date: 4/3/2017 1:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestionBoost](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Price] [int] NOT NULL,
	[Icon] [nvarchar](150) NOT NULL,
	[RectangleColor] [varchar](10) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_QuestionBoost] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReportedQuestions]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[ReportType]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[SelectedAvatar]    Script Date: 4/3/2017 1:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelectedAvatar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserAvatarID] [int] NOT NULL,
 CONSTRAINT [PK_SelectedAvatar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SelectedCategory]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[SelectedTheme]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[Store]    Script Date: 4/3/2017 1:26:21 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 4/3/2017 1:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UUID] [varchar](36) NOT NULL,
	[UserName] [nvarchar](40) NOT NULL,
	[UserTypeID] [int] NULL,
	[TotalStars] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[LevelProgress] [int] NOT NULL,
	[CurrentLevelID] [int] NULL,
	[IsAbleToWriteComment] [bit] NOT NULL,
	[LastSeenDateTime] [datetime] NOT NULL,
	[PrevLastSeenDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAvatar]    Script Date: 4/3/2017 1:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAvatar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PicUrl] [nvarchar](150) NOT NULL,
	[Price] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserAvatar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 4/3/2017 1:26:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[GoogleID] [varchar](40) NULL,
	[IsVerified] [bit] NOT NULL,
	[IsBanned] [bit] NOT NULL,
	[IsEditable] [int] NOT NULL,
	[RegisterDateTime] [datetime] NOT NULL,
	[ChangeInfoDate] [datetime] NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 4/3/2017 1:26:21 PM ******/
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
SET IDENTITY_INSERT [dbo].[AchievedCodeGift] ON 

INSERT [dbo].[AchievedCodeGift] ([ID], [CodeGiftID], [UserID], [AchievedDate]) VALUES (6, 4, 1168, CAST(0x0000A74501245B49 AS DateTime))
INSERT [dbo].[AchievedCodeGift] ([ID], [CodeGiftID], [UserID], [AchievedDate]) VALUES (7, 4, 1156, CAST(0x0000A74600A742CB AS DateTime))
SET IDENTITY_INSERT [dbo].[AchievedCodeGift] OFF
SET IDENTITY_INSERT [dbo].[AchievedGifts] ON 

INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (1, 1157, 3, CAST(0x0000A749013E06BB AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (2, 1157, 9, CAST(0x0000A749014161FB AS DateTime))
SET IDENTITY_INSERT [dbo].[AchievedGifts] OFF
SET IDENTITY_INSERT [dbo].[AchievedPosession] ON 

INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1201, 1158, 4, 3, CAST(0x0000A73A00092028 AS DateTime), CAST(0x0000A73A00091DD9 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1202, 1158, 5, 3, CAST(0x0000A73A000D661F AS DateTime), CAST(0x0000A73A000D63E8 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1203, 1156, 15, 3, CAST(0x0000A73A001C85CA AS DateTime), CAST(0x0000A73A001C81DF AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1204, 1155, 15, 3, CAST(0x0000A73A00A177A8 AS DateTime), CAST(0x0000A73A00A175E6 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1205, 1155, 16, 3, CAST(0x0000A73A00A17C0D AS DateTime), CAST(0x0000A73A00A17A7E AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1206, 1155, 4, 3, CAST(0x0000A73A00A22461 AS DateTime), CAST(0x0000A73A00A222C4 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1207, 1155, 5, 3, CAST(0x0000A73A00A2281D AS DateTime), CAST(0x0000A73A00A22681 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1208, 1155, 8, 3, CAST(0x0000A73A00D1F079 AS DateTime), CAST(0x0000A73A00D1EF36 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1209, 1160, 4, 3, CAST(0x0000A73A00D9D5A2 AS DateTime), CAST(0x0000A73A00D9D439 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1210, 1160, 5, 3, CAST(0x0000A73A00DB4A96 AS DateTime), CAST(0x0000A73A00DB495B AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1211, 1160, 15, 3, CAST(0x0000A73B017F7D07 AS DateTime), CAST(0x0000A73B017F7ADE AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1212, 1160, 16, 3, CAST(0x0000A73B018065CB AS DateTime), CAST(0x0000A73B01806263 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1213, 1160, 10, 2, NULL, CAST(0x0000A73C00E5AC02 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1214, 1160, 8, 2, NULL, CAST(0x0000A73C00E5AC02 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1215, 1160, 11, 2, NULL, CAST(0x0000A73C00E5B350 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1216, 1160, 9, 2, NULL, CAST(0x0000A73C00E5B350 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1217, 1165, 17, 3, CAST(0x0000A73D00D62781 AS DateTime), CAST(0x0000A73C015A5A9F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1218, 1165, 4, 3, CAST(0x0000A73D00D62617 AS DateTime), CAST(0x0000A73C015A5A9F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1219, 1165, 5, 3, CAST(0x0000A73D00D6323B AS DateTime), CAST(0x0000A73D00D62223 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1220, 1156, 17, 3, CAST(0x0000A73D01850F16 AS DateTime), CAST(0x0000A73D016F8DB2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1221, 1156, 16, 3, CAST(0x0000A73D016F9403 AS DateTime), CAST(0x0000A73D016F8DB2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1222, 1167, 17, 2, NULL, CAST(0x0000A73E0182AC15 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1223, 1167, 4, 2, NULL, CAST(0x0000A73E0182AC15 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1224, 1167, 5, 2, NULL, CAST(0x0000A73E0189327C AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1225, 1167, 8, 2, NULL, CAST(0x0000A73E0189327C AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1226, 1167, 9, 2, NULL, CAST(0x0000A73F0138F536 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1227, 1167, 15, 2, NULL, CAST(0x0000A745011BD816 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1228, 1169, 17, 3, CAST(0x0000A74600FFE812 AS DateTime), CAST(0x0000A745012B6E39 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1229, 1169, 4, 3, CAST(0x0000A74600FFE731 AS DateTime), CAST(0x0000A74600C267AF AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1230, 1170, 17, 2, NULL, CAST(0x0000A74800BA8864 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1231, 1168, 17, 2, NULL, CAST(0x0000A74801030552 AS DateTime))
SET IDENTITY_INSERT [dbo].[AchievedPosession] OFF
SET IDENTITY_INSERT [dbo].[Achievement] ON 

INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (4, N'عمومی تازه کار', N'جواب به یک سوال عمومی', 20, N'data/images/1.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1, NULL, NULL, 1, 1, 1, 1)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (5, N'عمومی جون', N'جواب به دو سوال عمومی', 30, N'data/images/2.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1, NULL, NULL, 1, 1, 2, 1)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (6, N'ورزشی تازه کار', N'جواب به یک سوال ورزشی', 20, N'data/images/3.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1, NULL, NULL, 1, 2, 1, 1)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (7, N'ورزشی جون', N'جواب به دو سوال ورزشی', 40, N'data/images/4.png', N'#c33d3d', CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 2, 2, 1)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (8, N'بزرگسال تازه کار', N'جواب به یک سوال بزرگسال', 50, N'data/images/5.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 7, 1, 1)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (9, N'بزرگسال جون', N'جواب به دو سوال بزرگسال', 60, N'data/images/6.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 7, 2, 1)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (10, N'پزشکی تازه کار', N'جواب به یک سوال پزشکی', 30, N'data/images/7.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1, NULL, NULL, 1, 8, 1, 1)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (11, N'پزشکی جون', N'جواب به دو سوال پزشکی', 40, N'data/images/8.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 8, 2, 1)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (13, N'خانوادگی تازه کار', N'جواب به یک سوال خانوادگی', 30, N'data/images/9.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 5, 1, 1)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (14, N'خانوادگی جون', N'جواب به دو سوال خانوادگی', 40, N'data/images/10.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 5, 2, 1)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (15, N'سیاسی تازه کار', N'جواب به یک سوال سیاسی', 30, N'data/images/11.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 6, 1, 1)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (16, N'سیاسی جون', N'جواب به دو سوال سیاسی', 40, N'data/images/12.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 6, 2, 1)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (17, N'گلد', N'جواب به دو سوال خاص', 100, N'data/images/4.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 2, N'SELECT Count( [QuestionID]) FROM [database_what_if].[dbo].[Answer] Where [UserID] = @p0 And [QuestionID] = 12 Or [QuestionID] = 18', 1, 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Achievement] OFF
SET IDENTITY_INSERT [dbo].[AchievementQueryType] ON 

INSERT [dbo].[AchievementQueryType] ([ID], [QueyName], [QueryDescription]) VALUES (1, N'1', N'1')
INSERT [dbo].[AchievementQueryType] ([ID], [QueyName], [QueryDescription]) VALUES (2, N'2', N'2')
SET IDENTITY_INSERT [dbo].[AchievementQueryType] OFF
SET IDENTITY_INSERT [dbo].[AchieveStateType] ON 

INSERT [dbo].[AchieveStateType] ([ID], [Name], [Description]) VALUES (1, N'1', N'1')
INSERT [dbo].[AchieveStateType] ([ID], [Name], [Description]) VALUES (2, N'2', N'2')
INSERT [dbo].[AchieveStateType] ([ID], [Name], [Description]) VALUES (3, N'3', N'3')
SET IDENTITY_INSERT [dbo].[AchieveStateType] OFF
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4098, 1155, 9, NULL, NULL, 0, CAST(0x0000A7390175EB7E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4099, 1155, 24, NULL, NULL, 1, CAST(0x0000A73901768B91 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4100, 1158, 1, NULL, NULL, 0, CAST(0x0000A73A0008D379 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4101, 1158, 25, NULL, NULL, 1, CAST(0x0000A73A000AD3BB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4102, 1158, 33, NULL, NULL, 0, CAST(0x0000A73A000B13DA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4103, 1156, 9, NULL, NULL, 1, CAST(0x0000A73A001C46F3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4104, 1156, 24, NULL, NULL, 1, CAST(0x0000A73A001C4C5E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4105, 1156, 111, 1, NULL, 0, CAST(0x0000A73A001C7B8E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4106, 1155, 1, NULL, NULL, 0, CAST(0x0000A73A00A18B65 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4107, 1155, 25, NULL, NULL, 0, CAST(0x0000A73A00A19276 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4108, 1155, 33, NULL, NULL, 0, CAST(0x0000A73A00A1984D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4109, 1155, 111, NULL, NULL, 0, CAST(0x0000A73A00A1D20E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4110, 1155, 16, NULL, NULL, 0, CAST(0x0000A73A00A31D96 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4111, 1155, 99, NULL, NULL, 0, CAST(0x0000A73A00A32B51 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4112, 1155, 105, NULL, NULL, 0, CAST(0x0000A73A00A33344 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4113, 1155, 112, NULL, NULL, 0, CAST(0x0000A73A00A33AF0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4114, 1160, 1, NULL, NULL, 1, CAST(0x0000A73A00D24A6A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4115, 1160, 25, NULL, NULL, 0, CAST(0x0000A73A00D250F8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4116, 1160, 33, NULL, NULL, 0, CAST(0x0000A73A00D25558 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4117, 1160, 58, NULL, NULL, 0, CAST(0x0000A73A00D829C0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4118, 1160, 74, NULL, NULL, 0, CAST(0x0000A73A00D9E59E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4119, 1160, 75, NULL, NULL, 0, CAST(0x0000A73A00D9FD9B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4120, 1160, 76, NULL, NULL, 0, CAST(0x0000A73A00DA06BE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4121, 1160, 114, NULL, NULL, 1, CAST(0x0000A73A00DA1340 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4122, 1160, 51, NULL, NULL, 0, CAST(0x0000A73A00DA25D5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4123, 1160, 53, NULL, NULL, 0, CAST(0x0000A73A00DA2C97 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4124, 1160, 72, NULL, NULL, 0, CAST(0x0000A73A00DA3443 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4125, 1160, 117, NULL, NULL, 0, CAST(0x0000A73A00DA4071 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4126, 1160, 37, NULL, NULL, 0, CAST(0x0000A73A00DA49E8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4127, 1160, 55, NULL, NULL, 0, CAST(0x0000A73A00DB0A3D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4128, 1160, 56, NULL, NULL, 1, CAST(0x0000A73A00DB3090 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4129, 1162, 33, NULL, NULL, 1, CAST(0x0000A73A0156546C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4130, 1162, 58, NULL, NULL, 0, CAST(0x0000A73A01565E87 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4131, 1162, 74, NULL, NULL, 0, CAST(0x0000A73A01566890 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4132, 1162, 75, NULL, NULL, 1, CAST(0x0000A73A015688DD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4133, 1162, 76, NULL, NULL, 1, CAST(0x0000A73A01569A7A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4134, 1162, 9, NULL, NULL, 0, CAST(0x0000A73A0156A49F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4135, 1162, 24, NULL, NULL, 1, CAST(0x0000A73A0156B670 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4136, 1162, 111, NULL, NULL, 0, CAST(0x0000A73A0156BB2E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4137, 1162, 12, NULL, NULL, 0, CAST(0x0000A73A01570C55 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4138, 1162, 31, NULL, NULL, 0, CAST(0x0000A73A01571396 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4139, 1162, 43, NULL, NULL, 0, CAST(0x0000A73A01572ECB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4140, 1162, 44, NULL, NULL, 0, CAST(0x0000A73A015734B1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4141, 1160, 57, NULL, NULL, 1, CAST(0x0000A73B010C4AA3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4142, 1160, 59, NULL, NULL, 0, CAST(0x0000A73B010C86AD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4143, 1160, 69, NULL, NULL, 0, CAST(0x0000A73B010C9CD6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4144, 1160, 71, NULL, NULL, 0, CAST(0x0000A73B010C9DC9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4145, 1160, 73, NULL, NULL, 0, CAST(0x0000A73B010CFFF8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4146, 1160, 77, NULL, NULL, 1, CAST(0x0000A73B010D137D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4147, 1160, 116, NULL, NULL, 1, CAST(0x0000A73B010D1C92 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4148, 1160, 118, NULL, NULL, 0, CAST(0x0000A73B010D304F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4149, 1160, 119, NULL, NULL, 0, CAST(0x0000A73B010D3582 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4150, 1160, 52, NULL, NULL, 0, CAST(0x0000A73B010D4867 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4151, 1160, 12, NULL, NULL, 0, CAST(0x0000A73B010DC093 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4152, 1160, 31, NULL, NULL, 1, CAST(0x0000A73B010DD5D6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4153, 1160, 43, NULL, NULL, 0, CAST(0x0000A73B010DEB92 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4154, 1160, 44, NULL, NULL, 1, CAST(0x0000A73B010DF0C0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4155, 1160, 64, NULL, NULL, 0, CAST(0x0000A73B010DF64D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4156, 1160, 26, NULL, NULL, 1, CAST(0x0000A73B010E098B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4157, 1160, 47, NULL, NULL, 0, CAST(0x0000A73B010E20E4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4158, 1160, 61, NULL, NULL, 1, CAST(0x0000A73B010E20ED AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4159, 1160, 65, NULL, NULL, 0, CAST(0x0000A73B010E3B7F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4160, 1160, 67, NULL, NULL, 1, CAST(0x0000A73B010E3F40 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4161, 1160, 80, NULL, NULL, 0, CAST(0x0000A73B010E45DC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4162, 1160, 81, NULL, NULL, 0, CAST(0x0000A73B010E61E0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4163, 1160, 84, NULL, NULL, 0, CAST(0x0000A73B017382B3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4164, 1160, 91, NULL, NULL, 1, CAST(0x0000A73B0176C903 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4165, 1160, 96, NULL, NULL, 0, CAST(0x0000A73B0176CC04 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4166, 1160, 97, NULL, NULL, 0, CAST(0x0000A73B0176D52C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4167, 1160, 100, NULL, NULL, 0, CAST(0x0000A73B0176FF53 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4168, 1160, 98, NULL, NULL, 1, CAST(0x0000A73B0176FF57 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4169, 1160, 63, NULL, NULL, 0, CAST(0x0000A73B0177220F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4170, 1160, 103, NULL, NULL, 0, CAST(0x0000A73B01774D41 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4171, 1160, 108, NULL, NULL, 0, CAST(0x0000A73B01774D5D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4172, 1160, 109, NULL, NULL, 0, CAST(0x0000A73B0177505E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4173, 1160, 104, NULL, NULL, 1, CAST(0x0000A73B0177712E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4174, 1160, 106, NULL, NULL, 0, CAST(0x0000A73B01777909 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4175, 1160, 107, NULL, NULL, 1, CAST(0x0000A73B01778CC1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4176, 1160, 113, NULL, NULL, 1, CAST(0x0000A73B01779E89 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4177, 1160, 86, NULL, NULL, 0, CAST(0x0000A73B017E5AC5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4178, 1160, 88, NULL, NULL, 0, CAST(0x0000A73B017E5AF4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4179, 1160, 89, NULL, NULL, 0, CAST(0x0000A73B017E6137 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4180, 1160, 101, NULL, NULL, 0, CAST(0x0000A73B017E65B8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4181, 1160, 27, NULL, NULL, 0, CAST(0x0000A73B017E7DA2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4182, 1160, 102, NULL, NULL, 0, CAST(0x0000A73B017E7DED AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4183, 1160, 29, NULL, NULL, 0, CAST(0x0000A73B017E7E38 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4184, 1160, 62, NULL, NULL, 0, CAST(0x0000A73B017EDF15 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4185, 1160, 66, NULL, NULL, 0, CAST(0x0000A73B017EE1F0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4186, 1160, 24, NULL, NULL, 0, CAST(0x0000A73B017F75F1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4187, 1160, 111, NULL, NULL, 0, CAST(0x0000A73B017F75FB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4188, 1160, 9, NULL, NULL, 0, CAST(0x0000A73B017F79A0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4189, 1160, 6, NULL, NULL, 1, CAST(0x0000A73C00A08D94 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4190, 1160, 22, NULL, NULL, 0, CAST(0x0000A73C00A08F15 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4191, 1160, 35, NULL, NULL, 0, CAST(0x0000A73C00A09622 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4192, 1160, 5, NULL, NULL, 0, CAST(0x0000A73C00D69136 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4193, 1160, 15, NULL, NULL, 0, CAST(0x0000A73C00DD2351 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4194, 1160, 17, NULL, NULL, 0, CAST(0x0000A73C00DD37CA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4195, 1160, 23, NULL, NULL, 0, CAST(0x0000A73C00DD3ECD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4196, 1160, 40, NULL, NULL, 0, CAST(0x0000A73C00DD44AE AS DateTime))
GO
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4197, 1160, 45, NULL, NULL, 0, CAST(0x0000A73C00DD48E4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4198, 1160, 3, NULL, NULL, 0, CAST(0x0000A73C00DD5F3F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4199, 1160, 4, NULL, NULL, 1, CAST(0x0000A73C00DD5F52 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4200, 1160, 21, NULL, NULL, 0, CAST(0x0000A73C00DD6240 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4201, 1160, 16, NULL, NULL, 0, CAST(0x0000A73C00E083F1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4202, 1160, 99, NULL, NULL, 0, CAST(0x0000A73C00E08420 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4203, 1160, 105, NULL, NULL, 0, CAST(0x0000A73C00E08796 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4204, 1160, 112, NULL, NULL, 1, CAST(0x0000A73C00E08E40 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4205, 1160, 7, NULL, NULL, 1, CAST(0x0000A73C00E0C6E7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4206, 1160, 18, NULL, NULL, 0, CAST(0x0000A73C00E0CD3E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4207, 1160, 79, NULL, NULL, 1, CAST(0x0000A73C00E0D27A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4208, 1160, 78, NULL, NULL, 0, CAST(0x0000A73C00E0D5CF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4209, 1160, 87, NULL, NULL, 1, CAST(0x0000A73C00E0F4BC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4210, 1160, 10, NULL, NULL, 1, CAST(0x0000A73C00E3B110 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4211, 1160, 46, NULL, NULL, 0, CAST(0x0000A73C00E3B5D7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4212, 1160, 34, NULL, NULL, 0, CAST(0x0000A73C00E3B651 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4213, 1160, 49, NULL, NULL, 0, CAST(0x0000A73C00E3C741 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4214, 1160, 50, NULL, NULL, 0, CAST(0x0000A73C00E3C9D6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4215, 1160, 30, NULL, NULL, 0, CAST(0x0000A73C00E3D098 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4216, 1160, 41, NULL, NULL, 0, CAST(0x0000A73C00E3D62D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4217, 1160, 92, NULL, NULL, 1, CAST(0x0000A73C00E3DCDC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4218, 1160, 110, NULL, NULL, 0, CAST(0x0000A73C00E3EADE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4219, 1160, 2, NULL, NULL, 0, CAST(0x0000A73C00E3ECC6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4220, 1160, 11, NULL, NULL, 0, CAST(0x0000A73C00E47200 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4221, 1160, 8, NULL, NULL, 0, CAST(0x0000A73C00E47205 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4222, 1160, 83, NULL, NULL, 0, CAST(0x0000A73C00E47539 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4223, 1160, 90, NULL, NULL, 1, CAST(0x0000A73C00E48844 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4225, 1160, 42, NULL, NULL, 0, CAST(0x0000A73C00E4A273 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4226, 1160, 60, NULL, NULL, 0, CAST(0x0000A73C00E4A692 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4227, 1160, 54, NULL, NULL, 0, CAST(0x0000A73C00E4A812 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4228, 1160, 70, NULL, NULL, 0, CAST(0x0000A73C00E4ABA4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4229, 1160, 93, NULL, NULL, 0, CAST(0x0000A73C00E4AEEB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4230, 1160, 20, NULL, NULL, 0, CAST(0x0000A73C00E4C18F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4231, 1160, 28, NULL, NULL, 0, CAST(0x0000A73C00E4C1A2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4232, 1160, 36, NULL, NULL, 1, CAST(0x0000A73C00E4C453 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4233, 1160, 39, NULL, NULL, 0, CAST(0x0000A73C00E4CED6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4234, 1160, 19, NULL, NULL, 0, CAST(0x0000A73C00E4D1E0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4235, 1160, 94, NULL, NULL, 0, CAST(0x0000A73C00E4D726 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4236, 1160, 95, NULL, NULL, 0, CAST(0x0000A73C00E4DFA0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4237, 1160, 115, NULL, NULL, 0, CAST(0x0000A73C00E4EB0D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4238, 1160, 38, NULL, NULL, 0, CAST(0x0000A73C00E520AA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4239, 1160, 48, NULL, NULL, 0, CAST(0x0000A73C00E520E7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4240, 1160, 68, NULL, NULL, 0, CAST(0x0000A73C00E52775 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4241, 1160, 82, NULL, NULL, 0, CAST(0x0000A73C00E530F6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4242, 1160, 85, NULL, NULL, 0, CAST(0x0000A73C00E54565 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4245, 1165, 33, NULL, NULL, 0, CAST(0x0000A73C0139E90F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4246, 1165, 58, NULL, NULL, 0, CAST(0x0000A73C0139ECDE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4247, 1165, 74, NULL, NULL, 0, CAST(0x0000A73C0139EFDF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4248, 1165, 75, NULL, NULL, 0, CAST(0x0000A73C0139F570 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4249, 1165, 76, NULL, NULL, 1, CAST(0x0000A73C013A07B6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4250, 1165, 51, NULL, NULL, 0, CAST(0x0000A73C013A0D47 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4251, 1165, 72, NULL, NULL, 0, CAST(0x0000A73C013A158A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4252, 1165, 53, NULL, NULL, 1, CAST(0x0000A73D00D69334 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4253, 1165, 55, NULL, NULL, 1, CAST(0x0000A73D00D6B0FA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4254, 1165, 56, NULL, NULL, 0, CAST(0x0000A73D00D6B3A2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4255, 1165, 114, NULL, NULL, 0, CAST(0x0000A73D00D9BDDA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4256, 1165, 117, NULL, NULL, 0, CAST(0x0000A73D00D9D135 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4257, 1165, 10, NULL, NULL, 1, CAST(0x0000A73D00D9EB9C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4258, 1165, 34, NULL, NULL, 1, CAST(0x0000A73D00DAB502 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4259, 1165, 46, NULL, NULL, 0, CAST(0x0000A73D00DB3A8C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4260, 1165, 49, NULL, NULL, 0, CAST(0x0000A73D00DB3AD3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4261, 1165, 1, NULL, NULL, 0, CAST(0x0000A73D010F8A7F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4262, 1156, 12, NULL, NULL, 1, CAST(0x0000A73D016EFAA4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4263, 1156, 26, NULL, NULL, 0, CAST(0x0000A73D016F0B90 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4264, 1156, 31, NULL, NULL, 1, CAST(0x0000A73D016F22D1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4265, 1156, 43, NULL, NULL, 1, CAST(0x0000A73D016FDB63 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4266, 1156, 44, NULL, NULL, 0, CAST(0x0000A73D016FEFB1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4267, 1156, 47, NULL, NULL, 1, CAST(0x0000A73D01854841 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4268, 1156, 61, NULL, NULL, 1, CAST(0x0000A73D01854E7F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4269, 1156, 64, NULL, NULL, 0, CAST(0x0000A73D0185597C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4270, 1166, 33, NULL, NULL, 0, CAST(0x0000A73D0189E197 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4271, 1165, 37, NULL, NULL, 0, CAST(0x0000A73E00B906C0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4272, 1165, 57, NULL, NULL, 1, CAST(0x0000A73E00B9214D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4273, 1165, 59, NULL, NULL, 0, CAST(0x0000A73E00B92157 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4274, 1165, 69, NULL, NULL, 0, CAST(0x0000A73E00B92542 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4275, 1165, 73, NULL, NULL, 0, CAST(0x0000A73E00B92818 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4276, 1165, 71, NULL, NULL, 0, CAST(0x0000A73E00B93076 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4277, 1165, 116, NULL, NULL, 0, CAST(0x0000A73E00BA75BB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4278, 1165, 118, 1, NULL, 1, CAST(0x0000A73E00BAC122 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4279, 1165, 25, NULL, NULL, 0, CAST(0x0000A73E00D88E28 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4280, 1165, 52, NULL, NULL, 1, CAST(0x0000A73E00EBBD55 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4281, 1167, 33, NULL, NULL, 0, CAST(0x0000A73E00ED2BA7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4282, 1167, 58, NULL, NULL, 0, CAST(0x0000A73E01821F9B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4283, 1167, 75, NULL, NULL, 0, CAST(0x0000A73E01821F9B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4284, 1167, 74, NULL, NULL, 1, CAST(0x0000A73E01821F9B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4285, 1167, 76, NULL, NULL, 0, CAST(0x0000A73E01822572 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4286, 1167, 51, NULL, NULL, 0, CAST(0x0000A73E018257D6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4287, 1167, 53, NULL, NULL, 0, CAST(0x0000A73E0183737C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4288, 1167, 72, NULL, NULL, 0, CAST(0x0000A73E0183B9FB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4289, 1167, 114, NULL, NULL, 1, CAST(0x0000A73E0183E89E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4290, 1167, 117, NULL, NULL, 0, CAST(0x0000A73E01841178 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4291, 1167, 1, NULL, NULL, 1, CAST(0x0000A73E0184117D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4292, 1167, 55, NULL, NULL, 1, CAST(0x0000A73E01842C4B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4293, 1167, 56, NULL, NULL, 1, CAST(0x0000A73E01843793 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4294, 1167, 57, NULL, NULL, 1, CAST(0x0000A73E01844A86 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4295, 1167, 37, NULL, NULL, 1, CAST(0x0000A73E01849794 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4296, 1167, 59, NULL, NULL, 0, CAST(0x0000A73E01849D70 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4297, 1167, 69, NULL, NULL, 0, CAST(0x0000A73E0184BAF9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4298, 1167, 73, NULL, NULL, 0, CAST(0x0000A73E0185655E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4299, 1167, 71, NULL, NULL, 1, CAST(0x0000A73E018588E0 AS DateTime))
GO
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4300, 1167, 16, NULL, NULL, 1, CAST(0x0000A73E0185EC43 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4301, 1167, 99, NULL, NULL, 0, CAST(0x0000A73E01860173 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4302, 1167, 105, NULL, NULL, 0, CAST(0x0000A73E0186126C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4303, 1167, 112, NULL, NULL, 1, CAST(0x0000A73E01865AE1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4304, 1167, 12, NULL, NULL, 0, CAST(0x0000A73E01885884 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4305, 1167, 31, NULL, NULL, 0, CAST(0x0000A73E01889075 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4306, 1167, 43, NULL, NULL, 0, CAST(0x0000A73E01890BD0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4307, 1167, 44, NULL, NULL, 1, CAST(0x0000A73E0189165C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4308, 1166, 58, NULL, NULL, 1, CAST(0x0000A73F00EDEB74 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4309, 1166, 74, NULL, NULL, 0, CAST(0x0000A73F00EE02CD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4310, 1166, 75, NULL, NULL, 0, CAST(0x0000A73F00EE092C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4311, 1166, 76, NULL, NULL, 1, CAST(0x0000A73F00EE2F18 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4312, 1166, 114, NULL, NULL, 0, CAST(0x0000A73F00EE60D8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4313, 1166, 51, NULL, NULL, 0, CAST(0x0000A73F00EE65F4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4314, 1166, 53, NULL, NULL, 0, CAST(0x0000A73F00EE8FD9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4315, 1166, 72, NULL, NULL, 0, CAST(0x0000A73F00EEB93F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4316, 1166, 117, NULL, NULL, 0, CAST(0x0000A73F00EED27F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4317, 1166, 1, NULL, NULL, 0, CAST(0x0000A73F00EEE5DA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4318, 1166, 55, NULL, NULL, 0, CAST(0x0000A73F00EF0038 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4319, 1166, 56, NULL, NULL, 0, CAST(0x0000A73F00EF16FF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4320, 1166, 57, NULL, NULL, 0, CAST(0x0000A73F00EF4824 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4321, 1166, 37, NULL, NULL, 1, CAST(0x0000A73F00EF63FE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4322, 1166, 59, NULL, NULL, 0, CAST(0x0000A73F00EF6AC5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4323, 1166, 69, NULL, NULL, 0, CAST(0x0000A73F00EF6F41 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4324, 1166, 73, NULL, NULL, 0, CAST(0x0000A73F00EF7BDA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4325, 1166, 71, NULL, NULL, 0, CAST(0x0000A73F00EF99FE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4326, 1166, 116, NULL, NULL, 0, CAST(0x0000A73F00EFA427 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4327, 1166, 118, NULL, NULL, 0, CAST(0x0000A73F00EFBEFA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4328, 1166, 119, NULL, NULL, 0, CAST(0x0000A73F00EFC5EB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4329, 1166, 25, NULL, NULL, 0, CAST(0x0000A73F00EFFFDF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4330, 1166, 52, NULL, NULL, 0, CAST(0x0000A73F00F00392 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4331, 1166, 77, NULL, NULL, 0, CAST(0x0000A73F00F007D1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4332, 1167, 26, NULL, NULL, 1, CAST(0x0000A73F0139CB44 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4333, 1167, 47, NULL, NULL, 0, CAST(0x0000A73F0139D0D5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4334, 1167, 61, NULL, NULL, 0, CAST(0x0000A73F0139D4C0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4335, 1167, 64, NULL, NULL, 0, CAST(0x0000A73F0139DBFB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4336, 1167, 9, NULL, NULL, 0, CAST(0x0000A7400179F91F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4337, 1167, 24, NULL, NULL, 1, CAST(0x0000A7430180CE6D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4338, 1167, 111, NULL, NULL, 1, CAST(0x0000A74500B9AFC3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4339, 1167, 38, NULL, NULL, 1, CAST(0x0000A74500B9B75C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4340, 1167, 48, NULL, NULL, 1, CAST(0x0000A74500B9BA90 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4341, 1167, 68, NULL, NULL, 1, CAST(0x0000A74500B9BDEA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4342, 1167, 82, NULL, NULL, 1, CAST(0x0000A74500B9C136 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4343, 1167, 85, NULL, NULL, 1, CAST(0x0000A74500B9C486 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4344, 1167, 32, NULL, NULL, 1, CAST(0x0000A74500B9C7D2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4345, 1167, 52, NULL, NULL, 0, CAST(0x0000A745011BBE07 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4346, 1167, 77, NULL, NULL, 1, CAST(0x0000A745011C7E54 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4347, 1169, 33, NULL, NULL, 0, CAST(0x0000A74600C1514F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4348, 1156, 65, NULL, NULL, 1, CAST(0x0000A74600E0778A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4349, 1156, 67, NULL, NULL, 1, CAST(0x0000A74600E08CB9 AS DateTime))
SET IDENTITY_INSERT [dbo].[Answer] OFF
SET IDENTITY_INSERT [dbo].[ApplicationState] ON 

INSERT [dbo].[ApplicationState] ([ID], [Favorite_FavoritePrice], [Favorite_FreeNumberToFavorite], [User_DefaultUserName], [User_DefaultUserCoin], [Question_CreateQuestionPrice], [Question_DefaultReturnAmount], [Question_NumberToSkip], [Question_NoQuestionFoundWhat], [Question_NoQuestionFoundBut], [Question_NoQuestionFoundID], [Question_ServerBurntReturnAmount], [Prize_AnswerPrize], [Prize_LikePrize], [Prize_CreateNewQuestionPrize], [Prize_NewQuestionAcceptedPrize], [Paging_DefaultPageSize], [Leader_TopNumberToShow], [Comment_DefaultNumberAmount], [Comment_DefaultVerifyState], [Host_WebSiteNoReplyMail], [Host_WebSiteNoReplyMailPassword], [Host_SupportMail], [Host_SupportMailPassword], [Host_SmtpServer], [Store_DefaultReturnAmount]) VALUES (1, 5, 3, N'Guest_', 200, 50, 5, 2, N'یه خورده صبر میکردی', N'ولی اونطوری سرورمون آب نمیشد', -1, 1, 1, 1, 1, 10, 5, 20, 10, 1, N'noreply@flapp.ir', N'123123123', N'support@flapp.ir', N'123123', N'31.25.89.211', 10)
SET IDENTITY_INSERT [dbo].[ApplicationState] OFF
SET IDENTITY_INSERT [dbo].[AppTheme] ON 

INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate]) VALUES (1, N'آبی', N'آبی', N'آبی', N'#0d27e9', N'#102095', 5, N'Data/Images/Background/background6.jpg', N'Data/Images/Background/background6.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EF00000000 AS DateTime))
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate]) VALUES (2, N'سبز', N'سبز', N'سبز', N'#1ec2bc', N'#157e7a', 5, N'Data/Images/Background/background7.jpg', N'Data/Images/Background/background7.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate]) VALUES (4, N'بنفش', N'بنفش', N'بنفش', N'#cb13d7', N'#8f0d97', 5, N'Data/Images/Background/background8.jpg', N'Data/Images/Background/background8.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate]) VALUES (5, N'قرمز', N'قرمز', N'قرمز', N'#d30838', N'#9f062a', 5, N'Data/Images/Background/background9.jpg', N'Data/Images/Background/background9.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate]) VALUES (6, N'زرد', N'زرد', N'زرد', N'#c6bf09', N'#c6bf09', 5, N'Data/Images/Background/background18.jpg', N'Data/Images/Background/background13.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate]) VALUES (9, N'زرد', N'زرد', N'زرد', N'#c6bf09', N'#c6bf09', 5, N'Data/Images/Background/background16.jpg', N'Data/Images/Background/background11.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[AppTheme] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (1, N'سوالات مردم', N'سوالات مردم', N'سوالات مردم', N'#cb13d7', N'#8f0d97', N'#9410a6', 10, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (2, N'ورزشی', N'ورزشی', N'ورزشی', N'#1ec2bc', N'#157e7a', N'#158b87', 10, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6F000000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (5, N'خانوادگی', N'خانوادگی', N'خانوادگی', N'#0d27e9', N'#102095', N'#091ba1', 10, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6F000000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (6, N'سیاسی', N'سیاسی', N'سیاسی', N'#0d27e9', N'#0048bb', N'#0027e9', 10, CAST(0x0000A70B00000000 AS DateTime), CAST(0x0000A81200000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (7, N'بزرگسال', N'بزرگسال', N'بزرگسال', N'#0d27e9', N'#d30838', N'#0027e9', 50, CAST(0x0000A70B00000000 AS DateTime), CAST(0x0000A6F700000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (8, N'اجتماعی اقتصادی', N'اجتماعی اقتصادی', N'اجتماعی اقتصادی', N'#0d27e9', N'#c6bf09', N'#0027e9', 10, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (10, N'خنده دار', N'خنده دار', N'خنده دار', N'#0d27e9', N'#c6b309', N'#0035ee', 10, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (11, N'چالشی', N'چالشی', N'چالشی', N'#0d27e9', N'#0d27e9', N'#0d27e9', 20, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime), 2)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (12, N'سینما', N'سینما', N'سینما', N'#0d3659', N'#0d27e9', N'#0364ee', 5, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime), 2)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (13, N'چرند و پرند', N'چرند و پرند', N'چرند و پرند', N'#0e45ee', N'#03587e', N'#03ee12', 20, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime), 3)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (14, N'شوخمی تخیلی', N'شوخمی تخیلی', N'شوخمی تخیلی', N'#33eeff', N'#03548e', N'#10ee32', 20, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[CodeGift] ON 

INSERT [dbo].[CodeGift] ([ID], [CompanyName], [Serial], [Prize], [TotalUserCount], [TotalUserRegistered], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate]) VALUES (1, N'Google', N'23345', 10, 100, 0, CAST(0x0000A73400000000 AS DateTime), CAST(0x0000A73700000000 AS DateTime), CAST(0x0000A73400000000 AS DateTime), CAST(0x0000A73400000000 AS DateTime))
INSERT [dbo].[CodeGift] ([ID], [CompanyName], [Serial], [Prize], [TotalUserCount], [TotalUserRegistered], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate]) VALUES (2, N'Yahoo', N'56548', 5, 100, 0, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73900000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73400000000 AS DateTime))
INSERT [dbo].[CodeGift] ([ID], [CompanyName], [Serial], [Prize], [TotalUserCount], [TotalUserRegistered], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate]) VALUES (4, N'bms', N'123456789', 500, 1, 0, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A83B00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[CodeGift] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2149, 1155, 24, N'تست', NULL, 1, CAST(0x0000A73901762F5F AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2150, 1158, 25, N'very nice nice ', NULL, 1, CAST(0x0000A73A000ACB08 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2151, 1156, 111, N'باحال بود', NULL, 1, CAST(0x0000A73A001C7432 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2152, 1160, 91, N'ت', NULL, 1, CAST(0x0000A73B017486BF AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2153, 1165, 34, N'تست', NULL, 1, CAST(0x0000A73D00DAEC37 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2154, 1165, 34, N'تست', NULL, 1, CAST(0x0000A73D00DAF50F AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2155, 1156, 12, N'سلام، سوال باحالی بود', NULL, 1, CAST(0x0000A73D016EEB7B AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2156, 1165, 118, N'تست', NULL, 1, CAST(0x0000A73E00BA989D AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2157, 1168, 33, N'fgh', NULL, 1, CAST(0x0000A74500E62A69 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2158, 1168, 33, N'jsjs', NULL, 1, CAST(0x0000A74500FA006F AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2159, 1168, 33, N'fthfth', NULL, 1, CAST(0x0000A74500FB1D54 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2160, 1168, 33, N'htht', NULL, 1, CAST(0x0000A74500FB3288 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2161, 1168, 33, N'yyyyy', NULL, 1, CAST(0x0000A745010784CA AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2162, 1168, 33, N'gjfyuygyjghjgyjjghj', NULL, 1, CAST(0x0000A745010E81A0 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2163, 1168, 33, N'ghgfhgfj', NULL, 1, CAST(0x0000A745010E98EA AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2164, 1168, 33, N'dfgdfgdfg', NULL, 1, CAST(0x0000A745010E9B88 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2165, 1168, 33, N'kkkkkkkkkkkkkk', NULL, 1, CAST(0x0000A745010F0929 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2166, 1168, 33, N'ttttttt', NULL, 1, CAST(0x0000A745010F1E04 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2167, 1168, 33, N'fhdfhdfhdfh', NULL, 1, CAST(0x0000A745010F2175 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2168, 1168, 33, N'1111111111111', NULL, 1, CAST(0x0000A745010F2468 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2169, 1168, 33, N'2222222222222', NULL, 1, CAST(0x0000A745010F2751 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2170, 1168, 33, N'333333333333', NULL, 1, CAST(0x0000A745010F2A3A AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2171, 1168, 33, N'444444444444', NULL, 1, CAST(0x0000A745010F2C76 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2172, 1168, 33, N'55555555555', NULL, 1, CAST(0x0000A745010F2FE3 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2173, 1168, 33, N'6666666666', NULL, 1, CAST(0x0000A745010F32E3 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2174, 1168, 33, N'77777777777', NULL, 1, CAST(0x0000A745010F8F36 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2175, 1168, 33, N'8888888888', NULL, 1, CAST(0x0000A745010FB140 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2176, 1167, 77, N'ددت', NULL, 1, CAST(0x0000A745011C733B AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2177, 1167, 77, N'اا', NULL, 1, CAST(0x0000A746000A7F33 AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[CreatedQuestionsVerifyType] ON 

INSERT [dbo].[CreatedQuestionsVerifyType] ([ID], [VerifyName], [Description]) VALUES (1, N'?? ???', NULL)
INSERT [dbo].[CreatedQuestionsVerifyType] ([ID], [VerifyName], [Description]) VALUES (2, N'?? ??? ?????', NULL)
INSERT [dbo].[CreatedQuestionsVerifyType] ([ID], [VerifyName], [Description]) VALUES (3, N'????? ???', NULL)
SET IDENTITY_INSERT [dbo].[CreatedQuestionsVerifyType] OFF
SET IDENTITY_INSERT [dbo].[Favorite] ON 

INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2152, 1155, 24, CAST(0x0000A73901768B91 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2153, 1158, 25, CAST(0x0000A73A000AD3BB AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2154, 1156, 24, CAST(0x0000A73A001C4C5E AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2155, 1156, 111, CAST(0x0000A73A001C7B93 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2156, 1165, 34, CAST(0x0000A73D00DAB507 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2157, 1156, 12, CAST(0x0000A73D016EFAA9 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2158, 1156, 47, CAST(0x0000A73D01854845 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2159, 1167, 77, CAST(0x0000A745011C7E58 AS DateTime))
SET IDENTITY_INSERT [dbo].[Favorite] OFF
SET IDENTITY_INSERT [dbo].[Gift] ON 

INSERT [dbo].[Gift] ([ID], [Image], [Name], [Description], [GiftTypeID], [Prize], [Day], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate]) VALUES (3, N'Data/Images/2.png', N'دهه قهر', N'دهه قهره،قهر کنید', 3, 5, 1, CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime))
INSERT [dbo].[Gift] ([ID], [Image], [Name], [Description], [GiftTypeID], [Prize], [Day], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate]) VALUES (4, N'Data/Images/4.png', N'دهه بی پولی', N'پول نداریم ', 4, 0, NULL, CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime))
INSERT [dbo].[Gift] ([ID], [Image], [Name], [Description], [GiftTypeID], [Prize], [Day], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate]) VALUES (6, N'Data/Images/6.png', N'دهه بی کاری', N'کار نداریم دیگه', 3, 10, 2, CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime))
INSERT [dbo].[Gift] ([ID], [Image], [Name], [Description], [GiftTypeID], [Prize], [Day], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate]) VALUES (7, N'Data/Images/7.png', N'دهه اختلاس', N'بیا حقوق های نجومی', 4, 0, NULL, CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime))
INSERT [dbo].[Gift] ([ID], [Image], [Name], [Description], [GiftTypeID], [Prize], [Day], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate]) VALUES (9, N'Data/Images/norooz.jpg', N'دهه فجر', N'دهه فجر مبارک', 2, 10, NULL, CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Gift] OFF
SET IDENTITY_INSERT [dbo].[GiftType] ON 

INSERT [dbo].[GiftType] ([ID], [Name], [Priority]) VALUES (2, N'DateTime', 1)
INSERT [dbo].[GiftType] ([ID], [Name], [Priority]) VALUES (3, N'Daily', 2)
INSERT [dbo].[GiftType] ([ID], [Name], [Priority]) VALUES (4, N'Message', 3)
SET IDENTITY_INSERT [dbo].[GiftType] OFF
SET IDENTITY_INSERT [dbo].[Level] ON 

INSERT [dbo].[Level] ([ID], [LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (1, 1, 100, 20, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[Level] ([ID], [LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (2, 2, 120, 30, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[Level] ([ID], [LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (3, 3, 140, 40, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Level] ([ID], [LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (4, 4, 150, 50, CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Level] ([ID], [LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (5, 5, 160, 60, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A70D00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Level] OFF
SET IDENTITY_INSERT [dbo].[Manufacture] ON 

INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (119, 1153, 1, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (120, 1153, 2, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (121, 1153, 3, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (122, 1153, 4, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (123, 1153, 5, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (124, 1153, 6, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (125, 1154, 7, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (126, 1153, 8, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (127, 1153, 9, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (128, 1153, 10, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (129, 1153, 11, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (130, 1153, 12, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (132, 1153, 15, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (133, 1153, 16, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (134, 1153, 17, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (135, 1153, 18, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (136, 1153, 19, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (137, 1153, 20, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (138, 1153, 21, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (139, 1153, 22, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (140, 1153, 23, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (141, 1153, 24, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (142, 1153, 25, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (143, 1153, 26, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (144, 1153, 27, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (145, 1154, 28, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (146, 1153, 29, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (148, 1153, 30, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (149, 1153, 31, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (150, 1153, 32, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (151, 1153, 33, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (152, 1153, 34, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (153, 1153, 35, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (154, 1153, 36, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (155, 1153, 37, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (156, 1153, 38, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (157, 1153, 39, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (158, 1153, 40, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (159, 1153, 41, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (160, 1153, 42, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (161, 1154, 43, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (162, 1155, 44, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (163, 1156, 45, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (164, 1157, 46, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (169, 1153, 47, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (170, 1153, 48, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (171, 1153, 49, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (172, 1153, 50, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (173, 1153, 51, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (174, 1153, 52, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (175, 1153, 53, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (176, 1153, 54, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (177, 1153, 55, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (178, 1153, 56, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (179, 1154, 57, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (180, 1153, 58, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (181, 1153, 59, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (182, 1153, 60, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (183, 1153, 61, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (184, 1153, 62, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (185, 1153, 63, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (186, 1153, 64, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (187, 1153, 65, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (188, 1153, 66, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (189, 1153, 67, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (190, 1153, 68, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (191, 1153, 69, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (192, 1153, 70, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (193, 1153, 71, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (194, 1153, 72, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (195, 1153, 73, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (196, 1154, 74, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (197, 1155, 75, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (198, 1153, 76, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (199, 1153, 77, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (200, 1153, 78, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (201, 1153, 79, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (202, 1153, 80, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (203, 1153, 81, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (204, 1153, 82, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (205, 1153, 83, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (206, 1153, 84, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (207, 1153, 85, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (208, 1153, 86, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (209, 1153, 87, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (210, 1153, 88, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (211, 1153, 89, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (212, 1153, 90, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (213, 1153, 91, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (214, 1154, 92, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (215, 1155, 93, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (216, 1156, 94, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (217, 1153, 95, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (218, 1153, 96, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (219, 1154, 97, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (220, 1153, 98, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (221, 1153, 99, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (222, 1153, 100, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (223, 1153, 101, CAST(0x0000A73900000000 AS DateTime))
GO
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (224, 1153, 102, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (225, 1153, 103, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (226, 1153, 104, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (227, 1154, 105, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (228, 1153, 106, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (229, 1153, 107, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (230, 1153, 108, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (231, 1153, 109, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (232, 1153, 110, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (233, 1153, 111, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (234, 1153, 112, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (235, 1153, 113, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (236, 1153, 114, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (237, 1153, 115, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (238, 1153, 116, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (239, 1153, 117, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (240, 1153, 118, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (241, 1153, 119, CAST(0x0000A73900000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Manufacture] OFF
SET IDENTITY_INSERT [dbo].[PurchaseAvatar] ON 

INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1013, 5, 1158, CAST(0x0000A73A000A60A1 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1014, 4, 1158, CAST(0x0000A73A000A656D AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1015, 3, 1158, CAST(0x0000A73A000A6767 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1016, 2, 1158, CAST(0x0000A73A000A695D AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1017, 2, 1165, CAST(0x0000A73D00D5E3BC AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1018, 5, 1165, CAST(0x0000A73D00D5F766 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1019, 2, 1168, CAST(0x0000A74500E614F3 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1020, 2, 1167, CAST(0x0000A745011C4B4C AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1021, 3, 1167, CAST(0x0000A745011C5D47 AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseAvatar] OFF
SET IDENTITY_INSERT [dbo].[PurchaseCategory] ON 

INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1058, 1155, 5, CAST(0x0000A73900F4E9B1 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1059, 1155, 6, CAST(0x0000A73900F6A7A1 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1060, 1156, 5, CAST(0x0000A73901393E60 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1061, 1158, 7, CAST(0x0000A73A000DA0B8 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1062, 1156, 6, CAST(0x0000A73A001C2F41 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1063, 1155, 7, CAST(0x0000A73A00A2033C AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1064, 1155, 2, CAST(0x0000A73A00D1F4B9 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1065, 1160, 5, CAST(0x0000A73A00D266EC AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1066, 1160, 14, CAST(0x0000A73A00D9BE16 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1067, 1160, 13, CAST(0x0000A73A00D9BFA0 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1068, 1160, 12, CAST(0x0000A73A00D9C1E5 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1069, 1160, 11, CAST(0x0000A73A00D9C4DC AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1070, 1160, 10, CAST(0x0000A73A00D9C747 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1071, 1160, 8, CAST(0x0000A73A00D9C9C9 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1072, 1160, 7, CAST(0x0000A73A00D9CBEE AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1073, 1160, 6, CAST(0x0000A73A00D9CDAB AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1074, 1160, 2, CAST(0x0000A73A00D9D90A AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1075, 1162, 6, CAST(0x0000A73A015647F4 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1076, 1162, 11, CAST(0x0000A73A0156E83A AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1077, 1162, 10, CAST(0x0000A73A01580235 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1078, 1165, 10, CAST(0x0000A73D00D690A9 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1079, 1156, 11, CAST(0x0000A73D016E8168 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1080, 1167, 7, CAST(0x0000A73E0184EB75 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1081, 1167, 11, CAST(0x0000A73E0186AC08 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1082, 1167, 6, CAST(0x0000A73F0139C746 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1083, 1167, 14, CAST(0x0000A74500B9A870 AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseCategory] OFF
SET IDENTITY_INSERT [dbo].[PurchaseTheme] ON 

INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1077, 1155, 2, CAST(0x0000A73900F53BF6 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1078, 1155, 4, CAST(0x0000A73901761DBD AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1079, 1158, 5, CAST(0x0000A73A000D9156 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1080, 1158, 6, CAST(0x0000A73A000DC735 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1081, 1160, 2, CAST(0x0000A73A00DB1B11 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1082, 1162, 2, CAST(0x0000A73A015640A5 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1083, 1160, 4, CAST(0x0000A73B01732174 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1084, 1165, 2, CAST(0x0000A73C0139B441 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1085, 1165, 4, CAST(0x0000A73C013A459A AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1086, 1165, 5, CAST(0x0000A73D00D71179 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1087, 1165, 6, CAST(0x0000A73D00D79EFF AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1088, 1165, 9, CAST(0x0000A73D00D9335E AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1089, 1156, 2, CAST(0x0000A73D016EB3F2 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1090, 1167, 2, CAST(0x0000A73E00EC40DB AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1091, 1167, 4, CAST(0x0000A741016A29FA AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1092, 1168, 2, CAST(0x0000A74500E61C7E AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1093, 1167, 5, CAST(0x0000A745011BEFE3 AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseTheme] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (1, N'هر روز یه پیتزا بهت میدادن', N'باید بدون سس میخوردی', 1, 59, 15, 0, 1, 75, CAST(0x0000A6EE00AD2C08 AS DateTime), CAST(0x0000A6EE00AD2C08 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (2, N'از هر مغازه ای که میخواستی، رایگان لباس میخریدی', N'مجبور بودی مثل سوپر من، شرتت رو رو شلوار میپوشیدی', 10, 37, 4, 2, 0, 20, CAST(0x0000A80800AD2C08 AS DateTime), CAST(0x0000A80800AD2C08 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (3, N'هیچوقت گرسنه ات نمیشد', N'رنگت مثل درختا سبز بود و باید روزی 1 ساعت پاهات رو تو زمین فرو میکردی', 11, 37, 8, 0, 1, 30, CAST(0x0000A6F700000000 AS DateTime), CAST(0x0000A6F700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (4, N'کنکور رو کلا حذف میکردن', N'دانشگاه ها تفکیک جنسیتی میشدن', 11, 38, 4, 2, 0, 40, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (5, N'وقتی شیر آب رو باز میکردی ازش پول میومد', N'برای بدست اوردن آب باید روزی هشت ساعت کار میکردی', 11, 39, 3, 1, 0, 50, CAST(0x0000A81C00000000 AS DateTime), CAST(0x0000A81C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (6, N'یه خونه رایگان بهت میدادن', N'10 سال از عمرت کم میشد', 11, 42, 4, 1, 0, 60, CAST(0x0000A7FF00000000 AS DateTime), CAST(0x0000A7FF00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (7, N'به جای اینکه یارانه بدن، همه ماهی 10 هزار تومن هم میدادن', N'دیگه کسی اختلاس و دزدی نمیکرد', 8, 36, 7, 1, 0, 70, CAST(0x0000A80800000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (8, N'پولداری میشدی', N'باید با کسی که کنارت نشسته ازدواج میکردی', 13, 42, 5, 1, 0, 80, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (9, N'یارانت دوبرابر میشد ', N'باید به غرضی رای میدادی', 6, 47, 10, 0, 0, 90, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (10, N'حقوقت سه میلیون بود ', N'نصفش رو باید پول ایزی لایف میدادی', 10, 41, 3, 2, 0, 91, CAST(0x0000A80800000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (11, N'یه شغل با آبرو داشتی', N'یه زن بی آبرو گیرت میومد', 13, 41, 4, 1, 0, 92, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (12, N'رتبه یک کنکور میشدی', N'باید بعدش رفتگر می شدی', 11, 51, 6, 2, 1, 93, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (15, N'سال نو آیفون هدیه بگیری', N'ولی تا آخر سال اجازه نداشتی روش برنامه بریزی', 11, 12, 1, 0, 0, 40, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A81C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (16, N'روحانی رئیس جمهور بشه', N'دیگه قید انرژی هسته ای رو بزنیم', 7, 13, 3, 0, 0, 2, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (17, N'هر کتابی رو که میخواستی به مغزت تزریق میکردی', N'کور میشدی', 11, 20, 14, 12, 10, 50, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (18, N'اندازه بیل گیتس پول داشتی', N'یه دست و یه پا نداشتی', 8, 23, 32, 10, 10, 60, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (19, N'زورت ده برابر میشد', N'عقلت نصف میشد', 13, 22, 15, 12, 3, 55, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (20, N'هر چه قدر میخواستی میخوردی و چاق نمیشدی', N'روزی 10 بار باید دستشویی میرفتی', 13, 29, 14, 10, 10, 70, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (21, N'میتونستی ذهن بقیه رو بخونی', N'بقیه هم میتونستن ذهنت رو بخونن', 11, 20, 27, 3, 5, 39, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (22, N'میتونستی زیر آب هم نفس بکشی', N'برای اینکه زنده بمونی باید همیشه بدنت رو خیس نگه میداشتی', 11, 40, 13, 7, 6, 60, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (23, N'پدر و مادرت رو خودت انتخاب میکردی', N'40 سال بشتر عمر نمیکردی', 11, 20, 20, 18, 17, 45, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (24, N'یارانه هر نفر 500 هزار تومن میشد', N'ترامپ رئیس جمهور ایران میشد', 6, 24, 16, 10, 10, 65, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (25, N'تو 30 سالگی یک میلیارد برنده میشدی', N'باید خرج ساخت سرویس بهداشتی میکردی', 1, 9, 11, 0, 0, 20, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (26, N'تا ابد زنده بودی', N'دیگه هیچکس باهات حرف نمیزد', 11, 22, 3, 0, 0, 80, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (27, N'میتونستی تو رویاهات زندگی کنی', N'دیگه هیچوقت نمیتونستی ازشون خارج بشی', 11, 14, 3, 1, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (28, N'دیگه سرما نمیخوردی', N'همیشه  کفشات لنگه به لنگه بودن', 13, 14, 2, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (29, N'هیچوقت چاق نمیشدی', N'هیچوقت هم گشنت نمیشد', 11, 16, 1, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (30, N'برای 25 سال ماهی 100 میلیون درآمد داشتی', N'برای 5 سال نمیتونستی لباسات را حتی برای قضای حاجت در بیاری', 10, 6, 3, 0, 0, 60, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (31, N'تو زندگی به هر چی که میخواستی  میرسیدی', N'دیگه هیچوقت نمیرسیدی خانواده و دوستات رو بینی', 11, 60, 9, 4, 0, 99, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (32, N'به جای بتمن بودی', N'بهترین دوستت جای جوکر بود', 14, 12, 1, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (33, N'میتونستی ذهن مردم رو بخونی', N'اونها هم میتونستن ذهنت رو بخونن', 1, 49, 16, 1, 0, 99, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (34, N'هفته ای یه بار قضای حاجت میکردی', N'ولی یه یارش به اندازه 10 بار پر سر و صدا تر بود', 10, 39, 11, 0, 0, 99, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (35, N'هر کی رو میخواستی عاشقت میشد', N'هر کی هم میخواستت عاشقش میشدی', 11, 14, 2, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (36, N'چند برابر خوشگل تر میشدی', N'ولی آخر هفته ها جنسیتت عوض میشد', 13, 14, 1, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (37, N'یه همزاد داشتی که هر چی میگفتی رو انجام میداد', N'عاشق اونی میشد که میخوای باهاش عروسی کنی', 1, 13, 4, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (38, N'جای رستم بودی', N'دوستت جای اسفندیار بود', 14, 24, 5, 1, 0, 80, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (39, N'هر چی میگفتی هیج عواقب بدی برات نداشت', N'ولی لهجه خیلی آبرو ریز داشتی', 13, 11, 2, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (40, N'هیچوقت تو زندگیت شکست نمیخوردی', N'هیچوقت هم عاشق نمیشدی', 11, 12, 2, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (41, N'صدای باد معده نصف میشد', N'پخش بوش 2 برابر بود', 10, 21, 4, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (42, N'دستگاه پرینتی داشتی که پول واقعی چاپ میکرد', N'تا آخر عمر باید دامن میپوشیدی و دیگه نمیتونستی زیرش شورت بپوشی', 13, 21, 3, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (43, N'میتونستی 5 نفر رو به همراه خودت میلیاردر کنی', N'همزمان به دلیل کار تو 5 نفر هم به زمین گرم میخوردن', 11, 19, 6, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (44, N'قالی پرنده داشتی', N'هیچوقت نمیتونستی ازش پیاده شی', 11, 19, 5, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (45, N'کت جادویی داشتی و هر موقع اراده میکردی یک میلیون از جیبش بر میداشتی', N'هر موقع که یک میلیونش رو خرج میکردی یک نفر توی اون گوشه دنیا میمرد', 11, 10, 3, 0, 0, 70, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (46, N'خوشگل ترین آدم دنیا بودی', N'نمیتونستی با کسی همبستر بشی', 10, 31, 8, 2, 0, 90, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (47, N'خونت همیشه تمیز بود و همه کارا خونه خود به خود انجام میشد', N'همیشه باید با کفشهای کثیف اینور و اونور میرفتی', 11, 26, 8, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (48, N'شخصیتهای کارتونی واقعی بودن', N'آدما تخیلی بودن', 14, 26, 7, 0, 1, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (49, N'هر عکسی که تو ایستاگرام پست میکردی 1 میلیون لایک میخورد', N' تو همشون چشات چپ بود و انگشتت تو دماقت بود', 10, 34, 7, 0, 0, 90, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (50, N'همیشه هیکلت رو فرم بود', N'به جای روزی 1 ساعت ورزش، روزی 60 نفر رو ماچ میکردی', 10, 49, 6, 4, 0, 100, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (51, N'10 تا سکه میگرفتی', N'هر چی که توی چی میشد... جواب دادی واقعا اتفاق میاق میفتاد', 1, 26, 8, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (52, N'سی تا سکه بهت میدادیم تا اینکه بتونی یک بسته رو بخری', N'باید پاسخ مثبت بدی و ما به فروشگاه وصلت کنیم', 1, 6, 5, 0, 0, 60, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (53, N'سه تا زبان جدید را مثل آب خوردن یاد میگرفتی', N'زبان مادریت رو کلا فراموش میکردی', 1, 28, 6, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (54, N'جذابیت چند برابر میشد', N'عقلت نصف میشد', 13, 24, 6, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (55, N'احتیاج به خواب نداشتی', N'20 سال زودتر میمردی', 1, 28, 5, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (56, N'ساعت جادویی داشتی و میتونستی زمان رو متوقف کنی', N'هر موقع زمان رو متوقف میکردی یک نفر سکته میزد', 1, 24, 7, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (57, N'هر موقع خوشحال بودی هوا آفتابی میشد', N'هر موقع هم که ناراحت بودی هوا بارونی میشد', 1, 24, 7, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (58, N'دیگه هیچ جنگی روی زمین نبود', N'اینترنت هم  وجود نداشت', 1, 31, 12, 2, 0, 90, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (59, N'هر کسی رو که اراده میکردی بهترین دوستت میشد', N'فقط و فقط یک روز میتونستید با هم باشید', 1, 8, 5, 0, 0, 70, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (60, N'کچل میشدی', N'روزی 100 هزار تومن بهت میدادن', 13, 7, 3, 0, 0, 70, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (61, N'همه مردم سیاه بودن', N'تو سفید بودی', 11, 20, 5, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (62, N'اراده کنی و بری به 50 سال دیگه', N'20 سال از عمرت کم میشد', 11, 7, 3, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (63, N'میتونستی یه هفته تمام با یکی از معروف ترین بازیگرا باشی', N'هر جا که با هم میرفتید خبرنگرا ولتون نمیکردن', 11, 9, 3, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (64, N'قدرتمند ترین آدم دنیا میشدی', N'برای اینکه مقامت رو از دست ندی روزی 1000 نفر رو میکشتی', 11, 28, 10, 0, 0, 99, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (65, N'میتونستی همسرت رو هر جوری که دوست داشتی  چه ظاهری چه باطنی تغییرش بدی', N'اونم میتونست هر جوری که دوست داشت تغییرت بده', 11, 11, 2, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (66, N'هر جایی که میرفتی بهترین دما و آب و هوا رو داشت', N'ولی توی رخت خوابت غندیل میبستی', 11, 8, 2, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (67, N'از این به بعد به همه غذاها، فیلمها، کتابهاو بازیها دسترسی رایگان داشتی', N'به مدت 10 سال نمیتونستی از خونت بیرون بری', 11, 11, 3, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (68, N'میتونستی یکی از شخصیتهای دنیای غیر واقعی بشی', N'بعدش دیگه نمیتونستی به حالت قبلیت برگردی', 14, 10, 3, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (69, N'ببینی توی یکسال آینده چی قراره اتفاق بیفته', N'بعدش به ازای هر سال که میگذره خاطرات اون سال و سال قبلش رو فراموش کنی', 1, 5, 6, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (70, N'هر لباسی رو از هر فروشگاهی که میخواستی میتونستی بخری', N'همیشه کفشات و جورابات لنگه به لنگه بودن', 13, 6, 2, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (71, N'همه مردم سفید بودن', N'تو سیاه بودی', 1, 6, 5, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (72, N'هر ماشینی رو که دوست داشتی میتونستی بخری', N'هفته ای یکبار باید باهاش جنازه جا به جا میکردی', 1, 11, 5, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (73, N'میتونستی پادشاه یا ملکه انگلیس بشی', N'با یک آدم بد ذات باید عروسی میکردی', 1, 5, 6, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (74, N'راننده شخصی داشتی که هر موقع که میخواستی هر جایی که میگفتی میبردت', N'با ژیان میرسوندت', 1, 22, 9, 0, 0, 90, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (75, N'برای 100 سال خودت و هر کی رو که دوست داشتی بیشتر عمر میکردن و جوون میموندن', N'شورت و جوراب رو دیگه نمیشد در بیارن', 1, 12, 6, 0, 0, 80, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (76, N'میدونستی کی و چجوری میمیری', N'نمیتونستی هیچ کاری برای جلوگیری ازش بکنی', 1, 21, 6, 1, 0, 90, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (77, N'دوستات هم میتونستن به سوالای با حال  برنامه جواب بدن و خودت و اونا سکه رایگان میگرفتید', N'...0', 1, 8, 1, 0, 0, 70, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (78, N'حقوقت 4 برابر میشد', N'قدت نصف میشد', 8, 15, 7, 1, 0, 90, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (79, N'روزی 100 هزار تومن بهت میدادن', N'سالی 1 سانت قدت کوتاه تر میشد', 8, 12, 3, 0, 0, 80, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (80, N'میتونستی پادشاه یا ملکه هر کشوری که میخواستی بشی', N'دیگه نمیتونستی زندگی شادی داشته باشی', 11, 11, 3, 0, 0, 80, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (81, N'25سال کمتر عمر میکردی', N'همیشه سالم و سلامت بودی', 11, 10, 3, 0, 0, 80, CAST(0x0000A71D00000000 AS DateTime), CAST(0x0000A71D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (82, N'فضاییها واقعی بودن و به زمین میومدن', N'با آدما میتونستن عروسی کنن و بچه هاشون آدم فضایی میشدن', 14, 6, 3, 0, 0, 70, CAST(0x0000A71D00000000 AS DateTime), CAST(0x0000A71D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (83, N'از زمان مردنت مطلع میشدی', N'اگه به کسی در موردش میگفتی همون موقع سوسک میشدی', 13, 13, 2, 0, 0, 80, CAST(0x0000A71D00000000 AS DateTime), CAST(0x0000A71D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (84, N'توی بهشت بودی و هر کاری دلت میخواست میتونستی بکنی', N'نباید به درخت سیب دست میزدی و ازش میخوردی', 11, 8, 2, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (85, N'یه درخت داشتی که به جای میوه پول میداد', N'هر موقع پولش رو میچیندی به اندازه مبلغی که بر میداشتی به همون تعداد درختای دیگه خشک میشدن', 14, 5, 3, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (86, N'یه مرغ داشتی که تخم طلا میداد', N'همه دنبال این بودن که ازت بدزدنش', 11, 5, 2, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (87, N'همیشه زندگیت رو به راه بود', N'هر روزبه 10 نفر کمک میکردی', 8, 14, 2, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (88, N'تمام سختیها و بدبختیهای زندگیت تموم میشد', N'باید به بهترین دوستت میدادیشون', 11, 5, 5, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (89, N'میتونستی به گذشته برگردی ', N'نمیتونستی با اونایی که میشناختی حرف بزنی', 11, 6, 3, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (90, N'موفقیت بچه هات تضمین میشد', N'باید حتما 3 تا بچه داشتی و اسمشون رو سوای اینکه پسرن یا دختر میذاشتی اتل و متل و توتوله', 13, 11, 3, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (91, N'همه از زندگیشون لذت میبردن و هیچکس فقیر نبود', N'برای اینکه اوضاع همه خوب باشه تو باید سختی میکشیدی', 11, 11, 3, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (92, N'هر روز خوشمزه ترین غذاها رو میخوردی', N'یه روز در میون اسهال بودی', 10, 10, 4, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (93, N'دیگه هیچوقت اسهال نمیشدی', N'ولی بجاش یبوست میگرفتی', 13, 7, 5, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (94, N'همه غذاهات توسط آقای گلریز سرو میشد', N'همیشه باید با دست غذا میخوردی', 13, 7, 3, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (95, N'هر موقع که اراده میکردی میتونستی جنسیت رو عوض کنی', N'هر بار که اینکار رو میکردی یکم زشتتر میشدی', 13, 5, 5, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (96, N'همیشه خدا خوشحال بودی', N'عقلت معیوب بود', 11, 6, 6, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (97, N'یه ویلای لوکس بغل ساحل داشتی', N'به محض اینکه ازش خارج میشدی خرابش میکردن', 11, 6, 6, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (98, N'میتونستی مثل هر کسی که دوست داشتی بشی', N'خانوادت و دوستات دیگه نمیشناختنت', 11, 8, 4, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (99, N'ستاره یه فیلم میشدی', N'فیلمش مستهجن بود', 7, 8, 7, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (100, N'قدت 10سانت بلندتر میشد', N'دستات 5 سانت کوتاه میشدن', 11, 7, 5, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (101, N'ثروتنمندترین آدم دنیا میشدی', N'هر کسی رو که میشناختی میمرد', 11, 3, 3, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
GO
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (102, N'با شعبده بازی گربه ظاهر کنی', N'7 روز بعد گربهایی که ظاهر میکردی میمردن', 11, 0, 1, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (103, N'هر روز 2 ساعت زودتر به محل کارت یا مدرسه و دانشگاه میرفتی', N'یه روز بیشتر تو هفته تعطیلی داشتی', 11, 0, 1, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (104, N'میتونستی هر اندازه که دلت بخواد بدون اینکه اثری رو سلامتیت بذاره بستنی بخوری', N'مجبور بودی تا آخر عمرت تو پارکها بستنی بفروشی', 11, 1, 0, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (105, N'آلت تناسلی نداشتی', N'100 تا همسر داشتی', 7, 0, 3, 0, 0, 90, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (106, N'خونه رویاهات رو داشتی و هر چی که آرزو داتشی درونش بود', N'دیگه نمیتونستی ازش خارج بشی', 11, 0, 1, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (107, N'5 تا سکه رایگان میگرفتی', N'یک ویدئو چند ثانیه ای درباره ی یک چیز باحال میدیدی', 11, 1, 0, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (108, N'هر کلیپی که روی یوتیوب میذاشتی جز پر بازدیدترینها میشسد', N'تو همشون 10 دقیقه گریه و زاری میکردی', 11, 0, 1, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (109, N'میتونستی انتخاب کنی به سیاره زنان ونوسی یا مردان مریخی بری', N'دیگه بعدش نمیتونستی اون سیاره رو ترک کنی', 11, 0, 1, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (110, N'میتونستی با نوک انگشتت لوازم الکترونیکی رو خاموش و روشن کنی', N'یک بار در ماه برای 24 ساعت باسنت رو بزنی به شارژ ', 10, 0, 1, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (111, N'دکترای فیزیک هسته ای داشتی', N'شغلت تو سازمان انرژی اتمی ساخت آبمیوه گیر بود', 6, 2, 24, 11, 1, 100, CAST(0x0000A72F00000000 AS DateTime), CAST(0x0000A72F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (112, N'شبا خوشگل بودی', N'روزا باهوش بودی', 7, 2, 1, 0, 0, 80, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (113, N'سالی 2 بار سرما میخوردی', N'موقعی که میخوردی بد میخوردی', 11, 1, 0, 0, 0, 70, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (114, N'مجبور بودی برای 10 سال تو بیابون زندگی کنی', N'وقتی که برمیگشتی 10 میلیارد بهت میدادن', 1, 2, 2, 0, 0, 80, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (115, N'یک میلیارد بهت میدادن', N'برای اینکه ازت نگیرن باید روزی 100 بار ازشون تشکر میکردی', 13, 0, 1, 0, 0, 70, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (116, N'میتونستی دو برابر سریعتر بخونی', N'مجبور بودی دوبرابر هم تند تر حرف بزنی', 1, 1, 2, 0, 0, 70, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (117, N'میتونستی یه کار خیلی خلاف انجام بدی', N'هیچکس هم متوجه نمیشد', 1, 0, 4, 0, 0, 80, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (118, N'دیگه لازم نبود هر شب بخوابی', N'مثل خرسها سالی یه بار به خواب زمستونی میرفتی', 1, 1, 2, 1, 0, 70, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (119, N'مذهبی که داری تو دنیا همه گیر میشد', N'برای اینکه همه گیر بشه باید تا آخر عمرت ملا میشدی', 1, 0, 2, 0, 0, 70, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[QuestionBoost] ON 

INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (1, N'عادی', N'عادی', 0, N'mine', N'#fffff', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (3, N'متوسط', N'متوسط', 60, N'data/images/8.png', N'#ffee32', CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A72300000000 AS DateTime))
INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (4, N'حرفه ای', N'حرفه ای', 70, N'Data/images/9.png', N'#ff3e55', CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A72300000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[QuestionBoost] OFF
SET IDENTITY_INSERT [dbo].[ReportedQuestions] ON 

INSERT [dbo].[ReportedQuestions] ([ID], [UserID], [QuestionID], [ReportTypeID], [CreatedDate]) VALUES (16, 1164, 33, 2, CAST(0x0000A73C00A8CAFF AS DateTime))
SET IDENTITY_INSERT [dbo].[ReportedQuestions] OFF
SET IDENTITY_INSERT [dbo].[ReportType] ON 

INSERT [dbo].[ReportType] ([ID], [Name], [Description]) VALUES (1, N'خلاف شرع', N'بد بد بد')
INSERT [dbo].[ReportType] ([ID], [Name], [Description]) VALUES (2, N'تکراری', N'تکراری')
INSERT [dbo].[ReportType] ([ID], [Name], [Description]) VALUES (3, N'حال به هم زن', N'چرت و پرت گویی')
SET IDENTITY_INSERT [dbo].[ReportType] OFF
SET IDENTITY_INSERT [dbo].[SelectedAvatar] ON 

INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1100, 1153, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1101, 1154, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1102, 1155, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1103, 1156, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1104, 1157, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1105, 1158, 2)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1106, 1159, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1107, 1160, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1108, 1161, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1109, 1162, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1110, 1163, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1111, 1164, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1112, 1165, 5)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1113, 1166, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1114, 1167, 3)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1115, 1168, 2)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1116, 1169, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1117, 1170, 1)
SET IDENTITY_INSERT [dbo].[SelectedAvatar] OFF
SET IDENTITY_INSERT [dbo].[SelectedCategory] ON 

INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1130, 1153, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1131, 1154, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1132, 1155, 2)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1133, 1156, 11)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1134, 1157, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1135, 1158, 7)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1136, 1159, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1137, 1160, 14)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1138, 1161, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1139, 1162, 10)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1140, 1163, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1141, 1164, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1142, 1165, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1143, 1166, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1144, 1167, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1145, 1168, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1146, 1169, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1147, 1170, 1)
SET IDENTITY_INSERT [dbo].[SelectedCategory] OFF
SET IDENTITY_INSERT [dbo].[SelectedTheme] ON 

INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1130, 1153, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1131, 1154, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1132, 1155, 4)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1133, 1156, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1134, 1157, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1135, 1158, 6)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1136, 1159, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1137, 1160, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1138, 1161, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1139, 1162, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1140, 1163, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1141, 1164, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1142, 1165, 9)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1143, 1166, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1144, 1167, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1145, 1168, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1146, 1169, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1147, 1170, 1)
SET IDENTITY_INSERT [dbo].[SelectedTheme] OFF
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([ID], [Name], [Description], [Star], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (1, N'بسته 1000', N'هزار باید پول بدی', 300, 1000, N'Data/Images/1.png', N'#c33d3d', CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6F000000000 AS DateTime))
INSERT [dbo].[Store] ([ID], [Name], [Description], [Star], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (8, N'بسته 2000', N'بسته 2000', 400, 2000, N'Data/Images/2.png', N'#c33d3d', CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6F000000000 AS DateTime))
INSERT [dbo].[Store] ([ID], [Name], [Description], [Star], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (9, N'بسته 3000', N'بسته 3000', 500, 3000, N'Data/Images/3.png', N'#c33d3d', CAST(0x0000A70F00000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime))
INSERT [dbo].[Store] ([ID], [Name], [Description], [Star], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (10, N'بسته 4000', N'بسته 4000', 600, 4000, N'Data/Images/4.png', N'#c33d3d', CAST(0x0000A70F00000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime))
INSERT [dbo].[Store] ([ID], [Name], [Description], [Star], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (12, N'بسته 5000', N'بسته 5000', 700, 5000, N'Data/Images/5.png', N'#c33d3d', CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Store] ([ID], [Name], [Description], [Star], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (13, N'بسته 6000', N'بسته 6000', 800, 6000, N'Data/Images/7.png', N'#c33d3d', CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Store] ([ID], [Name], [Description], [Star], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (14, N'بسته 7000', N'بسته 7000', 900, 7000, N'Data/Images/8.png', N'#c33d3d', CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Store] ([ID], [Name], [Description], [Star], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (16, N'بسته 8000', N'بسته 8000', 1000, 8000, N'Data/Images/9.png', N'#c33d3d', CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Store] ([ID], [Name], [Description], [Star], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (18, N'بسته 9000', N'بسته 9000', 2000, 9000, N'Data/Images/11.png', N'#c33d3d', CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Store] ([ID], [Name], [Description], [Star], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (19, N'بسته 10000', N'بسته 10000', 4000, 10000, N'Data/Images/11.png', N'#c33d3d', CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Store] ([ID], [Name], [Description], [Star], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (20, N'بسته 11000', N'بسته 11000', 5000, 11000, N'Data/Images/11.png', N'#c33d3d', CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Store] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1153, N'7d12e968-3028-42c8-b692-5942d2721114', N'Guest_4759257', 1, 200, 2, 2, 1, 1, CAST(0x0000A73900D09775 AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1154, N'2074cb8c-f4d8-4212-ba4b-03c750a78671', N'Guest_1662386', 1, 200, 0, 0, 1, 1, CAST(0x0000A73900D500B6 AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1155, N'5c80dcd7-e600-44c7-9c6c-881d9a8d8910', N'keyvan', 1, 45, 15, 15, 1, 1, CAST(0x0000A73900F46359 AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1156, N'ac6fee38-1f37-42bf-9448-c70a814a2f8a', N'Guest_0866602', 1, 690, 26, 6, 2, 1, CAST(0x0000A7390136F92E AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1157, N'a6443956-9d2f-4ff9-a778-56df6826f23e', N'Guest_8076392', 1, 215, 0, 0, 1, 1, CAST(0x0000A749012E546C AS DateTime), CAST(0x0000A739013A89A6 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1158, N'b3bd4e43-c5af-472c-a221-ae5fbee7a01c', N'Jeb', 1, 15, 5, 5, 1, 1, CAST(0x0000A739017479D7 AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1159, N'f6dda859-c7b2-4f7c-8aa5-0d29d1c179d6', N'Guest_9304912', 1, 200, 0, 0, 1, 1, CAST(0x0000A73A006798BB AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1160, N'04108948-40aa-4118-acb1-728184b1fbaa', N'keyvan2', 1, 105, 199, 59, 5, 1, CAST(0x0000A73A00D240BB AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1161, N'db3d13a4-2aae-40b7-a082-c3ec43518e77', N'Guest_2425523', 1, 200, 0, 0, 1, 1, CAST(0x0000A73A00E40E09 AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1162, N'3de29d61-46c7-4714-9a24-c18ff59b99d7', N'محمدرضا', 1, 155, 16, 16, 1, 1, CAST(0x0000A73A015602AA AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1163, N'57430493-1939-4920-ad32-a2bac7f6f265', N'Guest_1324601', 1, 200, 0, 0, 1, 1, CAST(0x0000A73B00D31114 AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1164, N'061598ee-6afd-43c5-89fe-590ec9be68b0', N'Guest_9464184', 1, 200, 0, 0, 1, 1, CAST(0x0000A73C00A8B438 AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1165, N'46d10964-bca8-4b99-89a1-e8bd1af4b854', N'Guest_3023018', 1, 215, 29, 9, 2, 1, CAST(0x0000A73C01396A06 AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1166, N'7aa7e99c-dbb3-41b0-ab91-bf71584c412e', N'Guest_7553699', 1, 200, 25, 5, 2, 1, CAST(0x0000A73D0189CA43 AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1167, N'b08e486c-ae1d-4816-bd99-336cfbff3c51', N'Guest_3152858', 1, 5, 47, 27, 2, 1, CAST(0x0000A73E00EBFBB3 AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1168, N'76f6c8bf-0759-443a-a7e0-a47977f263d1', N'Guest_123', 1, 665, 0, 0, 1, 1, CAST(0x0000A74500E0F48E AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1169, N'd3e9c138-9853-4919-86f8-0c181a3efcdd', N'Guest_3049019', 1, 320, 3, 3, 1, 1, CAST(0x0000A745012B6480 AS DateTime), CAST(0x000007DC00000000 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime]) VALUES (1170, N'9a264610-453a-4a94-ba02-3ec5d74ae602', N'Guest_0643621', 1, 200, 0, 0, 1, 1, CAST(0x0000A74600DBC373 AS DateTime), CAST(0x000007DC00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserAvatar] ON 

INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name]) VALUES (1, N'Data/Images/1.png', 1, N'بول')
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name]) VALUES (2, N'Data/Images/3.png', 30, N'غول')
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name]) VALUES (3, N'Data/Images/3.png', 50, N'مول')
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name]) VALUES (4, N'Data/Images/4.png', 60, N'ژوبین')
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name]) VALUES (5, N'Data/Images/5.png', 70, N'ترامپ')
SET IDENTITY_INSERT [dbo].[UserAvatar] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1138, 1153, NULL, N'636253511679603639', NULL, NULL, 0, 0, 2, CAST(0x0000A73900D097F4 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1139, 1154, NULL, N'636253521311662386', NULL, NULL, 0, 0, 2, CAST(0x0000A73900D500B6 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1140, 1155, N'keivan.moazami@yahoo.com', N'123456789', NULL, NULL, 0, 0, 1, CAST(0x0000A73900F463CE AS DateTime), CAST(0x0000A73900F497CF AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1141, 1156, NULL, N'636253735335710387', NULL, NULL, 0, 0, 2, CAST(0x0000A7390136F9A7 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1142, 1157, NULL, N'636253743118076392', NULL, NULL, 0, 0, 2, CAST(0x0000A739013A89A6 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1143, 1158, N'ja7ad.borhani@gmail.com', N'123456789', NULL, NULL, 0, 0, 1, CAST(0x0000A73901747A4C AS DateTime), CAST(0x0000A73A000AFEE8 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1144, 1159, NULL, N'636254146314773679', NULL, NULL, 0, 0, 2, CAST(0x0000A73A00679943 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1145, 1160, N'keivan.moazami@gmail.com', N'mo', NULL, NULL, 0, 0, 1, CAST(0x0000A73A00D240BB AS DateTime), CAST(0x0000A73A00DAD167 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1146, 1161, NULL, N'636254418197737433', NULL, NULL, 0, 0, 2, CAST(0x0000A73A00E40E8C AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1147, 1162, N'mohammad134613@yahoo.com', N'mo1811360', NULL, NULL, 0, 0, 1, CAST(0x0000A73A0156031B AS DateTime), CAST(0x0000A73A0157D6A1 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1148, 1163, NULL, N'636255245085542740', NULL, NULL, 0, 0, 2, CAST(0x0000A73B00D31176 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1149, 1164, NULL, N'636256016539620444', NULL, NULL, 0, 0, 2, CAST(0x0000A73C00A8B43D AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1150, 1165, NULL, N'636256332666617378', NULL, NULL, 0, 0, 2, CAST(0x0000A73C01396A5F AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1151, 1166, NULL, N'636257372247553699', NULL, NULL, 0, 0, 2, CAST(0x0000A73D0189CA43 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1152, 1167, NULL, N'636257891513152858', NULL, NULL, 0, 0, 2, CAST(0x0000A73E00EBFBB3 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1153, 1168, N'test@test.com', N'11111111111111', NULL, NULL, 0, 0, 0, CAST(0x0000A74500E0F4F5 AS DateTime), CAST(0x0000A74500E60513 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1154, 1169, NULL, N'636264078033204651', NULL, NULL, 0, 0, 2, CAST(0x0000A745012B6484 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1155, 1170, NULL, N'636264768084081125', NULL, NULL, 0, 0, 2, CAST(0x0000A74600DBC3DA AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([ID], [Name], [Description]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[UserType] ([ID], [Name], [Description]) VALUES (2, N'client', N'client')
INSERT [dbo].[UserType] ([ID], [Name], [Description]) VALUES (3, N'QuestionProvider', N'QuestionProvider')
SET IDENTITY_INSERT [dbo].[UserType] OFF
ALTER TABLE [dbo].[Achievement] ADD  CONSTRAINT [DF_Achievement_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Achievement] ADD  CONSTRAINT [DF_Achievement_Prize]  DEFAULT ((0)) FOR [Prize]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Favorite_FavoritePrice]  DEFAULT ((1)) FOR [Favorite_FavoritePrice]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Favorite_FreeNumberToFavorite]  DEFAULT ((1)) FOR [Favorite_FreeNumberToFavorite]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_User_DefaultUserName]  DEFAULT ('No-Name') FOR [User_DefaultUserName]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_User_DefaultUserCoin]  DEFAULT ((1)) FOR [User_DefaultUserCoin]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Question_CreateQuestionPrice]  DEFAULT ((1)) FOR [Question_CreateQuestionPrice]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Question_DefaultReturnAmount]  DEFAULT ((1)) FOR [Question_DefaultReturnAmount]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Question_NumberToSkip]  DEFAULT ((1)) FOR [Question_NumberToSkip]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Question_NoQuestionFoundWhat]  DEFAULT (N'داداش خوردی سرور ما رو') FOR [Question_NoQuestionFoundWhat]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Question_NoQuestionFoundBut]  DEFAULT (N'سرورمون آب شد') FOR [Question_NoQuestionFoundBut]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Question_NoQuestionFoundID]  DEFAULT ((-1)) FOR [Question_NoQuestionFoundID]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Question_ServerBurntReturnAmount]  DEFAULT ((1)) FOR [Question_ServerBurntReturnAmount]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_AnswerPrize]  DEFAULT ((1)) FOR [Prize_AnswerPrize]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_LikePrize]  DEFAULT ((1)) FOR [Prize_LikePrize]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_CreateNewQuestionPrize]  DEFAULT ((1)) FOR [Prize_CreateNewQuestionPrize]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_NewQuestionAcceptedPrize]  DEFAULT ((1)) FOR [Prize_NewQuestionAcceptedPrize]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Paging_DefaultPageSize]  DEFAULT ((1)) FOR [Paging_DefaultPageSize]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Leader_TopNumberToShow]  DEFAULT ((1)) FOR [Leader_TopNumberToShow]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Comment_DefaultNumberAmount]  DEFAULT ((1)) FOR [Comment_DefaultNumberAmount]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Comment_DefaultVerifyState]  DEFAULT ((1)) FOR [Comment_DefaultVerifyState]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Host_WebSiteNoReplyMail]  DEFAULT ('noreply@flapp.ir') FOR [Host_WebSiteNoReplyMail]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Host_WebSiteNoReplyMailPassword]  DEFAULT ((123123123)) FOR [Host_WebSiteNoReplyMailPassword]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Host_SupportMail]  DEFAULT ('support@flapp.ir') FOR [Host_SupportMail]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Host_SupportMailPassword]  DEFAULT ((123123)) FOR [Host_SupportMailPassword]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Host_SmtpServer]  DEFAULT ('31.25.89.211') FOR [Host_SmtpServer]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Store_DefaultReturnAmount]  DEFAULT ((1)) FOR [Store_DefaultReturnAmount]
GO
ALTER TABLE [dbo].[AppTheme] ADD  CONSTRAINT [DF_AppTheme_BackImage]  DEFAULT (N'Data/Images/1.png') FOR [BackImage]
GO
ALTER TABLE [dbo].[AppTheme] ADD  CONSTRAINT [DF_AppTheme_DialogImage]  DEFAULT (N'Data/Images/1.png') FOR [DialogImage]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_PrizeCoefficient]  DEFAULT ((1)) FOR [PrizeCoefficient]
GO
ALTER TABLE [dbo].[CodeGift] ADD  CONSTRAINT [DF_CodeGift_TotalUserCount]  DEFAULT ((0)) FOR [TotalUserCount]
GO
ALTER TABLE [dbo].[CodeGift] ADD  CONSTRAINT [DF_CodeGift_TotalUserRegistered]  DEFAULT ((0)) FOR [TotalUserRegistered]
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_IsVerified]  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[CreatedQuestions] ADD  CONSTRAINT [DF_CreatedQuestions_Verified]  DEFAULT ((0)) FOR [VerifyStateID]
GO
ALTER TABLE [dbo].[Level] ADD  CONSTRAINT [DF_Level_LevelNumber]  DEFAULT ((1)) FOR [LevelNumber]
GO
ALTER TABLE [dbo].[Level] ADD  CONSTRAINT [DF_Level_ScoreCeil]  DEFAULT ((1)) FOR [ScoreCeil]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_Banned]  DEFAULT ((0)) FOR [Banned]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Score]  DEFAULT ((0)) FOR [Score]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_LevelProgress]  DEFAULT ((0)) FOR [LevelProgress]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsAbleToWriteComment]  DEFAULT ((1)) FOR [IsAbleToWriteComment]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_PrevLastSeenDateTime]  DEFAULT (((2017)-(1))-(4)) FOR [PrevLastSeenDateTime]
GO
ALTER TABLE [dbo].[UserAvatar] ADD  CONSTRAINT [DF_UserAvatar_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[UserAvatar] ADD  CONSTRAINT [DF_UserAvatar_Name]  DEFAULT (N'No-Name') FOR [Name]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_Password]  DEFAULT (N'Password') FOR [Password]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsVerified]  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsBanned]  DEFAULT ((0)) FOR [IsBanned]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsEdited]  DEFAULT ((2)) FOR [IsEditable]
GO
ALTER TABLE [dbo].[AchievedCodeGift]  WITH CHECK ADD  CONSTRAINT [FK_AchievedCodeGift_CodeGift] FOREIGN KEY([CodeGiftID])
REFERENCES [dbo].[CodeGift] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AchievedCodeGift] CHECK CONSTRAINT [FK_AchievedCodeGift_CodeGift]
GO
ALTER TABLE [dbo].[AchievedCodeGift]  WITH CHECK ADD  CONSTRAINT [FK_AchievedCodeGift_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AchievedCodeGift] CHECK CONSTRAINT [FK_AchievedCodeGift_User]
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
ALTER TABLE [dbo].[AchievedPosession]  WITH CHECK ADD  CONSTRAINT [FK_AchievedQuests_Quest] FOREIGN KEY([AchievementID])
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
ALTER TABLE [dbo].[Achievement]  WITH CHECK ADD  CONSTRAINT [FK_Achievement_AchievementQueryType] FOREIGN KEY([QueryTypeID])
REFERENCES [dbo].[AchievementQueryType] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Achievement] CHECK CONSTRAINT [FK_Achievement_AchievementQueryType]
GO
ALTER TABLE [dbo].[Achievement]  WITH CHECK ADD  CONSTRAINT [FK_Achievement_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Achievement] CHECK CONSTRAINT [FK_Achievement_Category]
GO
ALTER TABLE [dbo].[Achievement]  WITH CHECK ADD  CONSTRAINT [FK_Achievement_Level] FOREIGN KEY([LevelID])
REFERENCES [dbo].[Level] ([ID])
GO
ALTER TABLE [dbo].[Achievement] CHECK CONSTRAINT [FK_Achievement_Level]
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
ALTER TABLE [dbo].[CreatedQuestions]  WITH CHECK ADD  CONSTRAINT [FK_CreatedQuestions_QuestionBoost] FOREIGN KEY([QuestionBoostID])
REFERENCES [dbo].[QuestionBoost] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[CreatedQuestions] CHECK CONSTRAINT [FK_CreatedQuestions_QuestionBoost]
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
ALTER TABLE [dbo].[Gift]  WITH CHECK ADD  CONSTRAINT [FK_Gift_GiftType] FOREIGN KEY([GiftTypeID])
REFERENCES [dbo].[GiftType] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Gift] CHECK CONSTRAINT [FK_Gift_GiftType]
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
ALTER TABLE [dbo].[PurchaseAvatar]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseAvatar_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseAvatar] CHECK CONSTRAINT [FK_PurchaseAvatar_User]
GO
ALTER TABLE [dbo].[PurchaseAvatar]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseAvatar_UserAvatar] FOREIGN KEY([UserAvatarID])
REFERENCES [dbo].[UserAvatar] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseAvatar] CHECK CONSTRAINT [FK_PurchaseAvatar_UserAvatar]
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
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_QuestionBoost] FOREIGN KEY([QuestionBoostID])
REFERENCES [dbo].[QuestionBoost] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_QuestionBoost]
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
ALTER TABLE [dbo].[SelectedAvatar]  WITH CHECK ADD  CONSTRAINT [FK_SelectedAvatar_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SelectedAvatar] CHECK CONSTRAINT [FK_SelectedAvatar_User]
GO
ALTER TABLE [dbo].[SelectedAvatar]  WITH CHECK ADD  CONSTRAINT [FK_SelectedAvatar_UserAvatar] FOREIGN KEY([UserAvatarID])
REFERENCES [dbo].[UserAvatar] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SelectedAvatar] CHECK CONSTRAINT [FK_SelectedAvatar_UserAvatar]
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
ON UPDATE CASCADE
ON DELETE SET NULL
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
