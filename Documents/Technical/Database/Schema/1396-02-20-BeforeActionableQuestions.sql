USE [database_what_if]
GO
/****** Object:  Table [dbo].[AchievedCodeGift]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[AchievedGifts]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[AchievedPosession]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[Achievement]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[AchievementQueryType]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[AchieveStateType]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[AppAdvertisements]    Script Date: 5/10/2017 11:05:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppAdvertisements](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Icon] [varchar](150) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[BackgroundColor] [varchar](10) NOT NULL,
	[MarketPackageName] [varchar](100) NULL,
	[MarketIntentString] [varchar](100) NULL,
	[AppStoreUri] [varchar](100) NULL,
	[StartTime] [datetime] NOT NULL,
	[ExpireTime] [datetime] NOT NULL,
	[Priority] [int] NOT NULL,
	[IsNew] [bit] NOT NULL,
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
/****** Object:  Table [dbo].[ApplicationState]    Script Date: 5/10/2017 11:05:23 AM ******/
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
	[WatchAdCoin] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppTheme]    Script Date: 5/10/2017 11:05:23 AM ******/
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
	[DiscountAmount] [int] NOT NULL,
	[TagStateID] [int] NOT NULL,
 CONSTRAINT [PK_AppTheme] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/10/2017 11:05:23 AM ******/
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
	[DiscountAmount] [int] NOT NULL,
	[TagStateID] [int] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CodeGift]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[CreatedQuestions]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[CreatedQuestionsVerifyType]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[DisplayedNotification]    Script Date: 5/10/2017 11:05:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisplayedNotification](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[NotificationID] [int] NOT NULL,
	[ExpireDate] [datetime] NOT NULL,
	[InsertDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DisplayedNotification] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[Gift]    Script Date: 5/10/2017 11:05:23 AM ******/
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
	[QueryString] [nvarchar](150) NULL,
 CONSTRAINT [PK_Gift] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GiftType]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[Level]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[Manufacture]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[MarketInfo]    Script Date: 5/10/2017 11:05:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MarketInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MarketName] [nvarchar](50) NOT NULL,
	[MarketKey] [int] NOT NULL,
	[AppPackageName] [varchar](100) NOT NULL,
	[PaymentVerificationLink] [varchar](200) NOT NULL,
	[LinkToAuthorize] [varchar](100) NULL,
	[ClientID] [varchar](100) NULL,
	[ClientSecret] [varchar](100) NULL,
	[AccessToken] [varchar](100) NULL,
	[RefreshToken] [varchar](100) NULL,
	[RedirectURI] [varchar](100) NULL,
	[ExpireAt] [datetime] NULL,
	[NeedsTokenVerification] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Code] [varchar](100) NOT NULL,
 CONSTRAINT [PK_MarketInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/10/2017 11:05:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClientPrice] [int] NOT NULL,
	[ServerPrice] [int] NOT NULL,
	[PurchasedDate] [datetime] NULL,
	[PurchasedToken] [varchar](100) NOT NULL,
	[PurchaseState] [int] NULL,
	[ConsumptionState] [int] NULL,
	[IsFailed] [bit] NOT NULL,
	[ErrorCode] [varchar](50) NULL,
	[ErrorDescription] [varchar](100) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PresentedAdvert]    Script Date: 5/10/2017 11:05:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PresentedAdvert](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AdvertID] [int] NOT NULL,
	[InsertDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PresentedAdvert] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PriceHistory]    Script Date: 5/10/2017 11:05:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceHistory](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[InsertDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PriceList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseAvatar]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[PurchaseCategory]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[PurchaseTheme]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[QuestionBoost]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[ReportedQuestions]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[ReportType]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[SelectedAvatar]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[SelectedCategory]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[SelectedTheme]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[Store]    Script Date: 5/10/2017 11:05:23 AM ******/
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
	[MarketID] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[SKU] [varchar](50) NOT NULL,
	[Coin] [int] NOT NULL,
	[IsAccessibleInAllStores] [bit] NOT NULL,
	[Icon] [nvarchar](150) NOT NULL,
	[RectangleColor] [varchar](10) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[DiscountAmount] [int] NOT NULL,
 CONSTRAINT [PK_Store_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TagState]    Script Date: 5/10/2017 11:05:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagState](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TagState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 5/10/2017 11:05:23 AM ******/
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
	[Rank] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAvatar]    Script Date: 5/10/2017 11:05:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAvatar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PicUrl] [nvarchar](150) NOT NULL,
	[Price] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DiscountAmount] [int] NOT NULL,
	[TagStateID] [int] NOT NULL,
 CONSTRAINT [PK_UserAvatar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[UserType]    Script Date: 5/10/2017 11:05:23 AM ******/
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
/****** Object:  Table [dbo].[WatchAdProvider]    Script Date: 5/10/2017 11:05:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WatchAdProvider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProviderName] [nvarchar](50) NOT NULL,
	[ProviderValidationLink] [varchar](150) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_WatchAdProvider] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WatchedAd]    Script Date: 5/10/2017 11:05:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WatchedAd](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[WatchAdProviderId] [int] NULL,
	[WatchAdId] [varchar](50) NOT NULL,
	[InsertDate] [datetime] NOT NULL,
 CONSTRAINT [PK_WatchedAd] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AchievedCodeGift] ON 

INSERT [dbo].[AchievedCodeGift] ([ID], [CodeGiftID], [UserID], [AchievedDate]) VALUES (8, 4, 1173, CAST(0x0000A759017840F6 AS DateTime))
INSERT [dbo].[AchievedCodeGift] ([ID], [CodeGiftID], [UserID], [AchievedDate]) VALUES (9, 4, 2185, CAST(0x0000A75A01014A33 AS DateTime))
SET IDENTITY_INSERT [dbo].[AchievedCodeGift] OFF
SET IDENTITY_INSERT [dbo].[AchievedGifts] ON 

INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (3, 1173, 9, CAST(0x0000A74A012B1DD9 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (4, 1173, 4, CAST(0x0000A74A01326E0B AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (5, 1170, 9, CAST(0x0000A74C014ED551 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (6, 1173, 7, CAST(0x0000A74C0155CBE8 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (7, 1170, 4, CAST(0x0000A74E00015D1C AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (8, 1170, 7, CAST(0x0000A74E0186D118 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (13, 2178, 9, CAST(0x0000A758009702CF AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (14, 2178, 4, CAST(0x0000A75800B16AA8 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (15, 2178, 7, CAST(0x0000A75800C8C2FF AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (16, 2182, 9, CAST(0x0000A758011FE08F AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (17, 2181, 9, CAST(0x0000A75801750A2C AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (18, 2180, 9, CAST(0x0000A75900C805E9 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (19, 2184, 9, CAST(0x0000A75900F0FA76 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (20, 2184, 3, CAST(0x0000A75900F95F8C AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (21, 2184, 4, CAST(0x0000A75900F9A2AE AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (22, 2184, 6, CAST(0x0000A75900FA4672 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (23, 2184, 7, CAST(0x0000A75900FA5D58 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (24, 2178, 3, CAST(0x0000A7590125CF43 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (25, 2178, 6, CAST(0x0000A759014DF5AF AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (26, 1173, 3, CAST(0x0000A7590172DC59 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (27, 1173, 6, CAST(0x0000A759017C9C6C AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (29, 2184, 11, CAST(0x0000A75A00DD0586 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (30, 2184, 12, CAST(0x0000A75A00E5123B AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (31, 2183, 9, CAST(0x0000A75A00E784C8 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (32, 2183, 11, CAST(0x0000A75A00E7DF70 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (33, 2183, 3, CAST(0x0000A75A00E7F2A5 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (34, 2183, 4, CAST(0x0000A75A00E7FDDA AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (35, 2183, 6, CAST(0x0000A75A00E807AF AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (36, 2183, 7, CAST(0x0000A75A00E8102E AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (37, 2185, 9, CAST(0x0000A75A00E9B8B1 AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (38, 2178, 11, CAST(0x0000A75C00C4021F AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (39, 2178, 12, CAST(0x0000A75E0116F20A AS DateTime))
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (40, 2212, 9, CAST(0x0000A76600B97AA0 AS DateTime))
SET IDENTITY_INSERT [dbo].[AchievedGifts] OFF
SET IDENTITY_INSERT [dbo].[AchievedPosession] ON 

INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1201, 1158, 4, 3, CAST(0x0000A73A00092028 AS DateTime), CAST(0x0000A73A00091DD9 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1202, 1158, 5, 3, CAST(0x0000A73A000D661F AS DateTime), CAST(0x0000A73A000D63E8 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1209, 1160, 4, 3, CAST(0x0000A73A00D9D5A2 AS DateTime), CAST(0x0000A73A00D9D439 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1210, 1160, 5, 3, CAST(0x0000A73A00DB4A96 AS DateTime), CAST(0x0000A73A00DB495B AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1211, 1160, 15, 3, CAST(0x0000A73B017F7D07 AS DateTime), CAST(0x0000A73B017F7ADE AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1212, 1160, 16, 3, CAST(0x0000A73B018065CB AS DateTime), CAST(0x0000A73B01806263 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1213, 1160, 10, 2, NULL, CAST(0x0000A73C00E5AC02 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1214, 1160, 8, 2, NULL, CAST(0x0000A73C00E5AC02 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1215, 1160, 11, 2, NULL, CAST(0x0000A73C00E5B350 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1216, 1160, 9, 2, NULL, CAST(0x0000A73C00E5B350 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1230, 1170, 17, 2, NULL, CAST(0x0000A74800BA8864 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1233, 1173, 17, 3, CAST(0x0000A74A011F4DB1 AS DateTime), CAST(0x0000A74A011F4C3A AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1234, 1173, 4, 3, CAST(0x0000A74A011F8A4C AS DateTime), CAST(0x0000A74A011F85DA AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1235, 1173, 5, 3, CAST(0x0000A74A0123B8B8 AS DateTime), CAST(0x0000A74A012023F6 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2238, 1158, 17, 3, CAST(0x0000A751017CDB30 AS DateTime), CAST(0x0000A74C0170C0E0 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2239, 1170, 4, 2, NULL, CAST(0x0000A74C0172D298 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2241, 1173, 10, 3, CAST(0x0000A74F016586BC AS DateTime), CAST(0x0000A74F0165845C AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2244, 1170, 5, 2, NULL, CAST(0x0000A75300F8FA26 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2246, 2179, 17, 2, NULL, CAST(0x0000A75600C1B3D0 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2247, 2179, 4, 2, NULL, CAST(0x0000A75600C2995A AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2248, 2179, 5, 2, NULL, CAST(0x0000A756010086D2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2249, 2180, 17, 3, CAST(0x0000A75601092331 AS DateTime), CAST(0x0000A75601091EFB AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2250, 2180, 4, 2, NULL, CAST(0x0000A75601096301 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2251, 1173, 11, 3, CAST(0x0000A75800DC5115 AS DateTime), CAST(0x0000A75800D57293 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2252, 2184, 4, 2, NULL, CAST(0x0000A75A00D0C791 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2253, 2185, 17, 3, CAST(0x0000A75A01009E3A AS DateTime), CAST(0x0000A75A01009CF2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2254, 2185, 4, 3, CAST(0x0000A75A01009F03 AS DateTime), CAST(0x0000A75A01009CF2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2255, 1170, 15, 2, NULL, CAST(0x0000A75C0146DC40 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2256, 1170, 16, 2, NULL, CAST(0x0000A75C01477786 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2257, 2187, 17, 3, CAST(0x0000A75D010F609F AS DateTime), CAST(0x0000A75D010F5E6C AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2258, 2187, 4, 3, CAST(0x0000A75D010F6079 AS DateTime), CAST(0x0000A75D010F5E6C AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2259, 2189, 17, 3, CAST(0x0000A75E00CFC599 AS DateTime), CAST(0x0000A75E00CFC300 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2260, 2200, 17, 3, CAST(0x0000A76400D79A19 AS DateTime), CAST(0x0000A75E014C083F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2261, 2200, 4, 3, CAST(0x0000A76400D7994B AS DateTime), CAST(0x0000A75E014C083F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2262, 2197, 17, 2, NULL, CAST(0x0000A75F00CE7269 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2263, 2197, 4, 3, CAST(0x0000A75F00CE7780 AS DateTime), CAST(0x0000A75F00CE7269 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2264, 2197, 5, 3, CAST(0x0000A75F00D01C5E AS DateTime), CAST(0x0000A75F00D01996 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2265, 2200, 5, 3, CAST(0x0000A7650189896C AS DateTime), CAST(0x0000A75F00F6065F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2266, 2201, 17, 3, CAST(0x0000A75F014A9BB2 AS DateTime), CAST(0x0000A75F014A994C AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2267, 2197, 15, 2, NULL, CAST(0x0000A76100CA667C AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2268, 2197, 16, 2, NULL, CAST(0x0000A76100D27138 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2269, 1173, 15, 3, CAST(0x0000A76200F845D4 AS DateTime), CAST(0x0000A76200F8440D AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2270, 2200, 15, 3, CAST(0x0000A76400D79959 AS DateTime), CAST(0x0000A76400D7933C AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2271, 2200, 16, 3, CAST(0x0000A7660003F876 AS DateTime), CAST(0x0000A76400D832A5 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2272, 1173, 16, 3, CAST(0x0000A76400F13118 AS DateTime), CAST(0x0000A76400EA9079 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2273, 2200, 10, 3, CAST(0x0000A7660003F9DF AS DateTime), CAST(0x0000A764013FB085 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2274, 2200, 11, 3, CAST(0x0000A76600040019 AS DateTime), CAST(0x0000A7640140758A AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2275, 2202, 17, 3, CAST(0x0000A76500FD13E7 AS DateTime), CAST(0x0000A76500BDD7CB AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2276, 2202, 4, 3, CAST(0x0000A76500FD132C AS DateTime), CAST(0x0000A76500BDD7CB AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2277, 2202, 5, 2, NULL, CAST(0x0000A76500F937E7 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2278, 2205, 17, 2, NULL, CAST(0x0000A7650114AEA2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2279, 2206, 17, 2, NULL, CAST(0x0000A7650114AFB2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2280, 2207, 17, 2, NULL, CAST(0x0000A7650114B133 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2281, 2208, 17, 2, NULL, CAST(0x0000A7650114B2AA AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2282, 2209, 17, 2, NULL, CAST(0x0000A7650114B658 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2283, 2207, 4, 2, NULL, CAST(0x0000A7650118F343 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2284, 2208, 4, 2, NULL, CAST(0x0000A7650118FDCB AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2285, 2209, 4, 2, NULL, CAST(0x0000A76501190BA7 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2286, 2209, 5, 2, NULL, CAST(0x0000A7650119D7B0 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2287, 2207, 5, 2, NULL, CAST(0x0000A765011C1FD5 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2288, 2205, 4, 2, NULL, CAST(0x0000A76501399EFD AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2289, 2200, 8, 3, CAST(0x0000A7660003FB44 AS DateTime), CAST(0x0000A765018B647D AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2290, 2200, 9, 3, CAST(0x0000A7660003FF54 AS DateTime), CAST(0x0000A76600033B8D AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2291, 2212, 17, 3, CAST(0x0000A76600B575B2 AS DateTime), CAST(0x0000A76600B545E8 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2292, 2212, 4, 3, CAST(0x0000A76600B59421 AS DateTime), CAST(0x0000A76600B592EC AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2293, 2212, 5, 3, CAST(0x0000A76600B80A20 AS DateTime), CAST(0x0000A76600B80825 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2294, 2212, 8, 2, NULL, CAST(0x0000A76600BB7CE5 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2295, 2212, 9, 2, NULL, CAST(0x0000A76600BC660B AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2296, 2213, 17, 3, CAST(0x0000A76600BDDBBA AS DateTime), CAST(0x0000A76600BDCDA0 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2297, 2213, 4, 3, CAST(0x0000A76600BDDEF3 AS DateTime), CAST(0x0000A76600BDCDA0 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2298, 2217, 17, 3, CAST(0x0000A76E00A942B8 AS DateTime), CAST(0x0000A76E00A9410E AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2299, 2218, 17, 3, CAST(0x0000A76E00AF615B AS DateTime), CAST(0x0000A76E00AF2E8B AS DateTime))
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

INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4100, 1158, 1, NULL, NULL, 0, CAST(0x0000A73A0008D379 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4101, 1158, 25, NULL, NULL, 1, CAST(0x0000A73A000AD3BB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4114, 1160, 1, NULL, NULL, 1, CAST(0x0000A73A00D24A6A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4115, 1160, 25, NULL, NULL, 0, CAST(0x0000A73A00D250F8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4117, 1160, 58, NULL, NULL, 0, CAST(0x0000A73A00D829C0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4118, 1160, 74, NULL, NULL, 0, CAST(0x0000A73A00D9E59E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4120, 1160, 76, NULL, NULL, 0, CAST(0x0000A73A00DA06BE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4121, 1160, 114, NULL, NULL, 1, CAST(0x0000A73A00DA1340 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4122, 1160, 51, NULL, NULL, 0, CAST(0x0000A73A00DA25D5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4123, 1160, 53, NULL, NULL, 0, CAST(0x0000A73A00DA2C97 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4124, 1160, 72, NULL, NULL, 0, CAST(0x0000A73A00DA3443 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4125, 1160, 117, NULL, NULL, 0, CAST(0x0000A73A00DA4071 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4126, 1160, 37, NULL, NULL, 0, CAST(0x0000A73A00DA49E8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4127, 1160, 55, NULL, NULL, 0, CAST(0x0000A73A00DB0A3D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4128, 1160, 56, NULL, NULL, 1, CAST(0x0000A73A00DB3090 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4130, 1162, 58, NULL, NULL, 0, CAST(0x0000A73A01565E87 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4131, 1162, 74, NULL, NULL, 0, CAST(0x0000A73A01566890 AS DateTime))
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
GO
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
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4351, 1173, 58, NULL, NULL, 1, CAST(0x0000A74A011F6B3E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4353, 1173, 74, NULL, NULL, 1, CAST(0x0000A74A011FECA0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4354, 1173, 51, NULL, NULL, 0, CAST(0x0000A74A01203C76 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (4355, 1173, 72, NULL, NULL, 0, CAST(0x0000A74A01241B44 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5350, 1173, 53, NULL, NULL, 1, CAST(0x0000A74A0128E7B8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5351, 1173, 55, NULL, NULL, 1, CAST(0x0000A74A0132EDC2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5385, 1173, 56, NULL, NULL, 0, CAST(0x0000A74D000ACFE8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5386, 1173, 57, 1, NULL, 1, CAST(0x0000A74E016514C0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5387, 1173, 1, NULL, NULL, 1, CAST(0x0000A74E01665CF4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5389, 1173, 76, NULL, NULL, 0, CAST(0x0000A74E0166B80B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5398, 1173, 12, NULL, NULL, 0, CAST(0x0000A74F0161E85A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5399, 1173, 31, 1, NULL, 0, CAST(0x0000A74F016206F2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5400, 1173, 43, NULL, NULL, 0, CAST(0x0000A74F01625231 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5401, 1173, 44, NULL, NULL, 0, CAST(0x0000A74F01625AD5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5402, 1173, 64, NULL, NULL, 0, CAST(0x0000A74F0162635D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5403, 1173, 7, NULL, NULL, 1, CAST(0x0000A74F01626C70 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5404, 1173, 63, 1, NULL, 0, CAST(0x0000A7510011CCD7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5414, 1170, 58, NULL, NULL, 0, CAST(0x0000A75101744FAA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5424, 1170, 74, NULL, NULL, 0, CAST(0x0000A75300F97DEE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5425, 1170, 51, NULL, NULL, 0, CAST(0x0000A753016455E8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5427, 1170, 76, NULL, NULL, 0, CAST(0x0000A75301646D8B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5428, 1170, 114, NULL, NULL, 0, CAST(0x0000A75301647622 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5429, 1170, 117, NULL, NULL, 1, CAST(0x0000A753016479E3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5430, 1173, 108, NULL, NULL, 0, CAST(0x0000A75301864BD7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5432, 1170, 53, NULL, NULL, 0, CAST(0x0000A75401054E40 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5433, 1170, 1, NULL, NULL, 1, CAST(0x0000A75500F2CE70 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5434, 1170, 55, NULL, NULL, 0, CAST(0x0000A75500F34DA8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5436, 2178, 58, NULL, NULL, 0, CAST(0x0000A755011821B8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5437, 2178, 74, NULL, NULL, 0, CAST(0x0000A755011831B9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5439, 2178, 76, NULL, NULL, 0, CAST(0x0000A7550118554D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5440, 2178, 51, NULL, NULL, 1, CAST(0x0000A755011883A0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5441, 2178, 72, NULL, NULL, 1, CAST(0x0000A75501189335 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5442, 2178, 114, NULL, NULL, 0, CAST(0x0000A7550118A0BD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5443, 2178, 117, NULL, NULL, 1, CAST(0x0000A75501197139 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5445, 2179, 58, NULL, NULL, 1, CAST(0x0000A75600C25B19 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5446, 2179, 74, NULL, NULL, 1, CAST(0x0000A75600C3044A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5450, 2181, 51, NULL, NULL, 0, CAST(0x0000A757013AC488 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5451, 2181, 58, NULL, NULL, 1, CAST(0x0000A757013ACFEB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5452, 2181, 74, NULL, NULL, 1, CAST(0x0000A757013ADFAA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5453, 2181, 76, NULL, NULL, 0, CAST(0x0000A757013AED1B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5454, 2181, 53, NULL, NULL, 0, CAST(0x0000A757013AF83D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5455, 2181, 55, NULL, NULL, 0, CAST(0x0000A757013B0466 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5456, 2181, 56, NULL, NULL, 0, CAST(0x0000A757013B1124 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5457, 2181, 57, NULL, NULL, 1, CAST(0x0000A757013B1BCC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5458, 2181, 72, NULL, NULL, 0, CAST(0x0000A757013B26A3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5460, 2181, 114, NULL, NULL, 0, CAST(0x0000A757013B3FFB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5461, 2181, 117, NULL, NULL, 0, CAST(0x0000A757013B4AE0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5462, 2181, 1, NULL, NULL, 1, CAST(0x0000A757013B571B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5463, 2181, 37, NULL, NULL, 0, CAST(0x0000A757013B6043 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5464, 2181, 59, NULL, NULL, 1, CAST(0x0000A757013B6B0C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5465, 2181, 69, NULL, NULL, 0, CAST(0x0000A757013B74FD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5469, 2181, 16, NULL, NULL, 0, CAST(0x0000A757013F4BCA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5470, 2181, 99, NULL, NULL, 0, CAST(0x0000A757013F5936 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5471, 2181, 105, NULL, 1, 0, CAST(0x0000A757013F708A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5472, 2181, 112, NULL, NULL, 1, CAST(0x0000A757013F7E3C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5473, 1173, 18, 1, NULL, 1, CAST(0x0000A758000B2C4F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5475, 2182, 58, NULL, NULL, 0, CAST(0x0000A75800B6B058 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5476, 2182, 74, NULL, NULL, 0, CAST(0x0000A75800B6BA58 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5478, 2182, 76, NULL, NULL, 0, CAST(0x0000A75800B6D2C5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5479, 2182, 51, NULL, NULL, 0, CAST(0x0000A75800B6DCF8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5480, 2182, 72, NULL, NULL, 1, CAST(0x0000A75800B6E6DB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5481, 2182, 114, NULL, NULL, 1, CAST(0x0000A75800B6F100 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5482, 2182, 117, NULL, NULL, 1, CAST(0x0000A75800B6FB33 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5483, 2182, 53, NULL, NULL, 1, CAST(0x0000A75800B7026E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5484, 2182, 55, NULL, NULL, 0, CAST(0x0000A75800B70879 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5485, 2182, 56, NULL, NULL, 0, CAST(0x0000A75800B724E0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5486, 2182, 57, NULL, NULL, 1, CAST(0x0000A75800B73C3D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5487, 2182, 1, NULL, NULL, 0, CAST(0x0000A75800B74763 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5488, 2182, 37, NULL, NULL, 0, CAST(0x0000A75800B7B31C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5490, 2183, 51, NULL, NULL, 1, CAST(0x0000A75801572F5A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5491, 2183, 58, NULL, NULL, 1, CAST(0x0000A75801578133 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5492, 2183, 74, NULL, NULL, 0, CAST(0x0000A758015795C8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5493, 2183, 76, NULL, NULL, 0, CAST(0x0000A7580157A228 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5494, 2183, 53, NULL, NULL, 1, CAST(0x0000A7580157AC6E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5495, 2183, 55, NULL, NULL, 0, CAST(0x0000A7580157B39B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5496, 2183, 56, NULL, NULL, 0, CAST(0x0000A7580157BC1F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5497, 2183, 57, NULL, NULL, 1, CAST(0x0000A7580157C9DB AS DateTime))
GO
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5498, 2183, 72, NULL, NULL, 0, CAST(0x0000A7580157D5F1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5500, 2183, 114, NULL, NULL, 0, CAST(0x0000A7580157F1A9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5501, 2183, 117, NULL, NULL, 0, CAST(0x0000A7580157FD7E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5502, 2183, 1, NULL, NULL, 0, CAST(0x0000A7580158088D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5503, 2183, 37, NULL, NULL, 0, CAST(0x0000A75801582466 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5504, 2183, 59, NULL, NULL, 0, CAST(0x0000A75801583340 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5505, 2183, 69, NULL, NULL, 0, CAST(0x0000A758015844C1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5509, 2183, 116, NULL, NULL, 0, CAST(0x0000A75801587140 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5510, 2183, 52, NULL, NULL, 1, CAST(0x0000A7580158872B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5511, 2183, 118, NULL, NULL, 0, CAST(0x0000A75801588E2E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5512, 2183, 119, NULL, NULL, 0, CAST(0x0000A75801589586 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5513, 2183, 25, NULL, NULL, 0, CAST(0x0000A7580158A10A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5514, 1173, 37, 1, NULL, 0, CAST(0x0000A758017897A8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5515, 1173, 59, NULL, NULL, 0, CAST(0x0000A7580178B4F8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5517, 2184, 58, NULL, NULL, 1, CAST(0x0000A75900DE4932 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5518, 2184, 74, NULL, NULL, 0, CAST(0x0000A75900DE5AAE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5520, 2184, 76, NULL, NULL, 1, CAST(0x0000A75900DE78D2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5521, 2184, 51, NULL, NULL, 0, CAST(0x0000A75900DE8587 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5522, 2184, 72, NULL, NULL, 0, CAST(0x0000A75900DEA958 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5523, 2184, 114, NULL, NULL, 1, CAST(0x0000A75900DEBD44 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5524, 2184, 117, NULL, NULL, 0, CAST(0x0000A75900DEC8B1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5525, 2184, 53, NULL, NULL, 1, CAST(0x0000A75900DECE96 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5526, 2184, 55, NULL, NULL, 0, CAST(0x0000A75900DED6EB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5527, 2184, 56, NULL, NULL, 1, CAST(0x0000A75900DEDDF8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5528, 2184, 57, NULL, NULL, 0, CAST(0x0000A75900DEE5F8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5529, 2184, 1, NULL, NULL, 1, CAST(0x0000A75900DEF0B3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5530, 2184, 37, NULL, NULL, 0, CAST(0x0000A75900DEF9F7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5531, 2184, 59, NULL, NULL, 0, CAST(0x0000A75900DF0796 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5533, 2184, 69, NULL, NULL, 0, CAST(0x0000A75900DF11BB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5535, 2184, 116, NULL, NULL, 0, CAST(0x0000A75900DF2476 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5536, 2184, 118, NULL, NULL, 1, CAST(0x0000A75900DF3444 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5538, 2181, 52, NULL, NULL, 0, CAST(0x0000A75900FFAE0E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5539, 2181, 116, NULL, NULL, 1, CAST(0x0000A75900FFB8EA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5540, 2181, 118, NULL, NULL, 0, CAST(0x0000A75900FFD429 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5541, 2181, 25, NULL, NULL, 0, CAST(0x0000A7590102F4F4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5542, 2181, 119, NULL, NULL, 1, CAST(0x0000A759010307E8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5543, 2184, 25, NULL, NULL, 0, CAST(0x0000A7590107698E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5544, 2184, 52, NULL, NULL, 1, CAST(0x0000A75901077F08 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5545, 2184, 119, NULL, NULL, 1, CAST(0x0000A75901078F2F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5546, 2178, 1, NULL, NULL, 1, CAST(0x0000A759012B839F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5547, 2178, 53, NULL, NULL, 1, CAST(0x0000A759012B8EE6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5548, 2178, 55, NULL, NULL, 0, CAST(0x0000A759012B9A29 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5549, 2178, 56, NULL, NULL, 0, CAST(0x0000A759012BAC9E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5550, 2178, 57, NULL, NULL, 1, CAST(0x0000A759012BC324 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5551, 2178, 37, NULL, NULL, 0, CAST(0x0000A759012BCBB1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5552, 2178, 59, NULL, NULL, 1, CAST(0x0000A759012BD6C5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5553, 2178, 69, NULL, NULL, 1, CAST(0x0000A759012BE91D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5557, 2178, 116, NULL, NULL, 1, CAST(0x0000A759012C1C67 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5558, 2178, 52, NULL, NULL, 1, CAST(0x0000A759014E0507 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5559, 1170, 37, NULL, NULL, 0, CAST(0x0000A75A000558AC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5560, 1170, 56, NULL, NULL, 0, CAST(0x0000A75A000560B1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5561, 1170, 57, NULL, NULL, 0, CAST(0x0000A75A00056773 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5562, 1170, 72, NULL, NULL, 0, CAST(0x0000A75A00056F8F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5564, 1170, 59, NULL, NULL, 0, CAST(0x0000A75A00057CF2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5565, 1170, 69, NULL, NULL, 0, CAST(0x0000A75A00058937 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5567, 1170, 116, NULL, NULL, 0, CAST(0x0000A75A0005E178 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5569, 1170, 118, NULL, NULL, 1, CAST(0x0000A75A00067180 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5570, 1170, 119, NULL, NULL, 0, CAST(0x0000A75A0006C728 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5571, 1170, 25, NULL, NULL, 0, CAST(0x0000A75A0006CE14 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5572, 1170, 52, NULL, NULL, 1, CAST(0x0000A75A0006DB0B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5573, 1170, 9, NULL, NULL, 0, CAST(0x0000A75A00071C65 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5574, 1170, 24, NULL, NULL, 0, CAST(0x0000A75A0007239B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5575, 1170, 111, NULL, NULL, 0, CAST(0x0000A75A00073262 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5576, 2179, 51, NULL, NULL, 1, CAST(0x0000A75A00DC0C5B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5578, 2185, 58, NULL, NULL, 1, CAST(0x0000A75A0102138B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5580, 2178, 25, NULL, NULL, 0, CAST(0x0000A75C00C41513 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5581, 2178, 118, NULL, NULL, 0, CAST(0x0000A75C00C42661 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5582, 2178, 119, NULL, NULL, 1, CAST(0x0000A75C00C4396C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5583, 2183, 12, NULL, NULL, 0, CAST(0x0000A75C00EC78F6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5584, 2183, 31, NULL, NULL, 0, CAST(0x0000A75C00ECB5A0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5585, 2183, 64, NULL, NULL, 0, CAST(0x0000A75C00ECCC67 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5586, 2183, 108, NULL, NULL, 1, CAST(0x0000A75C00ECF818 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5587, 2179, 53, NULL, NULL, 1, CAST(0x0000A75D00C90B63 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5588, 2179, 55, NULL, NULL, 1, CAST(0x0000A75D00CB2BCB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5589, 2179, 56, NULL, NULL, 1, CAST(0x0000A75D00CD7A7A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5590, 1173, 8, NULL, NULL, 1, CAST(0x0000A75D010B48D5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5591, 1173, 11, NULL, NULL, 1, CAST(0x0000A75D010B5528 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5592, 1173, 54, NULL, NULL, 1, CAST(0x0000A75D010B5FDA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5593, 1173, 90, NULL, NULL, 1, CAST(0x0000A75D010CABDC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5594, 1173, 94, NULL, NULL, 0, CAST(0x0000A75D010CB2D5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5595, 1173, 95, 1, NULL, 1, CAST(0x0000A75D010CE213 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5596, 1173, 69, NULL, NULL, 1, CAST(0x0000A75D010DC716 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5597, 1173, 114, NULL, NULL, 0, CAST(0x0000A75D010DDB10 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5598, 1173, 117, 1, NULL, 0, CAST(0x0000A75D010E6C3B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5599, 2187, 58, 1, NULL, 0, CAST(0x0000A75D010F438B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5600, 2189, 8, 1, NULL, 0, CAST(0x0000A75E00DE53A8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5601, 2190, 58, NULL, NULL, 1, CAST(0x0000A75E00F85923 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5602, 2190, 53, NULL, NULL, 1, CAST(0x0000A75E00F8F9D5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5603, 2196, 58, NULL, NULL, 1, CAST(0x0000A75E01184103 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5604, 2196, 74, NULL, NULL, 0, CAST(0x0000A75E011844C4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5605, 2196, 76, NULL, NULL, 1, CAST(0x0000A75E01184893 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5606, 2197, 58, NULL, NULL, 1, CAST(0x0000A75E01187046 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5607, 2200, 58, NULL, NULL, 0, CAST(0x0000A75E014BE948 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5608, 2200, 74, NULL, NULL, 0, CAST(0x0000A75E014BF1C2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5609, 2200, 76, NULL, NULL, 0, CAST(0x0000A75E014BF903 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5610, 2200, 114, NULL, NULL, 0, CAST(0x0000A75E014BFDE1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5611, 2200, 117, 1, NULL, 1, CAST(0x0000A75E014C651E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5612, 2197, 53, NULL, NULL, 1, CAST(0x0000A75F00B8299F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5613, 2197, 55, NULL, NULL, 0, CAST(0x0000A75F00C62996 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5614, 2197, 56, NULL, NULL, 0, CAST(0x0000A75F00D13A82 AS DateTime))
GO
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5615, 2200, 53, NULL, NULL, 1, CAST(0x0000A75F00F9BD8D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5616, 2200, 55, NULL, NULL, 0, CAST(0x0000A76000E50FD9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5617, 2200, 56, NULL, NULL, 1, CAST(0x0000A76000E5285D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5618, 2200, 37, NULL, NULL, 0, CAST(0x0000A761000B7CCB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5619, 2200, 57, NULL, NULL, 1, CAST(0x0000A761000C8A95 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5620, 2197, 57, NULL, NULL, 0, CAST(0x0000A76100B95ADF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5621, 2197, 72, NULL, NULL, 1, CAST(0x0000A76100B96D4B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5622, 2197, 74, NULL, NULL, 0, CAST(0x0000A76100B973BD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5623, 2197, 76, NULL, NULL, 1, CAST(0x0000A76100B9914A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5624, 2197, 59, NULL, NULL, 1, CAST(0x0000A76100BA118A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5625, 2197, 69, NULL, NULL, 0, CAST(0x0000A76100BA15AD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5626, 2197, 114, NULL, NULL, 0, CAST(0x0000A76100BA1D1C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5627, 2197, 37, NULL, NULL, 0, CAST(0x0000A76100BEAA4E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5628, 2197, 116, NULL, NULL, 0, CAST(0x0000A76100BEAE92 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5629, 2197, 117, NULL, NULL, 1, CAST(0x0000A76100BEC4ED AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5630, 2197, 25, NULL, NULL, 0, CAST(0x0000A76100BEEBFC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5631, 2197, 118, NULL, NULL, 1, CAST(0x0000A76100BEF90F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5632, 2197, 119, NULL, NULL, 0, CAST(0x0000A76100BF6B97 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5633, 2197, 9, NULL, NULL, 1, CAST(0x0000A76100C650AD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5634, 2197, 24, NULL, NULL, 0, CAST(0x0000A76100CA8D8B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5635, 2197, 111, NULL, NULL, 0, CAST(0x0000A76100CA91A9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5636, 2200, 59, NULL, NULL, 1, CAST(0x0000A761011A2FDE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5637, 2200, 69, NULL, NULL, 0, CAST(0x0000A761011A38CD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5638, 2200, 72, NULL, NULL, 1, CAST(0x0000A761011B7BBA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5639, 2200, 25, NULL, NULL, 1, CAST(0x0000A761014F8EE5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5640, 2200, 116, NULL, NULL, 1, CAST(0x0000A761014F9CB8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5641, 2200, 118, NULL, NULL, 1, CAST(0x0000A761014FC602 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5642, 2200, 119, NULL, NULL, 1, CAST(0x0000A76200B53C3C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5643, 1173, 9, NULL, NULL, 1, CAST(0x0000A76200E56DF6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5644, 1173, 24, NULL, NULL, 1, CAST(0x0000A7620100EF38 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5645, 1173, 111, NULL, NULL, 1, CAST(0x0000A7620103533C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5646, 2202, 56, NULL, NULL, 1, CAST(0x0000A76201044D3A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5647, 2203, 58, NULL, NULL, 1, CAST(0x0000A763015B20E6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5648, 2203, 53, NULL, NULL, 0, CAST(0x0000A763015B9844 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5649, 2203, 74, NULL, NULL, 0, CAST(0x0000A763015BAB41 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5650, 2203, 76, NULL, NULL, 0, CAST(0x0000A763015BB605 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5651, 2203, 114, 1, NULL, 1, CAST(0x0000A763015BDCA7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5652, 2200, 9, NULL, NULL, 1, CAST(0x0000A76400054FCB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5653, 2200, 24, NULL, NULL, 1, CAST(0x0000A76400058A4B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5654, 2200, 111, 1, NULL, 1, CAST(0x0000A76400D7A414 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5655, 2200, 12, 1, NULL, 1, CAST(0x0000A76400D81AB7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5656, 1173, 25, NULL, NULL, 1, CAST(0x0000A76400F0DFD0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5657, 1173, 116, NULL, NULL, 0, CAST(0x0000A76400F0EB50 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5658, 1173, 118, NULL, NULL, 0, CAST(0x0000A76400F0FB72 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5659, 2200, 78, NULL, NULL, 1, CAST(0x0000A764013EAB9D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5660, 2200, 79, NULL, NULL, 1, CAST(0x0000A764013FF17C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5661, 2200, 87, NULL, NULL, 1, CAST(0x0000A7640142E708 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5662, 2200, 7, NULL, NULL, 0, CAST(0x0000A7640144A7EF AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5663, 2200, 18, NULL, NULL, 1, CAST(0x0000A7640144C024 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5664, 2202, 58, NULL, NULL, 0, CAST(0x0000A76500D38DD3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5665, 2209, 58, NULL, NULL, 1, CAST(0x0000A7650115E82B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5666, 2208, 58, NULL, NULL, 1, CAST(0x0000A7650115EF3C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5667, 2207, 58, NULL, NULL, 0, CAST(0x0000A7650115FC37 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5668, 2207, 53, NULL, NULL, 0, CAST(0x0000A7650116B352 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5669, 2209, 74, NULL, NULL, 1, CAST(0x0000A7650119C8D2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5670, 2209, 76, NULL, NULL, 1, CAST(0x0000A7650119EBD0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5671, 2205, 58, NULL, NULL, 1, CAST(0x0000A765012B18E6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5672, 1173, 28, 1, NULL, 0, CAST(0x0000A765017788C2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5673, 2201, 12, NULL, NULL, 0, CAST(0x0000A76501782F2F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5674, 2213, 56, NULL, NULL, 0, CAST(0x0000A7650178E470 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5675, 2200, 99, NULL, NULL, 0, CAST(0x0000A765018B3206 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5676, 2200, 105, NULL, NULL, 1, CAST(0x0000A76600000C83 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5677, 2200, 112, NULL, NULL, 1, CAST(0x0000A76600006D49 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5678, 2212, 58, NULL, NULL, 1, CAST(0x0000A76600B57D1D AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5679, 2212, 74, NULL, NULL, 0, CAST(0x0000A76600B7C89C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5680, 2212, 76, NULL, NULL, 0, CAST(0x0000A76600B7CD55 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5681, 2212, 114, NULL, NULL, 0, CAST(0x0000A76600B8118F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5682, 2212, 117, NULL, NULL, 0, CAST(0x0000A76600B81550 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5683, 2212, 99, NULL, NULL, 0, CAST(0x0000A76600BAE91C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5684, 2212, 105, NULL, NULL, 0, CAST(0x0000A76600BAF197 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5685, 2212, 112, NULL, NULL, 1, CAST(0x0000A76600BB0F16 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5686, 2213, 58, NULL, NULL, 0, CAST(0x0000A76600BCF0E4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5687, 2213, 74, NULL, NULL, 0, CAST(0x0000A76600BCFAA7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5688, 2213, 76, NULL, NULL, 0, CAST(0x0000A76600BD02B1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5689, 2213, 114, NULL, NULL, 1, CAST(0x0000A76600BD0C1F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5690, 2213, 117, NULL, NULL, 0, CAST(0x0000A76600BE12B6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5691, 2213, 53, NULL, NULL, 1, CAST(0x0000A76600BE1CF3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5692, 2213, 55, NULL, NULL, 0, CAST(0x0000A76600BE24B6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5693, 2213, 57, NULL, NULL, 1, CAST(0x0000A76600BE29E0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5694, 2213, 72, NULL, NULL, 1, CAST(0x0000A76600BE336A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5695, 2213, 37, NULL, NULL, 0, CAST(0x0000A76600BE3B3C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5696, 2213, 59, NULL, NULL, 0, CAST(0x0000A76600BE41E6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5697, 2213, 69, NULL, NULL, 1, CAST(0x0000A76600BE52E4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5698, 2213, 118, NULL, NULL, 0, CAST(0x0000A76600BE622E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5699, 2213, 25, NULL, NULL, 0, CAST(0x0000A76600BE68F9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5700, 2213, 116, NULL, NULL, 0, CAST(0x0000A76600BE7064 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5701, 2213, 119, NULL, NULL, 0, CAST(0x0000A76600BE77B7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5702, 2212, 9, 1, NULL, 0, CAST(0x0000A76600C02682 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5703, 1173, 119, 1, NULL, 0, CAST(0x0000A76600D23FBA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5704, 2209, 9, NULL, NULL, 1, CAST(0x0000A76600D443CA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5705, 2209, 24, NULL, NULL, 1, CAST(0x0000A76600D44E44 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5706, 2214, 56, NULL, NULL, 1, CAST(0x0000A76900003A18 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5707, 2214, 57, NULL, NULL, 1, CAST(0x0000A76900004946 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5708, 2208, 55, NULL, NULL, 1, CAST(0x0000A76E010915BD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5709, 2208, 9, NULL, NULL, 1, CAST(0x0000A76E010CC73E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5710, 2208, 24, NULL, NULL, 1, CAST(0x0000A76E011A7155 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5711, 2208, 111, NULL, NULL, 0, CAST(0x0000A76E011AA487 AS DateTime))
SET IDENTITY_INSERT [dbo].[Answer] OFF
SET IDENTITY_INSERT [dbo].[AppAdvertisements] ON 

INSERT [dbo].[AppAdvertisements] ([ID], [Icon], [Title], [Description], [BackgroundColor], [MarketPackageName], [MarketIntentString], [AppStoreUri], [StartTime], [ExpireTime], [Priority], [IsNew], [CreatedDate], [UpdatedDate]) VALUES (1, N'Data/Images/appAdvert/faceapp.png', N'FaceApp', N'نرم افزار خوبی برای ترکوندن صورت', N'#0d27e9', N'com.farsitel.bazaar', N'bazaar://details?id=io.faceapp', N'https://cafebazaar.ir/app/io.faceapp/?l=fa', CAST(0x0000A76B00000000 AS DateTime), CAST(0x0000A78B00000000 AS DateTime), 1, 1, CAST(0x0000A76B00000000 AS DateTime), CAST(0x0000A76B00000000 AS DateTime))
INSERT [dbo].[AppAdvertisements] ([ID], [Icon], [Title], [Description], [BackgroundColor], [MarketPackageName], [MarketIntentString], [AppStoreUri], [StartTime], [ExpireTime], [Priority], [IsNew], [CreatedDate], [UpdatedDate]) VALUES (7, N'Data/Images/appAdvert/quizofkings.png', N'QuizofKing', N'کی بیشتر میدونه؟ با دوستات ', N'#0c29e7', N'ir.mservices.market', N'myket://details?id=co.palang.QuizOfKings', N'https://www.myket.ir/app/co.palang.QuizOfKings/?lang=fa', CAST(0x0000A76B00000000 AS DateTime), CAST(0x0000A78B00000000 AS DateTime), 2, 1, CAST(0x0000A76B00000000 AS DateTime), CAST(0x0000A76B00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[AppAdvertisements] OFF
SET IDENTITY_INSERT [dbo].[ApplicationState] ON 

INSERT [dbo].[ApplicationState] ([ID], [Favorite_FavoritePrice], [Favorite_FreeNumberToFavorite], [User_DefaultUserName], [User_DefaultUserCoin], [Question_CreateQuestionPrice], [Question_DefaultReturnAmount], [Question_NumberToSkip], [Question_NoQuestionFoundWhat], [Question_NoQuestionFoundBut], [Question_NoQuestionFoundID], [Question_ServerBurntReturnAmount], [Prize_AnswerPrize], [Prize_LikePrize], [Prize_CreateNewQuestionPrize], [Prize_NewQuestionAcceptedPrize], [Paging_DefaultPageSize], [Leader_TopNumberToShow], [Comment_DefaultNumberAmount], [Comment_DefaultVerifyState], [Host_WebSiteNoReplyMail], [Host_WebSiteNoReplyMailPassword], [Host_SupportMail], [Host_SupportMailPassword], [Host_SmtpServer], [Store_DefaultReturnAmount], [WatchAdCoin]) VALUES (1, 5, 3, N'Guest_', 200, 50, 5, 2, N'یه خورده صبر میکردی', N'ولی اونطوری سرورمون آب نمیشد', -1, 1, 1, 1, 1, 10, 5, 20, 10, 1, N'noreply@flapp.ir', N'123123123', N'support@flapp.ir', N'123123', N'31.25.89.211', 10, 5)
SET IDENTITY_INSERT [dbo].[ApplicationState] OFF
SET IDENTITY_INSERT [dbo].[AppTheme] ON 

INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate], [DiscountAmount], [TagStateID]) VALUES (1, N'آبی', N'آبی', N'آبی', N'#0d27e9', N'#102095', 5, N'Data/Images/Background/background6.jpg', N'Data/Images/Background/Dialog6.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EF00000000 AS DateTime), 0, 2)
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate], [DiscountAmount], [TagStateID]) VALUES (2, N'سبز', N'سبز', N'سبز', N'#1ec2bc', N'#157e7a', 5, N'Data/Images/Background/background7.jpg', N'Data/Images/Background/Dialog7.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 2)
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate], [DiscountAmount], [TagStateID]) VALUES (4, N'بنفش', N'بنفش', N'بنفش', N'#cb13d7', N'#8f0d97', 5, N'Data/Images/Background/background8.jpg', N'Data/Images/Background/Dialog8.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 3)
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate], [DiscountAmount], [TagStateID]) VALUES (5, N'قرمز', N'قرمز', N'قرمز', N'#d30838', N'#9f062a', 5, N'Data/Images/Background/background9.jpg', N'Data/Images/Background/Dialog9.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate], [DiscountAmount], [TagStateID]) VALUES (6, N'زرد', N'زرد', N'زرد', N'#c6bf09', N'#c6bf09', 5, N'Data/Images/Background/background18.jpg', N'Data/Images/Background/Dialog18.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 2)
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate], [DiscountAmount], [TagStateID]) VALUES (9, N'زرد', N'زرد', N'زرد', N'#c6bf09', N'#c6bf09', 5, N'Data/Images/Background/background16.jpg', N'Data/Images/Background/Dialog16.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[AppTheme] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient], [DiscountAmount], [TagStateID]) VALUES (1, N'سوالات مردم', N'سوالات مردم', N'سوالات مردم', N'#cb13d7', N'#8f0d97', N'#9410a6', 10, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1, 0, 1)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient], [DiscountAmount], [TagStateID]) VALUES (2, N'ورزشی', N'ورزشی', N'ورزشی', N'#1ec2bc', N'#157e7a', N'#158b87', 10, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6F000000000 AS DateTime), 1, 0, 2)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient], [DiscountAmount], [TagStateID]) VALUES (5, N'خانوادگی', N'خانوادگی', N'خانوادگی', N'#0d27e9', N'#102095', N'#091ba1', 10, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6F000000000 AS DateTime), 1, 0, 2)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient], [DiscountAmount], [TagStateID]) VALUES (6, N'سیاسی', N'سیاسی', N'سیاسی', N'#0d27e9', N'#0048bb', N'#0027e9', 10, CAST(0x0000A70B00000000 AS DateTime), CAST(0x0000A81200000000 AS DateTime), 1, 0, 2)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient], [DiscountAmount], [TagStateID]) VALUES (7, N'بزرگسال', N'بزرگسال', N'بزرگسال', N'#0d27e9', N'#d30838', N'#0027e9', 50, CAST(0x0000A70B00000000 AS DateTime), CAST(0x0000A6F700000000 AS DateTime), 1, 0, 2)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient], [DiscountAmount], [TagStateID]) VALUES (8, N'اجتماعی', N'اجتماعی اقتصادی', N'اجتماعی اقتصادی', N'#0d27e9', N'#c6bf09', N'#0027e9', 10, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1, 0, 2)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient], [DiscountAmount], [TagStateID]) VALUES (10, N'خنده دار', N'خنده دار', N'خنده دار', N'#0d27e9', N'#c6b309', N'#0035ee', 10, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1, 0, 2)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient], [DiscountAmount], [TagStateID]) VALUES (11, N'چالشی', N'چالشی', N'چالشی', N'#0d27e9', N'#0d27e9', N'#0d27e9', 20, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime), 2, 30, 3)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient], [DiscountAmount], [TagStateID]) VALUES (12, N'سینما', N'سینما', N'سینما', N'#0d3659', N'#0d27e9', N'#0364ee', 5, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime), 2, 0, 2)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient], [DiscountAmount], [TagStateID]) VALUES (13, N'چرند و پرند', N'چرند و پرند', N'چرند و پرند', N'#0e45ee', N'#03587e', N'#03ee12', 20, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime), 3, 2, 3)
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [SquareColor], [CircleColor], [RectangleColor], [Price], [CreatedDate], [UpdatedDate], [PrizeCoefficient], [DiscountAmount], [TagStateID]) VALUES (14, N'شخمی تخیلی', N'شخمی تخیلی', N'شخمی تخیلی', N'#33eeff', N'#03548e', N'#10ee32', 20, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime), 1, 0, 2)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[CodeGift] ON 

INSERT [dbo].[CodeGift] ([ID], [CompanyName], [Serial], [Prize], [TotalUserCount], [TotalUserRegistered], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate]) VALUES (1, N'Google', N'23345', 10, 100, 0, CAST(0x0000A73400000000 AS DateTime), CAST(0x0000A73700000000 AS DateTime), CAST(0x0000A73400000000 AS DateTime), CAST(0x0000A73400000000 AS DateTime))
INSERT [dbo].[CodeGift] ([ID], [CompanyName], [Serial], [Prize], [TotalUserCount], [TotalUserRegistered], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate]) VALUES (2, N'Yahoo', N'56548', 5, 100, 0, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73900000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73400000000 AS DateTime))
INSERT [dbo].[CodeGift] ([ID], [CompanyName], [Serial], [Prize], [TotalUserCount], [TotalUserRegistered], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate]) VALUES (4, N'bms', N'123456789', 500, 1, 0, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A83B00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[CodeGift] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2150, 1158, 25, N'very nice nice ', NULL, 1, CAST(0x0000A73A000ACB08 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2152, 1160, 91, N'ت', NULL, 1, CAST(0x0000A73B017486BF AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (2178, 1173, 74, N'چه گیم باحالی', NULL, 1, CAST(0x0000A74A011FB790 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3178, 1173, 53, N'خیلی باحال بود', NULL, 1, CAST(0x0000A74A012871D2 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3179, 1173, 53, N'باحال بود', NULL, 1, CAST(0x0000A74A0128D63C AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3182, 1173, 57, N'خیلی سوال چرتی بود', NULL, 1, CAST(0x0000A74E016501A0 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3183, 1173, 63, N'مطلب بگذارید', NULL, 1, CAST(0x0000A751001156A0 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3184, 1173, 63, N'باحال میشه', NULL, 1, CAST(0x0000A75100117124 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3185, 1170, 53, N'تست', NULL, 1, CAST(0x0000A753016516EB AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3186, 2179, 58, N'fgh', NULL, 1, CAST(0x0000A75600C2508D AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3187, 2179, 74, N'nice', NULL, 1, CAST(0x0000A75600C2F71F AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3188, 2179, 58, N'test', NULL, 1, CAST(0x0000A75600C35445 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3189, 2179, 74, N'test', NULL, 1, CAST(0x0000A75600C36385 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3190, 2179, 51, N'ttttttt', NULL, 1, CAST(0x0000A75800FA20B2 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3191, 1173, 37, N'سلام، سوال خوبی بود. چرا من بی قرا م', NULL, 1, CAST(0x0000A7580178859A AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3192, 1173, 59, N'چه سوال باحالی', NULL, 1, CAST(0x0000A7580178A810 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3193, 2185, 58, N'asd', NULL, 1, CAST(0x0000A75A0101E58C AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3194, 2185, 58, N'0634063306cc0634063306cc', NULL, 1, CAST(0x0000A75A0101E883 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3195, 1173, 69, N'حال کردم', NULL, 1, CAST(0x0000A75B014FA0D8 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3196, 2179, 55, N'ests', NULL, 1, CAST(0x0000A75D00CAA565 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3197, 1173, 95, N'11', NULL, 1, CAST(0x0000A75D010CCFC4 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3198, 2187, 58, N'ذذتذا', NULL, 1, CAST(0x0000A75D01108D6D AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3199, 2200, 117, N'تست', NULL, 1, CAST(0x0000A75E014C599E AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3200, 2200, 57, N' چرت کجا بود عمووو', NULL, 1, CAST(0x0000A761000C78E9 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3201, 2200, 118, N'تست', NULL, 1, CAST(0x0000A761014FA879 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3202, 2200, 24, N'تلب', NULL, 1, CAST(0x0000A76400057EA1 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3203, 2201, 31, N'/*', NULL, 1, CAST(0x0000A7650178F8DB AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3204, 2201, 31, N'اتبگعنخلهتاپلناتاموللداو1', NULL, 1, CAST(0x0000A76501792377 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3205, 2200, 99, N'کامنت', NULL, 1, CAST(0x0000A765018B4A4E AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3206, 1173, 119, N'can not type persian in genymotion', NULL, 1, CAST(0x0000A76600D1F10B AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3207, 1173, 119, N'not a good question', NULL, 1, CAST(0x0000A76600D27379 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3208, 2209, 9, N'rtertegte', NULL, 1, CAST(0x0000A76600D43E0F AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3209, 2209, 111, N'hgfgh', NULL, 1, CAST(0x0000A76B0115286A AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3210, 2208, 53, N'ghfghf', NULL, 1, CAST(0x0000A76D00E92A5E AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[CreatedQuestions] ON 

INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (52, 1173, N'حافظون مال تو بود', N'ولی باید نصف نصف میکردی؟؟؟ ', CAST(0x0000A75100163CC5 AS DateTime), 2, 1, 3)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (53, 1170, N'تست', N'تست', CAST(0x0000A75500F361C8 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (54, 2184, N'دوست داشتی چشماش مثه هیتلر وحشی بود', N'اما قلب تو مثه لهستان بی دفاع', CAST(0x0000A75A00D1C45D AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (55, 2200, N'تسن', N'تست', CAST(0x0000A75F00F947FA AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (56, 1173, N'شاگرد اول مدرسه بودی ', N'غذات یونجه بود', CAST(0x0000A76401097B6C AS DateTime), 2, 1, 4)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (57, 2200, N'اسب بودی', N'خر نبودی', CAST(0x0000A7650188E641 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (58, 2212, N'me', N'you', CAST(0x0000A76600B785C6 AS DateTime), 2, 1, 4)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (59, 2209, N'drth', N'ghf', CAST(0x0000A76B011C9456 AS DateTime), 2, 1, 1)
SET IDENTITY_INSERT [dbo].[CreatedQuestions] OFF
SET IDENTITY_INSERT [dbo].[CreatedQuestionsVerifyType] ON 

INSERT [dbo].[CreatedQuestionsVerifyType] ([ID], [VerifyName], [Description]) VALUES (1, N'رد شده', NULL)
INSERT [dbo].[CreatedQuestionsVerifyType] ([ID], [VerifyName], [Description]) VALUES (2, N'در حال بررسي', NULL)
INSERT [dbo].[CreatedQuestionsVerifyType] ([ID], [VerifyName], [Description]) VALUES (3, N'تاييد شده', NULL)
SET IDENTITY_INSERT [dbo].[CreatedQuestionsVerifyType] OFF
SET IDENTITY_INSERT [dbo].[DisplayedNotification] ON 

INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (19, 2187, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75D012E783B AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (20, 2187, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75D012E8B25 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (21, 2187, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75D012E8ECA AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (22, 2187, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75D013CE2F3 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (23, 1170, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75D013E17CB AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (24, 1170, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75D01422D8C AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (25, 2187, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E000C3510 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (26, 2186, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E001F9DCE AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (27, 2189, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E00CF5F93 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (28, 2189, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E00D5D7E0 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (29, 2189, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E00D9F2B3 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (30, 2189, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E00DDB10A AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (31, 2189, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E010592CD AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (32, 2186, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E0106A89C AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (33, 2186, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E010718F6 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (34, 2178, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E01098804 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (35, 2186, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E011780AE AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (36, 2186, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E012C1088 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (37, 2186, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E01315E7B AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (38, 2186, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E0131601C AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (39, 2200, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E013F3A69 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (40, 2183, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E013F7F2B AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (41, 2200, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E01431213 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (42, 2200, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E0148F4A7 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (43, 2200, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E014BC662 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (44, 2200, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75E01566C76 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (45, 2201, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75F016C6AF1 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (46, 2201, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76000531277 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (47, 2201, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76000A07CDA AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (48, 2201, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76000E5C0CD AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (49, 2201, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7600115DA64 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (50, 2197, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76100B4DE7D AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (51, 2201, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76100DDB4F3 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (52, 2197, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76200BB7FCD AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (53, 2201, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76200E958E2 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (54, 2204, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76400E0747E AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (55, 2204, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76400E0747E AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (56, 2204, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76400E0747E AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (57, 2204, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76400E0747E AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (58, 2204, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76400E0747E AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (59, 2204, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76400E0749F AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (60, 2204, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76400E5B961 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (61, 2204, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76400E5BA17 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (62, 2204, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76400E5BA21 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (63, 2203, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7650022BBED AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (64, 2202, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7650112465B AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (65, 2209, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7650139DC4B AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (66, 2203, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76501694271 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (67, 1158, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7650176B139 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (68, 1158, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7650176B139 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (69, 1158, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7650176B139 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (70, 1158, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7650176B139 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (71, 1158, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7650176B139 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (72, 2210, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A766009E9665 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (73, 2210, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A766009EFCC5 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (74, 2210, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76600ACF755 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (75, 2212, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76600B97221 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (76, 2212, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76600B97221 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (77, 2212, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76600B9D22F AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (78, 2212, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76600B9D22F AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (79, 2212, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76600B9D22F AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (80, 2212, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76600B9D22F AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (81, 2213, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76600BCC649 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (82, 2213, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76600BCCEDF AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (83, 2209, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76600BF2BCC AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (84, 2210, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76600CDD345 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (85, 2213, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76600D9A006 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (86, 2210, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76600E6A0D0 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (87, 2213, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76600FF4515 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (88, 2213, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76700FDFE17 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (89, 2210, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7670106C229 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (90, 2213, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7670178C785 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (91, 2200, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A767017D5713 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (92, 2210, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76801042F86 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (93, 2210, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76801042F86 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (94, 2200, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A768017C3F4E AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (95, 2209, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76B010D5C8B AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (96, 2208, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76C011D473E AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (97, 2208, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76E00AC3B08 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (98, 2218, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76E00D656FB AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (99, 2218, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76E00E85EDC AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (100, 2218, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76E00F6EB32 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (101, 2218, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76E00F9CC29 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (102, 2218, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76E00FB9F93 AS DateTime))
SET IDENTITY_INSERT [dbo].[DisplayedNotification] OFF
SET IDENTITY_INSERT [dbo].[Favorite] ON 

INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2153, 1158, 25, CAST(0x0000A73A000AD3BB AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (2160, 1173, 72, CAST(0x0000A74A01241B49 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3161, 1173, 56, CAST(0x0000A74D000AD003 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3162, 1173, 57, CAST(0x0000A74E016514C5 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3163, 1173, 12, CAST(0x0000A74F0161E876 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3164, 1173, 31, CAST(0x0000A74F016206F5 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3165, 2179, 58, CAST(0x0000A75600C25B19 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3166, 2179, 74, CAST(0x0000A75600C3044A AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3167, 1173, 18, CAST(0x0000A758000B2C66 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3168, 2185, 58, CAST(0x0000A75A0102138F AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3169, 2179, 55, CAST(0x0000A75D00CB2BD0 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3170, 1173, 95, CAST(0x0000A75D010CE218 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3171, 1173, 117, CAST(0x0000A75D010E6C3F AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3172, 2187, 58, CAST(0x0000A75D010F438B AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3173, 2189, 8, CAST(0x0000A75E00DE53AD AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3174, 2200, 59, CAST(0x0000A761011A2FE3 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3175, 2200, 24, CAST(0x0000A76400058A50 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3176, 2207, 53, CAST(0x0000A7650116B357 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3177, 1173, 28, CAST(0x0000A765017788CB AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3178, 2200, 99, CAST(0x0000A765018B320B AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3179, 2212, 74, CAST(0x0000A76600B7C89C AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3180, 2212, 76, CAST(0x0000A76600B7CD55 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3181, 2212, 9, CAST(0x0000A76600C02682 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3182, 1173, 119, CAST(0x0000A76600D23FBE AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3183, 2209, 9, CAST(0x0000A76600D443CF AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3184, 2209, 24, CAST(0x0000A76600D44E44 AS DateTime))
SET IDENTITY_INSERT [dbo].[Favorite] OFF
SET IDENTITY_INSERT [dbo].[Gift] ON 

INSERT [dbo].[Gift] ([ID], [Image], [Name], [Description], [GiftTypeID], [Prize], [Day], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate], [QueryString]) VALUES (3, N'Data/Images/2.png', N'دهه قهر', N'دهه قهره،قهر کنید', 4, 5, NULL, CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime), NULL)
INSERT [dbo].[Gift] ([ID], [Image], [Name], [Description], [GiftTypeID], [Prize], [Day], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate], [QueryString]) VALUES (4, N'Data/Images/4.png', N'دهه بی پولی', N'پول نداریم ', 4, 3, NULL, CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime), NULL)
INSERT [dbo].[Gift] ([ID], [Image], [Name], [Description], [GiftTypeID], [Prize], [Day], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate], [QueryString]) VALUES (6, N'Data/Images/6.png', N'دهه بی کاری', N'کار نداریم دیگه', 4, 10, NULL, CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime), NULL)
INSERT [dbo].[Gift] ([ID], [Image], [Name], [Description], [GiftTypeID], [Prize], [Day], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate], [QueryString]) VALUES (7, N'Data/Images/7.png', N'دهه اختلاس', N'بیا حقوق های نجومی', 4, 3, NULL, CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime), NULL)
INSERT [dbo].[Gift] ([ID], [Image], [Name], [Description], [GiftTypeID], [Prize], [Day], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate], [QueryString]) VALUES (9, N'Data/Images/norooz.jpg', N'دهه فجر', N'دهه فجر مبارک', 2, 10, NULL, CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime), CAST(0x0000A73600000000 AS DateTime), NULL)
INSERT [dbo].[Gift] ([ID], [Image], [Name], [Description], [GiftTypeID], [Prize], [Day], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate], [QueryString]) VALUES (11, N'Data/Images/2.png', N'یه روز غیبت', N'غیبت داشتی عمو پاشو بیا', 3, 3, 1, CAST(0x0000A72C00000000 AS DateTime), CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75900000000 AS DateTime), CAST(0x0000A75900000000 AS DateTime), NULL)
INSERT [dbo].[Gift] ([ID], [Image], [Name], [Description], [GiftTypeID], [Prize], [Day], [StartDate], [ExpireDate], [CreatedDate], [UpdatedDate], [QueryString]) VALUES (12, N'Data/Images/6.png', N'دو روز غیبت', N'عومو پاشو بیا', 3, 5, 2, CAST(0x0000A72C00000000 AS DateTime), CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A75900000000 AS DateTime), CAST(0x0000A75900000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Gift] OFF
SET IDENTITY_INSERT [dbo].[GiftType] ON 

INSERT [dbo].[GiftType] ([ID], [Name], [Priority]) VALUES (2, N'DateTime', 1)
INSERT [dbo].[GiftType] ([ID], [Name], [Priority]) VALUES (3, N'Daily', 2)
INSERT [dbo].[GiftType] ([ID], [Name], [Priority]) VALUES (4, N'Message', 3)
INSERT [dbo].[GiftType] ([ID], [Name], [Priority]) VALUES (5, N'AdHoc', 4)
SET IDENTITY_INSERT [dbo].[GiftType] OFF
SET IDENTITY_INSERT [dbo].[Level] ON 

INSERT [dbo].[Level] ([ID], [LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (1, 1, 100, 20, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[Level] ([ID], [LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (2, 2, 120, 30, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[Level] ([ID], [LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (3, 3, 140, 40, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Level] ([ID], [LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (4, 4, 150, 50, CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Level] ([ID], [LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (5, 5, 160, 60, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A70D00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Level] OFF
SET IDENTITY_INSERT [dbo].[Manufacture] ON 

INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (119, 2177, 1, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (120, 2177, 2, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (121, 2177, 3, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (122, 2177, 4, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (123, 2177, 5, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (124, 2177, 6, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (125, 2177, 7, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (126, 2177, 8, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (127, 2177, 9, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (128, 2177, 10, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (129, 2177, 11, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (130, 2177, 12, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (132, 2177, 15, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (133, 2177, 16, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (134, 2177, 17, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (135, 2177, 18, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (136, 2177, 19, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (137, 2177, 20, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (138, 2177, 21, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (139, 2177, 22, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (140, 2177, 23, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (141, 2177, 24, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (142, 2177, 25, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (143, 2177, 26, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (144, 2177, 27, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (145, 2177, 28, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (146, 2177, 29, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (148, 2177, 30, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (149, 2177, 31, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (150, 2177, 32, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (152, 2177, 34, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (153, 2177, 35, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (154, 2177, 36, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (155, 2177, 37, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (156, 2177, 38, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (157, 2177, 39, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (158, 2177, 40, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (159, 2177, 41, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (160, 2177, 42, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (161, 2177, 43, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (162, 2177, 44, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (163, 2177, 45, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (164, 2177, 46, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (169, 2177, 47, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (170, 2177, 48, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (171, 2177, 49, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (172, 2177, 50, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (173, 2177, 51, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (174, 2177, 52, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (175, 2177, 53, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (176, 2177, 54, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (177, 2177, 55, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (178, 2177, 56, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (179, 2177, 57, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (180, 2177, 58, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (181, 2177, 59, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (182, 2177, 60, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (183, 2177, 61, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (184, 2177, 62, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (185, 2177, 63, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (186, 2177, 64, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (187, 2177, 65, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (188, 2177, 66, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (189, 2177, 67, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (190, 2177, 68, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (191, 2177, 69, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (192, 2177, 70, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (194, 2177, 72, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (196, 2177, 74, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (198, 2177, 76, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (200, 2177, 78, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (201, 2177, 79, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (202, 2177, 80, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (203, 2177, 81, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (204, 2177, 82, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (205, 2177, 83, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (206, 2177, 84, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (207, 2177, 85, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (208, 2177, 86, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (209, 2177, 87, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (210, 2177, 88, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (211, 2177, 89, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (212, 2177, 90, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (213, 2177, 91, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (214, 2177, 92, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (216, 2177, 94, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (217, 2177, 95, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (218, 2177, 96, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (219, 2177, 97, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (220, 2177, 98, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (221, 2177, 99, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (222, 2177, 100, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (223, 2177, 101, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (224, 2177, 102, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (225, 2177, 103, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (226, 2177, 104, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (227, 2177, 105, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (228, 2177, 106, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (229, 2177, 107, CAST(0x0000A73900000000 AS DateTime))
GO
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (230, 2177, 108, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (231, 2177, 109, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (232, 2177, 110, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (233, 2177, 111, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (234, 2177, 112, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (235, 2177, 113, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (236, 2177, 114, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (237, 2177, 115, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (238, 2177, 116, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (239, 2177, 117, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (240, 2177, 118, CAST(0x0000A73900000000 AS DateTime))
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (241, 2177, 119, CAST(0x0000A73900000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Manufacture] OFF
SET IDENTITY_INSERT [dbo].[MarketInfo] ON 

INSERT [dbo].[MarketInfo] ([ID], [MarketName], [MarketKey], [AppPackageName], [PaymentVerificationLink], [LinkToAuthorize], [ClientID], [ClientSecret], [AccessToken], [RefreshToken], [RedirectURI], [ExpireAt], [NeedsTokenVerification], [CreatedDate], [UpdatedDate], [Code]) VALUES (2, N'CafeBazzar', 2323, N'com.bms.what_if', N'https://pardakht.cafebazaar.ir/devapi/v2/api/validate/{0}/inapp/{1}/purchases/{2}/', N'https://pardakht.cafebazaar.ir/devapi/v2/auth/token/', N'uxbmnAGS1zzFxWjHquyBZ97zoI0z9oWNu4YNrlEB', N'GIFjdx760ZKC0h6qdEdQbjGPhMkWVgWsDOrSHYOvRDn3zt71SSet6IR5cpCM', N'SmklMWcq0LB2LGBBQuhciTHjotNp7k', N'OMJ4lWiIXrxMTqnUe0pUdeACmqog7w', NULL, CAST(0x0000A7810065F0D8 AS DateTime), 1, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), N'CODE')
SET IDENTITY_INSERT [dbo].[MarketInfo] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (1, 1173, 4, 0, 200, NULL, N'KKcrLU2jWO4DY86Y', NULL, NULL, 1, N'invalid_value', N'Package name is invalid.')
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (2, 1173, 4, 0, 200, CAST(0x0000A756010E2B94 AS DateTime), N'KKcrLU2jWO4DY86Y', NULL, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (3, 1173, 4, 0, 200, CAST(0x0000A75701304F3C AS DateTime), N'h-BYyNa405R47REu', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (4, 1173, 2, 0, 100, CAST(0x0000A756010DF3F8 AS DateTime), N'pIucBgl7oCaAgL5e', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (5, 1173, 2, 0, 100, CAST(0x0000A7570130DED3 AS DateTime), N'nGlMfNWWQ7TBBG6K', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (6, 2179, 7, 0, 400, CAST(0x0000A75701418B5B AS DateTime), N'WUlbqFcmu6Yl-3zM', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (7, 2179, 4, 0, 200, CAST(0x0000A7570141F764 AS DateTime), N'XQY-PTVk41AGXRAF', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (8, 2179, 2, 0, 100, CAST(0x0000A7570142305C AS DateTime), N'3LNXl5wLFvvaEYXQ', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (9, 2179, 4, 0, 200, CAST(0x0000A75701428560 AS DateTime), N'OKSruIYhYF7h7-_o', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (10, 1173, 4, 2000, 200, CAST(0x0000A7510011C535 AS DateTime), N'zvcS5JJFFdjLD36d', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (11, 2179, 2, 0, 100, CAST(0x0000A75800DDAC58 AS DateTime), N'xFIxNZhxJ151b0th', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (12, 2179, 2, 0, 100, CAST(0x0000A75800DE9A91 AS DateTime), N'y_q2YeX8yobwDnTg', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (13, 2179, 2, 0, 100, CAST(0x0000A75800E0287B AS DateTime), N'I5eata9rkedG2kMD', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (14, 2179, 2, 1000, 100, CAST(0x0000A75800E22F6B AS DateTime), N'999769551755497152', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (15, 2179, 2, 0, 100, CAST(0x0000A75800EC696C AS DateTime), N'KuHJlqUzzZRHsPr5', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (16, 2179, 2, 1000, 100, CAST(0x0000A75800EEAEF4 AS DateTime), N'SIXWHxmvPUeVpeDHQ', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (17, 2179, 2, 1000, 100, CAST(0x0000A75800F1E402 AS DateTime), N'SmaLAqNJ2rFgQDhtu', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (18, 2179, 4, 0, 200, CAST(0x0000A75800F6B576 AS DateTime), N'SNoZ4jNY_Y7DbJcA', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (19, 2179, 4, 0, 200, CAST(0x0000A75800F7F9A2 AS DateTime), N'j0jXDNUpUhhg7SAN', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (20, 2179, 4, 0, 200, CAST(0x0000A75800FEA91C AS DateTime), N'-hTBP_zIYtU_sJ9v', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (21, 2179, 4, 0, 200, CAST(0x0000A75800FF4F37 AS DateTime), N'2X19ZrrVKan6Uqab', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (22, 2179, 4, 0, 200, CAST(0x0000A75801006948 AS DateTime), N'GZ6OA0G7fHjF-fcu', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (23, 1173, 4, 0, 200, CAST(0x0000A75900B30398 AS DateTime), N'9X81oYA7tpRgbCSr', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (24, 1173, 5, 0, 300, CAST(0x0000A75900B2D7DA AS DateTime), N'd0k_8kgoMYuQr8xc', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (25, 2179, 4, 0, 200, CAST(0x0000A75900CA0088 AS DateTime), N'9w9lcM85DcPTdBag', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (26, 2185, 4, 0, 200, CAST(0x0000A75701304F3C AS DateTime), N'h-BYyNa405R47REu', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (27, 2185, 4, 0, 200, CAST(0x0000A75A0100B7A9 AS DateTime), N'zERxsu2c_8CLukdV', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (28, 2185, 4, 0, 200, CAST(0x0000A75A0100C55F AS DateTime), N'L0WfzzbVvCeTw-kR', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (29, 2185, 4, 0, 200, CAST(0x0000A75A0100D87A AS DateTime), N'dtlCVf7LnEE28aTY', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (30, 2212, 2, 1000, 100, CAST(0x0000A7570130DED3 AS DateTime), N'nGlMfNWWQ7TBBG6K', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (31, 2212, 4, 0, 200, CAST(0x0000A76600BD6A84 AS DateTime), N'zp6Js8bxRvvQrV0s', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (32, 2200, 4, 0, 200, CAST(0x0000A76D013D5F24 AS DateTime), N'McLEuhisHVfxZ1vI', 0, 1, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[PresentedAdvert] ON 

INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (1, 2211, 1, CAST(0x0000A76C00FBCC0F AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (2, 2208, 1, CAST(0x0000A76D00CF8FC4 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (3, 2208, 7, CAST(0x0000A76D00CFBD49 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (4, 2208, 1, CAST(0x0000A76D00D046D1 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (5, 2208, 1, CAST(0x0000A76D00D14815 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (6, 2200, 1, CAST(0x0000A76D013AB217 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (7, 2200, 7, CAST(0x0000A76D013ABE65 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (8, 1173, 1, CAST(0x0000A76E00B26554 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (9, 1173, 7, CAST(0x0000A76E00B272B2 AS DateTime))
SET IDENTITY_INSERT [dbo].[PresentedAdvert] OFF
SET IDENTITY_INSERT [dbo].[PurchaseAvatar] ON 

INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1013, 5, 1158, CAST(0x0000A73A000A60A1 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1014, 4, 1158, CAST(0x0000A73A000A656D AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1015, 3, 1158, CAST(0x0000A73A000A6767 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1016, 2, 1158, CAST(0x0000A73A000A695D AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1022, 8, 1173, CAST(0x0000A74A0132AE68 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1023, 4, 1170, CAST(0x0000A74B0171B19D AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1024, 2, 1173, CAST(0x0000A74D000AF80C AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1025, 5, 1173, CAST(0x0000A74D014C6A78 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1026, 6, 1170, CAST(0x0000A74D0159E9F3 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1031, 6, 1173, CAST(0x0000A758000BA6BC AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1032, 4, 1173, CAST(0x0000A75800DD2418 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1033, 6, 2179, CAST(0x0000A75900D09454 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1034, 2, 1170, CAST(0x0000A75A00077A7E AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1035, 3, 1173, CAST(0x0000A75A0160FA6D AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1036, 8, 2187, CAST(0x0000A75D0110B0A8 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1037, 6, 2187, CAST(0x0000A75D0110B541 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1038, 7, 2187, CAST(0x0000A75D0110B9C6 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1039, 5, 2187, CAST(0x0000A75D012BAC57 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1040, 6, 2189, CAST(0x0000A75E00CF806C AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1041, 7, 2189, CAST(0x0000A75E00CF82EE AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1042, 6, 2200, CAST(0x0000A75E014C7947 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1043, 3, 2197, CAST(0x0000A75F00D11D07 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1044, 6, 2197, CAST(0x0000A75F00D124D4 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1045, 6, 2201, CAST(0x0000A76000CF7763 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1046, 4, 2201, CAST(0x0000A76000CF8426 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1047, 4, 2200, CAST(0x0000A761000C0019 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1048, 7, 1173, CAST(0x0000A76200E5A0F9 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1049, 9, 1173, CAST(0x0000A76200E5A737 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1050, 4, 2202, CAST(0x0000A76500FCBC53 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1051, 3, 2202, CAST(0x0000A76500FCFE3E AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1052, 9, 2208, CAST(0x0000A76501154AD3 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1053, 7, 2207, CAST(0x0000A76501155738 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1054, 8, 2206, CAST(0x0000A76501155FFE AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1055, 6, 2205, CAST(0x0000A7650115680C AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1056, 5, 2209, CAST(0x0000A765011583A9 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1057, 3, 2200, CAST(0x0000A76501521D0B AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1058, 8, 2201, CAST(0x0000A76501787729 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1059, 7, 2201, CAST(0x0000A76501787936 AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseAvatar] OFF
SET IDENTITY_INSERT [dbo].[PurchaseCategory] ON 

INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1061, 1158, 7, CAST(0x0000A73A000DA0B8 AS DateTime))
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
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1086, 1173, 11, CAST(0x0000A74E0166965B AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1091, 1173, 8, CAST(0x0000A74F0162031B AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1093, 2181, 7, CAST(0x0000A757013BC251 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1094, 2181, 12, CAST(0x0000A757013BD492 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1095, 2184, 2, CAST(0x0000A759010821D5 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1096, 2184, 5, CAST(0x0000A7590108FC0A AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1097, 1170, 2, CAST(0x0000A75A0006F187 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1098, 1170, 6, CAST(0x0000A75A00070DFC AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1099, 2185, 14, CAST(0x0000A75A0100EAA7 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1100, 2185, 13, CAST(0x0000A75A0100EC7C AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1101, 2185, 12, CAST(0x0000A75A0100EDC4 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1102, 2185, 11, CAST(0x0000A75A0100EF1A AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1103, 2185, 10, CAST(0x0000A75A0100F0BC AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1104, 2185, 8, CAST(0x0000A75A0100F24A AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1105, 2185, 7, CAST(0x0000A75A0100F4C8 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1106, 2185, 6, CAST(0x0000A75A0100F74A AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1107, 2185, 5, CAST(0x0000A75A0100F87F AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1108, 2185, 2, CAST(0x0000A75A0100F9DF AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1109, 1173, 13, CAST(0x0000A75B01558B62 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1110, 1173, 14, CAST(0x0000A75B015590A8 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1111, 1173, 6, CAST(0x0000A75B01559414 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1112, 2183, 11, CAST(0x0000A75C00EC5FDC AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1113, 2189, 2, CAST(0x0000A75E00CF927A AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1114, 2189, 5, CAST(0x0000A75E00CF93A1 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1115, 2189, 6, CAST(0x0000A75E00CF956C AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1116, 2189, 7, CAST(0x0000A75E00CF982C AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1117, 2189, 8, CAST(0x0000A75E00CF99AC AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1118, 2189, 10, CAST(0x0000A75E00CF9B98 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1119, 2189, 11, CAST(0x0000A75E00CF9D47 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1120, 2189, 12, CAST(0x0000A75E00CF9F88 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1121, 2189, 13, CAST(0x0000A75E00CFA174 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1122, 2197, 2, CAST(0x0000A75F00D0FE81 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1123, 2201, 2, CAST(0x0000A76000CF07B6 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1124, 2201, 5, CAST(0x0000A76000CF0F91 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1125, 2201, 13, CAST(0x0000A76000CF1AA9 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1126, 2201, 14, CAST(0x0000A76000CF243D AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1127, 2201, 6, CAST(0x0000A76000CF32BD AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1128, 2201, 7, CAST(0x0000A76000CF38CD AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1129, 2201, 8, CAST(0x0000A76000CF4265 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1130, 2201, 10, CAST(0x0000A76000CF4B59 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1131, 2201, 11, CAST(0x0000A76000CF5432 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1132, 2197, 6, CAST(0x0000A76100C5F9FE AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1133, 2203, 2, CAST(0x0000A763015C4412 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1134, 2200, 6, CAST(0x0000A76301717FEF AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1135, 2200, 2, CAST(0x0000A76400D7BF90 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1136, 2200, 5, CAST(0x0000A76400D7C173 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1137, 2200, 7, CAST(0x0000A76400D7C424 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1138, 2200, 8, CAST(0x0000A76400D7C571 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1139, 2200, 10, CAST(0x0000A76400D7C766 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1140, 2200, 11, CAST(0x0000A76400D7C8F0 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1141, 2200, 12, CAST(0x0000A76400D7CAC0 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1142, 2209, 2, CAST(0x0000A765011A0EEA AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1143, 2212, 2, CAST(0x0000A76600B6D1E4 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1144, 2212, 6, CAST(0x0000A76600B85F6A AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1145, 2212, 7, CAST(0x0000A76600B860EF AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1146, 2209, 6, CAST(0x0000A76600D42A65 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1147, 1173, 7, CAST(0x0000A76600D43DE0 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1148, 1173, 5, CAST(0x0000A76600D442D7 AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1151, 1173, 10, CAST(0x0000A76600D4492C AS DateTime))
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate]) VALUES (1152, 2208, 6, CAST(0x0000A76E0108FFC4 AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseCategory] OFF
SET IDENTITY_INSERT [dbo].[PurchaseTheme] ON 

INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1079, 1158, 5, CAST(0x0000A73A000D9156 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1080, 1158, 6, CAST(0x0000A73A000DC735 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1081, 1160, 2, CAST(0x0000A73A00DB1B11 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1082, 1162, 2, CAST(0x0000A73A015640A5 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1083, 1160, 4, CAST(0x0000A73B01732174 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1097, 1173, 9, CAST(0x0000A74D000EF1DA AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1098, 1173, 5, CAST(0x0000A74D000EF8CB AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1100, 1173, 4, CAST(0x0000A74E01662AC0 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1103, 1173, 2, CAST(0x0000A7500181BBD0 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1106, 1173, 6, CAST(0x0000A758017799DA AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1107, 2184, 2, CAST(0x0000A7590108285E AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1108, 1170, 2, CAST(0x0000A75A00064AD9 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1109, 2185, 5, CAST(0x0000A75A010017C1 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1110, 2185, 9, CAST(0x0000A75A01001D02 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1111, 2185, 4, CAST(0x0000A75A01001F55 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1112, 2185, 2, CAST(0x0000A75A010110DA AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1113, 2185, 6, CAST(0x0000A75A01011284 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1114, 2189, 5, CAST(0x0000A75E00CFA9BB AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1115, 2189, 6, CAST(0x0000A75E00CFAD07 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1116, 2197, 2, CAST(0x0000A75F00D105CB AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1117, 2197, 4, CAST(0x0000A75F00D10D31 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1118, 2201, 2, CAST(0x0000A76000CF0B93 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1119, 2201, 4, CAST(0x0000A76000CF5B64 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1120, 2201, 5, CAST(0x0000A76000CF60D9 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1121, 2201, 6, CAST(0x0000A76000CF6323 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1122, 2200, 2, CAST(0x0000A761000C4B72 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1123, 2200, 4, CAST(0x0000A761017E72D6 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1124, 2202, 2, CAST(0x0000A76500C21FF0 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1125, 2202, 4, CAST(0x0000A76500C36E6F AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1126, 2202, 5, CAST(0x0000A76500C383AD AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1127, 2202, 6, CAST(0x0000A76500C38A65 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1128, 2202, 9, CAST(0x0000A76500C38FF6 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1129, 2209, 2, CAST(0x0000A765011A088F AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1130, 2201, 9, CAST(0x0000A765017852E3 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1131, 2218, 6, CAST(0x0000A76E01601BBF AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseTheme] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (1, N'هر روز یه پیتزا بهت میدادن', N'باید بدون سس میخوردی', 1, 66, 17, 0, 1, 75, CAST(0x0000A6EE00AD2C08 AS DateTime), CAST(0x0000A6EE00AD2C08 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (2, N'از هر مغازه ای که میخواستی، رایگان لباس میخریدی', N'مجبور بودی مثل سوپر من، شرتت رو رو شلوار میپوشیدی', 10, 37, 4, 2, 0, 20, CAST(0x0000A80800AD2C08 AS DateTime), CAST(0x0000A80800AD2C08 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (3, N'هیچوقت گرسنه ات نمیشد', N'رنگت مثل درختا سبز بود و باید روزی 1 ساعت پاهات رو تو زمین فرو میکردی', 11, 37, 8, 0, 1, 30, CAST(0x0000A6F700000000 AS DateTime), CAST(0x0000A6F700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (4, N'کنکور رو کلا حذف میکردن', N'دانشگاه ها تفکیک جنسیتی میشدن', 11, 38, 4, 2, 0, 40, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (5, N'وقتی شیر آب رو باز میکردی ازش پول میومد', N'برای بدست اوردن آب باید روزی هشت ساعت کار میکردی', 11, 39, 3, 1, 0, 50, CAST(0x0000A81C00000000 AS DateTime), CAST(0x0000A81C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (6, N'یه خونه رایگان بهت میدادن', N'10 سال از عمرت کم میشد', 11, 42, 4, 1, 0, 60, CAST(0x0000A7FF00000000 AS DateTime), CAST(0x0000A7FF00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (7, N'به جای اینکه یارانه بدن، همه ماهی 10 هزار تومن هم میدادن', N'دیگه کسی اختلاس و دزدی نمیکرد', 8, 37, 8, 1, 0, 70, CAST(0x0000A80800000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (8, N'پولداری میشدی', N'باید با کسی که کنارت نشسته ازدواج میکردی', 13, 43, 6, 2, 0, 80, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (9, N'یارانت دوبرابر میشد ', N'باید به غرضی رای میدادی', 6, 53, 13, 1, 0, 90, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (10, N'حقوقت سه میلیون بود ', N'نصفش رو باید پول ایزی لایف میدادی', 10, 41, 3, 2, 0, 91, CAST(0x0000A80800000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (11, N'یه شغل با آبرو داشتی', N'یه زن بی آبرو گیرت میومد', 13, 42, 4, 1, 0, 92, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (12, N'رتبه یک کنکور میشدی', N'باید بعدش رفتگر می شدی', 11, 52, 9, 3, 1, 93, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (15, N'سال نو آیفون هدیه بگیری', N'ولی تا آخر سال اجازه نداشتی روش برنامه بریزی', 11, 12, 1, 0, 0, 40, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A81C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (16, N'روحانی رئیس جمهور بشه', N'دیگه قید انرژی هسته ای رو بزنیم', 7, 13, 4, 0, 0, 2, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 1, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (17, N'هر کتابی رو که میخواستی به مغزت تزریق میکردی', N'کور میشدی', 11, 20, 14, 12, 10, 50, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (18, N'اندازه بیل گیتس پول داشتی', N'یه دست و یه پا نداشتی', 8, 25, 32, 11, 10, 60, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (19, N'زورت ده برابر میشد', N'عقلت نصف میشد', 13, 22, 15, 12, 3, 55, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (20, N'هر چه قدر میخواستی میخوردی و چاق نمیشدی', N'روزی 10 بار باید دستشویی میرفتی', 13, 29, 14, 10, 10, 70, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (21, N'میتونستی ذهن بقیه رو بخونی', N'بقیه هم میتونستن ذهنت رو بخونن', 11, 20, 27, 3, 5, 39, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (22, N'میتونستی زیر آب هم نفس بکشی', N'برای اینکه زنده بمونی باید همیشه بدنت رو خیس نگه میداشتی', 11, 40, 13, 7, 6, 60, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (23, N'پدر و مادرت رو خودت انتخاب میکردی', N'40 سال بشتر عمر نمیکردی', 11, 20, 20, 18, 17, 45, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (24, N'یارانه هر نفر 500 هزار تومن میشد', N'ترامپ رئیس جمهور ایران میشد', 6, 29, 19, 10, 10, 65, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (25, N'تو 30 سالگی یک میلیارد برنده میشدی', N'باید خرج ساخت سرویس بهداشتی میکردی', 1, 11, 19, 0, 0, 20, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (26, N'تا ابد زنده بودی', N'دیگه هیچکس باهات حرف نمیزد', 11, 22, 3, 0, 0, 80, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (27, N'میتونستی تو رویاهات زندگی کنی', N'دیگه هیچوقت نمیتونستی ازشون خارج بشی', 11, 14, 3, 1, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (28, N'دیگه سرما نمیخوردی', N'همیشه  کفشات لنگه به لنگه بودن', 13, 14, 3, 1, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (29, N'هیچوقت چاق نمیشدی', N'هیچوقت هم گشنت نمیشد', 11, 16, 1, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (30, N'برای 25 سال ماهی 100 میلیون درآمد داشتی', N'برای 5 سال نمیتونستی لباسات را حتی برای قضای حاجت در بیاری', 10, 6, 3, 0, 0, 60, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (31, N'تو زندگی به هر چی که میخواستی  میرسیدی', N'دیگه هیچوقت نمیرسیدی خانواده و دوستات رو بینی', 11, 60, 11, 5, 0, 99, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (32, N'به جای بتمن بودی', N'بهترین دوستت جای جوکر بود', 14, 13, 1, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (34, N'هفته ای یه بار قضای حاجت میکردی', N'ولی یه یارش به اندازه 10 بار پر سر و صدا تر بود', 10, 39, 11, 0, 0, 99, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (35, N'هر کی رو میخواستی عاشقت میشد', N'هر کی هم میخواستت عاشقش میشدی', 11, 14, 2, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (36, N'چند برابر خوشگل تر میشدی', N'ولی آخر هفته ها جنسیتت عوض میشد', 13, 14, 1, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (37, N'یه همزاد داشتی که هر چی میگفتی رو انجام میداد', N'عاشق اونی میشد که میخوای باهاش عروسی کنی', 1, 14, 15, 1, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (38, N'جای رستم بودی', N'دوستت جای اسفندیار بود', 14, 24, 6, 1, 0, 80, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (39, N'هر چی میگفتی هیج عواقب بدی برات نداشت', N'ولی لهجه خیلی آبرو ریز داشتی', 13, 11, 2, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (40, N'هیچوقت تو زندگیت شکست نمیخوردی', N'هیچوقت هم عاشق نمیشدی', 11, 12, 2, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (41, N'صدای باد معده نصف میشد', N'پخش بوش 2 برابر بود', 10, 21, 4, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (42, N'دستگاه پرینتی داشتی که پول واقعی چاپ میکرد', N'تا آخر عمر باید دامن میپوشیدی و دیگه نمیتونستی زیرش شورت بپوشی', 13, 21, 3, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (43, N'میتونستی 5 نفر رو به همراه خودت میلیاردر کنی', N'همزمان به دلیل کار تو 5 نفر هم به زمین گرم میخوردن', 11, 19, 7, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (44, N'قالی پرنده داشتی', N'هیچوقت نمیتونستی ازش پیاده شی', 11, 19, 6, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (45, N'کت جادویی داشتی و هر موقع اراده میکردی یک میلیون از جیبش بر میداشتی', N'هر موقع که یک میلیونش رو خرج میکردی یک نفر توی اون گوشه دنیا میمرد', 11, 10, 3, 0, 0, 70, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (46, N'خوشگل ترین آدم دنیا بودی', N'نمیتونستی با کسی همبستر بشی', 10, 31, 8, 2, 0, 90, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (47, N'خونت همیشه تمیز بود و همه کارا خونه خود به خود انجام میشد', N'همیشه باید با کفشهای کثیف اینور و اونور میرفتی', 11, 26, 8, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (48, N'شخصیتهای کارتونی واقعی بودن', N'آدما تخیلی بودن', 14, 27, 7, 0, 1, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (49, N'هر عکسی که تو ایستاگرام پست میکردی 1 میلیون لایک میخورد', N' تو همشون چشات چپ بود و انگشتت تو دماقت بود', 10, 34, 7, 0, 0, 90, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (50, N'همیشه هیکلت رو فرم بود', N'به جای روزی 1 ساعت ورزش، روزی 60 نفر رو ماچ میکردی', 10, 49, 6, 4, 0, 100, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (51, N'10 تا سکه میگرفتی', N'هر چی که توی چی میشد... جواب دادی واقعا اتفاق میاق میفتاد', 1, 32, 13, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (52, N'سی تا سکه بهت میدادیم تا اینکه بتونی یک بسته رو بخری', N'باید پاسخ مثبت بدی و ما به فروشگاه وصلت کنیم', 1, 11, 6, 0, 0, 60, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (53, N'سه تا زبان جدید را مثل آب خوردن یاد میگرفتی', N'زبان مادریت رو کلا فراموش میکردی', 1, 39, 11, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (54, N'جذابیت چند برابر میشد', N'عقلت نصف میشد', 13, 25, 6, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (55, N'احتیاج به خواب نداشتی', N'20 سال زودتر میمردی', 1, 32, 15, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (56, N'ساعت جادویی داشتی و میتونستی زمان رو متوقف کنی', N'هر موقع زمان رو متوقف میکردی یک نفر سکته میزد', 1, 30, 16, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (57, N'هر موقع خوشحال بودی هوا آفتابی میشد', N'هر موقع هم که ناراحت بودی هوا بارونی میشد', 1, 34, 10, 2, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (58, N'دیگه هیچ جنگی روی زمین نبود', N'اینترنت هم  وجود نداشت', 1, 47, 22, 3, 0, 90, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (59, N'هر کسی رو که اراده میکردی بهترین دوستت میشد', N'فقط و فقط یک روز میتونستید با هم باشید', 1, 12, 12, 0, 0, 70, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (60, N'کچل میشدی', N'روزی 100 هزار تومن بهت میدادن', 13, 7, 3, 0, 0, 70, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (61, N'همه مردم سیاه بودن', N'تو سفید بودی', 11, 20, 5, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (62, N'اراده کنی و بری به 50 سال دیگه', N'20 سال از عمرت کم میشد', 11, 7, 3, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (63, N'میتونستی یه هفته تمام با یکی از معروف ترین بازیگرا باشی', N'هر جا که با هم میرفتید خبرنگرا ولتون نمیکردن', 11, 9, 4, 1, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (64, N'قدرتمند ترین آدم دنیا میشدی', N'برای اینکه مقامت رو از دست ندی روزی 1000 نفر رو میکشتی', 11, 28, 12, 0, 0, 99, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (65, N'میتونستی همسرت رو هر جوری که دوست داشتی  چه ظاهری چه باطنی تغییرش بدی', N'اونم میتونست هر جوری که دوست داشت تغییرت بده', 11, 11, 2, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (66, N'هر جایی که میرفتی بهترین دما و آب و هوا رو داشت', N'ولی توی رخت خوابت غندیل میبستی', 11, 8, 2, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (67, N'از این به بعد به همه غذاها، فیلمها، کتابهاو بازیها دسترسی رایگان داشتی', N'به مدت 10 سال نمیتونستی از خونت بیرون بری', 11, 11, 3, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (68, N'میتونستی یکی از شخصیتهای دنیای غیر واقعی بشی', N'بعدش دیگه نمیتونستی به حالت قبلیت برگردی', 14, 10, 4, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (69, N'ببینی توی یکسال آینده چی قراره اتفاق بیفته', N'بعدش به ازای هر سال که میگذره خاطرات اون سال و سال قبلش رو فراموش کنی', 1, 9, 13, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (70, N'هر لباسی رو از هر فروشگاهی که میخواستی میتونستی بخری', N'همیشه کفشات و جورابات لنگه به لنگه بودن', 13, 6, 2, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (72, N'هر ماشینی رو که دوست داشتی میتونستی بخری', N'هفته ای یکبار باید باهاش جنازه جا به جا میکردی', 1, 16, 12, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (74, N'راننده شخصی داشتی که هر موقع که میخواستی هر جایی که میگفتی میبردت', N'با ژیان میرسوندت', 1, 28, 22, 0, 0, 90, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (76, N'میدونستی کی و چجوری میمیری', N'نمیتونستی هیچ کاری برای جلوگیری ازش بکنی', 1, 25, 18, 1, 0, 90, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (78, N'حقوقت 4 برابر میشد', N'قدت نصف میشد', 8, 16, 7, 1, 0, 90, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (79, N'روزی 100 هزار تومن بهت میدادن', N'سالی 1 سانت قدت کوتاه تر میشد', 8, 13, 3, 0, 0, 80, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (80, N'میتونستی پادشاه یا ملکه هر کشوری که میخواستی بشی', N'دیگه نمیتونستی زندگی شادی داشته باشی', 11, 11, 3, 0, 0, 80, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (81, N'25سال کمتر عمر میکردی', N'همیشه سالم و سلامت بودی', 11, 10, 3, 0, 0, 80, CAST(0x0000A71D00000000 AS DateTime), CAST(0x0000A71D00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (82, N'فضاییها واقعی بودن و به زمین میومدن', N'با آدما میتونستن عروسی کنن و بچه هاشون آدم فضایی میشدن', 14, 6, 3, 0, 0, 70, CAST(0x0000A71D00000000 AS DateTime), CAST(0x0000A71D00000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (83, N'از زمان مردنت مطلع میشدی', N'اگه به کسی در موردش میگفتی همون موقع سوسک میشدی', 13, 13, 2, 0, 0, 80, CAST(0x0000A71D00000000 AS DateTime), CAST(0x0000A71D00000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (84, N'توی بهشت بودی و هر کاری دلت میخواست میتونستی بکنی', N'نباید به درخت سیب دست میزدی و ازش میخوردی', 11, 8, 2, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (85, N'یه درخت داشتی که به جای میوه پول میداد', N'هر موقع پولش رو میچیندی به اندازه مبلغی که بر میداشتی به همون تعداد درختای دیگه خشک میشدن', 14, 5, 3, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (86, N'یه مرغ داشتی که تخم طلا میداد', N'همه دنبال این بودن که ازت بدزدنش', 11, 5, 2, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (87, N'همیشه زندگیت رو به راه بود', N'هر روزبه 10 نفر کمک میکردی', 8, 15, 2, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (88, N'تمام سختیها و بدبختیهای زندگیت تموم میشد', N'باید به بهترین دوستت میدادیشون', 11, 5, 5, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (89, N'میتونستی به گذشته برگردی ', N'نمیتونستی با اونایی که میشناختی حرف بزنی', 11, 6, 3, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (90, N'موفقیت بچه هات تضمین میشد', N'باید حتما 3 تا بچه داشتی و اسمشون رو سوای اینکه پسرن یا دختر میذاشتی اتل و متل و توتوله', 13, 12, 3, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (91, N'همه از زندگیشون لذت میبردن و هیچکس فقیر نبود', N'برای اینکه اوضاع همه خوب باشه تو باید سختی میکشیدی', 11, 11, 3, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (92, N'هر روز خوشمزه ترین غذاها رو میخوردی', N'یه روز در میون اسهال بودی', 10, 10, 4, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (94, N'همه غذاهات توسط آقای گلریز سرو میشد', N'همیشه باید با دست غذا میخوردی', 13, 7, 4, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (95, N'هر موقع که اراده میکردی میتونستی جنسیت رو عوض کنی', N'هر بار که اینکار رو میکردی یکم زشتتر میشدی', 13, 6, 5, 1, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (96, N'همیشه خدا خوشحال بودی', N'عقلت معیوب بود', 11, 6, 6, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (97, N'یه ویلای لوکس بغل ساحل داشتی', N'به محض اینکه ازش خارج میشدی خرابش میکردن', 11, 6, 6, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (98, N'میتونستی مثل هر کسی که دوست داشتی بشی', N'خانوادت و دوستات دیگه نمیشناختنت', 11, 8, 4, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (99, N'ستاره یه فیلم میشدی', N'فیلمش مستهجن بود', 7, 8, 10, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (100, N'قدت 10سانت بلندتر میشد', N'دستات 5 سانت کوتاه میشدن', 11, 7, 5, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (101, N'ثروتنمندترین آدم دنیا میشدی', N'هر کسی رو که میشناختی میمرد', 11, 3, 3, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (102, N'با شعبده بازی گربه ظاهر کنی', N'روز بعد گربهایی که ظاهر میکردی میمردن', 11, 0, 1, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (103, N'هر روز 2 ساعت زودتر به محل کارت یا مدرسه و دانشگاه میرفتی', N'یه روز بیشتر تو هفته تعطیلی داشتی', 11, 0, 1, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (104, N'میتونستی هر اندازه که دلت بخواد بدون اینکه اثری رو سلامتیت بذاره بستنی بخوری', N'مجبور بودی تا آخر عمرت تو پارکها بستنی بفروشی', 11, 1, 0, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (105, N'آلت تناسلی نداشتی', N'100 تا همسر داشتی', 7, 1, 5, 0, 1, 90, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (106, N'خونه رویاهات رو داشتی و هر چی که آرزو داتشی درونش بود', N'دیگه نمیتونستی ازش خارج بشی', 11, 0, 1, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (107, N'5 تا سکه رایگان میگرفتی', N'یک ویدئو چند ثانیه ای درباره ی یک چیز باحال میدیدی', 11, 1, 0, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 1, 1)
GO
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (108, N'هر کلیپی که روی یوتیوب میذاشتی جز پر بازدیدترینها میشسد', N'تو همشون 10 دقیقه گریه و زاری میکردی', 11, 1, 2, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (109, N'میتونستی انتخاب کنی به سیاره زنان ونوسی یا مردان مریخی بری', N'دیگه بعدش نمیتونستی اون سیاره رو ترک کنی', 11, 0, 1, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (110, N'میتونستی با نوک انگشتت لوازم الکترونیکی رو خاموش و روشن کنی', N'یک بار در ماه برای 24 ساعت باسنت رو بزنی به شارژ ', 10, 0, 1, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (111, N'دکترای فیزیک هسته ای داشتی', N'شغلت تو سازمان انرژی اتمی ساخت آبمیوه گیر بود', 6, 5, 27, 12, 1, 100, CAST(0x0000A72F00000000 AS DateTime), CAST(0x0000A72F00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (112, N'شبا خوشگل بودی', N'روزا باهوش بودی', 7, 5, 1, 0, 0, 80, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (113, N'سالی 2 بار سرما میخوردی', N'موقعی که میخوردی بد میخوردی', 11, 1, 0, 0, 0, 70, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (114, N'مجبور بودی برای 10 سال تو بیابون زندگی کنی', N'وقتی که برمیگشتی 10 میلیارد بهت میدادن', 1, 7, 11, 1, 0, 80, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (115, N'یک میلیارد بهت میدادن', N'برای اینکه ازت نگیرن باید روزی 100 بار ازشون تشکر میکردی', 13, 0, 1, 0, 0, 70, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (116, N'میتونستی دو برابر سریعتر بخونی', N'مجبور بودی دوبرابر هم تند تر حرف بزنی', 1, 4, 9, 0, 0, 70, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (117, N'میتونستی یه کار خیلی خلاف انجام بدی', N'هیچکس هم متوجه نمیشد', 1, 7, 10, 2, 0, 80, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (118, N'دیگه لازم نبود هر شب بخوابی', N'مثل خرسها سالی یه بار به خواب زمستونی میرفتی', 1, 5, 8, 1, 0, 70, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (119, N'مذهبی که داری تو دنیا همه گیر میشد', N'برای اینکه همه گیر بشه باید تا آخر عمرت ملا میشدی', 1, 4, 8, 1, 0, 70, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (120, N'جای یکی از خواننده‌های معروف بشی', N'باید بین شهرام شپره و شماعی زاده یکی رو انتخاب می‌کردی', 13, 0, 0, 0, 0, 60, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (121, N'یه شهر دریایی داشتی', N'دیگه نمی‌تونستی ازش خارج بشی', 11, 0, 0, 0, 0, 70, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (122, N'می‌تونستی آب دریا رو دوغ کنی', N'به جای آب باید دوغ می‌خوردی', 1, 0, 0, 0, 0, 70, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (123, N'بهترین دوست بیل گیتس می‌شدی', N'بهترین دوست خودت رو از دست می‌دادی', 11, 0, 0, 0, 0, 70, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (124, N'می‌تونستی از حزب رقیبت تو انتخابات شرکت کنی و رای بیاری', N'مردم دیگه بعدش قبولت نداشتن', 6, 0, 0, 0, 0, 80, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (125, N'خوش اخلاق‌ترین همسر دنیا رو داشتی', N'قدش نیم متر کوتاه تر از خودت بود', 11, 0, 0, 0, 0, 80, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (126, N'همه لباسات مارک بودن و لوکس', N'نباید دیگه شورت پات می‌کردی', 13, 0, 0, 0, 0, 70, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (127, N'هر چیزی که بهش فکر می‌کردی اتفاق میفتاد', N'هر کار بدی که می‌شد همه از چشم تو میدیدن', 11, 0, 0, 0, 0, 80, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (128, N'برنده یک سفر دو نفره به هر کجا که دلت می‌خواست می‌شدی و همه هزینه‌هاش از قبل برای 2 ماه پرداخت شده بود', N'بعدش برای 10 سال نمی‌تونستی کشورت رو ترک کنی', 11, 0, 0, 0, 0, 80, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (129, N'می‌تونستی رهبر کره شمالی باشی', N'همونطور که الان اداره میشه باید حکومت می‌کردی', 11, 0, 0, 0, 0, 80, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (130, N'آخرین نفری رو که ماچ کردی دیوونه وار عاشقت می‌شد و دیگه تا آخر عمر ولت نمی‌کرد', N'اگر ظرف 24 ساعت دیگه مجدد ماچش نکنی تا آخر عمر تنها می‌موندی', 11, 0, 0, 0, 0, 80, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (131, N'100 میلیون تومن بهت می‌دادن', N'تا آخر عمر دیگه نیابد هیچ فیلمی می‌دیدی', 11, 0, 0, 0, 0, 90, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (132, N'بال داشتی و می‌تونستی پرواز کنی', N'طول هر بالت 2 متر بود ', 14, 0, 0, 0, 0, 60, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (133, N'دو برابر با هوش‌تر می‌شدی', N'دیگه به زیبایی قبل نبودی', 11, 0, 0, 0, 0, 60, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (134, N'زمانی که حضرت نوح خواست کشتی بسازه اونجا بودی', N'یکی از اونایی بودی که مسخره می‌کردی', 14, 0, 0, 0, 0, 80, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (135, N'هر روز 100 هزار تومن روی زمین پیدا می‌کردی', N'هر موقع می‌خواستی بر داری لیز می‌خوردی و زمین میفتادی', 13, 0, 0, 0, 0, 70, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (136, N'می‌تونستی به هر کجای دنیا که بخوای تله پورت بشی', N'هر موقع اینکار رو می‌کردی توی مقصد یه نفر دیگه هم همراهت ظاهر می‌شد', 14, 0, 0, 0, 0, 70, CAST(0x0000A80200000000 AS DateTime), CAST(0x0000A80200000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (137, N'می‌تونستی هر کسی که مریضه رو خوب کنی', N'باید پیشش بمونی و ترکش نکنی مگر نه دوباره مریض میشه', 11, 0, 0, 0, 0, 80, CAST(0x0000A80200000000 AS DateTime), CAST(0x0000A80200000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (138, N'اسم و سن و مشخصات هر کی رو می‌دیدی بدونی', N'هیچکس اسم و مشخصات تو رو به یاد نمیاورد', 11, 0, 0, 0, 0, 70, CAST(0x0000A80200000000 AS DateTime), CAST(0x0000A80200000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (139, N'با همسر رویاهات عروسی می‌کردی', N'هیچوقت از شغلت راضی نبودی', 11, 0, 0, 0, 0, 95, CAST(0x0000A80200000000 AS DateTime), CAST(0x0000A80200000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (140, N' 100 سال بیشتر عمر می‌کردی اونم مثل یه جوون 25 ساله', N'موقع مرگ زنده زنده می‌سوختی', 11, 0, 0, 0, 0, 80, CAST(0x0000A80200000000 AS DateTime), CAST(0x0000A80200000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (141, N'توی زندگی مشترک همسرت  لذت بیشتری از وقایع می‌برد', N' تو نصف اون از زندگی با اون لذت می‌بردی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (142, N'می‌تونستی هر کسی رو برای هر کاری قانع کنی تا انجامش بده', N'هر کسی هم می‌تونست تو رو برای انجام هر کاری قانع کنه', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (143, N'هر چیزی رو که دوست داشتی بتونی بخوری', N'فقط توی چین این اجازه رو داشتی', 13, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (144, N'پلاستیک مزه شکلات بده، کاغذ مزه سیب زمینی بده و بقیه اشیا خوراکی باشن', N'غذاهای عادی دیگه سمی بودن', 11, 0, 0, 0, 0, 60, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (145, N'خیلی مشهور می‌شدی', N'نصف دندونات می‌ریخت', 13, 0, 0, 0, 0, 60, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (146, N'قدرتمندترین انسان روی زمین می‌شدی', N'توان جنسی دیگه نداشتی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (147, N'قهرمان ملی می‌شدی و خیلی از خیابون‌ها و اماکن رو به اسم تو میذاشتن', N'توی 40 سالگی می‌مردی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (148, N'توی 1000 سال دیگه زندگی کنی', N'تا اون موقع باید منجمد می‌شدی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (149, N'باد معدت بوی شکلات می‌داد', N'ولی اگه کسی 2 بار ازش تنفس عمیق می‌کرد مسموم میشد', 10, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (150, N'روی سرت یه سیب میذاشتن و با شمشیر سیب رو از وسط نصف میکردن', N'اگر اشتباه می‌کردن و  تو را بجاش نصف می‌کردن 1 میلیارد به خانوادت می‌دادن', 11, 0, 0, 0, 0, 60, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (151, N'هر موقعی که دلت می‌خواست می‌تونستی نا مرئی بشی', N'هر موقع گشنه می‌شدی اون جایی که نباید دیده می‌شد مرئی می‌شد', 10, 0, 0, 0, 0, 80, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (152, N'موقعی که بقیه خوابن بتونی ببینی چی خواب می‌بینن', N'بقیه هم می‌تونستن ببین چی خواب می‌بینی موقعی که خوابی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (153, N'توی یه فیلم هالیوودی بازی کنی و 1 میلیارد بگیری', N'اون فیلم به خاطر بازی داغون تو بدترین فیلم تاریخ هالیوود می‌شد', 13, 0, 0, 0, 0, 80, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (154, N'نشون بدی که این بازی رو دوست داری و ازش خوشت اومده', N'برای این کار پیج ایستاگرام ما رو ... می‌کردی ما هم 10 تا سکه بهت می‌دادیم', 1, 0, 0, 0, 0, 60, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (155, N'همه بهت اطمینان 100 درصد داشتن', N'نمی‌تونستی بهشون حقیقت رو بگی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (156, N'شنوایی فوق العاده‌ای داشتی', N'هر شب یه صداهایی رو می‌شنیدی که نباید می‌شنیدی', 14, 0, 0, 0, 0, 90, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (157, N'نیمه گمشدت رو پیدا می‌کردی', N'برای اینکه باهاش ازدواج کنی باید 5 سال صبر می‌کردی تا از زندان در بیاد', 11, 0, 0, 0, 0, 80, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (158, N'همیشه آخرین پرچمدار تلفن هوشمند اندرویدی رو داشتی', N'دیگه هیچ وقت نمی‌تونستی از اپل استفاده کنی', 11, 0, 0, 0, 0, 80, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (159, N'پوکمون واقعی بود', N'بقیه حیوونا خیالی بودن', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (160, N'خدا بهت امر می‌کرد هر کی رو که بهش اعتقاد نداره بکشی', N'بهشت رفتنت قطعی می‌شد', 11, 0, 0, 0, 0, 80, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (161, N'همیشه تو زندگی خوشحال بودی', N'نمی‌تونستی بقیه رو تو خوشحالیت سهیم کنی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (162, N'می‌تونستی زمان رو متوقف کنی', N'هر موقع که زمان متوقف می‌شد خودت رو خیس می‌کردی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (163, N'می‌تونستی ذهن مردم رو بخونی', N'هر موقع که داشتی اینکار رو می‌کردی ول می‌دادی و تا موقعی که ذهن خوندنت ادامه داشت طول می‌کشید', 10, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (164, N'تا آخر عمر اینترنت رایگان داشتی', N'مجبور بودی از اینترنت اکسپلولر 6 به عنوان مرورگر استفاده کنی', 11, 0, 0, 0, 0, 80, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (165, N' که دوست من با دوست تو دوست بشه', N'دوست تو که دوست داره با دوست من دوست بشه 10 تا سکه بگیره', 8, 0, 0, 0, 0, 70, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (166, N'یه اسکنر سه بعدی داشتی که اشیا رو با دقت تمام چاپ می‌کرد', N'اگه باهاش پول چاپ می‌کردی دستگاه می‌سوخت', 11, 0, 0, 0, 0, 60, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (167, N'توی سریال مورد علاقت بازی کنی', N'نمی‌تونستی اون سریال رو ببینی', 12, 0, 0, 0, 0, 70, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (168, N'به شادی ابدی می‌رسیدی', N'دیگه زنده نبودی', 11, 0, 0, 0, 0, 80, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (169, N'تا آخر عمر تریاک رایگان بهت می‌دادن', N'هر روز نعشه بودی', 8, 0, 0, 0, 0, 70, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (170, N'بهت یک میلیارد می‌دادن', N'اگه دروغ می‌گفتی با سودش ازت پس می‌گرفتن', 8, 0, 0, 0, 0, 80, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (171, N'یک میلیارد بهت بدن', N'از بیت المال و حق و حقوق بقیه بود', 8, 0, 0, 0, 0, 80, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (172, N'می‌تونستی روی آب راه بری', N'نمی‌تونستی شنا کنی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 1, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (173, N'حافظه فوق العاده‌ای داشتی', N'فقط اسم بقیه رو فراموش می‌کردی', 11, 0, 0, 0, 0, 60, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (174, N'می‌تونستی یک نفر رو برای 5 سال به عنوان نوکرخودت انتخاب کنی', N'بعد از 5 سال تو هم باید همون اندازه نوکریش رو بکنی', 11, 0, 0, 0, 0, 60, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (175, N'همه مخارجت تا آخر عمر پرداخت می‌شد', N'باید تو خیابون زندگی می‌کردی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (176, N'حقوقت چند برابر می‌شد', N'باید هر چی از قبل بیشتر می‌گیری رو بدی به آسایشگاه', 8, 0, 0, 0, 0, 70, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID]) VALUES (177, N'بهترین فیلم تاریخ سینما رو بسازی', N'ساختش 20 سال طول می‌کشید', 12, 0, 0, 0, 0, 80, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[QuestionBoost] ON 

INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (1, N'عادی', N'عادی', 0, N'mine', N'#fffff', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (3, N'متوسط', N'متوسط', 60, N'data/images/8.png', N'#ffee32', CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A72300000000 AS DateTime))
INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (4, N'حرفه ای', N'حرفه ای', 70, N'Data/images/9.png', N'#ff3e55', CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A72300000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[QuestionBoost] OFF
SET IDENTITY_INSERT [dbo].[ReportType] ON 

INSERT [dbo].[ReportType] ([ID], [Name], [Description]) VALUES (1, N'خلاف شرع', N'بد بد بد')
INSERT [dbo].[ReportType] ([ID], [Name], [Description]) VALUES (2, N'تکراری', N'تکراری')
INSERT [dbo].[ReportType] ([ID], [Name], [Description]) VALUES (3, N'حال به هم زن', N'چرت و پرت گویی')
SET IDENTITY_INSERT [dbo].[ReportType] OFF
SET IDENTITY_INSERT [dbo].[SelectedAvatar] ON 

INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1105, 1158, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1107, 1160, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1109, 1162, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1117, 1170, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1120, 1173, 7)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2124, 2178, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2125, 2179, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2126, 2180, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2127, 2181, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2128, 2182, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2129, 2183, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2130, 2184, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2131, 2185, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2132, 2186, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2133, 2187, 6)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2134, 2188, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2135, 2189, 7)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2136, 2190, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2137, 2191, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2138, 2192, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2139, 2193, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2140, 2194, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2141, 2195, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2142, 2196, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2143, 2197, 6)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2144, 2198, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2145, 2199, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2146, 2200, 6)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2147, 2201, 7)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2148, 2202, 3)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2149, 2203, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2150, 2204, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2151, 2205, 6)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2152, 2206, 8)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2153, 2207, 7)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2154, 2208, 9)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2155, 2209, 5)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2156, 2210, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2157, 2211, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2158, 2212, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2159, 2213, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2160, 2214, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2161, 2215, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2162, 2216, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2163, 2217, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2164, 2218, 1)
SET IDENTITY_INSERT [dbo].[SelectedAvatar] OFF
SET IDENTITY_INSERT [dbo].[SelectedCategory] ON 

INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1135, 1158, 7)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1137, 1160, 14)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1139, 1162, 10)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1147, 1170, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1150, 1173, 6)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2154, 2178, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2155, 2179, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2156, 2180, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2157, 2181, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2158, 2182, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2159, 2183, 11)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2160, 2184, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2161, 2185, 2)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2162, 2186, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2163, 2187, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2164, 2188, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2165, 2189, 11)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2166, 2190, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2167, 2191, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2168, 2192, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2169, 2193, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2170, 2194, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2171, 2195, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2172, 2196, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2173, 2197, 6)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2174, 2198, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2175, 2199, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2176, 2200, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2177, 2201, 14)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2178, 2202, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2179, 2203, 2)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2180, 2204, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2181, 2205, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2182, 2206, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2183, 2207, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2184, 2208, 6)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2185, 2209, 6)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2186, 2210, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2187, 2211, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2188, 2212, 6)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2189, 2213, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2190, 2214, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2191, 2215, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2192, 2216, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2193, 2217, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2194, 2218, 1)
SET IDENTITY_INSERT [dbo].[SelectedCategory] OFF
SET IDENTITY_INSERT [dbo].[SelectedTheme] ON 

INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1135, 1158, 6)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1137, 1160, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1139, 1162, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1147, 1170, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1150, 1173, 6)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2154, 2178, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2155, 2179, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2156, 2180, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2157, 2181, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2158, 2182, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2159, 2183, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2160, 2184, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2161, 2185, 6)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2162, 2186, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2163, 2187, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2164, 2188, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2165, 2189, 5)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2166, 2190, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2167, 2191, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2168, 2192, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2169, 2193, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2170, 2194, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2171, 2195, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2172, 2196, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2173, 2197, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2174, 2198, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2175, 2199, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2176, 2200, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2177, 2201, 6)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2178, 2202, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2179, 2203, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2180, 2204, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2181, 2205, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2182, 2206, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2183, 2207, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2184, 2208, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2185, 2209, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2186, 2210, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2187, 2211, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2188, 2212, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2189, 2213, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2190, 2214, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2191, 2215, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2192, 2216, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2193, 2217, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2194, 2218, 6)
SET IDENTITY_INSERT [dbo].[SelectedTheme] OFF
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([ID], [Name], [Description], [MarketID], [Price], [SKU], [Coin], [IsAccessibleInAllStores], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [DiscountAmount]) VALUES (2, N'بسته 100', N'100 تومنی', 2, 100, N'seke100', 1000, 0, N'Data/Images/1.png', N'#c33d3d', CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6EF00000000 AS DateTime), 0)
INSERT [dbo].[Store] ([ID], [Name], [Description], [MarketID], [Price], [SKU], [Coin], [IsAccessibleInAllStores], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [DiscountAmount]) VALUES (4, N'بسته 200', N'200 تومنی', 2, 200, N'seke200', 200, 0, N'Data/Images/2.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Store] ([ID], [Name], [Description], [MarketID], [Price], [SKU], [Coin], [IsAccessibleInAllStores], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [DiscountAmount]) VALUES (5, N'بسته 300', N'300 تومنی', 2, 300, N'seke300', 300, 0, N'Data/Images/3.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Store] ([ID], [Name], [Description], [MarketID], [Price], [SKU], [Coin], [IsAccessibleInAllStores], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [DiscountAmount]) VALUES (7, N'بسته 400', N'400 تومنی', 2, 400, N'seke400', 400, 0, N'Data/Images/3.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Store] OFF
SET IDENTITY_INSERT [dbo].[TagState] ON 

INSERT [dbo].[TagState] ([ID], [Name]) VALUES (1, N'Regular')
INSERT [dbo].[TagState] ([ID], [Name]) VALUES (2, N'NewItem')
INSERT [dbo].[TagState] ([ID], [Name]) VALUES (3, N'OffItem')
SET IDENTITY_INSERT [dbo].[TagState] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (1158, N'b3bd4e43-c5af-472c-a221-ae5fbee7a01c', N'Jeb', 1, 115, 6, 6, 1, 1, CAST(0x0000A751017CD3EF AS DateTime), CAST(0x0000A751016CEF35 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (1160, N'04108948-40aa-4118-acb1-728184b1fbaa', N'keyvan', 1, 105, 199, 59, 5, 1, CAST(0x0000A73A00D240BB AS DateTime), CAST(0x000007DC00000000 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (1162, N'3de29d61-46c7-4714-9a24-c18ff59b99d7', N'محمدرضا', 1, 155, 16, 16, 1, 1, CAST(0x0000A73A015602AA AS DateTime), CAST(0x000007DC00000000 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (1170, N'9a264610-453a-4a94-ba02-3ec5d74ae602', N' کیوان', 1, 45, 29, 9, 2, 1, CAST(0x0000A75E0001BF32 AS DateTime), CAST(0x0000A75D0145596B AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (1173, N'5eefd408-6cd8-434c-8704-00924011a1cc', N'JebReal', 1, 3450, 70, 20, 3, 1, CAST(0x0000A76E00ACDB9D AS DateTime), CAST(0x0000A76E00AB35C6 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2177, N'empty', N'مدیر', 1, 100, 13, 13, 1, 1, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2178, N'afe785b1-7c4f-4e8b-982c-ccbba5dc06e7', N'Guest_5969030', 1, 218, 25, 5, 2, 1, CAST(0x0000A765011F9AF9 AS DateTime), CAST(0x0000A75E0116F20F AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2179, N'76f6c8bf-0759-443a-a7e0-a47977f263d1', N'keyvanOfficial', 1, 10180, 8, 8, 1, 1, CAST(0x0000A75D012C733B AS DateTime), CAST(0x0000A75D012BA24F AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2180, N'd3e9c138-9853-4919-86f8-0c181a3efcdd', N'Guest_2102810', 1, 310, 2, 2, 1, 1, CAST(0x0000A75900CA29DF AS DateTime), CAST(0x0000A75900C80498 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2181, N'4969a35a-edd1-4500-b6d6-70b70851ed1c', N'designer92', 1, 155, 29, 9, 2, 1, CAST(0x0000A759010449C9 AS DateTime), CAST(0x0000A7590102DFB2 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2182, N'6070c6e6-6108-4d2e-8b78-598e1879adf3', N'Guest_9094190', 1, 210, 15, 15, 1, 1, CAST(0x0000A758011FDE58 AS DateTime), CAST(0x0000A75800B64921 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2183, N'7aa7e99c-dbb3-41b0-ab91-bf71584c412e', N'Guest_7112246', 1, 193, 33, 13, 2, 1, CAST(0x0000A75C00EC3D4F AS DateTime), CAST(0x0000A75C00EB9AA8 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2184, N'e020988f-994c-4571-b6ff-6217b3ee9ffc', N'zrostami', 1, 143, 26, 6, 2, 1, CAST(0x0000A760011DAB19 AS DateTime), CAST(0x0000A75B00F045DF AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2185, N'a77d9489-6891-4994-9c77-d0d0a1c5cfb6', N'Guest_6208689', 1, 1440, 4, 4, 1, 1, CAST(0x0000A75A010104D2 AS DateTime), CAST(0x0000A75A01000ECD AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2186, N'4f1d4a2b-21f0-4599-a8f6-6229772820f4', N'sana1374', 1, 200, 1, 1, 1, 1, CAST(0x0000A75B012BFF85 AS DateTime), CAST(0x0000A75B012BEBAC AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2187, N'1d239eea-cf68-4a1d-9c54-79d320527527', N'Guest_0677772', 1, 210, 3, 3, 1, 1, CAST(0x0000A75E00BBDC48 AS DateTime), CAST(0x0000A75E0098D3CB AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2188, N'b7ac77f6-e55e-4318-bf18-1db332e80e0f', N'Guest_4243176', 1, 200, 0, 0, 1, 1, CAST(0x0000A75E00D532B7 AS DateTime), CAST(0x0000A75E00D4F7C1 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2189, N'04be959d-13f3-4a53-9920-07f0251c4558', N'Guest_2189', 1, 105, 4, 4, 1, 1, CAST(0x0000A75E0118A276 AS DateTime), CAST(0x0000A75E00E87B6E AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2190, N'09e81a77-2a8f-4e0c-bc85-33fcf3be25d7', N'Guest_2190', 1, 200, 2, 2, 1, 1, CAST(0x0000A75E00F8F481 AS DateTime), CAST(0x0000A75E00F8BF3D AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2191, N'cf974a75-d364-40b8-a101-6eee762a8c9e', N'Guest_2191', 1, 200, 0, 0, 1, 1, CAST(0x0000A75E01051405 AS DateTime), CAST(0x0000A75E01051405 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2192, N'8b21b4ff-c66e-4c5d-915b-1cf701fc2916', N'Guest_2192', 1, 200, 0, 0, 1, 1, CAST(0x0000A75E01066674 AS DateTime), CAST(0x0000A75E01065209 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2193, N'38dc4d3e-60ec-428d-9e0e-d2dc4391d2a3', N'Guest_2193', 1, 200, 0, 0, 1, 1, CAST(0x0000A75E0106B2D8 AS DateTime), CAST(0x0000A75E0106B2D8 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2194, N'477b9a79-5024-4f96-ab19-4264f42baafc', N'Guest_2194', 1, 200, 0, 0, 1, 1, CAST(0x0000A75E011605EC AS DateTime), CAST(0x0000A75E011605EC AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2195, N'8b6959ce-bf96-4cae-9b20-bfaffc4747fe', N'Guest_2195', 1, 200, 0, 0, 1, 1, CAST(0x0000A75E0118129D AS DateTime), CAST(0x0000A75E0117CDB1 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2196, N'd9d7ef44-0cf2-4b09-b312-f67459908f1b', N'Guest_2196', 1, 200, 3, 3, 1, 1, CAST(0x0000A75E01183500 AS DateTime), CAST(0x0000A75E01183500 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2197, N'a147c5c3-c9a4-4880-8668-d0bdad53b89e', N'Guest_2197', 1, 170, 22, 2, 2, 1, CAST(0x0000A76200FB1CD0 AS DateTime), CAST(0x0000A76200FACAED AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2198, N'6e8dac8e-a0c5-4a5a-9c03-a410b9b5cc68', N'Guest_2198', 1, 200, 0, 0, 1, 1, CAST(0x0000A75E01192C52 AS DateTime), CAST(0x0000A75E01192C52 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2199, N'0d6d1f77-1610-4d4a-ab15-bc7304d489ef', N'Guest_2199', 1, 200, 0, 0, 1, 1, CAST(0x0000A75E01195382 AS DateTime), CAST(0x0000A75E01195382 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2200, N'438d7ab3-b040-4ea6-83fa-840016b6b4fa', N'Guest_2200', 1, 495, 41, 21, 2, 1, CAST(0x0000A76E00AD8D72 AS DateTime), CAST(0x0000A76D01868918 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2201, N'25a3335d-e409-4d5d-a102-4f845bca6fb4', N'Guest_2201', 1, 15, 3, 3, 1, 1, CAST(0x0000A765017829DF AS DateTime), CAST(0x0000A76000CEF5EE AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2202, N'0215b03c-ec78-45bf-9eb0-2d6a80158363', N'Guest_2202', 1, 225, 4, 4, 1, 1, CAST(0x0000A76501133E3E AS DateTime), CAST(0x0000A765010F2D53 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2203, N'5bc28c8e-f497-4f96-b8bf-841ff461fc05', N'Guest_2203', 1, 190, 5, 5, 1, 1, CAST(0x0000A76301715EF1 AS DateTime), CAST(0x0000A763015B7944 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2204, N'512df3b4-f6c9-4208-94c7-3dfec39dbebe', N'Guest_2204', 1, 200, 0, 0, 1, 1, CAST(0x0000A76400E07F5E AS DateTime), CAST(0x0000A76400DEA033 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2205, N'e60b5fbd-a9b8-4956-b08c-c23989ef89cb', N'Guest_2205', 1, 180, 1, 1, 1, 1, CAST(0x0000A765013970D8 AS DateTime), CAST(0x0000A76501341096 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2206, N'1974704a-2add-46b9-948d-d382953f9f12', N'Guest_2206', 1, 180, 0, 0, 1, 1, CAST(0x0000A765011C2655 AS DateTime), CAST(0x0000A765011B82CD AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2207, N'd4d3f234-8107-4480-a600-439b06584af4', N'Guest_2207', 1, 180, 2, 2, 1, 1, CAST(0x0000A765011D3986 AS DateTime), CAST(0x0000A765011BDA12 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2208, N'da0a24e1-ed88-4461-b339-dd74c6eaa446', N'Guest_2208', 1, 170, 5, 5, 1, 1, CAST(0x0000A76E011A5880 AS DateTime), CAST(0x0000A76E010DB85F AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2209, N'e116a997-359f-4b99-b32d-886a5813848f', N'Guest_2209', 1, 75, 6, 6, 1, 1, CAST(0x0000A76B0137BFA6 AS DateTime), CAST(0x0000A76B011FF494 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2210, N'ba27e5de-c274-4a4a-8ce7-700354855993', N'Guest_2210', 1, 200, 0, 0, 1, 1, CAST(0x0000A7660100F744 AS DateTime), CAST(0x0000A76501201A6A AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2211, N'97380d07-a9d7-45d2-870b-dd02cabeefff', N'Guest_2211', 1, 200, 0, 0, 1, 1, CAST(0x0000A7650140B8B7 AS DateTime), CAST(0x0000A7650140AAF7 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2212, N'40b47470-9d10-4ce4-bbfa-be6988d2d0c9', N'KivKiv', 1, 1380, 13, 13, 1, 1, CAST(0x0000A76600C18345 AS DateTime), CAST(0x0000A76600C09609 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2213, N'57df3536-9ed0-41ed-b984-86fd97279c19', N'Guest_2213', 1, 320, 19, 19, 1, 1, CAST(0x0000A76600BCE227 AS DateTime), CAST(0x0000A7650178AD16 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2214, N'd85f3af5-0490-46a5-8371-1aed07339400', N'Guest_2214', 1, 200, 2, 2, 1, 1, CAST(0x0000A768018B77B4 AS DateTime), CAST(0x0000A768018B77B4 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2215, N'95799465-426d-4592-b036-2631427c8529', N'Guest_2215', 1, 200, 0, 0, 1, 1, CAST(0x0000A76A011CAD1E AS DateTime), CAST(0x0000A76A011CAD1E AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2216, N'09f0637a-b5e3-4daf-990c-48e5be16f137', N'Guest_2216', 1, 200, 0, 0, 1, 1, CAST(0x0000A76A012C4D07 AS DateTime), CAST(0x0000A76A0124B620 AS DateTime), 0)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2217, N'f3e58f46-92df-4fa6-a76e-ca9b8e334c54', N'Guest_2217', 1, 300, 1, 1, 1, 1, CAST(0x0000A76E00A9BBD3 AS DateTime), CAST(0x0000A76E00A978B8 AS DateTime), NULL)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalStars], [Score], [LevelProgress], [CurrentLevelID], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [Rank]) VALUES (2218, N'146b9671-d6c0-4ae7-b552-22192e496929', N'Guest_2218', 1, 300, 1, 1, 1, 1, CAST(0x0000A76F00ABF093 AS DateTime), CAST(0x0000A76F0068A91C AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserAvatar] ON 

INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (1, N'Data/Images/avatar/cinema1.png', 1, N'سینمایی', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (2, N'Data/Images/avatar/politic4.png', 30, N'کره شمالی', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (3, N'Data/Images/avatar/politic3.png', 30, N'آلمان', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (4, N'Data/Images/avatar/politic2.png', 40, N'امریکا', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (5, N'Data/Images/avatar/politic1.png', 50, N'فرانسه', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (6, N'Data/Images/avatar/girl1.png', 20, N'دختر 1', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (7, N'Data/Images/avatar/girl2.png', 20, N'دختر 2', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (8, N'Data/Images/avatar/girl3.png', 20, N'دختر 3', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (9, N'Data/Images/avatar/girl4.png', 20, N'دختر 4', 0, 1)
SET IDENTITY_INSERT [dbo].[UserAvatar] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1143, 1158, N'ja7ad.borhani@gmail.com', N'123456789', NULL, NULL, 0, 0, 1, CAST(0x0000A73901747A4C AS DateTime), CAST(0x0000A73A000AFEE8 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1145, 1160, N'keivan.moazami@gmail.com', N'mo', NULL, NULL, 0, 0, 1, CAST(0x0000A73A00D240BB AS DateTime), CAST(0x0000A73A00DAD167 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1147, 1162, N'mohammad134613@yahoo.com', N'mo1811360', NULL, NULL, 0, 0, 1, CAST(0x0000A73A0156031B AS DateTime), CAST(0x0000A73A0157D6A1 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1155, 1170, N'keivan.moazami@hotmail.com', N'mo1811360', NULL, NULL, 0, 0, 1, CAST(0x0000A74600DBC3DA AS DateTime), CAST(0x0000A7530164DDEA AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1158, 1173, N'ja7adborhani@gmail.com', N'123', NULL, NULL, 0, 0, 1, CAST(0x0000A74A011F3ED7 AS DateTime), CAST(0x0000A75001502B99 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2162, 2178, NULL, N'636277859637375293', NULL, NULL, 0, 0, 2, CAST(0x0000A7550117FC41 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2163, 2179, N'ke.mo@yahoo.com', N'mo1811360', NULL, NULL, 0, 0, 1, CAST(0x0000A75600C11242 AS DateTime), CAST(0x0000A75801253661 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2164, 2180, NULL, N'636278682496634043', NULL, NULL, 0, 0, 2, CAST(0x0000A75601052713 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2165, 2181, N'fmn2010@gmail.com', N'123654', NULL, NULL, 0, 0, 1, CAST(0x0000A757013A81A9 AS DateTime), CAST(0x0000A75900CB8C5D AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2166, 2182, NULL, N'636280238209250413', NULL, NULL, 0, 0, 2, CAST(0x0000A75800B64926 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2167, 2183, NULL, N'636280588467737239', NULL, NULL, 0, 0, 2, CAST(0x0000A75801569F10 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2168, 2184, N'zristam2222@gmail.com', N'farhad1369', NULL, NULL, 0, 0, 1, CAST(0x0000A75900DE2C93 AS DateTime), CAST(0x0000A75B00EC18BC AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2169, 2185, NULL, N'636282077446990488', NULL, NULL, 0, 0, 2, CAST(0x0000A75A00E934D2 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2170, 2186, N'hosna.rafiei@gmail.com', N'747474', NULL, NULL, 0, 0, 1, CAST(0x0000A75B012BEC13 AS DateTime), CAST(0x0000A75B012CB0FC AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2171, 2187, NULL, N'636284752160834041', NULL, NULL, 0, 0, 2, CAST(0x0000A75D010F11D9 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2172, 2188, NULL, N'636284818004399427', NULL, NULL, 0, 0, 2, CAST(0x0000A75D012D35E4 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2173, 2189, NULL, N'636285435542305786', NULL, NULL, 0, 0, 2, CAST(0x0000A75E00BC639D AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2174, 2190, NULL, N'636285560512549291', NULL, NULL, 0, 0, 2, CAST(0x0000A75E00F59891 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2175, 2191, NULL, N'636285594334021559', NULL, NULL, 0, 0, 2, CAST(0x0000A75E01051405 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2176, 2192, NULL, N'636285596699495127', NULL, NULL, 0, 0, 2, CAST(0x0000A75E01062939 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2177, 2193, NULL, N'636285597874029044', NULL, NULL, 0, 0, 2, CAST(0x0000A75E0106B2DD AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2178, 2194, NULL, N'636285631351437583', NULL, NULL, 0, 0, 2, CAST(0x0000A75E011605FF AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2179, 2195, NULL, N'636285635240039660', NULL, NULL, 0, 0, 2, CAST(0x0000A75E0117CDB1 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2180, 2196, NULL, N'636285636121603854', NULL, NULL, 0, 0, 2, CAST(0x0000A75E01183500 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2181, 2197, NULL, N'636285636519260818', NULL, NULL, 0, 0, 2, CAST(0x0000A75E0118639A AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2182, 2198, NULL, N'636285638232076550', NULL, NULL, 0, 0, 2, CAST(0x0000A75E01192C52 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2183, 2199, NULL, N'636285638566451659', NULL, NULL, 0, 0, 2, CAST(0x0000A75E01195382 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2184, 2200, NULL, N'636285640522862285', NULL, NULL, 0, 0, 2, CAST(0x0000A75E011A38C6 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2185, 2201, NULL, N'636286610134129096', NULL, NULL, 0, 0, 2, CAST(0x0000A75F014A9118 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2186, 2202, NULL, N'636289048490639676', NULL, NULL, 0, 0, 2, CAST(0x0000A76201043BFF AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2187, 2203, NULL, N'636290101801757911', NULL, NULL, 0, 0, 2, CAST(0x0000A763015AE4E5 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2188, 2204, NULL, N'636290691684042441', NULL, NULL, 0, 0, 2, CAST(0x0000A76400DD69B9 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2189, 2205, NULL, N'636291675655318611', NULL, NULL, 0, 0, 2, CAST(0x0000A765011454DC AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2190, 2206, NULL, N'636291675668287332', NULL, NULL, 0, 0, 2, CAST(0x0000A76501145661 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2191, 2207, NULL, N'636291675678443588', NULL, NULL, 0, 0, 2, CAST(0x0000A76501145791 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2192, 2208, NULL, N'636291675687349994', NULL, NULL, 0, 0, 2, CAST(0x0000A7650114589D AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2193, 2209, NULL, N'636291675889069160', NULL, NULL, 0, 0, 2, CAST(0x0000A76501147040 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2194, 2210, NULL, N'636291701371149409', NULL, NULL, 0, 0, 2, CAST(0x0000A76501201A6F AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2195, 2211, NULL, N'636291772513632549', NULL, NULL, 0, 0, 2, CAST(0x0000A7650140AB71 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2196, 2212, N'JebJeb@gmail.com', N'123123', NULL, NULL, 0, 0, 1, CAST(0x0000A7650145242F AS DateTime), CAST(0x0000A76600C0BC78 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2197, 2213, NULL, N'636291894861683976', NULL, NULL, 0, 0, 2, CAST(0x0000A7650178AD1A AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2198, 2214, NULL, N'636294527912291583', NULL, NULL, 0, 0, 2, CAST(0x0000A768018B77B9 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2199, 2215, NULL, N'636296013890347336', NULL, NULL, 0, 0, 2, CAST(0x0000A76A011CADC7 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2200, 2216, NULL, N'636296031437881583', NULL, NULL, 0, 0, 2, CAST(0x0000A76A0124B620 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2201, 2217, NULL, N'636299216739377815', NULL, NULL, 0, 0, 2, CAST(0x0000A76E00A8CBA5 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2202, 2218, NULL, N'636299227951118366', NULL, NULL, 0, 0, 2, CAST(0x0000A76E00ADED86 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([ID], [Name], [Description]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[UserType] ([ID], [Name], [Description]) VALUES (2, N'client', N'client')
INSERT [dbo].[UserType] ([ID], [Name], [Description]) VALUES (3, N'QuestionProvider', N'QuestionProvider')
SET IDENTITY_INSERT [dbo].[UserType] OFF
SET IDENTITY_INSERT [dbo].[WatchAdProvider] ON 

INSERT [dbo].[WatchAdProvider] ([ID], [ProviderName], [ProviderValidationLink], [IsActive]) VALUES (1, N'TapSell', N'Link', 1)
SET IDENTITY_INSERT [dbo].[WatchAdProvider] OFF
SET IDENTITY_INSERT [dbo].[WatchedAd] ON 

INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (1, 2212, 1, N'dade56a9-d432-4afb-9f30-5bb4ed3e33b9', CAST(0x0000A76501457D85 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (2, 1173, 1, N'7c9e6246-96c4-4e3c-b607-7a70579be9e3', CAST(0x0000A7650177E234 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (3, 1173, 1, N'0303916a-5608-4745-a2fc-75655bd3a8b4', CAST(0x0000A7650178A882 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (4, 1173, 1, N'473c6d99-f8e3-41a1-ae63-fdfbf93f852d', CAST(0x0000A765017E216A AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (5, 1173, 1, N'85c0c678-2cce-4645-9fd8-b6db98cc2230', CAST(0x0000A76501835618 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (6, 2200, 1, N'54c50686-e3af-48d3-a3f0-be02edc82c4b', CAST(0x0000A7650186A074 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (7, 2200, 1, N'cb2a537d-b2c3-4ab7-b59d-9361300619f9', CAST(0x0000A7650186D4D7 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (8, 2200, 1, N'edbd2592-f97a-420c-84e6-faec9471d319', CAST(0x0000A76600005331 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (9, 2212, 1, N'80645bb4-a100-4180-a560-dcdd0062c04d', CAST(0x0000A76600B835FF AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (10, 1173, 1, N'753ebc76-5040-4023-bf49-ae9288a20233', CAST(0x0000A767000FF397 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (11, 1173, 1, N'a5eef8a7-6680-4b20-bab1-a53dd8f07e27', CAST(0x0000A7670124724C AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (12, 1173, 1, N'fb930305-a026-46e7-a89b-98dc70d6ae0b', CAST(0x0000A76B00B80B2F AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (13, 2200, 1, N'8b56b2cc-4d2e-4693-94bb-1ad1a420e81b', CAST(0x0000A76D013B4702 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (14, 2218, 1, N'f507c3bf-151d-41be-a298-b53c0966c128', CAST(0x0000A76E00B0FFA2 AS DateTime))
SET IDENTITY_INSERT [dbo].[WatchedAd] OFF
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
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_WatchAdCoin]  DEFAULT ((5)) FOR [WatchAdCoin]
GO
ALTER TABLE [dbo].[AppTheme] ADD  CONSTRAINT [DF_AppTheme_BackImage]  DEFAULT (N'Data/Images/1.png') FOR [BackImage]
GO
ALTER TABLE [dbo].[AppTheme] ADD  CONSTRAINT [DF_AppTheme_DialogImage]  DEFAULT (N'Data/Images/1.png') FOR [DialogImage]
GO
ALTER TABLE [dbo].[AppTheme] ADD  CONSTRAINT [DF_AppTheme_DiscountAmount]  DEFAULT ((0)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[AppTheme] ADD  CONSTRAINT [DF_AppTheme_IsNew]  DEFAULT ((1)) FOR [TagStateID]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_PrizeCoefficient]  DEFAULT ((1)) FOR [PrizeCoefficient]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_DiscountAmount]  DEFAULT ((0)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_IsNew]  DEFAULT ((1)) FOR [TagStateID]
GO
ALTER TABLE [dbo].[CodeGift] ADD  CONSTRAINT [DF_CodeGift_TotalUserCount]  DEFAULT ((0)) FOR [TotalUserCount]
GO
ALTER TABLE [dbo].[CodeGift] ADD  CONSTRAINT [DF_CodeGift_TotalUserRegistered]  DEFAULT ((0)) FOR [TotalUserRegistered]
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_IsVerified]  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[CreatedQuestions] ADD  CONSTRAINT [DF_CreatedQuestions_Verified]  DEFAULT ((0)) FOR [VerifyStateID]
GO
ALTER TABLE [dbo].[Gift] ADD  CONSTRAINT [DF_Gift_QueryString]  DEFAULT (NULL) FOR [QueryString]
GO
ALTER TABLE [dbo].[Level] ADD  CONSTRAINT [DF_Level_LevelNumber]  DEFAULT ((1)) FOR [LevelNumber]
GO
ALTER TABLE [dbo].[Level] ADD  CONSTRAINT [DF_Level_ScoreCeil]  DEFAULT ((1)) FOR [ScoreCeil]
GO
ALTER TABLE [dbo].[MarketInfo] ADD  CONSTRAINT [DF_MarketInfo_NeedsTokenRequest]  DEFAULT ((1)) FOR [NeedsTokenVerification]
GO
ALTER TABLE [dbo].[MarketInfo] ADD  CONSTRAINT [DF_MarketInfo_Code]  DEFAULT ('CODE') FOR [Code]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_IsFailed]  DEFAULT ((0)) FOR [IsFailed]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_Banned]  DEFAULT ((0)) FOR [Banned]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_MarketID]  DEFAULT ((1)) FOR [MarketID]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_SKU]  DEFAULT ('SKU_1000_Toman') FOR [SKU]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_IsAccessibleInAllStore]  DEFAULT ((0)) FOR [IsAccessibleInAllStores]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_IsInOff]  DEFAULT ((0)) FOR [DiscountAmount]
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
ALTER TABLE [dbo].[UserAvatar] ADD  CONSTRAINT [DF_UserAvatar_DiscountAmount]  DEFAULT ((0)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[UserAvatar] ADD  CONSTRAINT [DF_UserAvatar_IsNew]  DEFAULT ((1)) FOR [TagStateID]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_Password]  DEFAULT (N'Password') FOR [Password]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsVerified]  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsBanned]  DEFAULT ((0)) FOR [IsBanned]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsEdited]  DEFAULT ((2)) FOR [IsEditable]
GO
ALTER TABLE [dbo].[WatchAdProvider] ADD  CONSTRAINT [DF_WatchAdProvider_IsActive]  DEFAULT ((1)) FOR [IsActive]
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
ALTER TABLE [dbo].[AppTheme]  WITH CHECK ADD  CONSTRAINT [FK_AppTheme_TagState] FOREIGN KEY([TagStateID])
REFERENCES [dbo].[TagState] ([ID])
GO
ALTER TABLE [dbo].[AppTheme] CHECK CONSTRAINT [FK_AppTheme_TagState]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_TagState] FOREIGN KEY([TagStateID])
REFERENCES [dbo].[TagState] ([ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_TagState]
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
ALTER TABLE [dbo].[DisplayedNotification]  WITH CHECK ADD  CONSTRAINT [FK_DisplayedNotification_Gift] FOREIGN KEY([NotificationID])
REFERENCES [dbo].[Gift] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DisplayedNotification] CHECK CONSTRAINT [FK_DisplayedNotification_Gift]
GO
ALTER TABLE [dbo].[DisplayedNotification]  WITH CHECK ADD  CONSTRAINT [FK_DisplayedNotification_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DisplayedNotification] CHECK CONSTRAINT [FK_DisplayedNotification_User]
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
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Store] FOREIGN KEY([StoreID])
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
ALTER TABLE [dbo].[PresentedAdvert]  WITH CHECK ADD  CONSTRAINT [FK_PresentedAdvert_AppAdvertisements] FOREIGN KEY([AdvertID])
REFERENCES [dbo].[AppAdvertisements] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PresentedAdvert] CHECK CONSTRAINT [FK_PresentedAdvert_AppAdvertisements]
GO
ALTER TABLE [dbo].[PresentedAdvert]  WITH CHECK ADD  CONSTRAINT [FK_PresentedAdvert_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PresentedAdvert] CHECK CONSTRAINT [FK_PresentedAdvert_User]
GO
ALTER TABLE [dbo].[PriceHistory]  WITH CHECK ADD  CONSTRAINT [FK_PriceList_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PriceHistory] CHECK CONSTRAINT [FK_PriceList_Store]
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
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_MarketInfo] FOREIGN KEY([MarketID])
REFERENCES [dbo].[MarketInfo] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_MarketInfo]
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
ALTER TABLE [dbo].[UserAvatar]  WITH CHECK ADD  CONSTRAINT [FK_UserAvatar_TagState] FOREIGN KEY([TagStateID])
REFERENCES [dbo].[TagState] ([ID])
GO
ALTER TABLE [dbo].[UserAvatar] CHECK CONSTRAINT [FK_UserAvatar_TagState]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_User]
GO
ALTER TABLE [dbo].[WatchedAd]  WITH CHECK ADD  CONSTRAINT [FK_WatchedAd_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WatchedAd] CHECK CONSTRAINT [FK_WatchedAd_User]
GO
ALTER TABLE [dbo].[WatchedAd]  WITH CHECK ADD  CONSTRAINT [FK_WatchedAd_WatchAdProvider] FOREIGN KEY([WatchAdProviderId])
REFERENCES [dbo].[WatchAdProvider] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[WatchedAd] CHECK CONSTRAINT [FK_WatchedAd_WatchAdProvider]
GO
