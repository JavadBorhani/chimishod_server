USE [SocialChimishod]
GO
/****** Object:  Table [dbo].[AchievedCodeGift]    Script Date: 1/9/2018 5:37:59 PM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 1/9/2018 5:38:17 PM ******/
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
	[YesState] [bit] NULL,
	[NoState] [bit] NULL,
	[IsReported] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApplicationState]    Script Date: 1/9/2018 5:38:17 PM ******/
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
	[Question_NoQuestionFoundWhat] [nvarchar](100) NOT NULL,
	[Question_NoQuestionFoundBut] [nvarchar](100) NOT NULL,
	[Question_NoQuestionFoundID] [int] NOT NULL,
	[Question_ServerBurntReturnAmount] [int] NOT NULL,
	[Prize_AnswerXP] [int] NOT NULL,
	[Prize_LikeScoreAmount] [int] NOT NULL,
	[Prize_CreateNewQuestionXP] [int] NOT NULL,
	[Prize_NewQuestionAcceptedXP] [int] NOT NULL,
	[Paging_DefaultPageSize] [int] NOT NULL,
	[Leader_TopNumberToShow] [int] NOT NULL,
	[Comment_DefaultNumberAmount] [int] NOT NULL,
	[Comment_DefaultVerifyState] [bit] NOT NULL,
	[Host_WebSiteNoReplyMail] [varchar](50) NOT NULL,
	[Host_WebSiteNoReplyMailPassword] [varchar](50) NOT NULL,
	[Host_SupportMail] [varchar](50) NOT NULL,
	[Host_SupportMailPassword] [varchar](50) NOT NULL,
	[Host_SmtpServer] [varchar](20) NOT NULL,
	[HostCredentialUserName] [varchar](50) NOT NULL,
	[HostCredentialPassword] [varchar](50) NOT NULL,
	[Store_DefaultReturnAmount] [int] NOT NULL,
	[WatchAdCoin] [int] NOT NULL,
	[SpinWheelFortuneThreshold] [int] NOT NULL,
	[SpinWheelLoopPrice] [int] NOT NULL,
	[Prize_CreateNewQuestionScore] [int] NOT NULL,
	[Prize_NewQuestionAcceptedScore] [int] NOT NULL,
	[Prize_AnswerScoreAmount] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientApplicationState]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientApplicationState](
	[ID] [int] NOT NULL,
	[VersionInfo] [int] NOT NULL,
	[IsMajorVersion] [bit] NOT NULL,
 CONSTRAINT [PK_ClientApplicationState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CodeGift]    Script Date: 1/9/2018 5:38:17 PM ******/
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
/****** Object:  Table [dbo].[ContactUs]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[ID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Message] [nvarchar](400) NOT NULL,
	[Type] [int] NOT NULL,
	[AdminResponse] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HashTag]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HashTag](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HashTag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MarketInfo]    Script Date: 1/9/2018 5:38:17 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 1/9/2018 5:38:17 PM ******/
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
/****** Object:  Table [dbo].[PlatformTypes]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PlatformTypes](
	[ID] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PlatformTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PriceHistory]    Script Date: 1/9/2018 5:38:17 PM ******/
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
/****** Object:  Table [dbo].[Quest]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quest](
	[QuestNumber] [int] NOT NULL,
	[QuestTypes] [int] NOT NULL,
	[QuestTitle] [nvarchar](300) NOT NULL,
	[QuestDescription] [nvarchar](300) NOT NULL,
	[CoinPrize] [int] NOT NULL,
	[CeilProgress] [int] NOT NULL,
	[Mean_Score] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Quest] PRIMARY KEY CLUSTERED 
(
	[QuestNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question]    Script Date: 1/9/2018 5:38:17 PM ******/
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
	[Banned] [bit] NOT NULL,
	[QuestionBoostID] [int] NULL,
	[ActionID] [int] NULL,
	[CommentCount] [int] NOT NULL,
	[RemovedByCreator] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UserID] [int] NULL,
	[HashTagID] [int] NULL,
	[ReportCount] [int] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionAction]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestionAction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ActionNumber] [int] NOT NULL,
	[Coin] [int] NOT NULL,
	[Priority] [int] NOT NULL,
	[ActionNavigationNumber] [int] NULL,
	[MarketPackageName] [varchar](100) NULL,
	[MarketIntentString] [varchar](100) NULL,
	[AppStoreUri] [varchar](100) NULL,
 CONSTRAINT [PK_QuestionAction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuestionSelectorConfig]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionSelectorConfig](
	[ID] [int] NOT NULL,
	[TotalNumberOfQuestions] [int] NOT NULL,
	[CreatedQuestionsPercent] [int] NOT NULL,
	[VerifiedQuestionsPercent] [int] NOT NULL,
	[BoostedQuestionsPercent] [int] NOT NULL,
	[ActionBasedQuestionsPercent] [int] NOT NULL,
 CONSTRAINT [PK_QuestionSelectorConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestQuestions]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestQuestions](
	[ID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[YesQuestNumber] [int] NOT NULL,
	[NoQuestNumber] [int] NOT NULL,
	[YesScore] [int] NOT NULL,
	[NoScore] [int] NOT NULL,
	[QuestNumber] [int] NOT NULL,
 CONSTRAINT [PK_QuestQuestions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestScore]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestScore](
	[ID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[QuestNumber] [int] NOT NULL,
	[Score] [int] NOT NULL,
 CONSTRAINT [PK_QuestScore] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestTypes]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestTypes](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QuestTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Relationship]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relationship](
	[UserOneID] [int] NOT NULL,
	[UserTwoID] [int] NOT NULL,
	[RelationStatus] [int] NOT NULL,
	[OperatedByID] [int] NOT NULL,
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_Relationship] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RelationshipStatus]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationshipStatus](
	[ID] [int] NOT NULL,
	[Name] [int] NOT NULL,
 CONSTRAINT [PK_RelationshipStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportedQuestions]    Script Date: 1/9/2018 5:38:17 PM ******/
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
/****** Object:  Table [dbo].[ReportType]    Script Date: 1/9/2018 5:38:17 PM ******/
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
/****** Object:  Table [dbo].[Sent]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sent](
	[ID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[GorupID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Sent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Store]    Script Date: 1/9/2018 5:38:17 PM ******/
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
/****** Object:  Table [dbo].[Tutorial]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutorial](
	[ID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Tutorial] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](40) NOT NULL,
	[UserTypeID] [int] NULL,
	[QuestProgress] [int] NULL,
	[QuestNumber] [int] NULL,
	[TotalCoin] [int] NOT NULL,
	[IsMale] [bit] NOT NULL,
	[UUID] [varchar](36) NOT NULL,
	[NotificationID] [varchar](36) NULL,
	[Platform] [int] NOT NULL,
	[APILevel] [varchar](50) NULL,
	[Device] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[RowVersion] [timestamp] NULL,
	[IPAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 1/9/2018 5:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[IsVerified] [bit] NOT NULL,
	[IsBanned] [bit] NOT NULL,
	[IsEditable] [int] NOT NULL,
	[IsInfoEnable] [bit] NOT NULL,
	[RegisterDateTime] [datetime] NOT NULL,
	[ChangeInfoDate] [datetime] NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserType]    Script Date: 1/9/2018 5:38:17 PM ******/
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
/****** Object:  Table [dbo].[WatchAdProvider]    Script Date: 1/9/2018 5:38:17 PM ******/
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
/****** Object:  Table [dbo].[WatchedAd]    Script Date: 1/9/2018 5:38:17 PM ******/
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
INSERT [dbo].[ClientApplicationState] ([ID], [VersionInfo], [IsMajorVersion]) VALUES (1, 504, 1)
INSERT [dbo].[PlatformTypes] ([ID], [Title]) VALUES (0, N'Android')
INSERT [dbo].[PlatformTypes] ([ID], [Title]) VALUES (1, N'IOS')
INSERT [dbo].[Quest] ([QuestNumber], [QuestTypes], [QuestTitle], [QuestDescription], [CoinPrize], [CeilProgress], [Mean_Score], [CreatedDate], [UpdateDate]) VALUES (1, 1, N'1', N'1', 1, 1, 1, CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime))
INSERT [dbo].[QuestTypes] ([ID], [Name]) VALUES (1, N'SubQuest')
INSERT [dbo].[QuestTypes] ([ID], [Name]) VALUES (2, N'Main')
INSERT [dbo].[QuestTypes] ([ID], [Name]) VALUES (3, N'Finale')
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [UserTypeID], [QuestProgress], [QuestNumber], [TotalCoin], [IsMale], [UUID], [NotificationID], [Platform], [APILevel], [Device], [Model], [IPAddress]) VALUES (3, N'Jeb', NULL, 0, 1, 10, 0, N'c0448e50-f170-4219-8c90-0fa86cc13c55', N'00000000-0000-0000-0000-000000000000', 0, N'1212122', N'1212122', N'1212122', N'5.116.230.5')
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [IsVerified], [IsBanned], [IsEditable], [IsInfoEnable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1, 3, NULL, NULL, 0, 0, 0, 0, CAST(0x0000A86300ED822A AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
ALTER TABLE [dbo].[Answer] ADD  CONSTRAINT [DF_Answer_NoState]  DEFAULT ((0)) FOR [NoState]
GO
ALTER TABLE [dbo].[Answer] ADD  CONSTRAINT [DF_Answer_IsReported]  DEFAULT ((0)) FOR [IsReported]
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
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_AnswerPrize]  DEFAULT ((1)) FOR [Prize_AnswerXP]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_LikePrize]  DEFAULT ((1)) FOR [Prize_LikeScoreAmount]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_CreateNewQuestionPrize]  DEFAULT ((1)) FOR [Prize_CreateNewQuestionXP]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_NewQuestionAcceptedPrize]  DEFAULT ((1)) FOR [Prize_NewQuestionAcceptedXP]
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
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_HostCredentialUserName]  DEFAULT ('Support') FOR [HostCredentialUserName]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_HostCredentialPassword]  DEFAULT ((0)) FOR [HostCredentialPassword]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Store_DefaultReturnAmount]  DEFAULT ((1)) FOR [Store_DefaultReturnAmount]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_WatchAdCoin]  DEFAULT ((5)) FOR [WatchAdCoin]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_SpinWheelFortuneThreshold]  DEFAULT ((20)) FOR [SpinWheelFortuneThreshold]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_SpinWheelPrice]  DEFAULT ((5)) FOR [SpinWheelLoopPrice]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Prize_CreateNewQuestionScore]  DEFAULT ((1)) FOR [Prize_CreateNewQuestionScore]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Prize_NewQuestionAcceptedScore]  DEFAULT ((1)) FOR [Prize_NewQuestionAcceptedScore]
GO
ALTER TABLE [dbo].[ApplicationState] ADD  CONSTRAINT [DF_ApplicationState_Prize_AnswerScoreAmount]  DEFAULT ((1)) FOR [Prize_AnswerScoreAmount]
GO
ALTER TABLE [dbo].[CodeGift] ADD  CONSTRAINT [DF_CodeGift_TotalUserCount]  DEFAULT ((0)) FOR [TotalUserCount]
GO
ALTER TABLE [dbo].[CodeGift] ADD  CONSTRAINT [DF_CodeGift_TotalUserRegistered]  DEFAULT ((0)) FOR [TotalUserRegistered]
GO
ALTER TABLE [dbo].[MarketInfo] ADD  CONSTRAINT [DF_MarketInfo_NeedsTokenRequest]  DEFAULT ((1)) FOR [NeedsTokenVerification]
GO
ALTER TABLE [dbo].[MarketInfo] ADD  CONSTRAINT [DF_MarketInfo_Code]  DEFAULT ('CODE') FOR [Code]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_IsFailed]  DEFAULT ((0)) FOR [IsFailed]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_Banned]  DEFAULT ((0)) FOR [Banned]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_CommentCount]  DEFAULT ((0)) FOR [CommentCount]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_RemovedByCreator]  DEFAULT ((0)) FOR [RemovedByCreator]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_UserID]  DEFAULT ((1)) FOR [UserID]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_ReportCount]  DEFAULT ((0)) FOR [ReportCount]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_MarketID]  DEFAULT ((1)) FOR [MarketID]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_SKU]  DEFAULT ('SKU_1000_Toman') FOR [SKU]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_IsAccessibleInAllStore]  DEFAULT ((0)) FOR [IsAccessibleInAllStores]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_IsInOff]  DEFAULT ((0)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsMale]  DEFAULT ((0)) FOR [IsMale]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Platform]  DEFAULT ((0)) FOR [Platform]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IPAddress]  DEFAULT ('127.0.0.1') FOR [IPAddress]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_Password]  DEFAULT (N'Password') FOR [Password]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsVerified]  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsBanned]  DEFAULT ((0)) FOR [IsBanned]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsEdited]  DEFAULT ((2)) FOR [IsEditable]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsEnable]  DEFAULT ((1)) FOR [IsInfoEnable]
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
ALTER TABLE [dbo].[ContactUs]  WITH CHECK ADD  CONSTRAINT [FK_ContactUs_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContactUs] CHECK CONSTRAINT [FK_ContactUs_User]
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
ALTER TABLE [dbo].[PriceHistory]  WITH CHECK ADD  CONSTRAINT [FK_PriceList_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PriceHistory] CHECK CONSTRAINT [FK_PriceList_Store]
GO
ALTER TABLE [dbo].[Quest]  WITH CHECK ADD  CONSTRAINT [FK_Quest_QuestTypes] FOREIGN KEY([QuestTypes])
REFERENCES [dbo].[QuestTypes] ([ID])
GO
ALTER TABLE [dbo].[Quest] CHECK CONSTRAINT [FK_Quest_QuestTypes]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_HashTag] FOREIGN KEY([HashTagID])
REFERENCES [dbo].[HashTag] ([ID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_HashTag]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_QuestionAction] FOREIGN KEY([ActionID])
REFERENCES [dbo].[QuestionAction] ([ID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_QuestionAction]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_User]
GO
ALTER TABLE [dbo].[QuestQuestions]  WITH CHECK ADD  CONSTRAINT [FK_QuestQuestions_Quest] FOREIGN KEY([QuestNumber])
REFERENCES [dbo].[Quest] ([QuestNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuestQuestions] CHECK CONSTRAINT [FK_QuestQuestions_Quest]
GO
ALTER TABLE [dbo].[QuestScore]  WITH CHECK ADD  CONSTRAINT [FK_QuestScore_Quest] FOREIGN KEY([QuestNumber])
REFERENCES [dbo].[Quest] ([QuestNumber])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuestScore] CHECK CONSTRAINT [FK_QuestScore_Quest]
GO
ALTER TABLE [dbo].[QuestScore]  WITH CHECK ADD  CONSTRAINT [FK_QuestScore_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuestScore] CHECK CONSTRAINT [FK_QuestScore_User]
GO
ALTER TABLE [dbo].[Relationship]  WITH CHECK ADD  CONSTRAINT [FK_Relationship_RelationshipStatus] FOREIGN KEY([RelationStatus])
REFERENCES [dbo].[RelationshipStatus] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Relationship] CHECK CONSTRAINT [FK_Relationship_RelationshipStatus]
GO
ALTER TABLE [dbo].[Relationship]  WITH CHECK ADD  CONSTRAINT [FK_Relationship_User] FOREIGN KEY([OperatedByID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Relationship] CHECK CONSTRAINT [FK_Relationship_User]
GO
ALTER TABLE [dbo].[Relationship]  WITH CHECK ADD  CONSTRAINT [FK_Relationship_User_Two] FOREIGN KEY([UserTwoID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Relationship] CHECK CONSTRAINT [FK_Relationship_User_Two]
GO
ALTER TABLE [dbo].[Relationship]  WITH CHECK ADD  CONSTRAINT [FK_RelationshipUserOne] FOREIGN KEY([UserOneID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Relationship] CHECK CONSTRAINT [FK_RelationshipUserOne]
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
ALTER TABLE [dbo].[Sent]  WITH CHECK ADD  CONSTRAINT [FK_Sent_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([ID])
GO
ALTER TABLE [dbo].[Sent] CHECK CONSTRAINT [FK_Sent_Question]
GO
ALTER TABLE [dbo].[Sent]  WITH CHECK ADD  CONSTRAINT [FK_Sent_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sent] CHECK CONSTRAINT [FK_Sent_User]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_MarketInfo] FOREIGN KEY([MarketID])
REFERENCES [dbo].[MarketInfo] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_MarketInfo]
GO
ALTER TABLE [dbo].[Tutorial]  WITH CHECK ADD  CONSTRAINT [FK_Tutorial_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tutorial] CHECK CONSTRAINT [FK_Tutorial_Question]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Quest] FOREIGN KEY([QuestNumber])
REFERENCES [dbo].[Quest] ([QuestNumber])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Quest]
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
/****** Object:  Trigger [dbo].[achievedCodeGift_afterInsert_update_number_of_users_achieved]    Script Date: 1/9/2018 5:38:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[achievedCodeGift_afterInsert_update_number_of_users_achieved]
   ON  [dbo].[AchievedCodeGift]
   after Delete , insert
AS 
BEGIN
  
	Update 
	[dbo].[CodeGift]
	Set 
		TotalUserRegistered = TotalUserRegistered + 
		(
		Select COUNT(*)
		From inserted I 
		Where I.CodeGiftID = [dbo].[CodeGift].ID
		)
	Where 
		ID IN (Select CodeGiftID from inserted)


	Update 
	[dbo].[CodeGift]
	Set 
		TotalUserRegistered = TotalUserRegistered - 
		(
		Select COUNT(*)
		From deleted I 
		Where I.CodeGiftID = [dbo].[CodeGift].ID
		)
	Where 
		ID IN (Select CodeGiftID from deleted)
END




GO
