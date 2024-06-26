USE [database_what_if]
GO
/****** Object:  Table [dbo].[AchievedGifts]    Script Date: 2/21/2017 10:55:53 AM ******/
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
/****** Object:  Table [dbo].[AchievedPosession]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[Achievement]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[AchievementQueryType]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[AchieveStateType]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[ApplicationState]    Script Date: 2/21/2017 10:55:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationState](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FavoritePrice] [int] NOT NULL,
	[DefaultUserName] [nvarchar](50) NOT NULL,
	[DefaultUserCoin] [int] NOT NULL,
	[CreateQuestionPrice] [int] NOT NULL,
	[AnswerPrize] [int] NOT NULL,
	[LikePrize] [int] NOT NULL,
	[CreateNewQuestionPrize] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppTheme]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[CreatedQuestions]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[CreatedQuestionsVerifyType]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[Favorite]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[Gift]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[Level]    Script Date: 2/21/2017 10:55:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[ID] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Manufacture]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[OurAdvertisements]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[PurchaseAvatar]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[PurchaseCategory]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[PurchaseTheme]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[QuestionBoost]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[ReportedQuestions]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[ReportType]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[SelectedAvatar]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[SelectedCategory]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[SelectedTheme]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[Store]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[UserAvatar]    Script Date: 2/21/2017 10:55:54 AM ******/
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
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2/21/2017 10:55:54 AM ******/
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
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 2/21/2017 10:55:54 AM ******/
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

INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (20, 8, 6, 3, CAST(0x0000A71700F1673F AS DateTime), CAST(0x0000A7140112482F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (21, 8, 4, 3, CAST(0x0000A71700F16638 AS DateTime), CAST(0x0000A7140112482F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (22, 8, 5, 3, CAST(0x0000A71700F16E92 AS DateTime), CAST(0x0000A71401124AAD AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (71, 27, 10, 3, CAST(0x0000A71500C7E36B AS DateTime), CAST(0x0000A71500C05963 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (72, 27, 8, 3, CAST(0x0000A71500C7BDD3 AS DateTime), CAST(0x0000A71500C05963 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (73, 27, 15, 2, NULL, CAST(0x0000A71500C05963 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (74, 27, 13, 2, NULL, CAST(0x0000A71500C05963 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (75, 27, 6, 3, CAST(0x0000A71500E10D63 AS DateTime), CAST(0x0000A71500C05963 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (76, 27, 4, 3, CAST(0x0000A71500E0D57C AS DateTime), CAST(0x0000A71500C05963 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (77, 27, 11, 2, NULL, CAST(0x0000A71500C7EAC2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (78, 27, 9, 3, CAST(0x0000A71700BB7CE3 AS DateTime), CAST(0x0000A71500C7EAC2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (79, 27, 16, 2, NULL, CAST(0x0000A71500C7EAC2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (80, 27, 14, 2, NULL, CAST(0x0000A71500C7EAC2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (81, 27, 7, 3, CAST(0x0000A71500E12A89 AS DateTime), CAST(0x0000A71500C7EAC2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (82, 27, 5, 3, CAST(0x0000A71500E0E947 AS DateTime), CAST(0x0000A71500C7EAC2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (84, 27, 17, 3, CAST(0x0000A715016241C6 AS DateTime), CAST(0x0000A71500DCC1D0 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (85, 8, 17, 3, CAST(0x0000A71900C17E57 AS DateTime), CAST(0x0000A71700EC2E64 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (86, 8, 7, 3, CAST(0x0000A71900C16BE2 AS DateTime), CAST(0x0000A71700EC2E64 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (87, 8, 8, 3, CAST(0x0000A71900C17072 AS DateTime), CAST(0x0000A71700EC2E64 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (88, 8, 15, 3, CAST(0x0000A71900C1762D AS DateTime), CAST(0x0000A71700EC2E64 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (89, 8, 9, 2, CAST(0x0000A717012338C1 AS DateTime), CAST(0x0000A71700EC760F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (90, 8, 16, 2, CAST(0x0000A717010D1058 AS DateTime), CAST(0x0000A71700EC760F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (91, 9, 17, 2, NULL, CAST(0x0000A71800AE5DC0 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (92, 9, 15, 2, NULL, CAST(0x0000A71800AE5DC0 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (93, 9, 13, 3, CAST(0x0000A71900F63133 AS DateTime), CAST(0x0000A71800AE5DC0 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (94, 9, 4, 3, CAST(0x0000A71900F6301A AS DateTime), CAST(0x0000A71800AE5DC0 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (95, 9, 5, 2, NULL, CAST(0x0000A71800AF8044 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (96, 9, 14, 2, NULL, CAST(0x0000A71800AF8044 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (97, 9, 6, 2, NULL, CAST(0x0000A71A00154DD9 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (98, 28, 4, 3, CAST(0x0000A71A011D513E AS DateTime), CAST(0x0000A71A00C9A293 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (99, 28, 5, 3, CAST(0x0000A71A011D5F36 AS DateTime), CAST(0x0000A71A00C9D871 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (100, 28, 13, 3, CAST(0x0000A71A011D622D AS DateTime), CAST(0x0000A71A011D4F8A AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (101, 28, 14, 3, CAST(0x0000A71A011DEB99 AS DateTime), CAST(0x0000A71A011D5A99 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (102, 28, 8, 3, CAST(0x0000A71A012AD458 AS DateTime), CAST(0x0000A71A012ACF4F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (103, 31, 13, 2, NULL, CAST(0x0000A71B00B43C95 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (104, 31, 4, 2, NULL, CAST(0x0000A71B00B43C95 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (105, 36, 4, 2, NULL, CAST(0x0000A71B0152A6B6 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (106, 35, 4, 3, CAST(0x0000A71C009E4F17 AS DateTime), CAST(0x0000A71B016A4336 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (107, 36, 5, 2, NULL, CAST(0x0000A71B017E0845 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (108, 35, 5, 3, CAST(0x0000A71C009E570D AS DateTime), CAST(0x0000A71C009E3545 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (109, 33, 4, 2, NULL, CAST(0x0000A71C00AF4D55 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (110, 47, 8, 3, CAST(0x0000A71E0156D7AD AS DateTime), CAST(0x0000A71E0154D9C4 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (111, 47, 4, 3, CAST(0x0000A71E0156D6DF AS DateTime), CAST(0x0000A71E0154D9C4 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (112, 47, 9, 2, NULL, CAST(0x0000A71E0154F874 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (113, 47, 5, 2, NULL, CAST(0x0000A71E0154F874 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (114, 57, 4, 2, NULL, CAST(0x0000A71F00BF6FBC AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (115, 57, 5, 2, NULL, CAST(0x0000A71F00BF8375 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (116, 58, 4, 3, CAST(0x0000A71F0146E23C AS DateTime), CAST(0x0000A71F0146DA1F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (117, 58, 5, 3, CAST(0x0000A71F016FEC40 AS DateTime), CAST(0x0000A71F0149FCDC AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1114, 58, 8, 3, CAST(0x0000A7210093B0FD AS DateTime), CAST(0x0000A7210093ABF8 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1115, 58, 9, 3, CAST(0x0000A72100945F11 AS DateTime), CAST(0x0000A72100945B1C AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1116, 58, 13, 3, CAST(0x0000A721009D4395 AS DateTime), CAST(0x0000A721009D4015 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1117, 58, 14, 3, CAST(0x0000A721009D4D29 AS DateTime), CAST(0x0000A721009D4B2E AS DateTime))
SET IDENTITY_INSERT [dbo].[AchievedPosession] OFF
SET IDENTITY_INSERT [dbo].[Achievement] ON 

INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (4, N'عمومی تازه کار', N'جواب به یک سوال عمومی', 20, N'data/images/1.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1, NULL, NULL, 1, 1, 1, 0)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (5, N'عمومی جون', N'جواب به دو سوال عمومی', 30, N'data/images/2.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1, NULL, NULL, 1, 1, 2, 0)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (6, N'ورزشی تازه کار', N'جواب به یک سوال ورزشی', 20, N'data/images/3.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1, NULL, NULL, 1, 2, 1, 0)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (7, N'ورزشی جون', N'جواب به دو سوال ورزشی', 40, N'data/images/4.png', N'#c33d3d', CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 2, 2, 0)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (8, N'بزرگسال تازه کار', N'جواب به یک سوال بزرگسال', 50, N'data/images/5.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 7, 1, 0)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (9, N'بزرگسال جون', N'جواب به دو سوال بزرگسال', 60, N'data/images/6.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 7, 2, 0)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (10, N'پزشکی تازه کار', N'جواب به یک سوال پزشکی', 30, N'data/images/7.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1, NULL, NULL, 1, 8, 1, 0)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (11, N'پزشکی جون', N'جواب به دو سوال پزشکی', 40, N'data/images/8.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 8, 2, 0)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (13, N'خانوادگی تازه کار', N'جواب به یک سوال خانوادگی', 30, N'data/images/9.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 5, 1, 0)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (14, N'خانوادگی جون', N'جواب به دو سوال خانوادگی', 40, N'data/images/10.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 5, 2, 0)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (15, N'سیاسی تازه کار', N'جواب به یک سوال سیاسی', 30, N'data/images/11.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 6, 1, 0)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (16, N'سیاسی جون', N'جواب به دو سوال سیاسی', 40, N'data/images/12.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, NULL, NULL, 1, 6, 2, 0)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [Star], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [QueryTypeID], [Query], [LevelID], [IsActive], [CategoryID], [CategoryQuantity], [Prize]) VALUES (17, N'گلد', N'جواب به دو سوال خاص', 100, N'data/images/4.png', N'#c33d3d', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 2, N'SELECT Count( [QuestionID]) FROM [database_what_if].[dbo].[Answer] Where [UserID] = @p0 And [QuestionID] = 12 Or [QuestionID] = 18', 1, 1, NULL, NULL, 0)
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

INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1964, 8, 50, NULL, NULL, 1, CAST(0x0000A71900D2A5D2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1965, 8, 31, NULL, NULL, 1, CAST(0x0000A71900D2A83C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1966, 8, 33, NULL, NULL, 1, CAST(0x0000A71900D2AA3B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1967, 8, 34, NULL, NULL, 1, CAST(0x0000A71900D2AC60 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1968, 8, 46, NULL, NULL, 1, CAST(0x0000A71900D2AEAA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1969, 8, 58, NULL, NULL, 1, CAST(0x0000A71900D2B282 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1970, 8, 49, NULL, NULL, 1, CAST(0x0000A71900D2B48F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1971, 8, 61, NULL, NULL, 1, CAST(0x0000A71900D2B61E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1972, 8, 47, NULL, NULL, 1, CAST(0x0000A71900D2B87A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1973, 8, 48, NULL, NULL, 1, CAST(0x0000A71900D2BAFC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1974, 8, 51, NULL, NULL, 1, CAST(0x0000A71900D2BD0E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1975, 8, 53, NULL, NULL, 1, CAST(0x0000A71900D2BF7E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1976, 8, 54, NULL, NULL, 1, CAST(0x0000A71900D2C157 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1977, 8, 55, NULL, NULL, 1, CAST(0x0000A71900D2C3FF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1978, 8, 56, NULL, NULL, 1, CAST(0x0000A71900D2C68F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1979, 8, 57, NULL, NULL, 1, CAST(0x0000A71900D2C93B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1980, 8, 38, NULL, NULL, 1, CAST(0x0000A71900D5486F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1981, 8, 41, NULL, NULL, 1, CAST(0x0000A71900D54E88 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1982, 8, 42, NULL, NULL, 1, CAST(0x0000A71900DD8CE1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1983, 8, 43, NULL, NULL, 1, CAST(0x0000A71900DD98A3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1984, 8, 44, NULL, NULL, 1, CAST(0x0000A71900DD9FFF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1985, 8, 26, NULL, NULL, 1, CAST(0x0000A71900DDA0D2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1986, 8, 1, NULL, NULL, 1, CAST(0x0000A71900DDA1B3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1987, 8, 27, NULL, NULL, 1, CAST(0x0000A71900DDA252 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1988, 8, 28, NULL, NULL, 1, CAST(0x0000A71900DDA30E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1989, 8, 29, NULL, NULL, 1, CAST(0x0000A71900DDA3EF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1990, 8, 35, NULL, NULL, 1, CAST(0x0000A71900DDA4CB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1991, 8, 36, NULL, NULL, 1, CAST(0x0000A71900DDA574 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1992, 8, 37, NULL, NULL, 1, CAST(0x0000A71900DDA634 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1993, 8, 45, NULL, NULL, 1, CAST(0x0000A71900DDA6DD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1994, 8, 39, NULL, NULL, 1, CAST(0x0000A71900DDA7D5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1995, 8, 40, NULL, NULL, 1, CAST(0x0000A71900DDA85D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1996, 8, 32, NULL, NULL, 1, CAST(0x0000A71900DDA935 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1997, 8, 59, NULL, NULL, 1, CAST(0x0000A71900DDAA32 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1998, 8, 60, NULL, NULL, 1, CAST(0x0000A71900DDAAB1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (1999, 8, 24, NULL, NULL, 1, CAST(0x0000A71900DDB075 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2000, 8, 22, NULL, NULL, 1, CAST(0x0000A71900DDBFA8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2001, 8, 30, NULL, NULL, 1, CAST(0x0000A71900DDC8AA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2002, 8, 52, NULL, NULL, 1, CAST(0x0000A71900DDCEA7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2003, 8, 23, NULL, NULL, 1, CAST(0x0000A71900DDD36E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2004, 8, 21, NULL, NULL, 1, CAST(0x0000A71900DDDAA5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2005, 8, 3, NULL, NULL, 1, CAST(0x0000A71900DDE324 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2006, 8, 2, NULL, NULL, 1, CAST(0x0000A71900DDE471 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2007, 8, 25, NULL, NULL, 1, CAST(0x0000A71900DDE662 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2008, 8, 6, NULL, NULL, 1, CAST(0x0000A7190133EC3E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2009, 9, 50, NULL, NULL, 1, CAST(0x0000A71A0014E397 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2010, 9, 31, NULL, NULL, 1, CAST(0x0000A71A00152621 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2011, 9, 33, NULL, NULL, 0, CAST(0x0000A71A00152BEB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2012, 9, 34, NULL, NULL, 1, CAST(0x0000A71A00153677 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2013, 9, 64, NULL, NULL, 1, CAST(0x0000A71A001538EB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2014, 9, 6, NULL, NULL, 1, CAST(0x0000A71A00153A41 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2015, 9, 5, NULL, NULL, 1, CAST(0x0000A71A00154741 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2016, 9, 4, NULL, NULL, 1, CAST(0x0000A71A0015481D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2017, 28, 50, 1, NULL, 1, CAST(0x0000A71A00C96106 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2018, 28, 33, NULL, NULL, 1, CAST(0x0000A71A00C982E5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2019, 28, 34, NULL, NULL, 1, CAST(0x0000A71A00C9EEA8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2020, 28, 64, NULL, NULL, 1, CAST(0x0000A71A00C9F0FB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2021, 28, 31, NULL, NULL, 1, CAST(0x0000A71A00C9FBCD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2022, 9, 49, NULL, NULL, 0, CAST(0x0000A71A00D58315 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2023, 9, 58, NULL, NULL, 1, CAST(0x0000A71A00DADCC9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2024, 9, 46, NULL, NULL, 0, CAST(0x0000A71A00DAE378 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2025, 28, 9, NULL, NULL, 1, CAST(0x0000A71A011CC1DE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2026, 28, 8, NULL, NULL, 0, CAST(0x0000A71A011CC8BC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2027, 28, 7, NULL, NULL, 0, CAST(0x0000A71A011CCD6C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2028, 28, 49, NULL, NULL, 1, CAST(0x0000A71A011CED15 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2029, 28, 58, 1, NULL, 0, CAST(0x0000A71A011CFC5A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2030, 28, 46, NULL, NULL, 1, CAST(0x0000A71A011D1981 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2031, 28, 47, NULL, NULL, 1, CAST(0x0000A71A011D48DB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2032, 28, 48, NULL, 1, 1, CAST(0x0000A71A011DA90A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2033, 28, 51, NULL, NULL, 1, CAST(0x0000A71A011DBF2D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2034, 28, 53, NULL, NULL, 0, CAST(0x0000A71A011DC75D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2035, 28, 17, NULL, NULL, 0, CAST(0x0000A71A011E942F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2036, 33, 50, NULL, NULL, 0, CAST(0x0000A71A012232D4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2037, 33, 31, NULL, NULL, 0, CAST(0x0000A71A01231CD1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2038, 33, 33, NULL, NULL, 0, CAST(0x0000A71A0123B435 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2039, 33, 34, NULL, NULL, 0, CAST(0x0000A71A0125807B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2040, 31, 50, NULL, NULL, 1, CAST(0x0000A71A015D4756 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2041, 31, 9, NULL, NULL, 1, CAST(0x0000A71A015D5520 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2042, 31, 8, NULL, NULL, 1, CAST(0x0000A71A0173C1ED AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2043, 31, 7, NULL, NULL, 0, CAST(0x0000A71A017905A8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2044, 36, 50, NULL, NULL, 0, CAST(0x0000A71B00BBE826 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2045, 36, 31, NULL, NULL, 1, CAST(0x0000A71B00BBEA13 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2046, 36, 33, NULL, NULL, 1, CAST(0x0000A71B00BC2CE3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2047, 35, 50, NULL, NULL, 1, CAST(0x0000A71B016A3DB3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2048, 36, 34, NULL, NULL, 1, CAST(0x0000A71B017DA7CB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2049, 36, 64, NULL, NULL, 0, CAST(0x0000A71B017DB540 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2050, 36, 49, NULL, NULL, 1, CAST(0x0000A71B017DBD41 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2051, 36, 58, NULL, NULL, 0, CAST(0x0000A71B017DC570 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2052, 36, 74, NULL, NULL, 0, CAST(0x0000A71B017DFC89 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2053, 36, 46, NULL, NULL, 1, CAST(0x0000A71B017E01BC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2054, 35, 31, NULL, NULL, 1, CAST(0x0000A71C009E2374 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2055, 33, 64, NULL, NULL, 0, CAST(0x0000A71C00AF44DA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2056, 36, 76, NULL, NULL, 0, CAST(0x0000A71D00CC18D5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2057, 36, 78, NULL, NULL, 0, CAST(0x0000A71D00CC2060 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2058, 36, 47, NULL, NULL, 0, CAST(0x0000A71D00CC296C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2059, 36, 48, NULL, NULL, 0, CAST(0x0000A71D00CC2E17 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2060, 36, 51, NULL, NULL, 0, CAST(0x0000A71D00CC393E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2061, 36, 53, NULL, NULL, 0, CAST(0x0000A71D00CC42D6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2062, 36, 54, NULL, NULL, 0, CAST(0x0000A71D00CC491E AS DateTime))
GO
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2063, 36, 55, NULL, NULL, 0, CAST(0x0000A71D00CD15D4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2064, 19, 40, NULL, NULL, 1, CAST(0x0000A71E01253AD9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2065, 47, 17, NULL, NULL, 1, CAST(0x0000A71E01282B98 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2066, 47, 15, NULL, NULL, 1, CAST(0x0000A71E01284E9F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2067, 47, 16, NULL, NULL, 1, CAST(0x0000A71E0128A1E6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2068, 49, 50, NULL, NULL, 1, CAST(0x0000A71E0131338F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2069, 47, 50, NULL, NULL, 1, CAST(0x0000A71E01314B58 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2070, 47, 31, NULL, NULL, 1, CAST(0x0000A71E01314FAF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2071, 47, 33, NULL, NULL, 1, CAST(0x0000A71E013157F1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2072, 47, 34, NULL, NULL, 1, CAST(0x0000A71E01315B67 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2073, 47, 64, NULL, NULL, 1, CAST(0x0000A71E01316151 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2074, 47, 49, NULL, NULL, 1, CAST(0x0000A71E013163D8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2075, 49, 31, NULL, NULL, 1, CAST(0x0000A71E0133315D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2076, 49, 33, NULL, NULL, 1, CAST(0x0000A71E01342F91 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2077, 49, 34, NULL, NULL, 1, CAST(0x0000A71E01344845 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2078, 49, 64, NULL, NULL, 1, CAST(0x0000A71E013504FF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2079, 49, 49, NULL, NULL, 1, CAST(0x0000A71E01371021 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2080, 49, 58, NULL, NULL, 1, CAST(0x0000A71E01371122 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2081, 49, 74, NULL, NULL, 1, CAST(0x0000A71E0137201D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2082, 49, 78, NULL, NULL, 1, CAST(0x0000A71E01375F78 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2083, 49, 76, NULL, NULL, 1, CAST(0x0000A71E013865BB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2084, 49, 46, NULL, NULL, 1, CAST(0x0000A71E01386CBE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2085, 49, 47, NULL, NULL, 1, CAST(0x0000A71E01392D26 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2086, 49, 48, NULL, NULL, 1, CAST(0x0000A71E0139871C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2087, 49, 51, NULL, NULL, 1, CAST(0x0000A71E01398877 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2088, 49, 53, NULL, NULL, 1, CAST(0x0000A71E013988C7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2089, 49, 54, NULL, NULL, 1, CAST(0x0000A71E0139898C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2090, 47, 58, NULL, NULL, 1, CAST(0x0000A71E0154E381 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2091, 47, 74, NULL, NULL, 1, CAST(0x0000A71E0154EF14 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2092, 49, 55, NULL, NULL, 1, CAST(0x0000A71F00A4C5A1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2093, 49, 56, NULL, NULL, 1, CAST(0x0000A71F00A4C7CA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2094, 49, 57, NULL, NULL, 1, CAST(0x0000A71F00A4C9D7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2095, 49, 38, NULL, NULL, 1, CAST(0x0000A71F00A4CE87 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2096, 49, 41, NULL, NULL, 1, CAST(0x0000A71F00A4CF9C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2097, 49, 42, NULL, NULL, 1, CAST(0x0000A71F00A4CFA5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2098, 49, 43, NULL, NULL, 1, CAST(0x0000A71F00A4D02D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2099, 49, 44, NULL, NULL, 1, CAST(0x0000A71F00A4D0C8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2100, 49, 26, NULL, NULL, 1, CAST(0x0000A71F00A4D0F2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2101, 49, 79, NULL, NULL, 1, CAST(0x0000A71F00A4D215 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2102, 49, 83, NULL, NULL, 1, CAST(0x0000A71F00A4D215 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2103, 49, 80, NULL, NULL, 1, CAST(0x0000A71F00A4D22C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2104, 49, 81, NULL, NULL, 1, CAST(0x0000A71F00A4D324 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2105, 49, 75, NULL, NULL, 1, CAST(0x0000A71F00A4D324 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2106, 49, 72, NULL, NULL, 1, CAST(0x0000A71F00A4D374 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2107, 49, 67, NULL, NULL, 1, CAST(0x0000A71F00A4D43E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2108, 49, 68, NULL, NULL, 1, CAST(0x0000A71F00A4D471 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2109, 49, 61, NULL, NULL, 1, CAST(0x0000A71F00A4D56A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2110, 49, 63, NULL, NULL, 1, CAST(0x0000A71F00A4D5F2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2111, 49, 65, NULL, NULL, 1, CAST(0x0000A71F00A4D6BB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2112, 49, 1, NULL, NULL, 1, CAST(0x0000A71F00A4D6BB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2113, 49, 27, NULL, NULL, 1, CAST(0x0000A71F00A4DAA2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2114, 49, 28, NULL, NULL, 1, CAST(0x0000A71F00A4DB58 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2115, 49, 29, NULL, NULL, 1, CAST(0x0000A71F00A4DC89 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2116, 49, 35, NULL, NULL, 1, CAST(0x0000A71F00A4DC92 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2117, 49, 36, NULL, NULL, 1, CAST(0x0000A71F00A4DD11 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2118, 49, 37, NULL, NULL, 1, CAST(0x0000A71F00A4DDAC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2119, 49, 45, NULL, NULL, 1, CAST(0x0000A71F00A4DE2F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2120, 49, 39, NULL, NULL, 1, CAST(0x0000A71F00A4DEEF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2121, 49, 40, NULL, NULL, 1, CAST(0x0000A71F00A4DF3A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2122, 49, 32, NULL, NULL, 1, CAST(0x0000A71F00A4E0F7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2123, 49, 66, NULL, NULL, 1, CAST(0x0000A71F00A4E106 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2124, 49, 62, NULL, NULL, 1, CAST(0x0000A71F00A4E192 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2125, 54, 50, NULL, NULL, 1, CAST(0x0000A71F00BBF279 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2126, 54, 31, NULL, NULL, 1, CAST(0x0000A71F00BBF37F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2127, 54, 33, NULL, NULL, 1, CAST(0x0000A71F00BBF3C6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2128, 54, 34, NULL, NULL, 1, CAST(0x0000A71F00BBF4BE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2129, 54, 64, NULL, NULL, 1, CAST(0x0000A71F00BBF4BE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2130, 54, 58, NULL, NULL, 1, CAST(0x0000A71F00BBF5FD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2131, 54, 49, NULL, NULL, 1, CAST(0x0000A71F00BBF5FD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2132, 54, 74, NULL, NULL, 1, CAST(0x0000A71F00BBF656 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2133, 54, 78, NULL, NULL, 1, CAST(0x0000A71F00BBF71B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2134, 54, 76, NULL, NULL, 1, CAST(0x0000A71F00BBF753 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2135, 54, 47, NULL, NULL, 1, CAST(0x0000A71F00BBF84C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2136, 54, 46, NULL, NULL, 1, CAST(0x0000A71F00BBF84C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2137, 54, 48, NULL, NULL, 1, CAST(0x0000A71F00BBF8BC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2138, 54, 51, NULL, NULL, 1, CAST(0x0000A71F00BBF960 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2139, 54, 53, NULL, NULL, 1, CAST(0x0000A71F00BBF98F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2140, 54, 55, NULL, NULL, 1, CAST(0x0000A71F00BBFA96 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2141, 54, 54, NULL, NULL, 1, CAST(0x0000A71F00BBFA96 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2142, 54, 56, NULL, NULL, 1, CAST(0x0000A71F00BD766B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2143, 54, 57, NULL, NULL, 1, CAST(0x0000A71F00BD7776 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2144, 54, 38, NULL, NULL, 1, CAST(0x0000A71F00BD7776 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2145, 54, 41, NULL, NULL, 1, CAST(0x0000A71F00BD77A5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2146, 54, 42, NULL, NULL, 1, CAST(0x0000A71F00BD789E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2147, 54, 43, NULL, NULL, 1, CAST(0x0000A71F00BD789E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2148, 54, 44, NULL, NULL, 1, CAST(0x0000A71F00BD78ED AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2149, 54, 26, NULL, NULL, 1, CAST(0x0000A71F00BD79CA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2150, 54, 83, NULL, NULL, 1, CAST(0x0000A71F00BD79EB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2151, 54, 79, NULL, NULL, 1, CAST(0x0000A71F00BD7AE7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2152, 54, 80, NULL, NULL, 1, CAST(0x0000A71F00BD7AE7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2153, 54, 81, NULL, NULL, 1, CAST(0x0000A71F00BD7B4A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2154, 54, 72, NULL, NULL, 1, CAST(0x0000A71F00BD7C0A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2155, 54, 75, NULL, NULL, 1, CAST(0x0000A71F00BD7C0A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2156, 54, 67, NULL, NULL, 1, CAST(0x0000A71F00BD7C84 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2157, 54, 68, NULL, NULL, 1, CAST(0x0000A71F00BD7D4E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2158, 54, 61, NULL, NULL, 1, CAST(0x0000A71F00BD7D65 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2159, 54, 63, NULL, NULL, 1, CAST(0x0000A71F00BD7E96 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2160, 54, 65, NULL, NULL, 1, CAST(0x0000A71F00BD7ECE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2161, 54, 1, NULL, NULL, 1, CAST(0x0000A71F00BD7FAF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2162, 54, 27, NULL, NULL, 1, CAST(0x0000A71F00BD7FE7 AS DateTime))
GO
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2163, 54, 29, NULL, NULL, 1, CAST(0x0000A71F00BD80E4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2164, 54, 28, NULL, NULL, 1, CAST(0x0000A71F00BD80E4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2165, 54, 35, NULL, NULL, 1, CAST(0x0000A71F00BD8139 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2166, 54, 36, NULL, NULL, 1, CAST(0x0000A71F00BD81F9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2167, 54, 37, NULL, NULL, 1, CAST(0x0000A71F00BD8210 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2168, 54, 39, NULL, NULL, 1, CAST(0x0000A71F00BD8354 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2169, 54, 45, NULL, NULL, 1, CAST(0x0000A71F00BD8354 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2170, 54, 40, NULL, NULL, 1, CAST(0x0000A71F00BD835D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2171, 54, 32, NULL, NULL, 1, CAST(0x0000A71F00BD857D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2172, 54, 66, NULL, NULL, 1, CAST(0x0000A71F00BD8582 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2173, 54, 62, NULL, NULL, 1, CAST(0x0000A71F00BD869F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2174, 54, 59, NULL, NULL, 1, CAST(0x0000A71F00BD869F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2175, 54, 60, NULL, NULL, 1, CAST(0x0000A71F00BD87DE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2176, 54, 69, NULL, NULL, 1, CAST(0x0000A71F00BD87FB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2177, 54, 71, NULL, NULL, 1, CAST(0x0000A71F00BD8906 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2178, 54, 70, NULL, NULL, 1, CAST(0x0000A71F00BD8906 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2179, 54, 73, NULL, NULL, 1, CAST(0x0000A71F00BD8A08 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2180, 54, 82, NULL, NULL, 1, CAST(0x0000A71F00BD8A08 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2181, 54, 77, NULL, NULL, 1, CAST(0x0000A71F00BD8A8F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2182, 54, 24, NULL, NULL, 1, CAST(0x0000A71F00BD8B54 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2183, 54, 22, NULL, NULL, 1, CAST(0x0000A71F00BD8B67 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2184, 54, 30, NULL, NULL, 1, CAST(0x0000A71F00BD8C64 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2185, 54, 52, NULL, NULL, 1, CAST(0x0000A71F00BD8CC6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2186, 54, 23, NULL, NULL, 1, CAST(0x0000A71F00BD8D82 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2187, 54, 21, NULL, NULL, 1, CAST(0x0000A71F00BD8DB6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2188, 54, 2, NULL, NULL, 1, CAST(0x0000A71F00BD8EF4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2189, 54, 3, NULL, NULL, 1, CAST(0x0000A71F00BD8EF4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2190, 54, 25, NULL, NULL, 1, CAST(0x0000A71F00BD8F3F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2191, 55, 50, NULL, NULL, 1, CAST(0x0000A71F00BDC191 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2192, 55, 31, NULL, NULL, 1, CAST(0x0000A71F00BDC38B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2193, 55, 33, NULL, NULL, 1, CAST(0x0000A71F00BDC4C0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2194, 55, 34, NULL, NULL, 1, CAST(0x0000A71F00BDC6F3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2195, 55, 64, NULL, NULL, 1, CAST(0x0000A71F00BDC82D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2196, 55, 49, NULL, NULL, 1, CAST(0x0000A71F00BDC98C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2197, 55, 58, NULL, NULL, 1, CAST(0x0000A71F00BDCB90 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2198, 55, 74, NULL, NULL, 1, CAST(0x0000A71F00BDCCD8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2199, 55, 78, NULL, NULL, 1, CAST(0x0000A71F00BDCE33 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2200, 55, 76, NULL, NULL, 1, CAST(0x0000A71F00BDCF5F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2201, 55, 46, NULL, NULL, 1, CAST(0x0000A71F00BDD0DB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2202, 55, 47, NULL, NULL, 1, CAST(0x0000A71F00BDD2C2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2203, 55, 48, NULL, NULL, 1, CAST(0x0000A71F00BDD406 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2204, 55, 51, NULL, NULL, 1, CAST(0x0000A71F00BDD536 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2205, 55, 53, NULL, NULL, 1, CAST(0x0000A71F00BDD6BB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2206, 55, 54, NULL, NULL, 1, CAST(0x0000A71F00BDD882 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2207, 55, 55, NULL, NULL, 1, CAST(0x0000A71F00BDD9E6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2208, 55, 56, NULL, NULL, 1, CAST(0x0000A71F00BDDB2A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2209, 55, 57, NULL, NULL, 1, CAST(0x0000A71F00BDDD40 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2210, 55, 38, NULL, NULL, 1, CAST(0x0000A71F00BDDE8D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2211, 55, 41, NULL, NULL, 1, CAST(0x0000A71F00BDDFFF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2212, 57, 50, NULL, NULL, 1, CAST(0x0000A71F00BF05F0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2213, 57, 31, NULL, NULL, 1, CAST(0x0000A71F00BF06E8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2214, 57, 33, NULL, NULL, 1, CAST(0x0000A71F00BF071C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2215, 57, 34, NULL, NULL, 1, CAST(0x0000A71F00BF078C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2216, 57, 64, NULL, NULL, 1, CAST(0x0000A71F00BF081E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2217, 57, 49, NULL, NULL, 1, CAST(0x0000A71F00BF085F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2218, 57, 58, NULL, NULL, 1, CAST(0x0000A71F00BF0945 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2219, 57, 74, NULL, NULL, 1, CAST(0x0000A71F00BF0966 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2220, 57, 78, NULL, NULL, 1, CAST(0x0000A71F00BF09C8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2221, 57, 76, NULL, NULL, 1, CAST(0x0000A71F00BF0A7F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2222, 57, 46, NULL, NULL, 1, CAST(0x0000A71F00BF0B0C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2223, 57, 47, NULL, NULL, 1, CAST(0x0000A71F00BF0B8F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2224, 57, 48, NULL, NULL, 1, CAST(0x0000A71F00BF0B94 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2225, 57, 51, NULL, NULL, 1, CAST(0x0000A71F00BF666A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2226, 57, 53, NULL, NULL, 1, CAST(0x0000A71F00BF6726 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2227, 57, 54, NULL, NULL, 1, CAST(0x0000A71F00BF672A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2228, 57, 55, NULL, NULL, 1, CAST(0x0000A71F00BF6831 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2229, 57, 56, NULL, NULL, 1, CAST(0x0000A71F00BF688F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2230, 57, 57, NULL, NULL, 1, CAST(0x0000A71F00BF6970 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2231, 57, 38, NULL, NULL, 1, CAST(0x0000A71F00C5FEAF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2232, 57, 41, NULL, NULL, 1, CAST(0x0000A71F00C5FF09 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2233, 57, 42, NULL, NULL, 1, CAST(0x0000A71F00C5FFB1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2234, 57, 43, NULL, NULL, 1, CAST(0x0000A71F00C5FFEE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2235, 57, 44, NULL, NULL, 1, CAST(0x0000A71F00C6003E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2236, 57, 26, NULL, NULL, 1, CAST(0x0000A71F00C60173 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2237, 57, 83, NULL, NULL, 1, CAST(0x0000A71F00C658D0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2238, 55, 42, NULL, NULL, 1, CAST(0x0000A71F011C7FFF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2239, 55, 43, NULL, NULL, 1, CAST(0x0000A71F011C848E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2240, 55, 44, NULL, NULL, 1, CAST(0x0000A71F011C860F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2241, 55, 26, NULL, NULL, 1, CAST(0x0000A71F011C878A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2242, 58, 50, NULL, NULL, 1, CAST(0x0000A71F0146D232 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2243, 58, 31, 1, NULL, 1, CAST(0x0000A71F0149F5C6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2244, 58, 33, NULL, NULL, 1, CAST(0x0000A71F016EB63C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2245, 58, 34, NULL, NULL, 0, CAST(0x0000A71F016EB933 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2246, 58, 64, NULL, NULL, 1, CAST(0x0000A71F016EBA56 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2247, 58, 49, NULL, NULL, 0, CAST(0x0000A71F016EBCD8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2248, 58, 58, NULL, NULL, 1, CAST(0x0000A71F016EBDE3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2249, 58, 74, NULL, NULL, 0, CAST(0x0000A71F016EC01B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2250, 58, 78, 1, NULL, 1, CAST(0x0000A71F016EC5CC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2251, 58, 76, 1, NULL, 1, CAST(0x0000A71F016EC989 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2252, 58, 46, 1, NULL, 1, CAST(0x0000A71F016ECCF5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2253, 58, 47, NULL, NULL, 1, CAST(0x0000A71F016ED0DC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2254, 58, 48, NULL, NULL, 1, CAST(0x0000A71F016EEC9E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2255, 58, 51, NULL, NULL, 1, CAST(0x0000A71F016EEC9E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2256, 58, 53, NULL, NULL, 1, CAST(0x0000A71F016F33FE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2257, 58, 54, 1, NULL, 1, CAST(0x0000A71F016F8C23 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2258, 58, 55, NULL, NULL, 1, CAST(0x0000A71F01700AE7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2259, 58, 56, NULL, NULL, 1, CAST(0x0000A71F01700CB3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2260, 58, 57, NULL, NULL, 1, CAST(0x0000A71F01701320 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2261, 58, 38, NULL, NULL, 1, CAST(0x0000A71F01701507 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (2262, 58, 41, NULL, NULL, 1, CAST(0x0000A71F01701650 AS DateTime))
GO
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3092, 55, 83, NULL, NULL, 1, CAST(0x0000A72000F339F0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3093, 55, 79, NULL, NULL, 1, CAST(0x0000A72000F35ACE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3094, 55, 80, NULL, NULL, 1, CAST(0x0000A72000F35E57 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3095, 1058, 50, NULL, NULL, 1, CAST(0x0000A72000F3B199 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3096, 1058, 31, NULL, NULL, 1, CAST(0x0000A72000F3B50F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3097, 1058, 33, NULL, NULL, 1, CAST(0x0000A72000F3B7D3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3098, 1058, 34, NULL, NULL, 1, CAST(0x0000A72000F432D1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3099, 1058, 64, NULL, NULL, 1, CAST(0x0000A72000F450E2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3100, 1058, 49, NULL, NULL, 1, CAST(0x0000A72000F64334 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3101, 1058, 58, NULL, NULL, 1, CAST(0x0000A72000F645A3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3102, 1058, 74, NULL, NULL, 1, CAST(0x0000A72000F64786 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3103, 1058, 78, NULL, NULL, 1, CAST(0x0000A72000F648C0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3104, 1058, 76, NULL, NULL, 1, CAST(0x0000A72000F649B4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3105, 1058, 46, NULL, NULL, 1, CAST(0x0000A72000F64A53 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3106, 1058, 47, NULL, NULL, 1, CAST(0x0000A72000F64B26 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3107, 1058, 48, NULL, NULL, 1, CAST(0x0000A72000F64C36 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3108, 1058, 51, NULL, NULL, 1, CAST(0x0000A72000F64D4F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3109, 1058, 53, NULL, NULL, 1, CAST(0x0000A72000F64D7A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3110, 1058, 54, NULL, NULL, 1, CAST(0x0000A72000F64E85 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3111, 1058, 55, NULL, NULL, 1, CAST(0x0000A72000F64FBF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3112, 1058, 56, NULL, NULL, 1, CAST(0x0000A72000F64FD2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3113, 1058, 57, NULL, NULL, 1, CAST(0x0000A72000F650F0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3114, 1058, 38, NULL, NULL, 1, CAST(0x0000A72000F651C7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3115, 1058, 41, NULL, NULL, 1, CAST(0x0000A72000F65262 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3116, 1058, 42, NULL, NULL, 1, CAST(0x0000A72000F788AC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3117, 1059, 50, NULL, NULL, 1, CAST(0x0000A7200107ADF4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3118, 1059, 31, NULL, NULL, 1, CAST(0x0000A7200107B089 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3119, 1059, 33, NULL, NULL, 1, CAST(0x0000A7200107B3D0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3120, 1059, 34, NULL, NULL, 1, CAST(0x0000A7200107B616 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3121, 1059, 64, NULL, NULL, 1, CAST(0x0000A7200107B8CB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3122, 1060, 50, NULL, NULL, 1, CAST(0x0000A7200108779C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3123, 1060, 31, NULL, NULL, 1, CAST(0x0000A72001087B37 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3124, 1060, 33, NULL, NULL, 1, CAST(0x0000A72001087E7A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3125, 1060, 34, NULL, NULL, 1, CAST(0x0000A720010880E0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3126, 1061, 50, NULL, NULL, 1, CAST(0x0000A7200108C268 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3127, 1061, 31, NULL, NULL, 1, CAST(0x0000A7200108C4EF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3128, 1061, 33, NULL, NULL, 1, CAST(0x0000A7200108C849 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3129, 1061, 34, NULL, NULL, 1, CAST(0x0000A7200108CA9C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3130, 1061, 64, NULL, NULL, 1, CAST(0x0000A7200108CD4D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3131, 1062, 50, NULL, NULL, 1, CAST(0x0000A72001096357 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3132, 1062, 31, NULL, NULL, 1, CAST(0x0000A7200109665C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3133, 1062, 33, NULL, NULL, 1, CAST(0x0000A7200109694F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3134, 1062, 34, NULL, NULL, 1, CAST(0x0000A720010969E9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3135, 1062, 64, NULL, NULL, 1, CAST(0x0000A72001096D5F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3136, 1062, 49, NULL, NULL, 1, CAST(0x0000A72001096FB7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3137, 1062, 58, NULL, NULL, 1, CAST(0x0000A7200109720B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3138, 1062, 74, NULL, NULL, 1, CAST(0x0000A72001097502 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3139, 1063, 50, NULL, NULL, 1, CAST(0x0000A72001099B47 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3140, 1063, 31, NULL, NULL, 1, CAST(0x0000A72001099D87 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3141, 1063, 33, NULL, NULL, 1, CAST(0x0000A7200109A055 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3142, 1063, 34, NULL, NULL, 1, CAST(0x0000A7200109A37B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3143, 1063, 64, NULL, NULL, 1, CAST(0x0000A7200109A52A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3144, 1065, 50, NULL, NULL, 1, CAST(0x0000A720011CE60F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3145, 1065, 31, NULL, NULL, 1, CAST(0x0000A720011CE60F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3146, 58, 17, NULL, NULL, 1, CAST(0x0000A72100939492 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3147, 58, 15, NULL, NULL, 1, CAST(0x0000A72100939739 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3148, 58, 16, NULL, NULL, 1, CAST(0x0000A7210093D080 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3149, 58, 9, NULL, NULL, 1, CAST(0x0000A72100967AAE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3150, 58, 8, NULL, NULL, 1, CAST(0x0000A72100967B19 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3151, 58, 7, NULL, NULL, 1, CAST(0x0000A72100967F4B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3152, 58, 42, NULL, NULL, 1, CAST(0x0000A7210096B809 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3153, 58, 43, NULL, NULL, 1, CAST(0x0000A7210096BC3F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3154, 58, 44, NULL, NULL, 1, CAST(0x0000A7210096BE77 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3155, 58, 26, NULL, NULL, 1, CAST(0x0000A7210096C0EF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3156, 58, 83, NULL, NULL, 1, CAST(0x0000A7210096C35A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3157, 58, 79, NULL, NULL, 1, CAST(0x0000A7210096C5F9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3158, 58, 80, NULL, NULL, 1, CAST(0x0000A7210096D0AF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3159, 58, 81, NULL, NULL, 1, CAST(0x0000A7210096D3AB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3160, 58, 75, NULL, NULL, 1, CAST(0x0000A7210096D81E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3161, 58, 72, NULL, NULL, 1, CAST(0x0000A7210096DA21 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3162, 58, 67, NULL, NULL, 1, CAST(0x0000A7210096DC0E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3163, 58, 68, NULL, NULL, 1, CAST(0x0000A7210096DDD4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3164, 58, 61, NULL, NULL, 1, CAST(0x0000A7210096DF9B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3165, 58, 63, NULL, NULL, 1, CAST(0x0000A7210096E141 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3166, 58, 65, NULL, NULL, 1, CAST(0x0000A7210096E336 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3167, 58, 1, NULL, NULL, 1, CAST(0x0000A7210096E6C9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3168, 58, 27, 1, NULL, 1, CAST(0x0000A721009D75CA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3169, 58, 28, NULL, NULL, 1, CAST(0x0000A72100A57F17 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3170, 58, 29, NULL, NULL, 1, CAST(0x0000A72100A58116 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3171, 58, 35, NULL, NULL, 1, CAST(0x0000A72100A5829B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (3172, 58, 36, NULL, NULL, 1, CAST(0x0000A72100A58483 AS DateTime))
SET IDENTITY_INSERT [dbo].[Answer] OFF
SET IDENTITY_INSERT [dbo].[ApplicationState] ON 

INSERT [dbo].[ApplicationState] ([ID], [FavoritePrice], [DefaultUserName], [DefaultUserCoin], [CreateQuestionPrice], [AnswerPrize], [LikePrize], [CreateNewQuestionPrize]) VALUES (1, 20, N'Non-Default', 30, 30, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[ApplicationState] OFF
SET IDENTITY_INSERT [dbo].[AppTheme] ON 

INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [Style], [CreatedDate], [UpdatedDate]) VALUES (1, N'آبی', N'آبی', N'آبی', N'#0d27e9', N'#102095', 100, NULL, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EF00000000 AS DateTime))
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [Style], [CreatedDate], [UpdatedDate]) VALUES (2, N'سبز', N'سبز', N'سبز', N'#1ec2bc', N'#157e7a', 30, NULL, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [Style], [CreatedDate], [UpdatedDate]) VALUES (4, N'بنفش', N'بنفش', N'بنفش', N'#cb13d7', N'#8f0d97', 150, NULL, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [Style], [CreatedDate], [UpdatedDate]) VALUES (5, N'قرمز', N'قرمز', N'قرمز', N'#d30838', N'#9f062a', 120, NULL, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [Style], [CreatedDate], [UpdatedDate]) VALUES (6, N'زرد', N'زرد', N'زرد', N'#c6bf09', N'#c6bf09', 100, NULL, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[AppTheme] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (1, N'عمومی', N'عمومی', N'عمومی', N'#cb13d7', N'#8f0d97', N'#9410a6', 100, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (2, N'ورزشی', N'ورزشی', N'ورزشی', N'#1ec2bc', N'#157e7a', N'#158b87', 150, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6F000000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (5, N'خانوادگی', N'خانوادگی', N'خانوادگی', N'#0d27e9', N'#102095', N'#091ba1', 50, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6F000000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (6, N'سیاسی', N'سیاسی', N'سیاسی', N'#0d27e9', N'#0048bb', N'#0027e9', 100, CAST(0x0000A70B00000000 AS DateTime), CAST(0x0000A81200000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (7, N'بزرگسال', N'بزرگسال', N'بزرگسال', N'#0d27e9', N'#d30838', N'#0027e9', 15, CAST(0x0000A70B00000000 AS DateTime), CAST(0x0000A6F700000000 AS DateTime), 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient]) VALUES (8, N'پزشکی', N'پزشکی', N'پزشکی', N'#0d27e9', N'#c6bf09', N'#0027e9', 200, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1)
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
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1063, 8, 6, N'test comment', NULL, 1, CAST(0x0000A70E01077B64 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1064, 8, 6, N'12345678..
', NULL, 1, CAST(0x0000A70E010A1D70 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1065, 27, 21, N'سلام ', NULL, 1, CAST(0x0000A70E0132F3A3 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1066, 27, 17, N'نه معلومه که نه،  اینطوری زیبایی های دنیا رو از دست میدادم', NULL, 1, CAST(0x0000A70E018874EE AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1067, 8, 7, N'tetttttttt', NULL, 1, CAST(0x0000A71000CE53F0 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1068, 27, 6, N'دوست داشتی زندگی میکردی ', NULL, 1, CAST(0x0000A7110169F244 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1069, 27, 10, N'ایزی لایف جالب بود ', NULL, 1, CAST(0x0000A712009EC5FC AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1070, 8, 16, N'test', NULL, 1, CAST(0x0000A71200B7C7FB AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1071, 8, 16, N'tttttttttttttttttttttttt', NULL, 1, CAST(0x0000A71301077C15 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1072, 8, 38, N'ey baba', NULL, 1, CAST(0x0000A7170125C58B AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1073, 9, 29, N'نه', NULL, 1, CAST(0x0000A71800AE9BB7 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1074, 8, 50, N'yaaaaaaaaaaaaaaaaaa', NULL, 1, CAST(0x0000A71900C1EDB5 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1075, 8, 58, N'excellent', NULL, 1, CAST(0x0000A71900C21CC4 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1076, 28, 48, N'مفهومش واضح نبود', NULL, 1, CAST(0x0000A71A011D9E70 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1077, 57, 38, N'gfhdfhhdfhdfh', NULL, 1, CAST(0x0000A71F00BF9290 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1078, 57, 83, N'fhgjvhjhvm
', NULL, 1, CAST(0x0000A71F00C6297F AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (1079, 58, 31, N'سلام دوستان ', NULL, 1, CAST(0x0000A71F0149C812 AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[CreatedQuestions] ON 

INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (7, 22, N'سوال خوبی بود', N'سوال بدی بود', CAST(0x0000A70D00F8E3AE AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (8, 22, N'سوال بدی بود', N'سوال بدی بود', CAST(0x0000A70D00F9595F AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (9, 8, N'3 milinom midad farzam', N'3 bar sham midadi', CAST(0x0000A70D00F9C8CB AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (10, 22, N'سوال بس بود', N'سوال بدی بود', CAST(0x0000A70D00FBC8D4 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (11, 22, N'سو2ل بس بود', N'سوال بدی بود', CAST(0x0000A70D00FBD360 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (12, 22, N'سو2سیبس بود', N'سوال بدی بود', CAST(0x0000A70D00FC1036 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (13, 22, N'سو2سبببس بود', N'سوال بدی بود', CAST(0x0000A70D00FC2E89 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (14, 9, N'تست', N'تست', CAST(0x0000A70D00FF4A9D AS DateTime), 2, 5, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (15, 8, N'test what', N'test but', CAST(0x0000A70E00A99746 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (16, 27, N'اینترنت 100 گیگ داشتی ', N'فقط باید نگاش میکردی', CAST(0x0000A70E0133A942 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (17, 9, N'کیوان', N'جواد', CAST(0x0000A70E0152A5D6 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (18, 9, N'یه کارت مترو یک ساله رایگان بهت میدادن', N'با گرین کارت امریکا عوضش میکردی', CAST(0x0000A70E016FF905 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (19, 27, N'یه بچه پولدار بودی و زندگیت در رفاه بود ', N'پدر  و مادر سالم نداشتی ', CAST(0x0000A70F0007E9A1 AS DateTime), 2, 5, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (20, 9, N'صد تا دوست داشتی', N'با هیچکدوم صمیمی نبودی', CAST(0x0000A71000AA44E7 AS DateTime), 2, 5, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (21, 27, N'دوست داشتی تهران زندگی میکردی ', N'باید هر روز میرفتی نون میخریدی', CAST(0x0000A71100004D2C AS DateTime), 2, 2, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (22, 27, N'ب', N'ا', CAST(0x0000A713010298E7 AS DateTime), 2, 2, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (23, 27, N'ع', N'ر', CAST(0x0000A714001BC2FD AS DateTime), 2, 8, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (24, 8, N'ttttt', N'ttttt', CAST(0x0000A71900C10850 AS DateTime), 2, 1, 1)
SET IDENTITY_INSERT [dbo].[CreatedQuestions] OFF
SET IDENTITY_INSERT [dbo].[CreatedQuestionsVerifyType] ON 

INSERT [dbo].[CreatedQuestionsVerifyType] ([ID], [VerifyName], [Description]) VALUES (1, N'رد شده', NULL)
INSERT [dbo].[CreatedQuestionsVerifyType] ([ID], [VerifyName], [Description]) VALUES (2, N'در حال بررسي', NULL)
INSERT [dbo].[CreatedQuestionsVerifyType] ([ID], [VerifyName], [Description]) VALUES (3, N'تاييد شده', NULL)
SET IDENTITY_INSERT [dbo].[CreatedQuestionsVerifyType] OFF
SET IDENTITY_INSERT [dbo].[Favorite] ON 

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
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (1034, 27, 11, CAST(0x0000A71401447DF7 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (1035, 27, 7, CAST(0x0000A71700061426 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (1050, 28, 50, CAST(0x0000A71A00C9610F AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (1051, 28, 58, CAST(0x0000A71A011CFC5A AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (1052, 28, 48, CAST(0x0000A71A011DA90A AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2053, 55, 83, CAST(0x0000A72000F33A5C AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2054, 55, 79, CAST(0x0000A72000F35ACE AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2055, 55, 80, CAST(0x0000A72000F35E57 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2056, 1058, 50, CAST(0x0000A72000F3B199 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2057, 1058, 31, CAST(0x0000A72000F3B513 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2058, 1058, 33, CAST(0x0000A72000F3B7D3 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2059, 1058, 34, CAST(0x0000A72000F432D1 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2060, 1058, 64, CAST(0x0000A72000F450E2 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2061, 1059, 50, CAST(0x0000A7200107ADF4 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2062, 1059, 31, CAST(0x0000A7200107B08E AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2063, 1059, 33, CAST(0x0000A7200107B3D0 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2064, 1059, 34, CAST(0x0000A7200107B616 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2065, 1059, 64, CAST(0x0000A7200107B8CB AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2066, 1060, 50, CAST(0x0000A7200108779C AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2067, 1060, 31, CAST(0x0000A72001087B37 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2068, 1060, 33, CAST(0x0000A72001087E7E AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2069, 1060, 34, CAST(0x0000A720010880E0 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2070, 1061, 50, CAST(0x0000A7200108C268 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2071, 1061, 31, CAST(0x0000A7200108C4EF AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2072, 1061, 33, CAST(0x0000A7200108C849 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2073, 1061, 34, CAST(0x0000A7200108CAA1 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2074, 1061, 64, CAST(0x0000A7200108CD52 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2075, 1062, 50, CAST(0x0000A72001096360 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2076, 1062, 31, CAST(0x0000A7200109665C AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2077, 1062, 33, CAST(0x0000A7200109694F AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2078, 1062, 64, CAST(0x0000A72001096D5F AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2079, 1062, 49, CAST(0x0000A72001096FB7 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2080, 1062, 58, CAST(0x0000A7200109720F AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2081, 1062, 74, CAST(0x0000A72001097507 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2082, 1063, 50, CAST(0x0000A72001099B4C AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2083, 1063, 31, CAST(0x0000A72001099D87 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2084, 1063, 33, CAST(0x0000A7200109A059 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2085, 1063, 34, CAST(0x0000A7200109A37B AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2086, 1063, 64, CAST(0x0000A7200109A52A AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2110, 58, 36, CAST(0x0000A72100A58483 AS DateTime))
SET IDENTITY_INSERT [dbo].[Favorite] OFF
SET IDENTITY_INSERT [dbo].[Level] ON 

INSERT [dbo].[Level] ([ID], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (1, 100, 20, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[Level] ([ID], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (2, 120, 30, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Level] OFF
SET IDENTITY_INSERT [dbo].[Manufacture] ON 

INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (1, 8, 3, CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (2, 8, 4, CAST(0x0000A6EF00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (3, 8, 6, CAST(0x0000A72A00000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (4, 8, 7, CAST(0x0000A78600000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Manufacture] OFF
SET IDENTITY_INSERT [dbo].[PurchaseAvatar] ON 

INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1, 2, 54, CAST(0x0000A71F00FB7319 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (2, 2, 55, CAST(0x0000A71F00000000 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1002, 2, 1063, CAST(0x0000A720010D1263 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1003, 2, 1064, CAST(0x0000A720011B794B AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1004, 3, 1065, CAST(0x0000A720011CB96B AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseAvatar] OFF
SET IDENTITY_INSERT [dbo].[PurchaseCategory] ON 

INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (6, 9, 2, CAST(0x0000A70B010E7BDC AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (7, 22, 5, CAST(0x0000A70B0117FCA3 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (8, 22, 8, CAST(0x0000A70B0118B61B AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (9, 8, 8, CAST(0x0000A70B0119A3AA AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (10, 9, 7, CAST(0x0000A70C00129B4A AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (11, 9, 5, CAST(0x0000A70C0012A1F9 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (12, 8, 2, CAST(0x0000A70C00A88962 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (13, 8, 5, CAST(0x0000A70C00AB22DD AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (14, 26, 7, CAST(0x0000A70D010249FE AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (15, 26, 2, CAST(0x0000A70E00F1C122 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (16, 26, 5, CAST(0x0000A70E00F1C3F4 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (17, 26, 6, CAST(0x0000A70E00F1C773 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (18, 26, 8, CAST(0x0000A70E00F1C9EC AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (19, 27, 2, CAST(0x0000A70E016A2982 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (20, 27, 5, CAST(0x0000A70E016BFE55 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (21, 27, 6, CAST(0x0000A70E016C00C9 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (22, 27, 7, CAST(0x0000A70E016C0240 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (23, 27, 8, CAST(0x0000A70E016C0427 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (24, 9, 6, CAST(0x0000A70E01700106 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (25, 9, 8, CAST(0x0000A70E01700410 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (26, 8, 6, CAST(0x0000A71000CE40A4 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (27, 8, 7, CAST(0x0000A71000F4EBDC AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (28, 28, 5, CAST(0x0000A71A00C99B90 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (29, 28, 7, CAST(0x0000A71A011D6A74 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (30, 31, 5, CAST(0x0000A71A015D3F93 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (31, 35, 5, CAST(0x0000A71C009E6898 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (32, 35, 7, CAST(0x0000A71C009E6C09 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (33, 47, 7, CAST(0x0000A71E010E50CD AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (34, 58, 7, CAST(0x0000A71F016EFBE4 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1034, 58, 5, CAST(0x0000A7210094060F AS DateTime))
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
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (15, 27, 6, CAST(0x0000A70E016C15CE AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (16, 27, 5, CAST(0x0000A70E016C16DE AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (17, 27, 4, CAST(0x0000A70E016C1821 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (18, 27, 2, CAST(0x0000A70E016C1A59 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (19, 9, 5, CAST(0x0000A70E01700922 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (20, 8, 4, CAST(0x0000A7120100A552 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (21, 8, 6, CAST(0x0000A713010758D5 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (22, 28, 2, CAST(0x0000A71A011E483B AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (23, 47, 2, CAST(0x0000A71E0156D11F AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (24, 58, 2, CAST(0x0000A71F016ED8C0 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1024, 55, 2, CAST(0x0000A72000F33FED AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1025, 1058, 2, CAST(0x0000A72000F3C11B AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseTheme] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (1, N'HHHHHHHH', N'HHHHHHHH', 1, 46, 6, 0, 1, 75, CAST(0x0000A6EE00AD2C08 AS DateTime), CAST(0x0000A6EE00AD2C08 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (2, N'از هر مغازه ای که میخواستی، رایگان لباس میخریدی', N'مجبور بودی مثل سوپر من، شرتت رو رو شلوار میپوشیدی', 1, 33, 2, 2, 0, 20, CAST(0x0000A80800AD2C08 AS DateTime), CAST(0x0000A80800AD2C08 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (3, N'هیچوقت گرسنه ات نمیشد', N'رنگت مثل درختا سبز بود و باید روزی 1 ساعت پاهات رو تو زمین فرو میکردی', 1, 34, 5, 0, 1, 30, CAST(0x0000A6F700000000 AS DateTime), CAST(0x0000A6F700000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (4, N'کنکور رو کلا حذف میکردن', N'دانشگاه ها تفکیک جنسیتی میشدن', 2, 34, 3, 1, 0, 40, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (5, N'وقتی شیر آب رو باز میکردی ازش پول میومد', N'برای بدست اوردن آب باید روزی هشت ساعت کار میکردی', 2, 35, 2, 1, 0, 50, CAST(0x0000A81C00000000 AS DateTime), CAST(0x0000A81C00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (6, N'یه خونه رایگان بهت میدادن', N'10 سال از عمرت کم میشد', 2, 38, 3, 1, 0, 60, CAST(0x0000A7FF00000000 AS DateTime), CAST(0x0000A7FF00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (7, N'به جای اینکه یارانه بدن، همه ماهی 10 هزار تومن هم میدادن', N'دیگه کسی اختلاس و دزدی نمیکرد', 5, 33, 6, 1, 0, 70, CAST(0x0000A80800000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (8, N'پولداری میشدی', N'باید با کسی که کنارت نشسته ازدواج میکردی', 5, 39, 4, 0, 0, 80, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (9, N'یارانت دوبرابر میشد ', N'باید به غرضی رای میدادی', 5, 43, 5, 0, 0, 90, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (10, N'حقوقت سه میلیون بود ', N'نصفش رو باید پول ایزی لایف میدادی', 6, 39, 3, 2, 0, 91, CAST(0x0000A80800000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (11, N'یه شغل با آبرو داشتی', N'یه زن بی آبرو گیرت میومد', 6, 41, 3, 1, 0, 92, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (12, N'رتبه یک کنکور میشدی', N'باید بعدش رفتگر می شدی', 6, 50, 3, 2, 1, 93, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (15, N'سال نو آیفون هدیه بگیری', N'ولی تا آخر سال اجازه نداشتی روش برنامه بریزی', 7, 12, 0, 0, 0, 40, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A81C00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (16, N'روحانی رئیس جمهور بشه', N'دیگه قید انرژی هسته ای رو بزنیم', 7, 12, 0, 0, 0, 2, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (17, N'هر کتابی رو که میخواستی به مغزت تزریق میکردی', N'کور میشدی', 7, 20, 13, 12, 10, 50, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (18, N'اندازه بیل گیتس پول داشتی', N'یه دست و یه پا نداشتی', 8, 22, 31, 10, 10, 60, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (19, N'زورت ده برابر میشد', N'عقلت نصف میشد', 8, 21, 14, 12, 3, 55, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (20, N'هر چه قدر میخواستی میخوردی و چاق نمیشدی', N'روزی 10 بار باید دستشویی میرفتی', 8, 28, 13, 10, 10, 70, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (21, N'میتونستی ذهن بقیه رو بخونی', N'بقیه هم میتونستن ذهنت رو بخونن', 1, 16, 25, 3, 5, 39, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (22, N'میتونستی زیر آب هم نفس بکشی', N'برای اینکه زنده بمونی باید همیشه بدنت رو خیس نگه میداشتی', 1, 34, 12, 6, 6, 60, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (23, N'پدر و مادرت رو خودت انتخاب میکردی', N'40 سال بشتر عمر نمیکردی', 1, 15, 18, 17, 17, 45, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (24, N'یارانه هر نفر 500 هزار تومن میشد', N'ترامپ رئیس جمهور ایران میشد', 1, 16, 13, 10, 10, 65, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (25, N'یک ', N'دو', 1, 4, 0, 0, 0, 20, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (26, N'تا ابد زنده بودی', N'دیگه هیچکس باهات حرف نمیزد', 1, 11, 0, 0, 0, 80, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (27, N'میتونستی تو رویاهات زندگی کنی', N'دیگه هیچوقت نمیتونستی ازشون خارج بشی', 1, 8, 1, 1, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (28, N'دیگه سرما نمیخوردی', N'همیشه  کفشات لنگه به لنگه بودن', 1, 8, 0, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (29, N'هیچوقت چاق نمیشدی', N'هیچوقت هم گشنت نمیشد', 1, 9, 0, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (30, N'برای 25 سال ماهی 100 میلیون درآمد داشتی', N'برای 5 سال نمیتونستی لباسات را حتی برای قضای حاجت در بیاری', 1, 3, 0, 0, 0, 60, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (31, N'تو زندگی به هر چی که میخواستی  میرسیدی', N'دیگه هیچوقت نمیرسیدی خانواده و دوستات رو بینی', 1, 30, 2, 1, 0, 99, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (32, N'به جای بتمن بودی', N'بهترین دوستت جای جوکر بود', 1, 5, 0, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (33, N'میتونستی ذهن مردم رو بخونی', N'اونها هم میتونستن ذهنت رو بخونن', 1, 24, 3, 0, 0, 99, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (34, N'هفته ای یه بار قضای حاجت میکردی', N'ولی یه یارش به اندازه 10 بار پر سر و صدا تر بود', 1, 23, 5, 0, 0, 99, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (35, N'هر کی رو میخواستی عاشقت میشد', N'هر کی هم میخواست عاشقش میشدی', 1, 8, 0, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (36, N'چند برابر خوشگل تر میشدی', N'ولی آخر هفته ها جنسیتت عوض میشد', 1, 7, 0, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (37, N'یه همزاد داشتی که هر چی میگفتی رو انجام میداد', N'عاشق اونی میشد که میخوای باهاش عروسی کنی', 1, 6, 0, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (38, N'جای رستم بودی', N'دوستت جای اسفندیار بود', 1, 11, 2, 1, 0, 80, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (39, N'هر چی میگفتی هیج عواقب بدی برات نداشت', N'ولی لهجه خیلی آبرو ریز داشتی', 1, 5, 0, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (40, N'هیچوقت تو زندگیت شکست نمیخوردی', N'هیچوقت هم عاشق نمیشدی', 1, 6, 0, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (41, N'صدای باد معده نصف میشد', N'پخش بوش 2 برابر بود', 1, 11, 1, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (42, N'دستگاه پرینتی داشتی که پول واقعی چاپ میکرد', N'تا آخر عمر باید دامن میپوشیدی و دیگه نمیتونستی زیرش شورت بپوشی', 1, 10, 1, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (43, N'میتونستی 5 نفر رو به همراه خودت میلیاردر کنی', N'همزمان به دلیل کار تو 5 نفر هم به زمین گرم میخوردن', 1, 9, 1, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (44, N'قالی پرنده داشتی', N'هیچوقت نمیتونستی ازش پیاده شی', 1, 9, 0, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (45, N'کت جادویی داشتی و هر موقع اراده میکردی یک میلیون از جیبش بر میداشتی', N'هر موقع که یک میلیونش رو خرج میکردی یک نفر توی اون گوشه دنیا میمرد', 1, 4, 1, 0, 0, 70, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (46, N'خوشگل ترین آدم دنیا بودی', N'نمیتونستی ازدواج کنی', 1, 17, 3, 2, 0, 90, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (47, N'خونت همیشه تمیز بود و همه کارا خونه خود به خود انجام میشد', N'همیشه باید با کفشهای کثیف اینور و اونور میرفتی', 1, 14, 2, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (48, N'شخصیتهای کارتونی واقعی بودن', N'آدما تخیلی بودن', 1, 14, 2, 0, 1, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (49, N'هر عکسی که تو ایستاگرام پست میکردی 1 میلیون لایک میخورد', N' تو همشون چشات چب بود و انگشتت تو دماقت بود', 1, 18, 3, 0, 0, 90, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (50, N'همیشه هیکلت رو فرم بود', N'به جای روزی 1 ساعت ورزش، روزی 60 نفر رو ماچ میکردی', 1, 28, 2, 2, 0, 100, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (51, N'10 تا سکه میگرفتی', N'هر چی که توی ... جواب دادی واقعا اتفاق میاق میفتاد', 1, 14, 1, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (52, N'سی تا سکه بهت میدادیم تا اینکه بتونی یک بسته رو بخری', N'باید پاسخ مثبت بدی و ما به فروشگاه وصلت کنیم', 1, 2, 0, 0, 0, 60, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (53, N'سه تا زبان جدید را مثل آب خوردن یاد میگرفتی', N'زبان مادریت رو کلا فراموش میکردی', 1, 13, 2, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (54, N'جذابیت چند برابر میشد', N'عقلت نصف میشد', 1, 12, 2, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (55, N'احتیاج به خواب نداشتی', N'20 سال زودتر میمردی', 1, 13, 1, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (56, N'ساعت جادویی داشتی و میتونستی زمان رو متوقف کنی', N'هر موقع زمان رو متوقف میکردی یک نفر سکته میزد', 1, 10, 2, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (57, N'هر موقع خوشحال بودی هوا آفتابی میشد', N'هر موقع هم که غمگین بودی هوا بارونی میشد', 1, 12, 0, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (58, N'دیگه هیچ جنگی روی زمین نبود', N'اینترنت هم  وجود نداشت', 1, 17, 4, 2, 0, 90, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (59, N'هر کسی رو که اراده میکردی بهترین دوستت میشد', N'فقط و فقط یک روز میتونستید با هم باشید', 1, 3, 0, 0, 0, 70, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (60, N'کجل میشدی', N'روزی 100 هزار تومن بهت میدادن', 1, 2, 1, 0, 0, 70, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (61, N'همه مردم سیاه بودن', N'تو سفید بودی', 1, 11, 2, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (62, N'اراده کنی و بری به 50 سال دیگه', N'20 سال از عمرت کم میشد', 1, 2, 0, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (63, N'میتونستی یه هفته تمام با یکی از معروف ترین بازیگرا باشی', N'هر جا که با هم میرفتید خبرنگرا ولتون نمیکردن', 1, 3, 0, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (64, N'قدرتمند ترین آدم دنیا میشدی', N'برای اینکه مقامت رو از دست ندی روزی 1000 نفر رو میکشتی', 1, 13, 2, 0, 0, 99, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (65, N'میتونستی همسرت رو هر جوری که دوست داشتی  چه ظاهری چه باطنی تغییرش بدی', N'اونم میتونست هر جوری که دوست داشت تغییرت بده', 1, 3, 0, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (66, N'هر جایی که میرفتی بهترین دما و آب و هوا رو داشت', N'ولی توی رخت خوابت غندیل میبستی', 1, 2, 0, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (67, N'از این به بعد به همه غذاها، فیلمها، کتابهاو بازیها دسترسی رایگان داشتی', N'به مدت 10 سال نمیتونستی از خونت بیرون بری', 1, 3, 0, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (68, N'میتونستی یکی از شخصیتهای دنیای غیر واقعی بشی', N'بعدش دیگه نمیتونستی به حالت قبلیت برگردی', 1, 3, 0, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (69, N'ببینی توی یکسال آینده چی قراره اتفاق بیفته', N'بعدش به ازای هر سال که میگذره خاطرات اون سال و سال قبلش رو فراموش کنی', 1, 1, 0, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (70, N'هر لباسی رو از هر فروشگاهی که میخواستی میتونستی بخری', N'همیشه کفشات و جورابات لنگه به لنگه بودن', 1, 1, 0, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (71, N'همه مردم سفید بودن', N'تو سیاه بودی', 1, 1, 0, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (72, N'هر ماشینی رو که دوست داشتی میتونستی بخری', N'هفته ای یکبار باید باهاش جنازه جا به جا میکردی', 1, 3, 0, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (73, N'میتونستی پادشاه یا ملکه انگلیس بشی', N'با یک آدم بد ذات باید عروسی میکردی', 1, 1, 0, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (74, N'راننده شخصی داشتی که هر موقع که میخواستی هر جایی که میگفتی میبردت', N'با ژیان میرسوندت', 1, 7, 2, 0, 0, 90, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (75, N'برای 100 سال خودت و هر کی رو که دوست داشتی بیشتر عمر میکردن و جوون میموندن', N'شورت و جوراب رو دیگه نمیشد در بیارن', 1, 3, 0, 0, 0, 80, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (76, N'میدونستی کی و چجوری میمیری', N'نمیتونستی هیچ کاری برای جلوگیری ازش بکنی', 1, 6, 1, 1, 0, 90, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (77, N'دوستات هم میتونستن به سوالای با حال  برنامه جواب بدن و خودن و اونا سکه رایگان میگرفتید', N'...0', 1, 1, 0, 0, 0, 70, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (78, N'حقوقت 4 برابر میشد', N'قدت نصف میشد', 1, 6, 1, 1, 0, 90, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (79, N'روزی 100 هزار تومن بهت میدادن', N'سالی 1 سانت قدت کوتاه تر میشد', 1, 4, 0, 0, 0, 80, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (80, N'میتونستی پادشاه یا ملکه هر کشوری که میخواستی بشی', N'دیگه نمیتونستی زندگی شادی داشته باشی', 1, 4, 0, 0, 0, 80, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (81, N'25سال کمتر عمر میکردی', N'همیشه سالم و سلامت بودی', 1, 3, 0, 0, 0, 80, CAST(0x0000A71D00000000 AS DateTime), CAST(0x0000A71D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (82, N'فضاییها واقعی بودن و به زمین میومدن', N'با آدما میتونستن عروسی کنن و بچه هاشون آدم فضایی میشدن', 1, 1, 0, 0, 0, 70, CAST(0x0000A71D00000000 AS DateTime), CAST(0x0000A71D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (83, N'از زمان مردنت مطلع میشدی', N'اگه به کسی در موردش مبگفتی همون موقع ن موقع سوسک میشدی', 1, 5, 0, 0, 0, 80, CAST(0x0000A71D00000000 AS DateTime), CAST(0x0000A71D00000000 AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[QuestionBoost] ON 

INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (1, N'خوب', N'خوب', 30, N'mine', N'#fffff', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[QuestionBoost] OFF
SET IDENTITY_INSERT [dbo].[ReportedQuestions] ON 

INSERT [dbo].[ReportedQuestions] ([ID], [UserID], [QuestionID], [ReportTypeID], [CreatedDate]) VALUES (3, 8, 31, 2, CAST(0x0000A717011835E6 AS DateTime))
INSERT [dbo].[ReportedQuestions] ([ID], [UserID], [QuestionID], [ReportTypeID], [CreatedDate]) VALUES (4, 8, 34, 3, CAST(0x0000A717011849BA AS DateTime))
INSERT [dbo].[ReportedQuestions] ([ID], [UserID], [QuestionID], [ReportTypeID], [CreatedDate]) VALUES (5, 8, 26, 1, CAST(0x0000A717011869EB AS DateTime))
INSERT [dbo].[ReportedQuestions] ([ID], [UserID], [QuestionID], [ReportTypeID], [CreatedDate]) VALUES (6, 9, 28, 2, CAST(0x0000A71800AE8329 AS DateTime))
INSERT [dbo].[ReportedQuestions] ([ID], [UserID], [QuestionID], [ReportTypeID], [CreatedDate]) VALUES (7, 8, 42, 1, CAST(0x0000A71900C4D632 AS DateTime))
INSERT [dbo].[ReportedQuestions] ([ID], [UserID], [QuestionID], [ReportTypeID], [CreatedDate]) VALUES (8, 28, 31, 1, CAST(0x0000A71A00C97013 AS DateTime))
INSERT [dbo].[ReportedQuestions] ([ID], [UserID], [QuestionID], [ReportTypeID], [CreatedDate]) VALUES (9, 58, 28, 1, CAST(0x0000A721009D79D1 AS DateTime))
INSERT [dbo].[ReportedQuestions] ([ID], [UserID], [QuestionID], [ReportTypeID], [CreatedDate]) VALUES (10, 58, 29, 2, CAST(0x0000A721009D7D50 AS DateTime))
SET IDENTITY_INSERT [dbo].[ReportedQuestions] OFF
SET IDENTITY_INSERT [dbo].[ReportType] ON 

INSERT [dbo].[ReportType] ([ID], [Name], [Description]) VALUES (1, N'خلاف شرع', N'بد بد بد')
INSERT [dbo].[ReportType] ([ID], [Name], [Description]) VALUES (2, N'تکراری', N'تکراری')
INSERT [dbo].[ReportType] ([ID], [Name], [Description]) VALUES (3, N'حال به هم زن', N'چرت و پرت گویی')
SET IDENTITY_INSERT [dbo].[ReportType] OFF
SET IDENTITY_INSERT [dbo].[SelectedAvatar] ON 

INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (0, 37, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1, 46, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2, 47, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3, 48, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (4, 49, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (5, 50, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (6, 51, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (7, 52, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (8, 53, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (9, 54, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (10, 55, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (11, 56, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (12, 57, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (13, 58, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1005, 1058, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1006, 1059, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1007, 1060, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1008, 1061, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1009, 1062, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1010, 1063, 2)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1011, 1064, 2)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1012, 1065, 3)
SET IDENTITY_INSERT [dbo].[SelectedAvatar] OFF
SET IDENTITY_INSERT [dbo].[SelectedCategory] ON 

INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1, 7, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2, 8, 2)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3, 9, 1)
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
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (20, 26, 8)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (21, 27, 7)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (22, 28, 7)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (23, 30, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (24, 31, 5)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (25, 32, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (26, 33, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (27, 34, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (28, 35, 7)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (29, 36, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (30, 37, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (31, 46, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (32, 47, 7)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (33, 48, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (34, 49, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (35, 50, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (36, 51, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (37, 52, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (38, 53, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (39, 54, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (40, 55, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (41, 56, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (42, 57, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (43, 58, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1035, 1058, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1036, 1059, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1037, 1060, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1038, 1061, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1039, 1062, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1040, 1063, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1041, 1064, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1042, 1065, 1)
SET IDENTITY_INSERT [dbo].[SelectedCategory] OFF
SET IDENTITY_INSERT [dbo].[SelectedTheme] ON 

INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1, 7, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2, 8, 6)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3, 9, 1)
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
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (16, 22, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (17, 23, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (18, 24, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (19, 25, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (20, 26, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (21, 27, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (22, 28, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (23, 30, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (24, 31, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (25, 32, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (26, 33, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (27, 34, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (28, 35, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (29, 36, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (30, 37, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (31, 46, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (32, 47, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (33, 48, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (34, 49, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (35, 50, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (36, 51, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (37, 52, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (38, 53, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (39, 54, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (40, 55, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (41, 56, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (42, 57, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (43, 58, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1035, 1058, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1036, 1059, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1037, 1060, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1038, 1061, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1039, 1062, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1040, 1063, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1041, 1064, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1042, 1065, 1)
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

INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (7, N'b9b83498-86eb-4377-a3df-e4454cff1f38', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A704012CA5B9 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (8, N'b89bb13b-ea92-467a-a248-fe618fae2b70', N'Not-Set', 1, 9855, 0, 0, 1, 1, CAST(0x0000A704012CE8E2 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (9, N'4e46314f-46c2-4ede-b1a2-364e269574c8', N'Not-Set', 1, 8020, 0, 0, 1, 1, CAST(0x0000A704013194FD AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (10, N'958063ac-b6ff-42a2-9e9d-43d6704b0fe7', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A70401341BCF AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (11, N'ef4be27e-d355-4f29-a6e5-93cd96d9a3ed', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A704013B60F8 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (12, N'a055be6d-249a-4745-afc3-aa3ba335f643', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A70401427775 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (13, N'edbedcad-de56-4ae6-88e9-cfd6792c3d5e', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A704014D6929 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (14, N'0ac4fd63-fccd-49b1-b158-70fe7f1b2d30', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A704016F33F7 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (15, N'98ea9631-2d91-4bed-a87d-ce1f136eed2a', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A70401784915 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (16, N'6f4e0b6c-f869-4ea9-88fe-4361c8d4587e', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A70500AD2BEF AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (17, N'6622', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A7060100E19C AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (18, N'6677', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A706014CA346 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (19, N'bea28629-75af-4448-97a2-dae0a79c09c4', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A706015C1221 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (20, N'ab7f6827-9fbd-4768-9f10-c175e0de2bf3', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A7070141255F AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (21, N'94135950-c3d8-4748-a04d-53e915ce8268', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A708000D9E59 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (22, N'a909b0f0-829d-4e99-86e1-2836f2d8474d', N'Not-Set', 1, 9600, 0, 0, 1, 1, CAST(0x0000A708009A5F1A AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (23, N'e96fc299-0752-46d3-802a-8d5c9b6f5d9b', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A70800A8BFBB AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (24, N'9a45dd60-c2de-44d0-a82e-888522c35de8', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A70800A91C4B AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (25, N'5c196d45-a52f-408d-b0f5-5e5b519abe6d', N'Not-Set', 1, 10000, 0, 0, 1, 1, CAST(0x0000A70B013807AE AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (26, N'd02275b5-8eb8-4c80-beda-4b07a832dd59', N'Not-Set', 1, 9500, 0, 0, 1, 1, CAST(0x0000A70D01022283 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (27, N'952c7439-9f13-4fa3-9d67-53c6d83541f6', N'Not-Set', 1, 8760, 0, 0, 1, 1, CAST(0x0000A70D01440794 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (28, N'a2c84931-e16b-4ef7-8964-ef4fc6ab7d61', N'Not-Set', 1, 125, 0, 0, 1, 1, CAST(0x0000A71A00C8FDB5 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (30, N'fbd3157c-5fd2-4319-8639-a9d4295bb13e', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71A00F1732B AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (31, N'72582e4d-ffba-40cd-964b-8a640c0a545f', N'Not-Set', 1, 0, 0, 0, 1, 1, CAST(0x0000A71A00F5C39C AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (32, N'9ab4c450-02dd-4aba-b66b-2b7cbe7de2ff', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71A00F5DBAB AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (33, N'fb1a79cb-b54d-4665-9eb3-67a001b8ee18', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71A0113562F AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (34, N'6b165d35-a9ca-4c7a-bbf9-98cb78e1e3a8', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71A017FC107 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (35, N'33322a81-1b17-41c0-9019-5daa4d00013c', N'Not-Set', 1, 35, 0, 0, 1, 1, CAST(0x0000A71B00B588B7 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (36, N'ee8692e5-ed4c-408d-b359-ca21826ce040', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71B00B88F41 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (37, N'cd95699f-9951-48f9-899f-2259c94d86f1', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71E01045683 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (38, N'2a797cac-8ea4-4eec-b594-51c61e1141cf', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71E01051C3B AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (39, N'82e178ff-1fb5-4b6c-868a-ad2a00f7af95', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71E01070252 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (40, N'ccb6793a-7321-49fd-812c-b782b0e27744', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71E01074B08 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (41, N'2f3771a9-2392-497f-8913-29c723f18844', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71E01076BF9 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (42, N'a4b1ab97-2008-446d-9a87-87448b65ab38', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71E01084D57 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (43, N'2f3771a9-2392-497f-8913-29c723f18842', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71E010914A5 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (44, N'2f3771a9-2392-497f-8913-29c723f18843', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71E010C078C AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (45, N'2f3771a9-2392-497f-8913-29c723f18841', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71E010CBE7E AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (46, N'2f3771a9-2392-497f-8913-29c723f18849', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71E010DB7EA AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (47, N'7ee379e5-bb4f-4a95-98cd-38681a0ccffc', N'Not-Set', 1, 75, 0, 0, 1, 1, CAST(0x0000A71E010E26BD AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (48, N'00d5d78c-b737-4033-9cd3-6733a5f03bf2', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71E010F50AC AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (49, N'a80c6416-0401-41fd-a181-3e65d47dd449', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71E012EA92F AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (50, N'5c9fd4fd-6b2e-4431-b38b-c0126eecf6c7', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71F00A5E24E AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (51, N'06ccc728-4957-40f1-b1b1-080159032704', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71F00A630AC AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (52, N'7a30f79a-2292-4a67-9190-1d6e71984e64', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71F00A6E281 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (53, N'7b2a4460-faa6-4114-b7f5-068bd0965455', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71F00A81CA0 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (54, N'f6f17444-daf2-4d49-b51f-a0d3f7b9a754', N'Not-Set', 1, 20, 0, 0, 1, 1, CAST(0x0000A71F00A898D8 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (55, N'2c58e1f5-13a5-45b4-b0b2-613b0b51c7a3', N'Not-Set', 1, 20, 0, 0, 1, 1, CAST(0x0000A71F00BDBDCB AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (56, N'6cab6368-40d9-46c1-ad37-07d3ba40dde1', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71F00BEC20B AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (57, N'ec22673b-2a5c-4454-885f-26ccaf757597', N'Not-Set', 1, 50, 0, 0, 1, 1, CAST(0x0000A71F00BEFC6A AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (58, N'e52392d9-5d61-4476-a81e-215c475fa964', N'Not-Set', 1, 60, 0, 0, 1, 1, CAST(0x0000A71F01411EB7 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1058, N'4db22837-2b6a-4a01-8abc-9c200d4cfa50', N'Not-Set', 1, 10, 0, 0, 1, 1, CAST(0x0000A72000F3AC1B AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1059, N'30714576-1a60-41a7-9fea-888f08412a49', N'Not-Set', 1, 40, 0, 0, 1, 1, CAST(0x0000A7200107A6DA AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1060, N'a14c1ba7-96b6-4c1b-aa3e-78cbca800c95', N'Not-Set', 1, 45, 0, 0, 1, 1, CAST(0x0000A720010873E9 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1061, N'c8dac843-19cc-4b50-8762-d67e7bb18172', N'Not-Set', 1, 40, 0, 0, 1, 1, CAST(0x0000A7200108BDB8 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1062, N'e9f23887-5718-424a-a2a1-f7ce955b7f1a', N'Not-Set', 1, 30, 0, 0, 1, 1, CAST(0x0000A72001095123 AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1063, N'24ac77cb-bc07-41f2-9704-ea6b309322e0', N'Not-Set', 1, 10, 0, 0, 1, 1, CAST(0x0000A720010996AE AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1064, N'ad2b3d95-82fb-4cf5-a1ba-462444a4db89', N'Not-Set', 1, 20, 0, 0, 1, 1, CAST(0x0000A720011B69CD AS DateTime))
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSceneDateTime]) VALUES (1065, N'7fa0336c-e813-41c6-b09f-261f2fea6b0a', N'Not-Set', 1, 0, 0, 0, 1, 1, CAST(0x0000A720011CADAE AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserAvatar] ON 

INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name]) VALUES (1, N'Data/Images/1.png', 1, NULL)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name]) VALUES (2, N'Data/Images/3.png', 30, N'غول')
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name]) VALUES (3, N'Data/Images/3.png', 50, N'مول')
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name]) VALUES (4, N'Data/Images/4.png', 60, N'ژوبین')
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name]) VALUES (5, N'Data/Images/5.png', 70, N'ترامپ')
SET IDENTITY_INSERT [dbo].[UserAvatar] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (1, 7, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A704012CA5CB AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (2, 8, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A704012CE8E2 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (3, 9, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A704013194FD AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (4, 10, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A70401341BCF AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (5, 11, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A704013B60F8 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (6, 12, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A70401427775 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (7, 13, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A704014D6933 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (8, 14, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A704016F34A4 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (9, 15, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A7040178496D AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (10, 16, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A70500AD2C51 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (11, 17, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A7060100E229 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (12, 18, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A706014CA3C4 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (13, 19, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A706015C122B AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (14, 20, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A707014125F0 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (15, 21, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A708000D9E5E AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (16, 22, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A708009A5F28 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (17, 23, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A70800A8BFC9 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (18, 24, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A70800A91C4B AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (19, 25, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A70B01380836 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (20, 26, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A70D01022288 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (21, 27, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A70D014407B1 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (22, 28, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71A00C8FE2E AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (23, 30, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71A00F17339 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (24, 31, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71A00F5C39C AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (25, 32, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71A00F5DBAB AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (26, 33, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71A0113563D AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (27, 34, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71A017FC18F AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (28, 35, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71B00B588C0 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (29, 36, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71B00B88F41 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (30, 37, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71E01045706 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (31, 46, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71E010DBB6B AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (32, 47, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71E010E2733 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (33, 48, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71E010F50AC AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (34, 49, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71E012EA934 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (35, 50, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71F00A5E25C AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (36, 51, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71F00A630F7 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (37, 52, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71F00A6E286 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (38, 53, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71F00A81CA0 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (39, 54, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71F00A898DC AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (40, 55, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71F00BDBDCB AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (41, 56, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71F00BEC20F AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (42, 57, NULL, N'Password', NULL, NULL, 0, 0, 0, CAST(0x0000A71F00BEFC6F AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (43, 58, NULL, NULL, NULL, NULL, 0, 0, 0, CAST(0x0000A71F01411EDC AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (1043, 1058, NULL, NULL, NULL, NULL, 0, 0, 0, CAST(0x0000A72000F3AC1F AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (1044, 1059, NULL, NULL, NULL, NULL, 0, 0, 0, CAST(0x0000A7200107A6EC AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (1045, 1060, NULL, NULL, NULL, NULL, 0, 0, 0, CAST(0x0000A720010873E9 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (1046, 1061, NULL, NULL, NULL, NULL, 0, 0, 0, CAST(0x0000A7200108BDB8 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (1047, 1062, NULL, NULL, NULL, NULL, 0, 0, 0, CAST(0x0000A72001095194 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (1048, 1063, NULL, NULL, NULL, NULL, 0, 0, 0, CAST(0x0000A720010996AE AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (1049, 1064, NULL, NULL, NULL, NULL, 0, 0, 0, CAST(0x0000A720011B6A35 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime]) VALUES (1050, 1065, NULL, NULL, NULL, NULL, 0, 0, 0, CAST(0x0000A720011CADAE AS DateTime))
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
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_AnswerPrize]  DEFAULT ((0)) FOR [AnswerPrize]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_LikePrize]  DEFAULT ((0)) FOR [LikePrize]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_CreateNewQuestionPrize]  DEFAULT ((0)) FOR [CreateNewQuestionPrize]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_PrizeCoefficient]  DEFAULT ((1)) FOR [PrizeCoefficient]
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_IsVerified]  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[CreatedQuestions] ADD  CONSTRAINT [DF_CreatedQuestions_Verified]  DEFAULT ((0)) FOR [VerifyStateID]
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
