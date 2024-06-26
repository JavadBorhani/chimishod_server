USE [what_if]
GO
/****** Object:  Table [dbo].[AchievedCodeGift]    Script Date: 3/8/2017 3:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AchievedCodeGift](
	[ID] [int] NOT NULL,
	[CodeGiftID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[AchievedDate] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AchievedGifts]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[AchievedPosession]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[Achievement]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[AchievementQueryType]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[AchieveStateType]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[ApplicationState]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[AppTheme]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[CodeGift]    Script Date: 3/8/2017 3:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CodeGift](
	[ID] [int] NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[Serial] [varchar](50) NOT NULL,
	[Prize] [int] NOT NULL,
	[UserCount] [int] NOT NULL,
	[StartDate] [int] NOT NULL,
	[ExpireDate] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Comment]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[CreatedQuestions]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[CreatedQuestionsVerifyType]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[Favorite]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[Gift]    Script Date: 3/8/2017 3:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gift](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Icon] [varchar](150) NOT NULL,
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
/****** Object:  Table [dbo].[Level]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[Manufacture]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[OurAdvertisements]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[PurchaseAvatar]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[PurchaseCategory]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[PurchaseTheme]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[QuestionBoost]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[ReportedQuestions]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[ReportType]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[SelectedAvatar]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[SelectedCategory]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[SelectedTheme]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[Store]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 3/8/2017 3:31:49 PM ******/
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
	[LastSceneDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAvatar]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[UserInfo]    Script Date: 3/8/2017 3:31:49 PM ******/
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
/****** Object:  Table [dbo].[UserType]    Script Date: 3/8/2017 3:31:49 PM ******/
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
SET IDENTITY_INSERT [dbo].[AchievedPosession] ON 

INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1129, 1101, 4, 3, CAST(0x0000A7230141626F AS DateTime), CAST(0x0000A7230141602E AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1130, 1101, 5, 3, CAST(0x0000A7230141B202 AS DateTime), CAST(0x0000A7230141AEC9 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1131, 1099, 4, 3, CAST(0x0000A72700C6AB6E AS DateTime), CAST(0x0000A7230145453A AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1132, 1101, 10, 3, CAST(0x0000A72301467CE9 AS DateTime), CAST(0x0000A72301467977 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1133, 1100, 4, 3, CAST(0x0000A723014695B3 AS DateTime), CAST(0x0000A72301469381 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1134, 1100, 5, 3, CAST(0x0000A72301469B7D AS DateTime), CAST(0x0000A72301469A6D AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1135, 1101, 11, 3, CAST(0x0000A7230159366E AS DateTime), CAST(0x0000A7230148CC07 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1136, 1089, 17, 3, CAST(0x0000A72400AC7B0D AS DateTime), CAST(0x0000A72400AC786F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1137, 1089, 4, 3, CAST(0x0000A72400AC7C14 AS DateTime), CAST(0x0000A72400AC786F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1138, 1101, 13, 3, CAST(0x0000A72400CCE53C AS DateTime), CAST(0x0000A72400CC696B AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1139, 1089, 5, 3, CAST(0x0000A72400D45DBD AS DateTime), CAST(0x0000A72400D45BFF AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1140, 1101, 14, 3, CAST(0x0000A72400D92D53 AS DateTime), CAST(0x0000A72400D92BA4 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1141, 1103, 17, 3, CAST(0x0000A72400DAF9CC AS DateTime), CAST(0x0000A72400DAF5E1 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1142, 1103, 4, 3, CAST(0x0000A72400DAF94E AS DateTime), CAST(0x0000A72400DAF5E1 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1143, 1103, 5, 3, CAST(0x0000A72400DC6B95 AS DateTime), CAST(0x0000A72400DC694B AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1144, 1105, 17, 2, NULL, CAST(0x0000A7240125B739 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1145, 1102, 17, 3, CAST(0x0000A7280008F8D2 AS DateTime), CAST(0x0000A72500198E29 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1146, 1102, 4, 3, CAST(0x0000A7280008F829 AS DateTime), CAST(0x0000A72500198E29 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1147, 1102, 5, 3, CAST(0x0000A7280008FD99 AS DateTime), CAST(0x0000A726009335D3 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1148, 1110, 17, 3, CAST(0x0000A727000BB957 AS DateTime), CAST(0x0000A7260133EE66 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1149, 1110, 4, 3, CAST(0x0000A727000BBAD3 AS DateTime), CAST(0x0000A727000BB19D AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1150, 1110, 5, 3, CAST(0x0000A727000BC9A8 AS DateTime), CAST(0x0000A727000BC637 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1151, 1114, 17, 2, NULL, CAST(0x0000A72700BFD0B2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1152, 1099, 17, 3, CAST(0x0000A72700C6AC75 AS DateTime), CAST(0x0000A72700C6A80B AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1153, 1099, 5, 3, CAST(0x0000A73000BE35B5 AS DateTime), CAST(0x0000A72700C6A80B AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1154, 1117, 17, 2, NULL, CAST(0x0000A7270121F6ED AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1155, 1117, 4, 2, NULL, CAST(0x0000A728010E5C58 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1156, 1117, 5, 2, NULL, CAST(0x0000A72801322D82 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1157, 1110, 13, 3, CAST(0x0000A72801441C8D AS DateTime), CAST(0x0000A72801441913 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1158, 1119, 17, 2, NULL, CAST(0x0000A72900074DE8 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1159, 1119, 4, 2, NULL, CAST(0x0000A72900076ADF AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1160, 1110, 14, 3, CAST(0x0000A729015F3A78 AS DateTime), CAST(0x0000A72900B8A249 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1161, 1129, 17, 2, NULL, CAST(0x0000A72900F8196F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1162, 1130, 17, 2, NULL, CAST(0x0000A729016B653E AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1163, 1131, 17, 2, NULL, CAST(0x0000A72A00B9534A AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1164, 1130, 6, 2, NULL, CAST(0x0000A72B0125D744 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1165, 1130, 4, 2, NULL, CAST(0x0000A72B0125D744 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1166, 1133, 17, 2, NULL, CAST(0x0000A72C0135A689 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1167, 1133, 4, 2, NULL, CAST(0x0000A72C0135A689 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1168, 1133, 5, 2, NULL, CAST(0x0000A72C0135B9C8 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1169, 1132, 4, 3, CAST(0x0000A72D015CDB54 AS DateTime), CAST(0x0000A72D015CD9F9 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1170, 1132, 5, 3, CAST(0x0000A72D015CE139 AS DateTime), CAST(0x0000A72D015CDFFF AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1171, 1110, 10, 2, NULL, CAST(0x0000A72F00A6490D AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1172, 1110, 15, 2, NULL, CAST(0x0000A72F00A6490D AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1173, 1137, 17, 3, CAST(0x0000A72F010F2F78 AS DateTime), CAST(0x0000A72F010EC464 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1174, 1137, 4, 3, CAST(0x0000A72F010F2E30 AS DateTime), CAST(0x0000A72F010F2B96 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1175, 1137, 5, 3, CAST(0x0000A72F010F5EB6 AS DateTime), CAST(0x0000A72F010F5C21 AS DateTime))
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

INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3204, 1087, 50, NULL, NULL, 1, CAST(0x0000A72300C71650 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3205, 1087, 31, NULL, NULL, 1, CAST(0x0000A72300C717B4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3206, 1087, 33, NULL, NULL, 1, CAST(0x0000A72300C719C6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3207, 1087, 34, NULL, NULL, 1, CAST(0x0000A72300C71B13 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3208, 1087, 64, NULL, NULL, 1, CAST(0x0000A72300C71C80 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3209, 1087, 49, NULL, NULL, 1, CAST(0x0000A72300C71DD1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3210, 1087, 58, NULL, NULL, 1, CAST(0x0000A72300C71F07 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3211, 1087, 74, NULL, NULL, 1, CAST(0x0000A72300C72029 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3212, 1087, 78, NULL, NULL, 1, CAST(0x0000A72300C7210A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3213, 1087, 76, NULL, NULL, 1, CAST(0x0000A72300C721F5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3214, 1087, 47, NULL, NULL, 1, CAST(0x0000A72300C72249 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3215, 1087, 46, NULL, NULL, 1, CAST(0x0000A72300C72253 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3216, 1087, 48, NULL, NULL, 1, CAST(0x0000A72300C72347 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3217, 1087, 53, NULL, NULL, 1, CAST(0x0000A72300C72485 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3218, 1087, 51, NULL, NULL, 1, CAST(0x0000A72300C72485 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3219, 1087, 54, NULL, NULL, 1, CAST(0x0000A72300C7258C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3220, 1087, 55, NULL, NULL, 1, CAST(0x0000A72300C725BA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3221, 1087, 56, NULL, NULL, 1, CAST(0x0000A72300C7270C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3222, 1087, 57, NULL, NULL, 1, CAST(0x0000A72300C72923 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3223, 1087, 38, NULL, NULL, 1, CAST(0x0000A72300C72B63 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3224, 1087, 41, NULL, NULL, 1, CAST(0x0000A72300C72B76 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3225, 1087, 42, NULL, NULL, 1, CAST(0x0000A72300C72BB7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3226, 1087, 44, NULL, NULL, 1, CAST(0x0000A72300C72CAB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3227, 1087, 43, NULL, NULL, 1, CAST(0x0000A72300C72CAB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3228, 1087, 26, NULL, NULL, 1, CAST(0x0000A72300C72DA8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3229, 1087, 87, NULL, NULL, 1, CAST(0x0000A72300C72DE1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3230, 1087, 90, NULL, NULL, 1, CAST(0x0000A72300C72EEC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3231, 1086, 22, 1, NULL, 1, CAST(0x0000A72300DC19DE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3232, 1086, 23, 1, NULL, 1, CAST(0x0000A72300DD13A4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3233, 1088, 50, NULL, NULL, 1, CAST(0x0000A72300E15D3F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3234, 1088, 31, NULL, NULL, 1, CAST(0x0000A72300E161A9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3235, 1088, 33, NULL, NULL, 1, CAST(0x0000A72300E16406 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3236, 1088, 34, NULL, NULL, 1, CAST(0x0000A72300E16524 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3237, 1088, 64, NULL, NULL, 1, CAST(0x0000A72300E16659 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3238, 1088, 49, NULL, NULL, 1, CAST(0x0000A72300E170BF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3239, 1088, 58, NULL, NULL, 1, CAST(0x0000A72300E171F5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3240, 1088, 78, NULL, NULL, 1, CAST(0x0000A72300E17338 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3241, 1088, 74, NULL, NULL, 1, CAST(0x0000A72300E17338 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3242, 1088, 46, NULL, NULL, 1, CAST(0x0000A72300E1747C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3243, 1088, 76, NULL, NULL, 1, CAST(0x0000A72300E1747C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3244, 1088, 47, NULL, NULL, 1, CAST(0x0000A72300E17587 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3245, 1088, 48, NULL, NULL, 1, CAST(0x0000A72300E17587 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3246, 1088, 51, NULL, NULL, 1, CAST(0x0000A72300E176F0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3247, 1088, 53, NULL, NULL, 1, CAST(0x0000A72300E177F6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3248, 1088, 54, NULL, NULL, 1, CAST(0x0000A72300E1792C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3249, 1088, 55, NULL, NULL, 1, CAST(0x0000A72300E17B55 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3250, 1088, 56, NULL, NULL, 1, CAST(0x0000A72300E17C7C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3251, 1088, 57, NULL, NULL, 1, CAST(0x0000A72300E17DC9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3252, 1088, 38, NULL, NULL, 1, CAST(0x0000A72300E1933F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3253, 1088, 41, NULL, NULL, 1, CAST(0x0000A72300E1D36D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3254, 1088, 42, NULL, NULL, 1, CAST(0x0000A72300E23BBD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3255, 1088, 43, NULL, NULL, 1, CAST(0x0000A72300E24039 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3256, 1088, 44, NULL, NULL, 1, CAST(0x0000A72300E2611C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3257, 1088, 26, NULL, NULL, 1, CAST(0x0000A72300E26244 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3258, 1088, 87, NULL, NULL, 1, CAST(0x0000A72300E2637E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3259, 1088, 90, NULL, NULL, 1, CAST(0x0000A72300E2639A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3260, 1088, 91, NULL, NULL, 1, CAST(0x0000A72300E26489 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3261, 1088, 92, NULL, NULL, 1, CAST(0x0000A72300E265B9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3262, 1088, 93, NULL, NULL, 1, CAST(0x0000A72300E265D6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3263, 1088, 79, NULL, NULL, 1, CAST(0x0000A72300E26751 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3264, 1088, 80, NULL, NULL, 1, CAST(0x0000A72300E26CF1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3265, 1088, 81, NULL, NULL, 1, CAST(0x0000A72300E29F21 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3266, 1088, 84, NULL, NULL, 1, CAST(0x0000A72300E2B45E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3267, 1088, 83, NULL, NULL, 1, CAST(0x0000A72300E2B463 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3268, 1088, 75, NULL, NULL, 1, CAST(0x0000A72300E2B484 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3269, 1088, 67, NULL, NULL, 1, CAST(0x0000A72300E2B57C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3270, 1088, 72, NULL, NULL, 1, CAST(0x0000A72300E2B57C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3271, 1088, 68, NULL, NULL, 1, CAST(0x0000A72300E2B6AD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3272, 1088, 61, NULL, NULL, 1, CAST(0x0000A72300E2B6AD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3273, 1088, 63, NULL, NULL, 1, CAST(0x0000A72300E2B6EA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3274, 1088, 65, NULL, NULL, 1, CAST(0x0000A72300E2B7DE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3275, 1088, 96, NULL, NULL, 1, CAST(0x0000A72300E2B7DE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3276, 1088, 97, NULL, NULL, 1, CAST(0x0000A72300E2E7EA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3277, 1088, 98, NULL, NULL, 1, CAST(0x0000A72300E2E8EC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3278, 1088, 99, NULL, NULL, 1, CAST(0x0000A72300E2E8F0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3279, 1088, 100, NULL, NULL, 1, CAST(0x0000A72300E2E949 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3280, 1088, 1, NULL, NULL, 1, CAST(0x0000A72300E2EA46 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3281, 1088, 27, NULL, NULL, 1, CAST(0x0000A72300E2EA46 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3282, 1088, 28, NULL, NULL, 1, CAST(0x0000A72300E2EAA0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3283, 1088, 29, NULL, NULL, 1, CAST(0x0000A72300E2EB64 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3284, 1088, 35, NULL, NULL, 1, CAST(0x0000A72300E2EBA6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3285, 1088, 36, NULL, NULL, 1, CAST(0x0000A72300E2EC82 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3286, 1088, 37, NULL, NULL, 1, CAST(0x0000A72300E2ECC4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3287, 1088, 45, NULL, NULL, 1, CAST(0x0000A72300E2ED55 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3288, 1088, 39, NULL, NULL, 1, CAST(0x0000A72300E2EDA5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3289, 1088, 40, NULL, NULL, 1, CAST(0x0000A72300E2EE1A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3290, 1088, 32, NULL, NULL, 1, CAST(0x0000A72300E2EEDA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3291, 1088, 66, NULL, NULL, 1, CAST(0x0000A72300E2F51D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3292, 1088, 62, NULL, NULL, 1, CAST(0x0000A72300E2F63B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3293, 1087, 91, NULL, NULL, 1, CAST(0x0000A7230129D46A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3294, 1087, 92, NULL, NULL, 1, CAST(0x0000A723012A203D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3295, 1090, 50, NULL, NULL, 1, CAST(0x0000A723012B3D0A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3296, 1090, 31, NULL, NULL, 1, CAST(0x0000A723012B3DF5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3297, 1090, 33, NULL, NULL, 1, CAST(0x0000A723012B3F54 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3298, 1090, 34, NULL, NULL, 1, CAST(0x0000A723012B40AA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3299, 1090, 64, NULL, NULL, 1, CAST(0x0000A723012B42BC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3300, 1090, 49, NULL, NULL, 1, CAST(0x0000A723012B43E3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3301, 1090, 58, NULL, NULL, 1, CAST(0x0000A723012B44F8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3302, 1090, 74, NULL, NULL, 1, CAST(0x0000A723012B464A AS DateTime))
GO
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3303, 1090, 78, NULL, NULL, 1, CAST(0x0000A723012B47B2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3304, 1090, 76, NULL, NULL, 1, CAST(0x0000A723012B49BF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3305, 1090, 46, NULL, NULL, 1, CAST(0x0000A723012B4AE7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3306, 1090, 47, NULL, NULL, 1, CAST(0x0000A723012B4C0E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3307, 1090, 48, NULL, NULL, 1, CAST(0x0000A723012B4D3F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3308, 1090, 51, NULL, NULL, 1, CAST(0x0000A723012B4E4F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3309, 1090, 53, NULL, NULL, 1, CAST(0x0000A723012B4F76 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3310, 1090, 54, NULL, NULL, 1, CAST(0x0000A723012B50A7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3311, 1090, 55, NULL, NULL, 1, CAST(0x0000A723012B51F8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3312, 1090, 56, NULL, NULL, 1, CAST(0x0000A723012B536F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3313, 1090, 57, NULL, NULL, 1, CAST(0x0000A723012B80C1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3314, 1090, 38, NULL, NULL, 1, CAST(0x0000A723012B81F6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3315, 1098, 50, NULL, NULL, 1, CAST(0x0000A7230134A8C8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3316, 1098, 31, NULL, NULL, 1, CAST(0x0000A7230134DEB0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3317, 1098, 33, NULL, NULL, 1, CAST(0x0000A72301353A42 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3318, 1101, 50, NULL, NULL, 0, CAST(0x0000A7230140C6EB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3319, 1101, 31, NULL, NULL, 1, CAST(0x0000A723014171D0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3320, 1101, 33, NULL, NULL, 1, CAST(0x0000A723014173FE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3321, 1101, 34, NULL, NULL, 0, CAST(0x0000A72301417525 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3322, 1101, 64, NULL, NULL, 0, CAST(0x0000A72301417668 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3323, 1101, 49, NULL, NULL, 1, CAST(0x0000A72301417782 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3324, 1101, 58, NULL, NULL, 0, CAST(0x0000A723014179AB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3325, 1101, 74, NULL, NULL, 0, CAST(0x0000A723014179C7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3326, 1101, 78, NULL, NULL, 1, CAST(0x0000A72301417E6E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3327, 1101, 76, NULL, NULL, 1, CAST(0x0000A72301417FBF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3328, 1101, 46, NULL, NULL, 1, CAST(0x0000A72301418107 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3329, 1101, 47, NULL, NULL, 0, CAST(0x0000A7230141834C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3330, 1101, 48, NULL, NULL, 1, CAST(0x0000A7230141857F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3331, 1101, 51, NULL, NULL, 1, CAST(0x0000A72301418978 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3332, 1101, 53, NULL, NULL, 1, CAST(0x0000A72301418A59 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3333, 1101, 54, NULL, NULL, 0, CAST(0x0000A72301418B3F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3334, 1101, 55, NULL, NULL, 1, CAST(0x0000A72301418C87 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3335, 1101, 56, NULL, NULL, 1, CAST(0x0000A72301418DEB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3336, 1101, 57, NULL, NULL, 0, CAST(0x0000A72301418F54 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3337, 1101, 38, NULL, NULL, 1, CAST(0x0000A7230143B727 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3338, 1099, 50, NULL, NULL, 1, CAST(0x0000A7230144E1D1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3339, 1099, 31, 1, NULL, 1, CAST(0x0000A7230144FC84 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3340, 1099, 33, NULL, NULL, 1, CAST(0x0000A7230145537D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3341, 1099, 34, NULL, NULL, 0, CAST(0x0000A72301455950 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3342, 1100, 50, NULL, NULL, 1, CAST(0x0000A72301466375 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3343, 1100, 31, NULL, NULL, 1, CAST(0x0000A72301466477 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3344, 1100, 33, NULL, NULL, 1, CAST(0x0000A72301466477 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3345, 1100, 34, NULL, NULL, 1, CAST(0x0000A723014664D0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3346, 1100, 64, NULL, NULL, 1, CAST(0x0000A72301466582 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3347, 1100, 49, NULL, NULL, 1, CAST(0x0000A72301466590 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3348, 1100, 58, NULL, NULL, 1, CAST(0x0000A723014665E9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3349, 1100, 78, NULL, NULL, 1, CAST(0x0000A723014666DD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3350, 1100, 74, NULL, NULL, 1, CAST(0x0000A723014666DD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3351, 1100, 76, NULL, NULL, 1, CAST(0x0000A723014667F1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3352, 1100, 46, NULL, NULL, 1, CAST(0x0000A72301466809 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3353, 1100, 47, NULL, NULL, 1, CAST(0x0000A72301466948 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3354, 1100, 48, NULL, NULL, 1, CAST(0x0000A72301466948 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3355, 1100, 51, NULL, NULL, 1, CAST(0x0000A7230146696D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3356, 1100, 53, NULL, NULL, 1, CAST(0x0000A72301466A49 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3357, 1100, 54, NULL, NULL, 1, CAST(0x0000A72301466A4E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3358, 1100, 55, NULL, NULL, 1, CAST(0x0000A72301466B7A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3359, 1100, 56, NULL, NULL, 1, CAST(0x0000A72301466B7A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3360, 1101, 18, NULL, NULL, 1, CAST(0x0000A72301466C8F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3361, 1101, 20, NULL, NULL, 1, CAST(0x0000A72301466C8F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3362, 1100, 57, NULL, NULL, 1, CAST(0x0000A72301466C93 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3363, 1101, 19, NULL, NULL, 1, CAST(0x0000A72301466CE3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3364, 1100, 38, NULL, NULL, 1, CAST(0x0000A72301466CF1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3365, 1100, 42, NULL, NULL, 1, CAST(0x0000A72301466DD7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3366, 1100, 41, NULL, NULL, 1, CAST(0x0000A72301466DD7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3367, 1100, 43, NULL, NULL, 1, CAST(0x0000A72301466E18 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3368, 1100, 44, NULL, NULL, 1, CAST(0x0000A72301466EF9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3369, 1100, 26, NULL, NULL, 1, CAST(0x0000A72301466F11 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3370, 1100, 87, NULL, NULL, 1, CAST(0x0000A72301467021 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3371, 1100, 90, NULL, NULL, 1, CAST(0x0000A72301467021 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3372, 1100, 91, NULL, NULL, 1, CAST(0x0000A7230146713A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3373, 1100, 92, NULL, NULL, 1, CAST(0x0000A72301467148 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3374, 1100, 93, NULL, NULL, 1, CAST(0x0000A723014671AA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3375, 1100, 80, NULL, NULL, 1, CAST(0x0000A72301467287 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3376, 1100, 79, NULL, NULL, 1, CAST(0x0000A72301467287 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3377, 1100, 81, NULL, NULL, 1, CAST(0x0000A7230146739B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3378, 1100, 83, NULL, NULL, 1, CAST(0x0000A723014673A9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3379, 1100, 84, NULL, NULL, 1, CAST(0x0000A72301467423 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3380, 1100, 75, NULL, NULL, 1, CAST(0x0000A723014674CC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3381, 1100, 72, NULL, NULL, 1, CAST(0x0000A72301467504 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3382, 1100, 68, NULL, NULL, 1, CAST(0x0000A723014675FD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3383, 1100, 67, NULL, NULL, 1, CAST(0x0000A723014675FD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3384, 1100, 61, NULL, NULL, 1, CAST(0x0000A7230146764C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3385, 1100, 63, NULL, NULL, 1, CAST(0x0000A7230146771F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3386, 1100, 65, NULL, NULL, 1, CAST(0x0000A72301467737 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3387, 1100, 96, NULL, NULL, 1, CAST(0x0000A72301467799 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3388, 1100, 97, NULL, NULL, 1, CAST(0x0000A72301467859 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3389, 1100, 98, NULL, NULL, 1, CAST(0x0000A7230146796E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3390, 1100, 99, NULL, NULL, 1, CAST(0x0000A7230146798F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3391, 1100, 100, NULL, NULL, 1, CAST(0x0000A72301467AC4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3392, 1100, 1, NULL, NULL, 1, CAST(0x0000A72301467E1E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3393, 1100, 27, NULL, NULL, 1, CAST(0x0000A72301467E8A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3394, 1100, 28, NULL, NULL, 1, CAST(0x0000A72301467F6B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3395, 1100, 29, NULL, NULL, 1, CAST(0x0000A72301467F74 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3396, 1100, 35, NULL, NULL, 1, CAST(0x0000A72301467FC8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3397, 1100, 36, NULL, NULL, 1, CAST(0x0000A72301468089 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3398, 1100, 37, NULL, NULL, 1, CAST(0x0000A7230146809B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3399, 1100, 45, NULL, NULL, 1, CAST(0x0000A7230146810C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3400, 1100, 39, NULL, NULL, 1, CAST(0x0000A7230146818F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3401, 1100, 40, NULL, NULL, 1, CAST(0x0000A723014681AB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3402, 1100, 66, NULL, NULL, 1, CAST(0x0000A7230146841F AS DateTime))
GO
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3403, 1100, 32, NULL, NULL, 1, CAST(0x0000A7230146841F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3404, 1100, 62, NULL, NULL, 1, CAST(0x0000A72301468453 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3405, 1100, 59, NULL, NULL, 1, CAST(0x0000A7230146854B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3406, 1100, 60, NULL, NULL, 1, CAST(0x0000A7230146854B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3407, 1100, 69, NULL, NULL, 1, CAST(0x0000A723014685B3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3408, 1100, 70, NULL, NULL, 1, CAST(0x0000A72301468665 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3409, 1100, 71, NULL, NULL, 1, CAST(0x0000A72301468673 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3410, 1100, 73, NULL, NULL, 1, CAST(0x0000A723014687EA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3411, 1100, 85, NULL, NULL, 1, CAST(0x0000A723014688C2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3412, 1100, 86, NULL, NULL, 1, CAST(0x0000A723014688C6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3413, 1100, 82, NULL, NULL, 1, CAST(0x0000A72301468932 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3414, 1100, 94, NULL, NULL, 1, CAST(0x0000A723014689DF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3415, 1100, 95, NULL, NULL, 1, CAST(0x0000A72301468A09 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3416, 1100, 88, NULL, NULL, 1, CAST(0x0000A72301468B07 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3417, 1100, 89, NULL, NULL, 1, CAST(0x0000A72301468B1A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3418, 1100, 77, NULL, NULL, 1, CAST(0x0000A72301468C61 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3419, 1100, 101, NULL, NULL, 1, CAST(0x0000A72301468C61 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3420, 1100, 24, NULL, NULL, 1, CAST(0x0000A72301468CBB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3421, 1100, 22, NULL, NULL, 1, CAST(0x0000A72301468D84 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3422, 1100, 30, NULL, NULL, 1, CAST(0x0000A72301468D97 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3423, 1100, 23, NULL, NULL, 1, CAST(0x0000A72301468FEA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3424, 1100, 52, NULL, NULL, 1, CAST(0x0000A72301468FEA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3425, 1100, 21, NULL, NULL, 1, CAST(0x0000A723014769F0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3426, 1100, 3, NULL, NULL, 1, CAST(0x0000A72301476B0E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3427, 1100, 2, NULL, NULL, 1, CAST(0x0000A72301476B6C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3428, 1101, 41, NULL, NULL, 1, CAST(0x0000A7230159569A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3429, 1089, 50, NULL, NULL, 1, CAST(0x0000A72400AC172B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3430, 1101, 42, 1, NULL, 1, CAST(0x0000A72400CBEC44 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3431, 1101, 43, NULL, NULL, 1, CAST(0x0000A72400CC0A7B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3432, 1101, 44, NULL, NULL, 1, CAST(0x0000A72400CC5D3E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3433, 1101, 26, NULL, NULL, 1, CAST(0x0000A72400CC5EE9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3434, 1101, 87, NULL, NULL, 1, CAST(0x0000A72400CC614A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3435, 1101, 9, NULL, NULL, 1, CAST(0x0000A72400CC61BB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3436, 1089, 31, 1, NULL, 1, CAST(0x0000A72400D3445C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3437, 1089, 33, NULL, NULL, 0, CAST(0x0000A72400D44619 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3438, 1101, 8, 1, NULL, 1, CAST(0x0000A72400D81975 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3439, 1101, 7, NULL, NULL, 1, CAST(0x0000A72400D8240F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3440, 1089, 34, NULL, NULL, 1, CAST(0x0000A72400D8C6FD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3441, 1089, 64, NULL, NULL, 1, CAST(0x0000A72400D8C963 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3442, 1089, 49, NULL, NULL, 1, CAST(0x0000A72400D8CBAD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3443, 1089, 58, NULL, NULL, 1, CAST(0x0000A72400D8D0CD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3444, 1089, 74, NULL, NULL, 1, CAST(0x0000A72400D8D40B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3445, 1089, 78, NULL, NULL, 1, CAST(0x0000A72400D8D69B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3446, 1089, 76, NULL, NULL, 1, CAST(0x0000A72400D8D8C4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3447, 1089, 46, NULL, NULL, 1, CAST(0x0000A72400D8DB21 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3448, 1089, 47, NULL, NULL, 1, CAST(0x0000A72400D8DD5D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3449, 1089, 48, NULL, NULL, 1, CAST(0x0000A72400D8DFA2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3450, 1089, 51, NULL, NULL, 1, CAST(0x0000A72400D8E122 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3451, 1089, 53, NULL, NULL, 1, CAST(0x0000A72400D8E334 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3452, 1089, 54, NULL, NULL, 1, CAST(0x0000A72400D8E48A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3453, 1089, 55, NULL, NULL, 1, CAST(0x0000A72400D8E7DF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3454, 1089, 56, NULL, NULL, 1, CAST(0x0000A72400D8EC73 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3455, 1089, 57, NULL, NULL, 1, CAST(0x0000A72400D8F29F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3456, 1089, 38, NULL, NULL, 1, CAST(0x0000A72400D8F4A3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3457, 1089, 41, NULL, NULL, 1, CAST(0x0000A72400D8F5E1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3458, 1089, 42, NULL, NULL, 1, CAST(0x0000A72400D8F85A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3459, 1089, 43, NULL, NULL, 1, CAST(0x0000A72400D8FAC5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3460, 1089, 44, NULL, NULL, 1, CAST(0x0000A72400D8FD34 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3461, 1089, 26, NULL, NULL, 1, CAST(0x0000A72400D8FFA4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3462, 1089, 87, NULL, NULL, 1, CAST(0x0000A72400D902CF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3463, 1089, 90, NULL, NULL, 1, CAST(0x0000A72400D9051D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3464, 1089, 91, NULL, NULL, 1, CAST(0x0000A72400D9079F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3465, 1089, 92, NULL, NULL, 1, CAST(0x0000A72400D909E9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3466, 1089, 93, NULL, NULL, 1, CAST(0x0000A72400D90E87 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3467, 1089, 79, NULL, NULL, 1, CAST(0x0000A72400D9146C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3468, 1089, 80, NULL, NULL, 1, CAST(0x0000A72400D915A1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3469, 1089, 81, NULL, NULL, 1, CAST(0x0000A72400D91836 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3470, 1089, 83, NULL, NULL, 1, CAST(0x0000A72400D91C84 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3471, 1089, 84, NULL, NULL, 1, CAST(0x0000A72400D92032 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3472, 1089, 75, NULL, NULL, 1, CAST(0x0000A72400D9217A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3473, 1089, 72, NULL, NULL, 1, CAST(0x0000A72400D92524 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3474, 1089, 67, NULL, NULL, 1, CAST(0x0000A72400D9282E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3475, 1089, 68, NULL, NULL, 1, CAST(0x0000A72400D929D8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3476, 1089, 61, NULL, NULL, 1, CAST(0x0000A72400D92BF3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3477, 1089, 63, NULL, NULL, 1, CAST(0x0000A72400D92E42 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3478, 1089, 65, NULL, NULL, 1, CAST(0x0000A72400D92F49 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3479, 1089, 96, NULL, NULL, 1, CAST(0x0000A72400D932DF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3480, 1089, 97, NULL, NULL, 1, CAST(0x0000A72400D93663 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3481, 1089, 98, NULL, NULL, 1, CAST(0x0000A72400D93914 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3482, 1089, 99, NULL, NULL, 1, CAST(0x0000A72400D93FC8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3483, 1089, 100, NULL, NULL, 1, CAST(0x0000A72400D94220 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3484, 1089, 1, NULL, NULL, 1, CAST(0x0000A72400D94301 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3485, 1089, 27, NULL, NULL, 1, CAST(0x0000A72400D944BA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3486, 1089, 28, NULL, NULL, 1, CAST(0x0000A72400D946AB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3487, 1089, 29, NULL, NULL, 1, CAST(0x0000A72400D94928 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3488, 1089, 35, NULL, NULL, 1, CAST(0x0000A72400D94A62 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3489, 1089, 36, NULL, NULL, 1, CAST(0x0000A72400D94DF4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3490, 1089, 37, NULL, NULL, 1, CAST(0x0000A72400D94F09 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3491, 1089, 45, NULL, NULL, 1, CAST(0x0000A72400D95051 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3492, 1089, 39, NULL, NULL, 1, CAST(0x0000A72400D9527F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3493, 1089, 40, NULL, NULL, 1, CAST(0x0000A72400D954F7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3494, 1089, 32, NULL, NULL, 1, CAST(0x0000A72400D95704 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3495, 1089, 66, NULL, NULL, 1, CAST(0x0000A72400D95864 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3496, 1089, 62, NULL, NULL, 1, CAST(0x0000A72400D95ABC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3497, 1089, 59, NULL, NULL, 1, CAST(0x0000A72400D95E2D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3498, 1089, 60, NULL, NULL, 1, CAST(0x0000A72400D95F67 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3499, 1089, 69, NULL, NULL, 1, CAST(0x0000A72400D961C9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3500, 1089, 70, NULL, NULL, 1, CAST(0x0000A72400D96405 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3501, 1089, 71, NULL, NULL, 1, CAST(0x0000A72400D9655B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3502, 1089, 73, NULL, NULL, 1, CAST(0x0000A72400D96755 AS DateTime))
GO
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3503, 1089, 85, NULL, NULL, 1, CAST(0x0000A72400D969F8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3504, 1089, 86, NULL, NULL, 1, CAST(0x0000A72400D96C47 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3505, 1089, 82, NULL, NULL, 1, CAST(0x0000A72400D96D77 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3506, 1089, 94, NULL, NULL, 1, CAST(0x0000A72400D97109 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3507, 1089, 95, NULL, NULL, 1, CAST(0x0000A72400D97235 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3508, 1089, 88, NULL, NULL, 1, CAST(0x0000A72400D97476 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3509, 1089, 89, NULL, NULL, 1, CAST(0x0000A72400D97594 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3510, 1089, 77, NULL, NULL, 1, CAST(0x0000A72400D97E2A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3511, 1089, 101, NULL, NULL, 1, CAST(0x0000A72400D984F1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3512, 1089, 24, NULL, NULL, 1, CAST(0x0000A72400D98634 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3513, 1089, 22, NULL, NULL, 1, CAST(0x0000A72400D99FE5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3514, 1089, 30, NULL, NULL, 1, CAST(0x0000A72400D9A11A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3515, 1089, 52, NULL, NULL, 1, CAST(0x0000A72400D9A364 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3516, 1089, 23, NULL, NULL, 1, CAST(0x0000A72400D9A474 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3517, 1089, 21, NULL, NULL, 1, CAST(0x0000A72400D9A5D3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3518, 1089, 3, NULL, NULL, 1, CAST(0x0000A72400D9A80F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3519, 1089, 2, NULL, NULL, 1, CAST(0x0000A72400D9A949 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3520, 1089, 25, NULL, NULL, 1, CAST(0x0000A72400D9AA8D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3521, 1102, 50, NULL, NULL, 1, CAST(0x0000A72400DA48F0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3522, 1102, 31, NULL, NULL, 1, CAST(0x0000A72400DA55D9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3523, 1102, 33, NULL, NULL, 1, CAST(0x0000A72400DA5916 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3524, 1103, 50, NULL, NULL, 1, CAST(0x0000A72400DA67EB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3525, 1103, 31, NULL, NULL, 1, CAST(0x0000A72400DC2D7D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3526, 1104, 50, NULL, NULL, 1, CAST(0x0000A72400E031AF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3527, 1104, 31, NULL, NULL, 1, CAST(0x0000A72400E045BC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3528, 1104, 33, NULL, NULL, 0, CAST(0x0000A72400E05218 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3529, 1104, 34, NULL, NULL, 0, CAST(0x0000A72400E06620 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3530, 1104, 64, NULL, NULL, 0, CAST(0x0000A72400E06EBB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3531, 1104, 49, NULL, NULL, 0, CAST(0x0000A72400E077A1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3532, 1104, 58, NULL, NULL, 0, CAST(0x0000A72400E07D78 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3533, 1104, 74, NULL, NULL, 1, CAST(0x0000A72400E08618 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3534, 1104, 78, NULL, NULL, 0, CAST(0x0000A72400E08B7A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3535, 1104, 76, NULL, NULL, 1, CAST(0x0000A72400E094F6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3536, 1104, 46, NULL, NULL, 0, CAST(0x0000A72400E09ABB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3537, 1104, 47, NULL, NULL, 1, CAST(0x0000A72400E0A254 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3538, 1104, 48, NULL, NULL, 0, CAST(0x0000A72400E0A80F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3539, 1104, 51, NULL, NULL, 0, CAST(0x0000A72400E0AF46 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3540, 1104, 53, NULL, NULL, 0, CAST(0x0000A72400E0B81A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3541, 1104, 54, NULL, NULL, 0, CAST(0x0000A72400E0BCBC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3542, 1104, 55, NULL, NULL, 0, CAST(0x0000A72400E0C202 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3543, 1104, 56, NULL, NULL, 0, CAST(0x0000A72400E0CADE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3544, 1104, 57, NULL, NULL, 0, CAST(0x0000A72400E0D0F3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3545, 1104, 38, NULL, NULL, 0, CAST(0x0000A72400E0D312 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3546, 1104, 41, NULL, NULL, 0, CAST(0x0000A72400E0D43E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3547, 1104, 42, NULL, NULL, 0, CAST(0x0000A72400E0D561 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3548, 1104, 43, NULL, NULL, 0, CAST(0x0000A72400E0D5A3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3549, 1104, 44, NULL, NULL, 0, CAST(0x0000A72400E0D696 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3550, 1104, 26, NULL, NULL, 0, CAST(0x0000A72400E0D6DD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3551, 1104, 87, NULL, NULL, 0, CAST(0x0000A72400E0D7B0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3552, 1104, 90, NULL, NULL, 0, CAST(0x0000A72400E0D7E8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3553, 1104, 91, NULL, NULL, 0, CAST(0x0000A72400E0D8EA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3554, 1104, 92, NULL, NULL, 0, CAST(0x0000A72400E0D8FC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3555, 1104, 93, NULL, NULL, 0, CAST(0x0000A72400E0E494 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3556, 1104, 79, NULL, NULL, 0, CAST(0x0000A72400E0E5C9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3557, 1104, 80, NULL, NULL, 0, CAST(0x0000A72400E0E656 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3558, 1104, 81, NULL, NULL, 0, CAST(0x0000A72400E0E703 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3559, 1104, 83, NULL, NULL, 0, CAST(0x0000A72400E0E82F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3560, 1104, 84, NULL, NULL, 0, CAST(0x0000A72400E0E86C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3561, 1104, 75, NULL, NULL, 0, CAST(0x0000A72400E13F58 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3562, 1104, 72, NULL, NULL, 0, CAST(0x0000A72400E14246 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3563, 1104, 67, NULL, NULL, 0, CAST(0x0000A72400E143D9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3564, 1104, 68, NULL, NULL, 0, CAST(0x0000A72400E145E1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3565, 1104, 61, NULL, NULL, 0, CAST(0x0000A72400E1479A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3566, 1104, 63, NULL, NULL, 0, CAST(0x0000A72400E14965 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3567, 1104, 65, NULL, NULL, 0, CAST(0x0000A72400E14A96 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3568, 1104, 96, NULL, NULL, 0, CAST(0x0000A72400E14AC9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3569, 1104, 97, NULL, NULL, 0, CAST(0x0000A72400E14D6C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3570, 1104, 98, NULL, NULL, 1, CAST(0x0000A72400E150C6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3571, 1104, 99, NULL, NULL, 1, CAST(0x0000A72400E1530B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3572, 1104, 100, NULL, NULL, 1, CAST(0x0000A72400E1558E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3573, 1103, 33, NULL, NULL, 1, CAST(0x0000A72400E9DC3A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3574, 1103, 34, NULL, NULL, 1, CAST(0x0000A72400EA3558 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3575, 1103, 64, NULL, NULL, 0, CAST(0x0000A72400EA3FF2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3576, 1103, 49, NULL, NULL, 1, CAST(0x0000A72400EA4957 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3577, 1103, 58, NULL, NULL, 0, CAST(0x0000A72400EA4E07 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3578, 1103, 74, NULL, NULL, 1, CAST(0x0000A7240173AB0C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3579, 1107, 50, NULL, NULL, 1, CAST(0x0000A725015FF5D2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3580, 1107, 31, NULL, NULL, 0, CAST(0x0000A72501600559 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3581, 1107, 33, NULL, NULL, 0, CAST(0x0000A725016012E6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3582, 1107, 34, NULL, NULL, 0, CAST(0x0000A72501601E99 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3583, 1103, 46, NULL, NULL, 0, CAST(0x0000A725016CFA79 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3584, 1104, 1, NULL, NULL, 1, CAST(0x0000A725018AEB6C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3585, 1092, 31, NULL, NULL, 1, CAST(0x0000A726011024B5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3586, 1092, 33, NULL, NULL, 1, CAST(0x0000A726011025B7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3587, 1092, 34, NULL, NULL, 1, CAST(0x0000A726011026C2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3588, 1092, 50, NULL, NULL, 1, CAST(0x0000A72601102758 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3589, 1092, 64, NULL, NULL, 1, CAST(0x0000A72601102902 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3590, 1092, 49, NULL, NULL, 1, CAST(0x0000A72601103999 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3591, 1092, 58, NULL, NULL, 1, CAST(0x0000A72601103B15 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3592, 1092, 74, NULL, NULL, 1, CAST(0x0000A72601103CBB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3593, 1092, 76, NULL, NULL, 1, CAST(0x0000A72601103E8B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3594, 1092, 78, NULL, NULL, 1, CAST(0x0000A72601103FEA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3595, 1092, 46, NULL, NULL, 1, CAST(0x0000A7260110417E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3596, 1092, 47, NULL, NULL, 1, CAST(0x0000A726011042F9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3597, 1092, 48, NULL, NULL, 1, CAST(0x0000A72601104488 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3598, 1092, 51, NULL, NULL, 1, CAST(0x0000A726011045B8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3599, 1092, 53, NULL, NULL, 1, CAST(0x0000A72601104726 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3600, 1092, 54, NULL, NULL, 1, CAST(0x0000A726011047CF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3601, 1092, 55, NULL, NULL, 1, CAST(0x0000A726011048BE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3602, 1092, 56, NULL, NULL, 1, CAST(0x0000A726011049E0 AS DateTime))
GO
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3603, 1092, 38, NULL, NULL, 1, CAST(0x0000A72601104AB3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3604, 1092, 41, NULL, NULL, 1, CAST(0x0000A72601104BBA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3605, 1092, 42, NULL, NULL, 1, CAST(0x0000A72601104E45 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3606, 1092, 57, NULL, NULL, 1, CAST(0x0000A72601104F5A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3607, 1092, 26, NULL, NULL, 1, CAST(0x0000A726011050C3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3608, 1092, 43, NULL, NULL, 1, CAST(0x0000A7260110521E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3609, 1092, 44, NULL, NULL, 1, CAST(0x0000A72601105382 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3610, 1092, 87, NULL, NULL, 1, CAST(0x0000A72601105536 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3611, 1092, 90, NULL, NULL, 1, CAST(0x0000A726011056A8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3612, 1092, 79, NULL, NULL, 1, CAST(0x0000A726011062F2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3613, 1092, 80, NULL, NULL, 1, CAST(0x0000A726011063F3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3614, 1092, 91, NULL, NULL, 1, CAST(0x0000A726011064BD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3615, 1092, 92, NULL, NULL, 1, CAST(0x0000A7260110659E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3616, 1092, 93, NULL, NULL, 1, CAST(0x0000A726011066E6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3617, 1092, 75, NULL, NULL, 1, CAST(0x0000A726011067C7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3618, 1092, 81, NULL, NULL, 1, CAST(0x0000A7260110684F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3619, 1092, 83, NULL, NULL, 1, CAST(0x0000A7260110694C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3620, 1092, 84, NULL, NULL, 1, CAST(0x0000A72601106A49 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3621, 1092, 61, NULL, NULL, 1, CAST(0x0000A72601106B3D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3622, 1092, 67, NULL, NULL, 1, CAST(0x0000A72601106C0B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3623, 1092, 68, NULL, NULL, 1, CAST(0x0000A72601106D1B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3624, 1092, 63, NULL, NULL, 1, CAST(0x0000A726011084DB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3625, 1092, 65, NULL, NULL, 1, CAST(0x0000A7260110863A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3626, 1092, 72, NULL, NULL, 1, CAST(0x0000A72601108741 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3627, 1092, 96, NULL, NULL, 1, CAST(0x0000A72601108847 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3628, 1092, 97, NULL, NULL, 1, CAST(0x0000A72601108953 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3629, 1092, 1, NULL, NULL, 1, CAST(0x0000A726011089BE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3630, 1092, 98, NULL, NULL, 1, CAST(0x0000A72601108A54 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3631, 1092, 99, NULL, NULL, 1, CAST(0x0000A72601108ABC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3632, 1092, 100, NULL, NULL, 1, CAST(0x0000A72601108B64 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3633, 1092, 27, NULL, NULL, 1, CAST(0x0000A72601108C4F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3634, 1092, 28, NULL, NULL, 1, CAST(0x0000A72601108CB6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3635, 1092, 29, NULL, NULL, 1, CAST(0x0000A72601108D47 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3636, 1092, 35, NULL, NULL, 1, CAST(0x0000A72601108DB8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3637, 1092, 36, NULL, NULL, 1, CAST(0x0000A72601108EBE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3638, 1092, 37, NULL, NULL, 1, CAST(0x0000A72601108F59 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3639, 1092, 32, NULL, NULL, 1, CAST(0x0000A7260110D35A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3640, 1092, 39, NULL, NULL, 1, CAST(0x0000A7260110D440 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3641, 1092, 40, NULL, NULL, 1, CAST(0x0000A7260110D499 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3642, 1092, 45, NULL, NULL, 1, CAST(0x0000A7260110D546 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3643, 1092, 66, NULL, NULL, 1, CAST(0x0000A7260110D5B7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3644, 1092, 59, NULL, NULL, 1, CAST(0x0000A7260110D6AF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3645, 1092, 60, NULL, NULL, 1, CAST(0x0000A7260110D71B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3646, 1092, 62, NULL, NULL, 1, CAST(0x0000A7260110D766 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3647, 1092, 69, NULL, NULL, 1, CAST(0x0000A7260110D8AE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3648, 1110, 31, NULL, NULL, 0, CAST(0x0000A7260133F2DE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3649, 1110, 33, NULL, NULL, 1, CAST(0x0000A7260133F5F1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3650, 1110, 34, NULL, NULL, 1, CAST(0x0000A7260133F722 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3651, 1110, 50, NULL, NULL, 1, CAST(0x0000A7260133F75A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3652, 1110, 64, NULL, NULL, 1, CAST(0x0000A7260133F9B7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3653, 1110, 49, NULL, NULL, 1, CAST(0x0000A7260133FAB4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3654, 1110, 58, NULL, NULL, 1, CAST(0x0000A7260133FCF9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3655, 1110, 74, NULL, NULL, 1, CAST(0x0000A7260133FF6D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3656, 1092, 70, NULL, NULL, 1, CAST(0x0000A72700B65FEB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3657, 1092, 71, NULL, NULL, 1, CAST(0x0000A72700B66057 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3658, 1092, 73, NULL, NULL, 1, CAST(0x0000A72700B66112 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3659, 1092, 85, NULL, NULL, 1, CAST(0x0000A72700B661D7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3660, 1092, 86, NULL, NULL, 1, CAST(0x0000A72700B662AF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3661, 1092, 82, NULL, NULL, 1, CAST(0x0000A72700B66373 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3662, 1092, 88, NULL, NULL, 1, CAST(0x0000A72700B66434 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3663, 1092, 94, NULL, NULL, 1, CAST(0x0000A72700B677B4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3664, 1092, 95, NULL, NULL, 1, CAST(0x0000A72700B678EE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3665, 1112, 31, NULL, NULL, 1, CAST(0x0000A72700FDFC2E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3666, 1117, 31, NULL, NULL, 1, CAST(0x0000A72800C444B0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3667, 1117, 33, NULL, NULL, 1, CAST(0x0000A7280110A4DF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3668, 1110, 46, NULL, NULL, 1, CAST(0x0000A728013CC2C6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3669, 1110, 7, NULL, NULL, 0, CAST(0x0000A728014390EA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3670, 1119, 31, NULL, NULL, 1, CAST(0x0000A729000761C6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3671, 1110, 8, NULL, NULL, 1, CAST(0x0000A72900B89AE3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3672, 1130, 31, NULL, NULL, 1, CAST(0x0000A72A00A6C0A9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3673, 1131, 31, NULL, NULL, 1, CAST(0x0000A72A00C055C8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3674, 1131, 33, NULL, NULL, 1, CAST(0x0000A72A00C05BF3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3675, 1131, 34, NULL, NULL, 1, CAST(0x0000A72A00C064E3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3676, 1131, 49, NULL, NULL, 1, CAST(0x0000A72A00C086B9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3677, 1131, 50, NULL, NULL, 1, CAST(0x0000A72A00C08D0B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3678, 1131, 58, NULL, NULL, 1, CAST(0x0000A72A00C10F49 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3679, 1131, 64, NULL, NULL, 1, CAST(0x0000A72A00C11347 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3680, 1131, 74, NULL, NULL, 1, CAST(0x0000A72A00C11B34 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3681, 1131, 46, NULL, NULL, 1, CAST(0x0000A72A00C1654A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3682, 1131, 47, NULL, NULL, 1, CAST(0x0000A72A00C16A45 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3683, 1131, 48, NULL, NULL, 1, CAST(0x0000A72A00C17855 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3684, 1131, 51, NULL, NULL, 1, CAST(0x0000A72A00C19124 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3685, 1131, 53, NULL, NULL, 1, CAST(0x0000A72A00C19604 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3686, 1131, 54, NULL, NULL, 1, CAST(0x0000A72A00C19B7D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3687, 1131, 76, NULL, NULL, 1, CAST(0x0000A72A00C1A0FB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3688, 1131, 38, NULL, NULL, 1, CAST(0x0000A72A00C1BDA3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3689, 1131, 55, NULL, NULL, 1, CAST(0x0000A72A00C1CA4A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3690, 1131, 41, NULL, NULL, 1, CAST(0x0000A72A00C3ACEB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3691, 1131, 42, NULL, NULL, 1, CAST(0x0000A72A00C3B095 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3692, 1131, 56, NULL, NULL, 1, CAST(0x0000A72A00C3B769 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3693, 1131, 57, NULL, NULL, 0, CAST(0x0000A72A00C3BC93 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3694, 1131, 78, NULL, NULL, 0, CAST(0x0000A72A00C3C6B3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3695, 1131, 26, NULL, NULL, 1, CAST(0x0000A72A00C4C355 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3696, 1131, 43, NULL, NULL, 1, CAST(0x0000A72A00C4C80E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3697, 1131, 44, NULL, NULL, 1, CAST(0x0000A72A00C4CE5B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3698, 1131, 87, NULL, NULL, 1, CAST(0x0000A72A00C4D2BB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3699, 1131, 79, NULL, NULL, 1, CAST(0x0000A72A00C5154A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3700, 1131, 90, NULL, NULL, 1, CAST(0x0000A72A00C51935 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3701, 1131, 80, NULL, NULL, 1, CAST(0x0000A72A00C54154 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3702, 1131, 81, NULL, NULL, 1, CAST(0x0000A72A00C563CE AS DateTime))
GO
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3703, 1131, 83, NULL, NULL, 1, CAST(0x0000A72A00C5C318 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3704, 1131, 84, NULL, NULL, 1, CAST(0x0000A72A00C5C6F5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3705, 1131, 72, NULL, NULL, 1, CAST(0x0000A72A00C5E271 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3706, 1131, 75, NULL, NULL, 1, CAST(0x0000A72A00C5E5EC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3707, 1131, 91, NULL, NULL, 1, CAST(0x0000A72A00C5E979 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3708, 1131, 92, NULL, NULL, 1, CAST(0x0000A72A00C60D9E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3709, 1131, 93, NULL, NULL, 1, CAST(0x0000A72A00C61114 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3710, 1131, 61, NULL, NULL, 1, CAST(0x0000A72A00C6158C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3711, 1131, 63, NULL, NULL, 1, CAST(0x0000A72A00C6834D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3712, 1131, 65, NULL, NULL, 1, CAST(0x0000A72A00C686B9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3713, 1131, 67, NULL, NULL, 1, CAST(0x0000A72A00C694BB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3714, 1131, 68, NULL, NULL, 1, CAST(0x0000A72A00C6C708 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3715, 1131, 96, NULL, NULL, 1, CAST(0x0000A72A00C6CA2E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3716, 1131, 1, NULL, NULL, 1, CAST(0x0000A72A00C6E783 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3717, 1131, 97, NULL, NULL, 0, CAST(0x0000A72A00C6F2EC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3718, 1131, 98, NULL, NULL, 1, CAST(0x0000A72A00C6F6F3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3719, 1131, 27, NULL, NULL, 1, CAST(0x0000A72A00C72490 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3720, 1131, 28, NULL, NULL, 1, CAST(0x0000A72A00C73EB6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3721, 1131, 29, NULL, NULL, 1, CAST(0x0000A72A00C76456 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3722, 1131, 35, NULL, NULL, 1, CAST(0x0000A72A00C78501 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3723, 1131, 36, NULL, NULL, 1, CAST(0x0000A72A00C7B537 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3724, 1131, 37, NULL, NULL, 1, CAST(0x0000A72A00C7DA59 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3725, 1131, 39, NULL, NULL, 1, CAST(0x0000A72A00C80EB3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3726, 1131, 32, NULL, NULL, 1, CAST(0x0000A72A00C830A1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3727, 1131, 40, NULL, NULL, 1, CAST(0x0000A72A00C84C76 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3728, 1131, 45, NULL, NULL, 1, CAST(0x0000A72A00C8D5EB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3729, 1131, 59, NULL, NULL, 1, CAST(0x0000A72A00C91F1B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3730, 1131, 62, NULL, NULL, 1, CAST(0x0000A72A00C92364 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3731, 1131, 60, NULL, NULL, 1, CAST(0x0000A72A00C9827F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3732, 1131, 66, NULL, NULL, 1, CAST(0x0000A72A00CAE88A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3733, 1131, 69, NULL, NULL, 1, CAST(0x0000A72A00CB1384 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3734, 1131, 70, NULL, NULL, 1, CAST(0x0000A72A00CB1753 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3735, 1131, 71, NULL, NULL, 1, CAST(0x0000A72A00CB1B14 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3736, 1131, 99, NULL, NULL, 1, CAST(0x0000A72A00CB1EC6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3737, 1131, 100, NULL, NULL, 1, CAST(0x0000A72A00CB2259 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3738, 1131, 73, NULL, NULL, 0, CAST(0x0000A72A00CB2610 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3739, 1131, 82, NULL, NULL, 1, CAST(0x0000A72A00CB9690 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3740, 1131, 85, NULL, NULL, 1, CAST(0x0000A72A00CBCDE6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3741, 1131, 86, NULL, NULL, 1, CAST(0x0000A72A00CBD161 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3742, 1131, 77, NULL, NULL, 1, CAST(0x0000A72A00CC0448 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3743, 1131, 88, NULL, NULL, 1, CAST(0x0000A72A00CC0820 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3744, 1131, 24, NULL, NULL, 1, CAST(0x0000A72A00CC219D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3745, 1131, 22, NULL, NULL, 1, CAST(0x0000A72A00CC3A3E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3746, 1131, 89, NULL, NULL, 1, CAST(0x0000A72A00CC3E99 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3747, 1131, 94, NULL, NULL, 1, CAST(0x0000A72A00CC4349 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3748, 1131, 23, NULL, NULL, 1, CAST(0x0000A72A00CC6D20 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3749, 1131, 30, NULL, NULL, 1, CAST(0x0000A72A00CC705E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3750, 1131, 52, NULL, NULL, 1, CAST(0x0000A72A00CC7384 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3751, 1131, 95, NULL, NULL, 1, CAST(0x0000A72A00CC7708 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3752, 1131, 101, NULL, NULL, 1, CAST(0x0000A72A00CC8080 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3753, 1131, 2, NULL, NULL, 1, CAST(0x0000A72A00CCA719 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3754, 1131, 3, NULL, NULL, 1, CAST(0x0000A72A00CCA9B7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3755, 1131, 21, NULL, NULL, 1, CAST(0x0000A72A00CCF659 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3756, 1131, 25, NULL, NULL, 1, CAST(0x0000A72A00CCF9B7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3757, 1130, 33, NULL, NULL, 1, CAST(0x0000A72A00CD3D64 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3758, 1130, 34, NULL, NULL, 1, CAST(0x0000A72A00CD40B9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3759, 1130, 49, NULL, NULL, 1, CAST(0x0000A72A00CE6C1E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3760, 1130, 50, NULL, NULL, 1, CAST(0x0000A72A00CE70FD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3761, 1130, 58, NULL, NULL, 1, CAST(0x0000A72A00CE7461 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3762, 1130, 64, NULL, NULL, 1, CAST(0x0000A72A00CE77F7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3763, 1130, 74, NULL, NULL, 1, CAST(0x0000A72A00CE7AB6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3764, 1130, 46, NULL, NULL, 1, CAST(0x0000A72A00ED7707 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3765, 1130, 47, NULL, NULL, 1, CAST(0x0000A72A00ED79FA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3766, 1130, 48, NULL, NULL, 1, CAST(0x0000A72A00ED7DA3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3767, 1130, 76, NULL, NULL, 1, CAST(0x0000A72A00ED826B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3768, 1130, 51, NULL, NULL, 1, CAST(0x0000A72A00EDA195 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3769, 1130, 53, NULL, NULL, 1, CAST(0x0000A72A00EDA462 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3770, 1130, 54, NULL, NULL, 1, CAST(0x0000A72A00EDA72F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3771, 1130, 55, NULL, NULL, 1, CAST(0x0000A72A00EDAABD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3772, 1130, 78, NULL, NULL, 1, CAST(0x0000A72A00EDAD9C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3773, 1130, 38, NULL, NULL, 1, CAST(0x0000A72A00EDDCFB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3774, 1130, 41, NULL, NULL, 1, CAST(0x0000A72A00EDDFC4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3775, 1130, 42, NULL, NULL, 1, CAST(0x0000A72A00EDE2F3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3776, 1130, 56, NULL, NULL, 1, CAST(0x0000A72A00EDE619 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3777, 1130, 57, NULL, NULL, 1, CAST(0x0000A72A00EDE97D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3778, 1130, 26, NULL, NULL, 1, CAST(0x0000A72A00EDECEE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3779, 1130, 43, NULL, NULL, 1, CAST(0x0000A72A010399E9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3780, 1130, 44, NULL, NULL, 1, CAST(0x0000A72A01044FA0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3781, 1130, 87, NULL, NULL, 1, CAST(0x0000A72A010455AF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3782, 1130, 90, NULL, NULL, 1, CAST(0x0000A72A01045D02 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3783, 1130, 91, NULL, NULL, 1, CAST(0x0000A72A010462F1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3784, 1130, 79, NULL, NULL, 1, CAST(0x0000A72A010636F1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3785, 1130, 80, NULL, NULL, 1, CAST(0x0000A72A01063E15 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3786, 1130, 81, NULL, NULL, 1, CAST(0x0000A72A0106446B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3787, 1130, 92, NULL, NULL, 1, CAST(0x0000A72A01064A89 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3788, 1130, 93, NULL, NULL, 1, CAST(0x0000A72A01065112 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3789, 1130, 72, NULL, NULL, 1, CAST(0x0000A72A01065585 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3790, 1130, 75, NULL, NULL, 1, CAST(0x0000A72A01065A4C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3791, 1130, 61, NULL, NULL, 1, CAST(0x0000A72A0108B219 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3792, 1130, 67, NULL, NULL, 1, CAST(0x0000A72A0108B7FA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3793, 1130, 68, NULL, NULL, 1, CAST(0x0000A72A0108C951 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3794, 1130, 83, NULL, NULL, 1, CAST(0x0000A72A0108CE92 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3795, 1130, 84, NULL, NULL, 1, CAST(0x0000A72A0108E57A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3796, 1130, 63, NULL, NULL, 1, CAST(0x0000A72A0108EA54 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3797, 1130, 65, NULL, NULL, 1, CAST(0x0000A72A01094898 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3798, 1130, 96, NULL, NULL, 1, CAST(0x0000A72A01094E08 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3799, 1130, 97, NULL, NULL, 1, CAST(0x0000A72A01095763 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3800, 1130, 98, NULL, NULL, 1, CAST(0x0000A72A01095EF3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3801, 1130, 99, NULL, NULL, 1, CAST(0x0000A72A0109629D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3802, 1130, 1, NULL, NULL, 1, CAST(0x0000A72A0109BC6D AS DateTime))
GO
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3803, 1130, 27, NULL, NULL, 1, CAST(0x0000A72A0109F00B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3804, 1130, 28, NULL, NULL, 1, CAST(0x0000A72A010A9A83 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3805, 1130, 100, NULL, NULL, 1, CAST(0x0000A72A010C8D3D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3806, 1130, 29, NULL, NULL, 1, CAST(0x0000A72A010CE5AE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3807, 1130, 35, NULL, NULL, 1, CAST(0x0000A72A010CE9B5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3808, 1130, 36, NULL, NULL, 1, CAST(0x0000A72A010CEFC9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3809, 1130, 37, NULL, NULL, 0, CAST(0x0000A72A010CEFEA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3810, 1130, 32, NULL, NULL, 0, CAST(0x0000A72A010CF04C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3811, 1110, 9, NULL, NULL, 1, CAST(0x0000A72B00170AA3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3812, 1110, 47, NULL, NULL, 1, CAST(0x0000A72B00176F62 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3813, 1110, 48, NULL, NULL, 0, CAST(0x0000A72B009D4DB2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3814, 1110, 51, NULL, NULL, 1, CAST(0x0000A72B00AB49DE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3815, 1110, 53, NULL, NULL, 1, CAST(0x0000A72B00C94D70 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3816, 1130, 39, NULL, NULL, 1, CAST(0x0000A72B00EDEA37 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3817, 1130, 40, NULL, NULL, 1, CAST(0x0000A72B00EE07FD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3818, 1130, 45, NULL, NULL, 1, CAST(0x0000A72B00EE0DE7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3819, 1130, 62, NULL, NULL, 0, CAST(0x0000A72B00EE21A4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3820, 1130, 66, NULL, NULL, 1, CAST(0x0000A72B00EE2B38 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3821, 1130, 59, NULL, NULL, 0, CAST(0x0000A72B00EE3350 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3822, 1130, 60, NULL, NULL, 1, CAST(0x0000A72B00EE3B2B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3823, 1130, 69, NULL, NULL, 0, CAST(0x0000A72B00EE4CFC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3824, 1130, 70, NULL, NULL, 1, CAST(0x0000A72B00EE5B52 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3825, 1130, 71, NULL, NULL, 0, CAST(0x0000A72B00EE6161 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3826, 1130, 73, NULL, NULL, 1, CAST(0x0000A72B00EE6603 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3827, 1130, 85, NULL, NULL, 0, CAST(0x0000A72B00EE7426 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3828, 1130, 86, NULL, NULL, 0, CAST(0x0000A72B00EE7CAA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3829, 1130, 82, NULL, NULL, 0, CAST(0x0000A72B00EE88B1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3830, 1130, 88, NULL, NULL, 0, CAST(0x0000A72B00EE9180 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3831, 1130, 94, NULL, NULL, 1, CAST(0x0000A72B00EE98B2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3832, 1130, 95, NULL, NULL, 0, CAST(0x0000A72B00EEA26B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3833, 1130, 24, NULL, NULL, 0, CAST(0x0000A72B00EEB1D6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3834, 1130, 77, NULL, NULL, 1, CAST(0x0000A72B00EEC4EF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3835, 1130, 89, NULL, NULL, 1, CAST(0x0000A72B00EECCAE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3836, 1130, 101, NULL, NULL, 0, CAST(0x0000A72B00EED370 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3837, 1130, 22, NULL, NULL, 1, CAST(0x0000A72B00EEE0EA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3838, 1130, 23, NULL, NULL, 1, CAST(0x0000A72B00EEE663 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3839, 1130, 30, NULL, NULL, 0, CAST(0x0000A72B00EEFF38 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3840, 1130, 52, NULL, NULL, 0, CAST(0x0000A72B00F02A73 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3841, 1130, 2, NULL, NULL, 1, CAST(0x0000A72B0123DEA0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3842, 1130, 3, NULL, NULL, 0, CAST(0x0000A72B012533C0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3843, 1130, 21, NULL, NULL, 0, CAST(0x0000A72B01253F74 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3844, 1130, 25, NULL, NULL, 0, CAST(0x0000A72B01255ACF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3845, 1130, 4, NULL, NULL, 0, CAST(0x0000A72B01259B3E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3846, 1130, 5, NULL, NULL, 1, CAST(0x0000A72B0125AE24 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3847, 1130, 6, NULL, NULL, 1, CAST(0x0000A72B0125BBDB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3848, 1099, 49, NULL, NULL, 1, CAST(0x0000A72C00EE105E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3849, 1099, 58, NULL, NULL, 1, CAST(0x0000A72C00EE3857 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3850, 1099, 64, NULL, NULL, 1, CAST(0x0000A72C00EE530E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3851, 1099, 46, NULL, NULL, 1, CAST(0x0000A72C00EF2B2D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3852, 1132, 31, NULL, NULL, 1, CAST(0x0000A72C0134038E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3853, 1132, 33, NULL, NULL, 1, CAST(0x0000A72C013421FC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3854, 1132, 34, NULL, NULL, 1, CAST(0x0000A72C01342784 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3855, 1132, 50, NULL, NULL, 1, CAST(0x0000A72C01342C39 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3856, 1132, 64, NULL, NULL, 1, CAST(0x0000A72C013433E5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3857, 1133, 31, NULL, NULL, 0, CAST(0x0000A72C01351CEE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3858, 1133, 33, NULL, NULL, 0, CAST(0x0000A72C013524F8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3859, 1133, 34, NULL, NULL, 0, CAST(0x0000A72C01352653 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3860, 1133, 50, NULL, NULL, 0, CAST(0x0000A72C01352C47 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3861, 1133, 64, NULL, NULL, 0, CAST(0x0000A72C01353406 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3862, 1133, 49, NULL, NULL, 1, CAST(0x0000A72C013598E5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3863, 1133, 58, NULL, NULL, 1, CAST(0x0000A72C01359C77 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3864, 1133, 46, NULL, NULL, 1, CAST(0x0000A72C013980AB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3865, 1133, 47, NULL, NULL, 0, CAST(0x0000A72C0143D230 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3866, 1133, 48, NULL, NULL, 0, CAST(0x0000A72C0143DA85 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3867, 1133, 74, NULL, NULL, 0, CAST(0x0000A72C0143E39A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3868, 1133, 76, NULL, NULL, 0, CAST(0x0000A72C0143E85D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3869, 1133, 78, NULL, NULL, 0, CAST(0x0000A72C0143EE7F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3870, 1133, 51, NULL, NULL, 0, CAST(0x0000A72C0143F570 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3871, 1133, 53, NULL, NULL, 1, CAST(0x0000A72C014451B9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3872, 1133, 54, NULL, NULL, 0, CAST(0x0000A72C01445B72 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3873, 1133, 55, NULL, NULL, 0, CAST(0x0000A72C01445FEA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3874, 1133, 38, NULL, NULL, 0, CAST(0x0000A72C01446490 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3875, 1133, 41, NULL, NULL, 0, CAST(0x0000A72C01446F1C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3876, 1133, 56, NULL, NULL, 0, CAST(0x0000A72C0144A2B6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3877, 1110, 54, NULL, NULL, 1, CAST(0x0000A72C01547056 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3878, 1110, 55, NULL, NULL, 1, CAST(0x0000A72C0154904F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3879, 1133, 26, NULL, NULL, 0, CAST(0x0000A72C015E32CC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3880, 1133, 42, NULL, NULL, 1, CAST(0x0000A72C015E3B09 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3881, 1133, 43, NULL, NULL, 0, CAST(0x0000A72C015E4697 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3882, 1133, 44, NULL, NULL, 0, CAST(0x0000A72C015E5091 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3883, 1133, 57, NULL, NULL, 0, CAST(0x0000A72C015E5CD6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3884, 1133, 87, NULL, NULL, 1, CAST(0x0000A72C015E65BC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3885, 1133, 90, NULL, NULL, 1, CAST(0x0000A72C015E7109 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3886, 1133, 91, NULL, NULL, 1, CAST(0x0000A72C015E7A30 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3887, 1133, 92, NULL, NULL, 0, CAST(0x0000A72C015E83D6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3888, 1133, 79, NULL, NULL, 0, CAST(0x0000A72C015E9058 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3889, 1133, 80, NULL, NULL, 0, CAST(0x0000A72C015E9858 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3890, 1133, 81, NULL, NULL, 0, CAST(0x0000A72C015E9F03 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3891, 1133, 93, NULL, NULL, 0, CAST(0x0000A72C015EA6F5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3892, 1133, 72, NULL, NULL, 1, CAST(0x0000A72C015EB848 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3893, 1133, 75, NULL, NULL, 1, CAST(0x0000A72C015ECCA9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3894, 1133, 83, NULL, NULL, 1, CAST(0x0000A72C015ED58F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3895, 1133, 84, NULL, NULL, 1, CAST(0x0000A72C015EDE0E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3896, 1133, 61, NULL, NULL, 0, CAST(0x0000A72C015EE480 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3897, 1133, 63, NULL, NULL, 0, CAST(0x0000A72C015EF504 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3898, 1133, 67, NULL, NULL, 0, CAST(0x0000A72C015EFE14 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3899, 1133, 68, NULL, NULL, 0, CAST(0x0000A72C015F0628 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3900, 1133, 65, NULL, NULL, 1, CAST(0x0000A72C015F1483 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3901, 1133, 96, NULL, NULL, 0, CAST(0x0000A72C015F1CE5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3902, 1133, 97, NULL, NULL, 0, CAST(0x0000A72C015F2714 AS DateTime))
GO
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3903, 1133, 98, NULL, NULL, 0, CAST(0x0000A72C015F33CE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3904, 1133, 1, NULL, NULL, 0, CAST(0x0000A72C015F404F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3905, 1133, 27, NULL, NULL, 0, CAST(0x0000A72C015F4736 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3906, 1133, 99, NULL, NULL, 1, CAST(0x0000A72C015F4CA2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3907, 1133, 100, NULL, NULL, 0, CAST(0x0000A72C015F529A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3908, 1133, 28, NULL, NULL, 0, CAST(0x0000A72C015F5BF5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3909, 1133, 29, NULL, NULL, 1, CAST(0x0000A72C015F65AA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3910, 1133, 35, NULL, NULL, 0, CAST(0x0000A72C015FB7A8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3911, 1133, 36, NULL, NULL, 0, CAST(0x0000A72C015FC048 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3912, 1133, 37, NULL, NULL, 0, CAST(0x0000A72C015FC8ED AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3913, 1133, 39, NULL, NULL, 0, CAST(0x0000A72C015FD175 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3914, 1133, 40, NULL, NULL, 0, CAST(0x0000A72C015FD971 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3915, 1133, 45, NULL, NULL, 0, CAST(0x0000A72C015FE6A4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3916, 1133, 32, NULL, NULL, 1, CAST(0x0000A72C015FEEF0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3917, 1133, 59, NULL, NULL, 1, CAST(0x0000A72C0160018F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3918, 1133, 62, NULL, NULL, 0, CAST(0x0000A72C01600A3D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3919, 1133, 66, NULL, NULL, 0, CAST(0x0000A72C01601462 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3920, 1133, 60, NULL, NULL, 0, CAST(0x0000A72C01602A98 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3921, 1133, 69, NULL, NULL, 0, CAST(0x0000A72C0160387D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3922, 1133, 70, NULL, NULL, 0, CAST(0x0000A72C01604943 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3923, 1133, 71, NULL, NULL, 0, CAST(0x0000A72C01605169 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3924, 1133, 73, NULL, NULL, 0, CAST(0x0000A72C01605602 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3925, 1133, 82, NULL, NULL, 0, CAST(0x0000A72C01606080 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3926, 1133, 85, NULL, NULL, 0, CAST(0x0000A72C016076B1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3927, 1133, 86, NULL, NULL, 1, CAST(0x0000A72C01608053 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3928, 1133, 88, NULL, NULL, 0, CAST(0x0000A72C01608D16 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3929, 1133, 89, NULL, NULL, 1, CAST(0x0000A72C01609C15 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3930, 1133, 94, NULL, NULL, 0, CAST(0x0000A72C0160B16A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3931, 1133, 95, NULL, NULL, 0, CAST(0x0000A72C0160BBD5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3932, 1133, 22, NULL, NULL, 1, CAST(0x0000A72C0160C767 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3933, 1133, 24, NULL, NULL, 0, CAST(0x0000A72C0160D222 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3934, 1133, 77, NULL, NULL, 1, CAST(0x0000A72C0160DBF7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3935, 1133, 101, NULL, NULL, 0, CAST(0x0000A72C0160E73F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3936, 1133, 21, NULL, NULL, 1, CAST(0x0000A72C0160EF6A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3937, 1133, 23, NULL, NULL, 0, CAST(0x0000A72C0160FF87 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3938, 1133, 30, NULL, NULL, 0, CAST(0x0000A72C01610B5B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3939, 1133, 52, NULL, NULL, 0, CAST(0x0000A72C0161183F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3940, 1133, 2, NULL, NULL, 0, CAST(0x0000A72C016125BE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3941, 1133, 3, NULL, NULL, 0, CAST(0x0000A72C01612F2B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3942, 1133, 25, NULL, NULL, 0, CAST(0x0000A72C01613370 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3943, 1132, 49, NULL, NULL, 1, CAST(0x0000A72D0010B2FF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3944, 1099, 47, 1, NULL, 1, CAST(0x0000A72D00B3B3F7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3945, 1131, 4, NULL, NULL, 1, CAST(0x0000A72D00C15AF5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3946, 1131, 5, NULL, NULL, 1, CAST(0x0000A72D00C16003 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3947, 1131, 6, NULL, NULL, 1, CAST(0x0000A72D00C165A2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3948, 1134, 31, NULL, NULL, 1, CAST(0x0000A72D00F1078C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3949, 1134, 33, NULL, NULL, 1, CAST(0x0000A72D00F11649 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3950, 1134, 34, NULL, NULL, 1, CAST(0x0000A72D00F19ECB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3951, 1134, 49, NULL, NULL, 0, CAST(0x0000A72D00F1A0D8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3952, 1134, 50, NULL, NULL, 0, CAST(0x0000A72D00F1A258 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3953, 1134, 58, NULL, NULL, 0, CAST(0x0000A72D00F1A2EE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3954, 1134, 64, NULL, NULL, 0, CAST(0x0000A72D00F1A34B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3955, 1134, 46, NULL, NULL, 0, CAST(0x0000A72D00F1A3E1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3956, 1134, 74, NULL, NULL, 0, CAST(0x0000A72D00F1A449 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3957, 1134, 76, NULL, NULL, 0, CAST(0x0000A72D00F1A473 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3958, 1134, 78, NULL, NULL, 0, CAST(0x0000A72D00F23345 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3959, 1134, 47, NULL, NULL, 0, CAST(0x0000A72D00F235E4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3960, 1134, 48, NULL, NULL, 1, CAST(0x0000A72D00F3D8B0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3961, 1134, 51, NULL, NULL, 1, CAST(0x0000A72D00F3DE12 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3962, 1134, 53, NULL, NULL, 1, CAST(0x0000A72D00F3E1EB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3963, 1134, 38, NULL, NULL, 1, CAST(0x0000A72D00F8734E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3964, 1134, 54, NULL, NULL, 1, CAST(0x0000A72D00F878D1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3965, 1134, 55, NULL, NULL, 1, CAST(0x0000A72D00F87E25 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3966, 1134, 56, NULL, NULL, 0, CAST(0x0000A72D00F87E95 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3967, 1134, 41, NULL, NULL, 1, CAST(0x0000A72D00F9454F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3968, 1134, 42, NULL, NULL, 1, CAST(0x0000A72D00F949DE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3969, 1134, 43, NULL, NULL, 1, CAST(0x0000A72D00F950EF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3970, 1134, 44, NULL, NULL, 0, CAST(0x0000A72D00F95135 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3971, 1134, 26, NULL, NULL, 1, CAST(0x0000A72D00FB5CB1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3972, 1134, 57, NULL, NULL, 0, CAST(0x0000A72D00FB6124 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3973, 1134, 87, NULL, NULL, 1, CAST(0x0000A72D00FB658D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3974, 1134, 91, NULL, NULL, 1, CAST(0x0000A72D00FB719E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3975, 1134, 79, NULL, NULL, 1, CAST(0x0000A72D01022EA8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3976, 1134, 80, NULL, NULL, 1, CAST(0x0000A72D010244AB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3977, 1134, 90, NULL, NULL, 1, CAST(0x0000A72D010253AA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3978, 1134, 81, NULL, NULL, 1, CAST(0x0000A72D010A3AB0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3979, 1134, 75, NULL, NULL, 1, CAST(0x0000A72D010C29E6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3980, 1134, 83, NULL, NULL, 1, CAST(0x0000A72D010C3094 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3981, 1134, 84, NULL, NULL, 1, CAST(0x0000A72D010C35C3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3982, 1134, 92, NULL, NULL, 1, CAST(0x0000A72D010C3A65 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3983, 1132, 46, NULL, NULL, 1, CAST(0x0000A72D015D15CB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3984, 1132, 58, NULL, NULL, 1, CAST(0x0000A72D015D1A77 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3985, 1132, 74, NULL, NULL, 1, CAST(0x0000A72D015D1E91 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3986, 1132, 76, NULL, NULL, 1, CAST(0x0000A72D015D229C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3987, 1132, 78, NULL, NULL, 1, CAST(0x0000A72D015D27C6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3988, 1132, 47, NULL, NULL, 0, CAST(0x0000A72D015D4DA4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3989, 1132, 48, NULL, NULL, 0, CAST(0x0000A72D015D5393 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3990, 1132, 51, NULL, NULL, 0, CAST(0x0000A72D015DBA0F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3991, 1132, 53, NULL, NULL, 1, CAST(0x0000A72D015DBDDE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3992, 1132, 54, NULL, NULL, 1, CAST(0x0000A72D015DC37D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3993, 1132, 55, NULL, NULL, 1, CAST(0x0000A72D015DCB8B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3994, 1132, 56, NULL, NULL, 1, CAST(0x0000A72D015E0990 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3995, 1132, 57, NULL, NULL, 1, CAST(0x0000A72D015EA31D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3996, 1132, 38, NULL, NULL, 1, CAST(0x0000A72D015EA6F1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3997, 1132, 41, NULL, NULL, 1, CAST(0x0000A72D015EAA2A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3998, 1132, 42, NULL, NULL, 1, CAST(0x0000A72D015EADFE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3999, 1134, 61, NULL, NULL, 1, CAST(0x0000A72E01134E47 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4000, 1134, 67, NULL, NULL, 0, CAST(0x0000A72E011352BA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4001, 1099, 48, NULL, NULL, 1, CAST(0x0000A72E01144A65 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4002, 1099, 51, NULL, NULL, 1, CAST(0x0000A72E011475AE AS DateTime))
GO
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4003, 1099, 53, 1, NULL, 1, CAST(0x0000A72E0115E1FD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4004, 1099, 54, NULL, NULL, 1, CAST(0x0000A72E01161076 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4005, 1099, 55, 1, NULL, 1, CAST(0x0000A72E01165676 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4006, 1099, 56, NULL, NULL, 1, CAST(0x0000A72E01169727 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4007, 1099, 57, 1, NULL, 1, CAST(0x0000A72E01175566 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4008, 1110, 38, NULL, NULL, 1, CAST(0x0000A72F0012661B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4009, 1110, 56, NULL, NULL, 1, CAST(0x0000A72F001268B5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4010, 1110, 57, NULL, NULL, 0, CAST(0x0000A72F00128C8A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4011, 1137, 31, NULL, NULL, 1, CAST(0x0000A72F010EDEC6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4012, 1137, 33, NULL, NULL, 1, CAST(0x0000A72F010EE318 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4013, 1137, 46, NULL, NULL, 1, CAST(0x0000A72F010EE78C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4014, 1137, 50, 1, NULL, 1, CAST(0x0000A72F010F0B08 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4015, 1137, 64, NULL, NULL, 1, CAST(0x0000A72F010F419D AS DateTime))
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

INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (1, N'سوالات مردم', N'سوالات مردم', N'سوالات مردم', N'#cb13d7', N'#8f0d97', N'#9410a6', 100, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (2, N'ورزشی', N'ورزشی', N'ورزشی', N'#1ec2bc', N'#157e7a', N'#158b87', 150, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6F000000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (5, N'خانوادگی', N'خانوادگی', N'خانوادگی', N'#0d27e9', N'#102095', N'#091ba1', 50, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6F000000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (6, N'سیاسی', N'سیاسی', N'سیاسی', N'#0d27e9', N'#0048bb', N'#0027e9', 100, CAST(0x0000A70B00000000 AS DateTime), CAST(0x0000A81200000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (7, N'بزرگسال', N'بزرگسال', N'بزرگسال', N'#0d27e9', N'#d30838', N'#0027e9', 15, CAST(0x0000A70B00000000 AS DateTime), CAST(0x0000A6F700000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (8, N'اجتماعی اقتصادی', N'اجتماعی اقتصادی', N'اجتماعی اقتصادی', N'#0d27e9', N'#c6bf09', N'#0027e9', 200, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (10, N'خنده دار', N'خنده دار', N'خنده دار', N'#0d27e9', N'#c6b309', N'#0035ee', 300, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (11, N'چالشی', N'چالشی', N'چالشی', N'#0d27e9', N'#0d27e9', N'#0d27e9', 400, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime), 2)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (12, N'سینما', N'سینما', N'سینما', N'#0d3659', N'#0d27e9', N'#0364ee', 500, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime), 2)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (13, N'چرند و پرند', N'چرند و پرند', N'چرند و پرند', N'#0e45ee', N'#03587e', N'#03ee12', 600, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime), 3)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (14, N'شوخمی تخیلی', N'شوخمی تخیلی', N'شوخمی تخیلی', N'#33eeff', N'#03548e', N'#10ee32', 700, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2080, 1101, 31, N'سلام ', NULL, 1, CAST(0x0000A7230140D99D AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2081, 1101, 38, N'بخش جدید ', NULL, 1, CAST(0x0000A7230141E5AA AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2082, 1089, 31, N'سلام', NULL, 1, CAST(0x0000A72400ACF3B3 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2083, 1089, 31, N'123', NULL, 1, CAST(0x0000A72400D3F330 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2084, 1101, 8, N'سلام کیوان', NULL, 1, CAST(0x0000A72400D882D6 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2085, 1101, 8, N'من کامنت فرستادم', NULL, 1, CAST(0x0000A72400D88FDF AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2086, 1102, 50, N'سلام', NULL, 1, CAST(0x0000A72400D9FC70 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2087, 1103, 50, N'سلام', NULL, 1, CAST(0x0000A72400DA728A AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2088, 1103, 50, N'خوبی چه خبر ', NULL, 1, CAST(0x0000A72400DA79D8 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2089, 1102, 50, N'اره', NULL, 1, CAST(0x0000A72400DACA8F AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2090, 1103, 50, N'سلام', NULL, 1, CAST(0x0000A72400DC00FA AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2091, 1103, 50, N'سلان', NULL, 1, CAST(0x0000A72400DC0292 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2092, 1102, 34, N'ترردوو', NULL, 1, CAST(0x0000A7250019549C AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2093, 1110, 46, N'زدنرزی', NULL, 1, CAST(0x0000A72800EB630C AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2094, 1110, 47, N'سلام دوستان ', NULL, 1, CAST(0x0000A72B001765EB AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2095, 1130, 25, N'hbnn', NULL, 1, CAST(0x0000A72B012550BD AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2096, 1133, 46, N'چه با مزه', NULL, 1, CAST(0x0000A72C01397873 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2097, 1133, 46, N'باا', NULL, 1, CAST(0x0000A72C013A25CB AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2098, 1133, 46, N'ازاد', NULL, 1, CAST(0x0000A72C013A2637 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2099, 1133, 46, N'اتد', NULL, 1, CAST(0x0000A72C013A275A AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2100, 1133, 46, N'ووو', NULL, 1, CAST(0x0000A72C013A287D AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2101, 1133, 46, N'بتبت', NULL, 1, CAST(0x0000A72C013A2983 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2102, 1133, 49, N'بابا', NULL, 1, CAST(0x0000A72C013AD938 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2103, 1133, 49, N'ایخا', NULL, 1, CAST(0x0000A72C013ADB8C AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2104, 1133, 49, N'ن', NULL, 1, CAST(0x0000A72C013ADF27 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2105, 1133, 49, N'اد', NULL, 1, CAST(0x0000A72C013ADF27 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2106, 1133, 49, N'بامزه بود', NULL, 1, CAST(0x0000A72C013B3248 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2107, 1133, 46, N'چه با مزه', NULL, 1, CAST(0x0000A72C01457BB5 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2108, 1099, 47, N'sasasa', NULL, 1, CAST(0x0000A72D00B3BFF1 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2109, 1099, 47, N'sasasas', NULL, 1, CAST(0x0000A72D00B3C22D AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2110, 1099, 47, N'sassas', NULL, 1, CAST(0x0000A72D00B3D34C AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2111, 1099, 47, N'asasas', NULL, 1, CAST(0x0000A72D00B524FF AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2112, 1099, 47, N'asasas', NULL, 1, CAST(0x0000A72D00B54EEE AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2113, 1134, 79, N'fhdhfghf', NULL, 1, CAST(0x0000A72D01022409 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2114, 1134, 79, N'ffthfhfhfg', NULL, 1, CAST(0x0000A72D010272CF AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2115, 1134, 79, N'hfghgfhf', NULL, 1, CAST(0x0000A72D0102F313 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2116, 1134, 90, N'1
1
1', NULL, 1, CAST(0x0000A72D01073219 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2117, 1134, 90, N'1', NULL, 1, CAST(0x0000A72D010743CA AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2118, 1134, 90, N'2', NULL, 1, CAST(0x0000A72D01074AE5 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2119, 1134, 90, N'3', NULL, 1, CAST(0x0000A72D01074DB6 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2120, 1134, 90, N'4', NULL, 1, CAST(0x0000A72D01075076 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2121, 1134, 90, N'5', NULL, 1, CAST(0x0000A72D01075270 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2122, 1134, 90, N'6', NULL, 1, CAST(0x0000A72D01075490 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2123, 1134, 90, N'7', NULL, 1, CAST(0x0000A72D01075614 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2124, 1134, 90, N'8', NULL, 1, CAST(0x0000A72D010757C9 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2125, 1134, 90, N'9', NULL, 1, CAST(0x0000A72D01075A9A AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2126, 1134, 90, N'10', NULL, 1, CAST(0x0000A72D01075BFE AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2127, 1134, 90, N'11', NULL, 1, CAST(0x0000A72D01075E02 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2128, 1134, 90, N'12', NULL, 1, CAST(0x0000A72D01075FD2 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2129, 1134, 90, N'13', NULL, 1, CAST(0x0000A72D01076178 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2130, 1132, 51, N'تست', NULL, 1, CAST(0x0000A72D015D8AC3 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2131, 1132, 51, N'تست', NULL, 1, CAST(0x0000A72D015D920D AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2132, 1132, 51, N'تست', NULL, 1, CAST(0x0000A72D015D9FCD AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2133, 1134, 61, N'h', NULL, 1, CAST(0x0000A72E00B9A654 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2134, 1134, 61, N'ryty', NULL, 1, CAST(0x0000A72E00BB30B8 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2135, 1134, 61, N'try', NULL, 1, CAST(0x0000A72E00BB3D6E AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2136, 1099, 51, N'aasas', NULL, 1, CAST(0x0000A72E01145F8B AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2137, 1099, 51, N'asassaas', NULL, 1, CAST(0x0000A72E01146119 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2138, 1099, 51, N'asasas', NULL, 1, CAST(0x0000A72E01146274 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2139, 1099, 51, N'asassas', NULL, 1, CAST(0x0000A72E0114648B AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2140, 1099, 57, N'asdasd', NULL, 1, CAST(0x0000A72E0118CC58 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2141, 1099, 57, N'asdasdd', NULL, 1, CAST(0x0000A72E0118CEED AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2142, 1099, 57, N'asd', NULL, 1, CAST(0x0000A72E0118EBA3 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2143, 1099, 57, N'sa', NULL, 1, CAST(0x0000A72E01191A46 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2144, 1099, 57, N'as', NULL, 1, CAST(0x0000A72E01191E81 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2145, 1137, 50, N'لننملز', NULL, 1, CAST(0x0000A72F010F0726 AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[CreatedQuestions] ON 

INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (26, 1089, N'تست', N'تست', CAST(0x0000A72400D495F4 AS DateTime), 2, 1, 3)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (27, 1103, N'سلام ', N'دوست داشتی ', CAST(0x0000A72400E42184 AS DateTime), 2, 1, 3)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (28, 1083, N'دوست داشتی که بخوری', N'بعد نخوری', CAST(0x0000A72D00000000 AS DateTime), 2, 1, 3)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (29, 1099, N'salam khobi koli badi ', N'chi mishod ke bad bashi ', CAST(0x0000A72D00B32FC4 AS DateTime), 2, 1, 3)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (30, 1134, N'1', N'1', CAST(0x0000A72D011C7A72 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (31, 1134, N'2', N'2', CAST(0x0000A72D011C8A07 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (32, 1134, N'3', N'3', CAST(0x0000A72D011C953C AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (33, 1132, N'1', N'1', CAST(0x0000A72D011FEDAC AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (34, 1132, N'2', N'2', CAST(0x0000A72D011FF960 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (35, 1132, N'3', N'3', CAST(0x0000A72D01200669 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (36, 1132, N'4', N'4', CAST(0x0000A72D01221BA7 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (37, 1132, N'5', N'5', CAST(0x0000A72D012227D9 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (38, 1132, N'6', N'6', CAST(0x0000A72D01223484 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (39, 1132, N'7', N'7', CAST(0x0000A72D0122403C AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (40, 1132, N'8', N'8', CAST(0x0000A72D012249CB AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (41, 1132, N'9', N'9', CAST(0x0000A72D012254AC AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (42, 1132, N'0', N'0', CAST(0x0000A72D012261D1 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (43, 1132, N'12', N'11', CAST(0x0000A72D01226CF3 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (44, 1134, N'4', N'4', CAST(0x0000A72D012DA9CC AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (45, 1134, N'5', N'5', CAST(0x0000A72D012DB39D AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (46, 1134, N'6', N'6', CAST(0x0000A72D012DBC95 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (47, 1134, N'89', N'89', CAST(0x0000A72D01365BDE AS DateTime), 2, 1, 1)
SET IDENTITY_INSERT [dbo].[CreatedQuestions] OFF
SET IDENTITY_INSERT [dbo].[CreatedQuestionsVerifyType] ON 

INSERT [dbo].[CreatedQuestionsVerifyType] ([ID], [VerifyName], [Description]) VALUES (1, N'رد شده', NULL)
INSERT [dbo].[CreatedQuestionsVerifyType] ([ID], [VerifyName], [Description]) VALUES (2, N'در حال بررسي', NULL)
INSERT [dbo].[CreatedQuestionsVerifyType] ([ID], [VerifyName], [Description]) VALUES (3, N'تاييد شده', NULL)
SET IDENTITY_INSERT [dbo].[CreatedQuestionsVerifyType] OFF
SET IDENTITY_INSERT [dbo].[Favorite] ON 

INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2119, 1099, 50, CAST(0x0000A7230144E1D6 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2120, 1099, 31, CAST(0x0000A7230144FC89 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2121, 1101, 41, CAST(0x0000A723015956A4 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2122, 1101, 42, CAST(0x0000A72400CBECB9 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2123, 1089, 31, CAST(0x0000A72400D3446A AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2124, 1101, 8, CAST(0x0000A72400D81975 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2125, 1101, 7, CAST(0x0000A72400D82414 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2126, 1102, 50, CAST(0x0000A72400DA48F5 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2127, 1102, 33, CAST(0x0000A72400DA5916 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2128, 1103, 50, CAST(0x0000A72400DA67EB AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2129, 1103, 31, CAST(0x0000A72400DC2D82 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2130, 1103, 33, CAST(0x0000A72400E9DC3A AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2131, 1117, 33, CAST(0x0000A7280110A4E4 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2132, 1110, 47, CAST(0x0000A72B00176F67 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2133, 1133, 49, CAST(0x0000A72C013598EA AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2134, 1133, 58, CAST(0x0000A72C01359C7C AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2135, 1133, 46, CAST(0x0000A72C013980AB AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2136, 1110, 55, CAST(0x0000A72C0154904F AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2137, 1099, 47, CAST(0x0000A72D00B3B3FC AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2138, 1134, 79, CAST(0x0000A72D01022EAD AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2139, 1134, 90, CAST(0x0000A72D010253AA AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2140, 1099, 51, CAST(0x0000A72E011475B3 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2141, 1099, 53, CAST(0x0000A72E0115E1FD AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2142, 1099, 55, CAST(0x0000A72E01165676 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2143, 1099, 57, CAST(0x0000A72E01176C33 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2144, 1110, 57, CAST(0x0000A72F00128C8F AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2145, 1137, 50, CAST(0x0000A72F010F0B0D AS DateTime))
SET IDENTITY_INSERT [dbo].[Favorite] OFF
SET IDENTITY_INSERT [dbo].[Level] ON 

INSERT [dbo].[Level] ([ID], [LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (1, 1, 100, 20, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[Level] ([ID], [LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (2, 2, 120, 30, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[Level] ([ID], [LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (3, 3, 140, 40, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Level] ([ID], [LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (4, 4, 150, 50, CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Level] ([ID], [LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (5, 5, 160, 60, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A70D00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Level] OFF
SET IDENTITY_INSERT [dbo].[Manufacture] ON 

INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (6, 1083, 1, CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (7, 1084, 2, CAST(0x0000A72C00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (8, 1083, 3, CAST(0x0000A74A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (9, 1084, 4, CAST(0x0000A74A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (10, 1083, 5, CAST(0x0000A74A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (11, 1084, 6, CAST(0x0000A74A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (12, 1083, 7, CAST(0x0000A74A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (13, 1084, 8, CAST(0x0000A74A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (14, 1083, 9, CAST(0x0000A74A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (15, 1084, 10, CAST(0x0000A74A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (16, 1083, 11, CAST(0x0000A74A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (17, 1084, 12, CAST(0x0000A74A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (18, 1083, 15, CAST(0x0000A74A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (19, 1084, 16, CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (20, 1083, 17, CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (21, 1084, 18, CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (22, 1083, 19, CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (23, 1084, 20, CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (24, 1083, 21, CAST(0x0000A70E00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (25, 1084, 22, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (26, 1083, 23, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (27, 1084, 24, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (28, 1085, 25, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (30, 1084, 26, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (31, 1083, 27, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (32, 1084, 28, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (33, 1083, 29, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (34, 1084, 30, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (35, 1083, 31, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (36, 1083, 32, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (37, 1084, 33, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (39, 1083, 34, CAST(0x0000A70E00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (40, 1084, 35, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (41, 1083, 36, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (42, 1084, 37, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (43, 1083, 38, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (44, 1084, 39, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (45, 1085, 40, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (48, 1084, 41, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (49, 1085, 42, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (50, 1086, 43, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (51, 1087, 44, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (52, 1088, 45, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (54, 1084, 46, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (55, 1086, 47, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (57, 1083, 48, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (58, 1084, 49, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (59, 1085, 50, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (60, 1086, 51, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (61, 1087, 52, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (62, 1083, 53, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (63, 1084, 54, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (64, 1085, 55, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (65, 1086, 56, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (66, 1087, 57, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (67, 1088, 58, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (70, 1083, 59, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (71, 1084, 60, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (72, 1085, 61, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (73, 1086, 62, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (74, 1087, 63, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (75, 1088, 64, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (77, 1083, 65, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (78, 1084, 66, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (79, 1083, 67, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (80, 1084, 68, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (81, 1083, 69, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (82, 1084, 70, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (83, 1085, 71, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (84, 1086, 72, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (85, 1087, 73, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (86, 1088, 74, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (89, 1083, 75, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (90, 1084, 76, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (91, 1085, 77, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (92, 1086, 78, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (93, 1087, 79, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (94, 1088, 80, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (96, 1083, 81, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (97, 1084, 82, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (98, 1085, 83, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (99, 1086, 84, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (100, 1087, 85, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (101, 1088, 86, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (102, 1083, 87, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (103, 1084, 88, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (104, 1085, 89, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (105, 1086, 90, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (106, 1087, 91, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (107, 1088, 92, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (109, 1083, 93, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (110, 1084, 94, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (111, 1085, 95, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (112, 1086, 96, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (113, 1087, 97, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (114, 1088, 98, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (116, 1083, 99, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (117, 1084, 100, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (118, 1085, 101, CAST(0x0000A72A00000000 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Manufacture] OFF
SET IDENTITY_INSERT [dbo].[PurchaseAvatar] ON 

INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1008, 2, 1101, CAST(0x0000A72301434B1F AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1009, 2, 1099, CAST(0x0000A72700C6BAD4 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1010, 5, 1099, CAST(0x0000A72700C6BD98 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1011, 4, 1099, CAST(0x0000A72E011A4968 AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseAvatar] OFF
SET IDENTITY_INSERT [dbo].[PurchaseCategory] ON 

INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1041, 1101, 8, CAST(0x0000A7230141C046 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1042, 1101, 5, CAST(0x0000A72400CC580B AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1043, 1103, 2, CAST(0x0000A725011FF84F AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1044, 1103, 5, CAST(0x0000A725011FFB4B AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1045, 1103, 6, CAST(0x0000A725011FFDBB AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1046, 1103, 7, CAST(0x0000A725011FFECF AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1047, 1103, 8, CAST(0x0000A72501200062 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1048, 1103, 10, CAST(0x0000A725012003F9 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1049, 1115, 5, CAST(0x0000A7270113920E AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1050, 1115, 7, CAST(0x0000A727011398A0 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1051, 1110, 5, CAST(0x0000A728013C9729 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1052, 1130, 2, CAST(0x0000A72B01258663 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1053, 1131, 2, CAST(0x0000A72D00B090F5 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1054, 1137, 2, CAST(0x0000A72F010EF08E AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseCategory] OFF
SET IDENTITY_INSERT [dbo].[PurchaseTheme] ON 

INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1026, 1092, 2, CAST(0x0000A726010A4F3E AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1027, 1092, 4, CAST(0x0000A72700B66FCB AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1028, 1112, 2, CAST(0x0000A72701085548 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1029, 1102, 2, CAST(0x0000A7270111D870 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1030, 1102, 4, CAST(0x0000A7270111FF0E AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1031, 1112, 4, CAST(0x0000A7270112D78F AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1032, 1115, 2, CAST(0x0000A7270113A04D AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1033, 1115, 6, CAST(0x0000A7270113A9D7 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1034, 1116, 2, CAST(0x0000A7270114807E AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1035, 1116, 4, CAST(0x0000A72701160174 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1036, 1117, 2, CAST(0x0000A7270117D04F AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1037, 1099, 2, CAST(0x0000A727012601C9 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1038, 1117, 4, CAST(0x0000A72800E92400 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1039, 1117, 5, CAST(0x0000A72800E92946 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1040, 1117, 6, CAST(0x0000A72800E92FE3 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1041, 1117, 9, CAST(0x0000A72800E933F3 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1042, 1110, 2, CAST(0x0000A72800EB2F3A AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1043, 1110, 4, CAST(0x0000A72800EB3590 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1044, 1110, 5, CAST(0x0000A72800EB395A AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1045, 1110, 6, CAST(0x0000A72800EB3C93 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1046, 1110, 9, CAST(0x0000A72800EB43DD AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1047, 1119, 2, CAST(0x0000A729000754F0 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1048, 1120, 2, CAST(0x0000A72900978D8E AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1049, 1120, 4, CAST(0x0000A7290097917A AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1050, 1120, 5, CAST(0x0000A729009796D7 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1051, 1120, 6, CAST(0x0000A72900979E2F AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1052, 1120, 9, CAST(0x0000A7290097A2FB AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1053, 1130, 2, CAST(0x0000A729016B3D87 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1054, 1131, 2, CAST(0x0000A72A00B9F2D9 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1055, 1130, 4, CAST(0x0000A72B01241747 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1056, 1130, 5, CAST(0x0000A72B01241E62 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1057, 1132, 2, CAST(0x0000A72C013414A8 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1058, 1133, 2, CAST(0x0000A72C0134ED8B AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1059, 1133, 4, CAST(0x0000A72C0134EFB9 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1060, 1133, 5, CAST(0x0000A72C0134F1FE AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1061, 1133, 6, CAST(0x0000A72C0134F5C4 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1062, 1133, 9, CAST(0x0000A72C0134FB13 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1063, 1132, 4, CAST(0x0000A72D015CD5D1 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1064, 1132, 9, CAST(0x0000A72D015D0717 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1065, 1132, 6, CAST(0x0000A72D015D0CFD AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1066, 1099, 4, CAST(0x0000A72E011A1372 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1067, 1099, 5, CAST(0x0000A72E011A16A6 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1068, 1099, 6, CAST(0x0000A72E011A1A59 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1069, 1099, 9, CAST(0x0000A72E011A1D5E AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1070, 1137, 2, CAST(0x0000A72F014D0E79 AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseTheme] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (1, N'HHHHHHHH', N'HHHHHHHH', 1, 53, 7, 0, 1, 75, CAST(0x0000A6EE00AD2C08 AS DateTime), CAST(0x0000A6EE00AD2C08 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (2, N'از هر مغازه ای که میخواستی، رایگان لباس میخریدی', N'مجبور بودی مثل سوپر من، شرتت رو رو شلوار میپوشیدی', 10, 37, 3, 2, 0, 20, CAST(0x0000A80800AD2C08 AS DateTime), CAST(0x0000A80800AD2C08 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (3, N'هیچوقت گرسنه ات نمیشد', N'رنگت مثل درختا سبز بود و باید روزی 1 ساعت پاهات رو تو زمین فرو میکردی', 11, 37, 7, 0, 1, 30, CAST(0x0000A6F700000000 AS DateTime), CAST(0x0000A6F700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (4, N'کنکور رو کلا حذف میکردن', N'دانشگاه ها تفکیک جنسیتی میشدن', 11, 37, 4, 2, 0, 40, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (5, N'وقتی شیر آب رو باز میکردی ازش پول میومد', N'برای بدست اوردن آب باید روزی هشت ساعت کار میکردی', 11, 39, 2, 1, 0, 50, CAST(0x0000A81C00000000 AS DateTime), CAST(0x0000A81C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (6, N'یه خونه رایگان بهت میدادن', N'10 سال از عمرت کم میشد', 11, 41, 4, 1, 0, 60, CAST(0x0000A7FF00000000 AS DateTime), CAST(0x0000A7FF00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (7, N'به جای اینکه یارانه بدن، همه ماهی 10 هزار تومن هم میدادن', N'دیگه کسی اختلاس و دزدی نمیکرد', 8, 35, 7, 1, 0, 70, CAST(0x0000A80800000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (8, N'پولداری میشدی', N'باید با کسی که کنارت نشسته ازدواج میکردی', 13, 42, 4, 1, 0, 80, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (9, N'یارانت دوبرابر میشد ', N'باید به غرضی رای میدادی', 6, 46, 5, 0, 0, 90, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (10, N'حقوقت سه میلیون بود ', N'نصفش رو باید پول ایزی لایف میدادی', 10, 39, 3, 2, 0, 91, CAST(0x0000A80800000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (11, N'یه شغل با آبرو داشتی', N'یه زن بی آبرو گیرت میومد', 13, 41, 3, 1, 0, 92, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (12, N'رتبه یک کنکور میشدی', N'باید بعدش رفتگر می شدی', 11, 50, 3, 2, 1, 93, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (15, N'سال نو آیفون هدیه بگیری', N'ولی تا آخر سال اجازه نداشتی روش برنامه بریزی', 11, 12, 0, 0, 0, 40, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A81C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (16, N'روحانی رئیس جمهور بشه', N'دیگه قید انرژی هسته ای رو بزنیم', 7, 12, 0, 0, 0, 2, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (17, N'هر کتابی رو که میخواستی به مغزت تزریق میکردی', N'کور میشدی', 11, 20, 13, 12, 10, 50, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (18, N'اندازه بیل گیتس پول داشتی', N'یه دست و یه پا نداشتی', 8, 23, 31, 10, 10, 60, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (19, N'زورت ده برابر میشد', N'عقلت نصف میشد', 13, 22, 14, 12, 3, 55, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (20, N'هر چه قدر میخواستی میخوردی و چاق نمیشدی', N'روزی 10 بار باید دستشویی میرفتی', 13, 29, 13, 10, 10, 70, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (21, N'میتونستی ذهن بقیه رو بخونی', N'بقیه هم میتونستن ذهنت رو بخونن', 11, 20, 26, 3, 5, 39, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (22, N'میتونستی زیر آب هم نفس بکشی', N'برای اینکه زنده بمونی باید همیشه بدنت رو خیس نگه میداشتی', 11, 40, 12, 7, 6, 60, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (23, N'پدر و مادرت رو خودت انتخاب میکردی', N'40 سال بشتر عمر نمیکردی', 11, 20, 19, 18, 17, 45, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (24, N'یارانه هر نفر 500 هزار تومن میشد', N'ترامپ رئیس جمهور ایران میشد', 6, 19, 15, 10, 10, 65, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (25, N'یک ', N'دو', 1, 6, 2, 0, 0, 20, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (26, N'تا ابد زنده بودی', N'دیگه هیچکس باهات حرف نمیزد', 11, 20, 2, 0, 0, 80, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (27, N'میتونستی تو رویاهات زندگی کنی', N'دیگه هیچوقت نمیتونستی ازشون خارج بشی', 11, 14, 2, 1, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (28, N'دیگه سرما نمیخوردی', N'همیشه  کفشات لنگه به لنگه بودن', 13, 14, 1, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (29, N'هیچوقت چاق نمیشدی', N'هیچوقت هم گشنت نمیشد', 11, 16, 0, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (30, N'برای 25 سال ماهی 100 میلیون درآمد داشتی', N'برای 5 سال نمیتونستی لباسات را حتی برای قضای حاجت در بیاری', 10, 6, 2, 0, 0, 60, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (31, N'تو زندگی به هر چی که میخواستی  میرسیدی', N'دیگه هیچوقت نمیرسیدی خانواده و دوستات رو بینی', 1, 54, 5, 4, 0, 99, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (32, N'به جای بتمن بودی', N'بهترین دوستت جای جوکر بود', 14, 11, 1, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (33, N'میتونستی ذهن مردم رو بخونی', N'اونها هم میتونستن ذهنت رو بخونن', 1, 44, 7, 0, 0, 99, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (34, N'هفته ای یه بار قضای حاجت میکردی', N'ولی یه یارش به اندازه 10 بار پر سر و صدا تر بود', 10, 38, 10, 0, 0, 99, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (35, N'هر کی رو میخواستی عاشقت میشد', N'هر کی هم میخواستت عاشقش میشدی', 11, 14, 1, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (36, N'چند برابر خوشگل تر میشدی', N'ولی آخر هفته ها جنسیتت عوض میشد', 13, 13, 1, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (37, N'یه همزاد داشتی که هر چی میگفتی رو انجام میداد', N'عاشق اونی میشد که میخوای باهاش عروسی کنی', 11, 11, 2, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (38, N'جای رستم بودی', N'دوستت جای اسفندیار بود', 14, 23, 4, 1, 0, 80, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (39, N'هر چی میگفتی هیج عواقب بدی برات نداشت', N'ولی لهجه خیلی آبرو ریز داشتی', 13, 11, 1, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (40, N'هیچوقت تو زندگیت شکست نمیخوردی', N'هیچوقت هم عاشق نمیشدی', 11, 12, 1, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (41, N'صدای باد معده نصف میشد', N'پخش بوش 2 برابر بود', 10, 21, 3, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (42, N'دستگاه پرینتی داشتی که پول واقعی چاپ میکرد', N'تا آخر عمر باید دامن میپوشیدی و دیگه نمیتونستی زیرش شورت بپوشی', 13, 21, 2, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (43, N'میتونستی 5 نفر رو به همراه خودت میلیاردر کنی', N'همزمان به دلیل کار تو 5 نفر هم به زمین گرم میخوردن', 11, 18, 3, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (44, N'قالی پرنده داشتی', N'هیچوقت نمیتونستی ازش پیاده شی', 11, 17, 3, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (45, N'کت جادویی داشتی و هر موقع اراده میکردی یک میلیون از جیبش بر میداشتی', N'هر موقع که یک میلیونش رو خرج میکردی یک نفر توی اون گوشه دنیا میمرد', 11, 10, 2, 0, 0, 70, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (46, N'خوشگل ترین آدم دنیا بودی', N'نمیتونستی با کسی همبستر بشی', 10, 31, 6, 2, 0, 90, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (47, N'خونت همیشه تمیز بود و همه کارا خونه خود به خود انجام میشد', N'همیشه باید با کفشهای کثیف اینور و اونور میرفتی', 11, 25, 6, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (48, N'شخصیتهای کارتونی واقعی بودن', N'آدما تخیلی بودن', 14, 25, 6, 0, 1, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (49, N'هر عکسی که تو ایستاگرام پست میکردی 1 میلیون لایک میخورد', N' تو همشون چشات چپ بود و انگشتت تو دماقت بود', 10, 34, 5, 0, 0, 90, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (50, N'همیشه هیکلت رو فرم بود', N'به جای روزی 1 ساعت ورزش، روزی 60 نفر رو ماچ میکردی', 10, 49, 5, 4, 0, 100, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (51, N'10 تا سکه میگرفتی', N'هر چی که توی چی میشد... جواب دادی واقعا اتفاق میاق میفتاد', 11, 26, 4, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (52, N'سی تا سکه بهت میدادیم تا اینکه بتونی یک بسته رو بخری', N'باید پاسخ مثبت بدی و ما به فروشگاه وصلت کنیم', 11, 5, 2, 0, 0, 60, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (53, N'سه تا زبان جدید را مثل آب خوردن یاد میگرفتی', N'زبان مادریت رو کلا فراموش میکردی', 11, 27, 3, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (54, N'جذابیت چند برابر میشد', N'عقلت نصف میشد', 13, 24, 5, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (55, N'احتیاج به خواب نداشتی', N'20 سال زودتر میمردی', 11, 26, 3, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (56, N'ساعت جادویی داشتی و میتونستی زمان رو متوقف کنی', N'هر موقع زمان رو متوقف میکردی یک نفر سکته میزد', 11, 22, 5, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (57, N'هر موقع خوشحال بودی هوا آفتابی میشد', N'هر موقع هم که ناراحت بودی هوا بارونی میشد', 11, 21, 6, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (58, N'دیگه هیچ جنگی روی زمین نبود', N'اینترنت هم  وجود نداشت', 11, 30, 8, 2, 0, 90, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (59, N'هر کسی رو که اراده میکردی بهترین دوستت میشد', N'فقط و فقط یک روز میتونستید با هم باشید', 11, 8, 1, 0, 0, 70, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (60, N'کچل میشدی', N'روزی 100 هزار تومن بهت میدادن', 13, 7, 2, 0, 0, 70, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (61, N'همه مردم سیاه بودن', N'تو سفید بودی', 11, 18, 4, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (62, N'اراده کنی و بری به 50 سال دیگه', N'20 سال از عمرت کم میشد', 11, 7, 2, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (63, N'میتونستی یه هفته تمام با یکی از معروف ترین بازیگرا باشی', N'هر جا که با هم میرفتید خبرنگرا ولتون نمیکردن', 11, 9, 2, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (64, N'قدرتمند ترین آدم دنیا میشدی', N'برای اینکه مقامت رو از دست ندی روزی 1000 نفر رو میکشتی', 11, 28, 7, 0, 0, 99, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (65, N'میتونستی همسرت رو هر جوری که دوست داشتی  چه ظاهری چه باطنی تغییرش بدی', N'اونم میتونست هر جوری که دوست داشت تغییرت بده', 11, 10, 1, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (66, N'هر جایی که میرفتی بهترین دما و آب و هوا رو داشت', N'ولی توی رخت خوابت غندیل میبستی', 11, 8, 1, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (67, N'از این به بعد به همه غذاها، فیلمها، کتابهاو بازیها دسترسی رایگان داشتی', N'به مدت 10 سال نمیتونستی از خونت بیرون بری', 11, 9, 3, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (68, N'میتونستی یکی از شخصیتهای دنیای غیر واقعی بشی', N'بعدش دیگه نمیتونستی به حالت قبلیت برگردی', 14, 9, 2, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (69, N'ببینی توی یکسال آینده چی قراره اتفاق بیفته', N'بعدش به ازای هر سال که میگذره خاطرات اون سال و سال قبلش رو فراموش کنی', 1, 5, 2, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (70, N'هر لباسی رو از هر فروشگاهی که میخواستی میتونستی بخری', N'همیشه کفشات و جورابات لنگه به لنگه بودن', 1, 6, 1, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (71, N'همه مردم سفید بودن', N'تو سیاه بودی', 1, 5, 2, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (72, N'هر ماشینی رو که دوست داشتی میتونستی بخری', N'هفته ای یکبار باید باهاش جنازه جا به جا میکردی', 1, 10, 1, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (73, N'میتونستی پادشاه یا ملکه انگلیس بشی', N'با یک آدم بد ذات باید عروسی میکردی', 1, 5, 2, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (74, N'راننده شخصی داشتی که هر موقع که میخواستی هر جایی که میگفتی میبردت', N'با ژیان میرسوندت', 1, 19, 5, 0, 0, 90, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (75, N'برای 100 سال خودت و هر کی رو که دوست داشتی بیشتر عمر میکردن و جوون میموندن', N'شورت و جوراب رو دیگه نمیشد در بیارن', 1, 11, 1, 0, 0, 80, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (76, N'میدونستی کی و چجوری میمیری', N'نمیتونستی هیچ کاری برای جلوگیری ازش بکنی', 1, 17, 3, 1, 0, 90, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (77, N'دوستات هم میتونستن به سوالای با حال  برنامه جواب بدن و خودن و اونا سکه رایگان میگرفتید', N'...0', 1, 6, 0, 0, 0, 70, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (78, N'حقوقت 4 برابر میشد', N'قدت نصف میشد', 1, 15, 5, 1, 0, 90, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (79, N'روزی 100 هزار تومن بهت میدادن', N'سالی 1 سانت قدت کوتاه تر میشد', 1, 11, 2, 0, 0, 80, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (80, N'میتونستی پادشاه یا ملکه هر کشوری که میخواستی بشی', N'دیگه نمیتونستی زندگی شادی داشته باشی', 1, 11, 2, 0, 0, 80, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (81, N'25سال کمتر عمر میکردی', N'همیشه سالم و سلامت بودی', 1, 10, 2, 0, 0, 80, CAST(0x0000A71D00000000 AS DateTime), CAST(0x0000A71D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (82, N'فضاییها واقعی بودن و به زمین میومدن', N'با آدما میتونستن عروسی کنن و بچه هاشون آدم فضایی میشدن', 1, 5, 2, 0, 0, 70, CAST(0x0000A71D00000000 AS DateTime), CAST(0x0000A71D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (83, N'از زمان مردنت مطلع میشدی', N'اگه به کسی در موردش مبگفتی همون موقع سوسک میشدی', 1, 13, 1, 0, 0, 80, CAST(0x0000A71D00000000 AS DateTime), CAST(0x0000A71D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (84, N'توی بهشت بودی و هر کاری دلت میخواست میتونستی بکنی', N'نباید به درخت سیب دست میزدی و ازش میخوردی', 1, 8, 1, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (85, N'یه درخت داشتی که به جای میوه پول میداد', N'هر موقع پولش رو میچیندی به اندازه مبلغی که بر میداتشتی به همون تعداد درختای دیگه خشک میشدن', 1, 4, 2, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (86, N'یه مرغ داشتی که تخم طلا میداد', N'همه دنبال این بودن که ازت بدزدنش', 1, 5, 1, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (87, N'همیشه زندگیت رو به راه بود', N'روزی به 10 نفر کمک میکردی', 1, 10, 1, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (88, N'تمام سختیها و بدبختیهای زندگیت تموم میشد', N'باید به بهترین دوستت میدادیشون', 1, 4, 2, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (89, N'میتونستی به گذشته برگردی ', N'نمیتونستی با اونایی که میشناختی حرف بزنی', 1, 5, 0, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (90, N'موفقیت بچه هات تضمین میشد', N'باید حتما 3 تا بچه داشتی و اسمشون رو سوای اینکه پسرن یا دختر میذاشتی اتل و متل و توتوله', 1, 9, 1, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (91, N'همه از زندگیشون لذت میبردن و هیچکس فقیر نبود', N'برای اینکه اوضاع همه خوب باشه تو باید سختی میکشیدی', 1, 9, 1, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (92, N'هر روز خوشمزه ترین غذاها رو میخوردی', N'یه روز در میون اسهال بودی', 1, 8, 2, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (93, N'دیگه هیچوقت اسهال نمیشدی', N'ولی بجاش یبوست میگرفتی', 1, 6, 2, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (94, N'همه غذاهات توسط آقای گلریز سرو میشد', N'همیشه باید با دست غذا میخوردی', 1, 5, 1, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (95, N'هر موقع که اراده میکردی میتونستی جنسیت رو عوض کنی', N'هر بار که اینکار رو میکردی یکم زشتتر میشدی', 1, 4, 2, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (96, N'همیشه خدا خوشحال بودی', N'عقلت معیوب بود', 1, 6, 2, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (97, N'یه ویلای لوکس بغل ساحل داشتی', N'به محض اینکه ازش خارج میشدی خرابش میکردن', 1, 5, 3, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (98, N'میتونستی مثل هر کسی که دوست داشتی بشی', N'خانوادت و دوستات نمیشناختنت', 1, 7, 1, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (99, N'ستاره یه فیلم میشدی', N'فیلمش مستهجن بود', 1, 8, 0, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (100, N'قدت 10سانت بلندتر میشد', N'دستات 5 سانت کوتاه میشدن', 1, 7, 1, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (101, N'ثروتنمندترین آدم دنیا میشدی', N'هر کسی رو که میشناختی میمرد', 11, 3, 2, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
GO
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (102, N'با شعبده بازی گربه ظاهر کنی', N'7 روز بعد گربهایی که ظاهر میکردی میمردن', 11, 0, 0, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (103, N'هر روز 2 ساعت زودتر به محل کارت یا مدرسه و دانشگاه میرفتی', N'یه روز بیشتر تو هفته تعطیلی داشتی', 11, 0, 0, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (104, N'میتونستی هر اندازه که دلت بخواد بدون اینکه اثری رو سلامتیت بذاره بستنی بخوری', N'مجبور بودی تا آخر عمرت تو پارکها بستنی بفروشی', 11, 0, 0, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (105, N'آلت تناسلی نداشتی', N'100 تا همسر داشتی', 10, 0, 0, 0, 0, 90, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (106, N'خونه رویاهات رو داشتی و هر چی که آرزو داتشی درونش بود', N'دیگه نمیتونستی ازش خارج بشی', 11, 0, 0, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (107, N'5 تا سکه رایگان میگرفتی', N'یک ویدئو چند ثانیه ای درباره ی یک چیز باحال میدیدی', 11, 0, 0, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (108, N'هر کلیپی که روی یوتیوب میذاشتی جز پر بازدیدترینها میشسد', N'تو همشون 10 دقیقه گریه و زاری میکردی', 11, 0, 0, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (109, N'میتونستی انتخاب کنی به سیاره زنان ونوسی یا مردان مریخی بری', N'دیگه بعدش نمیتونستی اون سیاره رو ترک کنی', 11, 0, 0, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (110, N'میتونستی با نوک انگشتت لوازم الکترونیکی رو خاموش و روشن کنی', N'یک بار در ماه برای 24 ساعت باسنت رو بزنی به شارژ ', 10, 0, 0, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (111, N'دکترای فیزیک هسته ای داشتی', N'شغلت تو سازمان انرژی اتمی ساخت آبمیوه گیر بود', 6, 1, 20, 10, 1, 100, CAST(0x0000A72F00000000 AS DateTime), CAST(0x0000A72F00000000 AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[QuestionBoost] ON 

INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (1, N'عادی', N'عادی', 0, N'mine', N'#fffff', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (3, N'متوسط', N'متوسط', 60, N'data/images/8.png', N'#ffee32', CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A72300000000 AS DateTime))
INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (4, N'حرفه ای', N'حرفه ای', 70, N'Data/images/9.png', N'#ff3e55', CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A72300000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[QuestionBoost] OFF
SET IDENTITY_INSERT [dbo].[ReportedQuestions] ON 

INSERT [dbo].[ReportedQuestions] ([ID], [UserID], [QuestionID], [ReportTypeID], [CreatedDate]) VALUES (11, 1117, 34, 2, CAST(0x0000A7280110D497 AS DateTime))
INSERT [dbo].[ReportedQuestions] ([ID], [UserID], [QuestionID], [ReportTypeID], [CreatedDate]) VALUES (12, 1131, 4, 2, CAST(0x0000A72D00B0A18C AS DateTime))
INSERT [dbo].[ReportedQuestions] ([ID], [UserID], [QuestionID], [ReportTypeID], [CreatedDate]) VALUES (13, 1131, 5, 1, CAST(0x0000A72D00BE65E9 AS DateTime))
INSERT [dbo].[ReportedQuestions] ([ID], [UserID], [QuestionID], [ReportTypeID], [CreatedDate]) VALUES (14, 1131, 6, 1, CAST(0x0000A72D00BFC781 AS DateTime))
INSERT [dbo].[ReportedQuestions] ([ID], [UserID], [QuestionID], [ReportTypeID], [CreatedDate]) VALUES (15, 1134, 90, 2, CAST(0x0000A72D00FB6C9F AS DateTime))
SET IDENTITY_INSERT [dbo].[ReportedQuestions] OFF
SET IDENTITY_INSERT [dbo].[ReportType] ON 

INSERT [dbo].[ReportType] ([ID], [Name], [Description]) VALUES (1, N'خلاف شرع', N'بد بد بد')
INSERT [dbo].[ReportType] ([ID], [Name], [Description]) VALUES (2, N'تکراری', N'تکراری')
INSERT [dbo].[ReportType] ([ID], [Name], [Description]) VALUES (3, N'حال به هم زن', N'چرت و پرت گویی')
SET IDENTITY_INSERT [dbo].[ReportType] OFF
SET IDENTITY_INSERT [dbo].[SelectedAvatar] ON 

INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1030, 1083, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1031, 1084, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1032, 1085, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1033, 1086, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1034, 1087, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1035, 1088, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1036, 1089, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1037, 1090, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1038, 1091, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1039, 1092, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1040, 1093, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1041, 1094, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1042, 1095, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1043, 1096, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1044, 1097, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1045, 1098, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1046, 1099, 4)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1047, 1100, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1048, 1101, 2)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1049, 1102, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1050, 1103, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1051, 1104, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1052, 1105, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1053, 1106, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1054, 1107, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1055, 1108, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1056, 1109, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1057, 1110, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1058, 1111, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1059, 1112, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1060, 1113, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1061, 1114, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1062, 1115, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1063, 1116, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1064, 1117, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1065, 1118, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1066, 1119, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1067, 1120, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1068, 1121, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1069, 1122, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1070, 1123, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1071, 1124, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1072, 1125, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1073, 1126, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1074, 1127, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1075, 1128, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1076, 1129, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1077, 1130, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1078, 1131, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1079, 1132, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1080, 1133, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1081, 1134, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1082, 1135, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1083, 1136, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1084, 1137, 1)
SET IDENTITY_INSERT [dbo].[SelectedAvatar] OFF
SET IDENTITY_INSERT [dbo].[SelectedCategory] ON 

INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1060, 1083, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1061, 1084, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1062, 1085, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1063, 1086, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1064, 1087, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1065, 1088, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1066, 1089, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1067, 1090, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1068, 1091, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1069, 1092, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1070, 1093, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1071, 1094, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1072, 1095, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1073, 1096, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1074, 1097, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1075, 1098, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1076, 1099, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1077, 1100, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1078, 1101, 5)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1079, 1102, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1080, 1103, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1081, 1104, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1082, 1105, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1083, 1106, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1084, 1107, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1085, 1108, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1086, 1109, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1087, 1110, 5)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1088, 1111, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1089, 1112, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1090, 1113, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1091, 1114, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1092, 1115, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1093, 1116, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1094, 1117, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1095, 1118, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1096, 1119, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1097, 1120, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1098, 1121, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1099, 1122, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1100, 1123, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1101, 1124, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1102, 1125, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1103, 1126, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1104, 1127, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1105, 1128, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1106, 1129, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1107, 1130, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1108, 1131, 2)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1109, 1132, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1110, 1133, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1111, 1134, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1112, 1135, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1113, 1136, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1114, 1137, 2)
SET IDENTITY_INSERT [dbo].[SelectedCategory] OFF
SET IDENTITY_INSERT [dbo].[SelectedTheme] ON 

INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1060, 1083, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1061, 1084, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1062, 1085, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1063, 1086, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1064, 1087, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1065, 1088, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1066, 1089, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1067, 1090, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1068, 1091, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1069, 1092, 4)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1070, 1093, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1071, 1094, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1072, 1095, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1073, 1096, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1074, 1097, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1075, 1098, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1076, 1099, 4)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1077, 1100, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1078, 1101, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1079, 1102, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1080, 1103, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1081, 1104, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1082, 1105, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1083, 1106, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1084, 1107, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1085, 1108, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1086, 1109, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1087, 1110, 5)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1088, 1111, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1089, 1112, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1090, 1113, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1091, 1114, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1092, 1115, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1093, 1116, 4)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1094, 1117, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1095, 1118, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1096, 1119, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1097, 1120, 9)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1098, 1121, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1099, 1122, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1100, 1123, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1101, 1124, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1102, 1125, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1103, 1126, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1104, 1127, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1105, 1128, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1106, 1129, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1107, 1130, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1108, 1131, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1109, 1132, 6)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1110, 1133, 9)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1111, 1134, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1112, 1135, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1113, 1136, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1114, 1137, 2)
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

INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1083, N'ebe43e11-d1de-41b0-ab89-1cfe78f1d112', N'keyvan', 1, 200, 4, 4, 1, 1, CAST(0x0000A72300AF6382 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1084, N'6327f3f4-3b9c-42d7-9e39-1e20fd80eacd', N'kayvan3', 1, 200, 7, 2, 1, 1, CAST(0x0000A72300B0B51E AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1085, N'cab49d9b-e4f1-42da-a35e-fdc96eca481b', N'keyvan23', 1, 200, 5, 3, 1, 1, CAST(0x0000A72300B709F8 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1086, N'3d6c9441-8cc0-4911-ab50-2c75594e0f06', N'jb', 1, 200, 4, 1, 1, 1, CAST(0x0000A72300C06756 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1087, N'97380d07-a9d7-45d2-870b-dd02cab30f29', N'kivi', 1, 200, 7, 3, 1, 1, CAST(0x0000A72300C6D130 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1088, N'34161a17-4357-495e-8b74-aab781a0366f', N'Guest_4571810', 1, 200, 49, 29, 2, 1, CAST(0x0000A72300CF82CD AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1089, N'ef45a050-73ee-4462-bbe3-edbe6852141d', N'LG-E445', 1, 260, 97, 37, 3, 1, CAST(0x0000A72300D53F2A AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1090, N'377c3e1b-fa6e-4c95-83ea-bc8c5fa70de2', N'Guest_9625134', 1, 200, 20, 0, 2, 1, CAST(0x0000A723012B08B5 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1091, N'a71e4940-b7b6-4981-98d6-d6dc0007e3c8', N'Guest_4005661', 1, 200, 0, 0, 1, 1, CAST(0x0000A723012D1D3C AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1092, N'066fa8bb-306c-43bc-83b5-c07169e0485c', N'Guest_8224823', 1, 20, 71, 21, 3, 1, CAST(0x0000A723012DA0FF AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1093, N'ebe43e11-d1de-41b0-ab89-1cfe78f1d1f1', N'Guest_9044137', 1, 200, 0, 0, 1, 1, CAST(0x0000A723012DF8BF AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1094, N'ebe43e11-d1de-41b0-ab89-1cfe78f1eff3', N'Guest_9788814', 1, 200, 0, 0, 1, 1, CAST(0x0000A723012E98F2 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1095, N'ec9de6d1-bfcc-4f53-855d-d3c558591949', N'Guest_5260378', 1, 200, 0, 0, 1, 1, CAST(0x0000A723012F811A AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1096, N'7fa0336c-e813-41c6-b09f-261f2fea6b0a', N'Guest_2300460', 1, 200, 0, 0, 1, 1, CAST(0x0000A723013319DE AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1097, N'c73ab2a8-b4ae-47c1-b155-3a74f890cf53', N'Guest_3550529', 1, 200, 0, 0, 1, 1, CAST(0x0000A723013340AB AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1098, N'c29cac06-3ee7-4ec4-8d62-5e0644b4285a', N'Guest_4020912', 1, 200, 3, 3, 1, 1, CAST(0x0000A7230133F65D AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1099, N'd3e9c138-9853-4919-86f8-0c181a3efcdd', N'Guest_3553976', 1, 30, 29, 9, 2, 1, CAST(0x0000A72301349B8B AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1100, N'826657dd-815d-4cf4-8356-8bcfd60746c8', N'keyvanXXX', 1, 250, 70, 20, 3, 1, CAST(0x0000A72301356C44 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1101, N'b5c15d20-32c6-4a71-8e54-dcdcdbf25228', N'Jeb', 1, 1000, 37, 17, 2, 1, CAST(0x0000A723013FDD34 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1102, N'686f7799-52d2-4d7c-aa68-b6e8f1384574', N'keyvan12', 1, 170, 6, 6, 1, 1, CAST(0x0000A72400D9ED38 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1103, N'9a92b561-9690-4af2-8533-c45f9aaf3799', N'Javad', 1, 185, 12, 12, 1, 1, CAST(0x0000A72400DA5FE6 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1104, N'641f68f1-41c7-4bfa-ae86-089f86ac4f15', N'Guest_6766126', 1, 200, 48, 28, 2, 1, CAST(0x0000A72400E01D73 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1105, N'cceab59d-ef75-4b01-8694-4847855f4674', N'Guest_4268554', 1, 200, 0, 0, 1, 1, CAST(0x0000A72401256C84 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1106, N'6b5cd9e4-eb74-4126-8e37-691292dd0492', N'Guest_1141417', 1, 200, 0, 0, 1, 1, CAST(0x0000A7240168B45E AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1107, N'1a14e60d-4617-4e99-9c6d-ee69a0b8191e', N'Guest_8084756', 1, 200, 4, 4, 1, 1, CAST(0x0000A725015FD297 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1108, N'9a92b561-9690-4af2-8533-c45f9aaf3299', N'Guest_9414304', 1, 200, 0, 0, 1, 1, CAST(0x0000A72600CB0496 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1109, N'ebe43e11-d1de-41b0-ab89-1cfe78f1d1f5', N'Guest_8242628', 1, 200, 0, 0, 1, 1, CAST(0x0000A7260121C82C AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1110, N'21c900bc-11a8-4dd5-a33e-81516c14979a', N'JebTel', 1, 345, 26, 6, 2, 1, CAST(0x0000A7260129C0EA AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1111, N'23678ba0-82ba-4873-9ebd-10df665f13cf', N'Guest_2132451', 1, 200, 0, 0, 1, 1, CAST(0x0000A726012A3864 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1112, N'2f2a99b7-c014-4573-b8cd-f5e0feed41c4', N'Guest_7152142', 1, 20, 1, 1, 1, 1, CAST(0x0000A72700B8583F AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1113, N'ebe43e11-d1de-41b0-ab89-1cfe78f1d1f2', N'Guest_1539733', 1, 200, 0, 0, 1, 1, CAST(0x0000A72700BDC442 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1114, N'ebe43e11-d1de-41b0-ab89-1ede78f1d1f2', N'Guest_2558252', 1, 200, 0, 0, 1, 1, CAST(0x0000A72700BE2DD9 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1115, N'835592b8-688d-42ef-9a4b-f5ae25d2affb', N'Guest_0954809', 1, 5, 0, 0, 1, 1, CAST(0x0000A7270113899D AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1116, N'5204930c-2d5d-462d-a8ea-4d38844e60c1', N'Guest_9550030', 1, 20, 0, 0, 1, 1, CAST(0x0000A727011479AF AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1117, N'08973d6f-a2f8-4e0c-ac3d-303d9c369c29', N'Guest_1589647', 1, 150, 2, 2, 1, 1, CAST(0x0000A7270117CA5C AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1118, N'9a45dd60-c2de-44d0-a82e-888522c35de8', N'Guest_6056266', 1, 200, 0, 0, 1, 1, CAST(0x0000A7290006C4BE AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1119, N'27ee6949-9237-4585-ba7d-a34a5b3b6227', N'Guest_3088569', 1, 195, 1, 1, 1, 1, CAST(0x0000A7290006F921 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1120, N'66189f97-2b53-483e-b833-a39ffcfc106d', N'Guest_0137608', 1, 175, 0, 0, 1, 1, CAST(0x0000A72900973D98 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1121, N'1300dcb5-eb47-4eda-a3e9-d2fab33e3662', N'Guest_3543709', 1, 200, 0, 0, 1, 1, CAST(0x0000A72900CE024E AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1122, N'fdbda41d-02dd-4d4b-b67f-89c3e9b2f7bb', N'Guest_1670083', 1, 200, 0, 0, 1, 1, CAST(0x0000A72900CE5676 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1123, N'04674e62-1d71-49dc-98a8-56b39d96e4b9', N'Guest_2453112', 1, 200, 0, 0, 1, 1, CAST(0x0000A72900CF62EA AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1124, N'a829e6f7-52f8-4533-9210-319570c1a78c', N'Guest_7143154', 1, 200, 0, 0, 1, 1, CAST(0x0000A72900D02BDA AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1125, N'85a1a6ec-bf52-43a5-9375-9c196b5fa3f5', N'Guest_4976560', 1, 200, 0, 0, 1, 1, CAST(0x0000A72900D9A0B1 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1126, N'ddb4f97e-6d70-446c-bdce-e15262f47237', N'Guest_3415665', 1, 200, 0, 0, 1, 1, CAST(0x0000A72900DA009B AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1127, N'ebe43e11-d1de-41b0-ab89-1cfe78f1d1fd', N'Guest_2663897', 1, 200, 0, 0, 1, 1, CAST(0x0000A72900E6E6DC AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1128, N'ebe43e11-d1de-41b0-ab89-1cfe78f1d1de', N'Guest_8288999', 1, 200, 0, 0, 1, 1, CAST(0x0000A72900E6F919 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1129, N'd5eca87a-906e-4e4d-852a-bf832f6aca1b', N'Guest_5023916', 1, 200, 0, 0, 1, 1, CAST(0x0000A72900EE07BF AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1130, N'fe52aa70-c935-494f-89ec-be051ab38cce', N'Guest_6554024', 1, 35, 87, 37, 3, 1, CAST(0x0000A729016861CD AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1131, N'9a95fd31-93f3-4dd7-9068-10cfe7527652', N'Guest_6119915', 1, 45, 87, 37, 3, 1, CAST(0x0000A72A00B8F654 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1132, N'c235b7a8-f1dc-4e37-84f7-6fba628d47f6', N'Guest_0337809', 1, 1295, 134, 44, 4, 1, CAST(0x0000A72C0133FCFB AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1133, N'136031cb-232a-4687-ba60-82196a94f8cb', N'Guest_3464982', 1, 175, 84, 34, 3, 1, CAST(0x0000A72C0134DF80 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1134, N'056e1d94-44c2-4366-ac13-d1b5a4d9f713', N'Guest_1446245', 1, 1880, 107, 17, 4, 1, CAST(0x0000A72D00EEF538 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1135, N'2f3771a9-2392-497f-8913-29c723f18844', N'Guest_2921975', 1, 200, 0, 0, 1, 1, CAST(0x0000A72D0137DCAC AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1136, N'ebe43e11-d1de-41b0-3b89-1cfe78f1d112', N'Guest_7531387', 1, 200, 0, 0, 1, 1, CAST(0x0000A72F00D3F637 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1137, N'c4c4f97f-47d4-4345-86a4-6f0fbd6e47b4', N'Non-Default4675452', 1, 195, 8, 8, 1, 1, CAST(0x0000A72F010844E4 AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserAvatar] ON 

INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name]) VALUES (1, N'Data/Images/1.png', 1, N'بول')
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name]) VALUES (2, N'Data/Images/3.png', 30, N'غول')
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name]) VALUES (3, N'Data/Images/3.png', 50, N'مول')
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name]) VALUES (4, N'Data/Images/4.png', 60, N'ژوبین')
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name]) VALUES (5, N'Data/Images/5.png', 70, N'ترامپ')
SET IDENTITY_INSERT [dbo].[UserAvatar] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1068, 1083, N'keivan.moazami@yahoo.com', N'123456789', NULL, NULL, 0, 0, 1, CAST(0x0000A72300AF6405 AS DateTime), CAST(0x0000A72300BD1801 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1069, 1084, N'moz@yahoo.com', N'************', NULL, NULL, 0, 0, 2, CAST(0x0000A72300B0B51E AS DateTime), CAST(0x0000A72300B576C1 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1070, 1085, N'keyvan@yahoo.com', N'11111111111111', NULL, NULL, 0, 0, 0, CAST(0x0000A72300B70A7C AS DateTime), CAST(0x0000A72300C56AB0 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1071, 1086, N'jb@yahoo.com', N'123123', NULL, NULL, 0, 0, 1, CAST(0x0000A72300C067BD AS DateTime), CAST(0x0000A72300CEA1A3 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1072, 1087, N'kivi@yaho.com', N'123', NULL, NULL, 0, 0, 1, CAST(0x0000A72300C6D130 AS DateTime), CAST(0x0000A72300C79030 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1073, 1088, NULL, N'636234501315197436', NULL, NULL, 0, 0, 2, CAST(0x0000A72300CF82E0 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1074, 1089, N'k@z.com', N'123456789', NULL, NULL, 0, 0, 1, CAST(0x0000A72300D53F2E AS DateTime), CAST(0x0000A72400ABDEB7 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1075, 1090, NULL, N'636234701254157078', NULL, NULL, 0, 0, 2, CAST(0x0000A723012B0939 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1076, 1091, NULL, N'636234705794005661', NULL, NULL, 0, 0, 2, CAST(0x0000A723012D1D3C AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1077, 1092, NULL, N'636234706922599824', NULL, NULL, 0, 0, 2, CAST(0x0000A723012DA17E AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1078, 1093, NULL, N'636234707716598835', NULL, NULL, 0, 0, 2, CAST(0x0000A723012DFE8A AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1079, 1094, NULL, N'636234709057915943', NULL, NULL, 0, 0, 2, CAST(0x0000A723012E9BB9 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1080, 1095, NULL, N'636234711019791621', NULL, NULL, 0, 0, 2, CAST(0x0000A723012F81A2 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1081, 1096, NULL, N'636234718876831102', NULL, NULL, 0, 0, 2, CAST(0x0000A72301331A61 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1082, 1097, NULL, N'636234719203707276', NULL, NULL, 0, 0, 2, CAST(0x0000A723013340AF AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1083, 1098, NULL, N'636234720754020912', NULL, NULL, 0, 0, 2, CAST(0x0000A7230133F65D AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1084, 1099, NULL, N'636234722163553976', NULL, NULL, 0, 0, 2, CAST(0x0000A72301349B8B AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1085, 1100, N'keivan.moazami@gmal.com', N'123456789', NULL, NULL, 0, 0, 1, CAST(0x0000A72301356C48 AS DateTime), CAST(0x0000A7230146D761 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1086, 1101, N'ja7ad.borhani@gmail.com', N'123456', NULL, NULL, 0, 0, 1, CAST(0x0000A723013FDDB3 AS DateTime), CAST(0x0000A723014016FE AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1087, 1102, N'q@z.com', N'123456789', NULL, NULL, 0, 0, 1, CAST(0x0000A72400D9ED3D AS DateTime), CAST(0x0000A72400DA3D2F AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1088, 1103, N'jdborhani@gmail.com', N'visualbasic', NULL, NULL, 0, 0, 1, CAST(0x0000A72400DA5FE6 AS DateTime), CAST(0x0000A72400DAEE3A AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1089, 1104, NULL, N'636235401586766126', NULL, NULL, 0, 0, 2, CAST(0x0000A72400E01D73 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1090, 1105, NULL, N'636235552999112109', NULL, NULL, 0, 0, 2, CAST(0x0000A72401256D15 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1091, 1106, NULL, N'636235699975672335', NULL, NULL, 0, 0, 2, CAST(0x0000A7240168B4E6 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1092, 1107, NULL, N'636236544573084783', NULL, NULL, 0, 0, 2, CAST(0x0000A725015FD328 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1093, 1108, NULL, N'636237083503008052', NULL, NULL, 0, 0, 2, CAST(0x0000A72600CB0502 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1094, 1109, NULL, N'636237273039025881', NULL, NULL, 0, 0, 2, CAST(0x0000A7260121C843 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1095, 1110, N'g@g.com', N'123', NULL, NULL, 0, 0, 1, CAST(0x0000A7260129C151 AS DateTime), CAST(0x0000A72801351FB3 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1096, 1111, NULL, N'636237291472287965', NULL, NULL, 0, 0, 2, CAST(0x0000A726012A3869 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1097, 1112, NULL, N'636237906707308311', NULL, NULL, 0, 0, 2, CAST(0x0000A72700B85843 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1098, 1113, NULL, N'636237918551695234', NULL, NULL, 0, 0, 2, CAST(0x0000A72700BDC447 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1099, 1114, NULL, N'636237919453269693', NULL, NULL, 0, 0, 2, CAST(0x0000A72700BE2DEE AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1100, 1115, NULL, N'636238105921110392', NULL, NULL, 0, 0, 2, CAST(0x0000A727011389A1 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1101, 1116, NULL, N'636238107969550030', NULL, NULL, 0, 0, 2, CAST(0x0000A727011479AF AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1102, 1117, NULL, N'636238115211745676', NULL, NULL, 0, 0, 2, CAST(0x0000A7270117CA61 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1103, 1118, NULL, N'636239246790275008', NULL, NULL, 0, 0, 2, CAST(0x0000A7290006C53C AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1104, 1119, NULL, N'636239247233088569', NULL, NULL, 0, 0, 2, CAST(0x0000A7290006F921 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1105, 1120, NULL, N'636239562394512429', NULL, NULL, 0, 0, 2, CAST(0x0000A72900973E1B AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1106, 1121, NULL, N'636239682034169394', NULL, NULL, 0, 0, 2, CAST(0x0000A72900CE0261 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1107, 1122, NULL, N'636239682751670083', NULL, NULL, 0, 0, 2, CAST(0x0000A72900CE5676 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1108, 1123, NULL, N'636239685042609986', NULL, NULL, 0, 0, 2, CAST(0x0000A72900CF62EE AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1109, 1124, NULL, N'636239686757298695', NULL, NULL, 0, 0, 2, CAST(0x0000A72900D02BDF AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1110, 1125, NULL, N'636239707419507816', NULL, NULL, 0, 0, 2, CAST(0x0000A72900D9A139 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1111, 1126, NULL, N'636239708233415665', NULL, NULL, 0, 0, 2, CAST(0x0000A72900DA009B AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1112, 1127, NULL, N'636239736416413887', NULL, NULL, 0, 0, 2, CAST(0x0000A72900E6E74C AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1113, 1128, NULL, N'636239736568288999', NULL, NULL, 0, 0, 2, CAST(0x0000A72900E6F919 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1114, 1129, NULL, N'636239751989085820', NULL, NULL, 0, 0, 2, CAST(0x0000A72900EE0839 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1115, 1130, NULL, N'636240019267803455', NULL, NULL, 0, 0, 2, CAST(0x0000A729016861F2 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1116, 1131, NULL, N'636240500060807829', NULL, NULL, 0, 0, 2, CAST(0x0000A72A00B8F6E0 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1117, 1132, NULL, N'636242496811275336', NULL, NULL, 0, 0, 2, CAST(0x0000A72C0133FD12 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1118, 1133, NULL, N'636242498743620456', NULL, NULL, 0, 0, 2, CAST(0x0000A72C0134DF85 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1119, 1134, NULL, N'636243210012383103', NULL, NULL, 0, 0, 2, CAST(0x0000A72D00EEF553 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1120, 1135, NULL, N'636243369273664762', NULL, NULL, 0, 0, 2, CAST(0x0000A72D0137DCC2 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1121, 1136, NULL, N'636244879038321713', NULL, NULL, 0, 0, 2, CAST(0x0000A72F00D3F64E AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1122, 1137, NULL, N'636244993307487351', NULL, NULL, 0, 0, 2, CAST(0x0000A72F01084539 AS DateTime), NULL)
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
