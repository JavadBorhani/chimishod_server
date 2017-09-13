USE [Chimishod]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCharacterRank]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCharacterRank]
AS
BEGIN
	
	SET NOCOUNT ON;
		Update 
			[dbo].[PersonalizedCharacter]
		Set 
			[dbo].[PersonalizedCharacter].Rank = Ranking.NewRank,
			[dbo].[PersonalizedCharacter].OldPointCount = Ranking.NewPointCount
		FROM
			(Select 
					ID , 
					NewPointCount ,
					ROW_NUMBER() over (PARTITION by	CharacterID Order BY NewPointCount DESC) as NewRank
			FROM
				[dbo].[PersonalizedCharacter]
			) as Ranking
		WHERE
			[dbo].[PersonalizedCharacter].ID = Ranking.ID
END



GO
/****** Object:  StoredProcedure [dbo].[UpdateUserGlobalRank]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUserGlobalRank]
AS
BEGIN
	
	SET NOCOUNT ON;
		Update 
			[dbo].[UserStat]
		Set 
			[dbo].[UserStat].Rank  = Ranking.NewRank,
			[dbo].[UserStat].OldScore = Ranking.Score
		FROM
			(Select 
					ID , 
					Score ,
					ROW_NUMBER() over (Order BY Score DESC) as NewRank
			FROM
				[dbo].[UserStat]
			) as Ranking
		WHERE
			[dbo].[UserStat].ID = Ranking.ID
END



GO
/****** Object:  Table [dbo].[AchievedCodeGift]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[AchievedGifts]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[AchievedPosession]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[AchievedScore]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AchievedScore](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[AchievedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AchievedScore] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AchievedSpinWheel]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AchievedSpinWheel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SpinWheelID] [int] NOT NULL,
 CONSTRAINT [PK_AchievedSpinWheel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Achievement]    Script Date: 8/7/2017 8:03:43 PM ******/
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
	[QueryTypeID] [int] NULL,
	[CategoryID] [int] NULL,
	[Quantity] [int] NULL,
	[Query] [nvarchar](500) NULL,
	[Coin] [int] NOT NULL,
	[ScorePrize] [int] NOT NULL,
	[Icon] [varchar](150) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Quest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AchievementQueryType]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AchievementQueryType](
	[ID] [int] NOT NULL,
	[QueyName] [nvarchar](20) NOT NULL,
	[QueryDescription] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_AchievementQueryType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AchieveStateType]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[AppAdvertisements]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[ApplicationState]    Script Date: 8/7/2017 8:03:43 PM ******/
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
	[HostCredentialUserName] [varchar](50) NOT NULL,
	[HostCredentialPassword] [varchar](50) NOT NULL,
	[Store_DefaultReturnAmount] [int] NOT NULL,
	[WatchAdCoin] [int] NOT NULL,
	[SpinWheelFortuneThreshold] [int] NOT NULL,
	[SpinWheelLoopPrice] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationState] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AppTheme]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[AssignedCharacter]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignedCharacter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CharacterID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_AssignedCharacter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/7/2017 8:03:43 PM ******/
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
	[Icon] [varchar](100) NOT NULL,
	[Price] [int] NOT NULL,
	[PrizeCoefficient] [int] NOT NULL,
	[DiscountAmount] [int] NOT NULL,
	[TagStateID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[CharacterAlias]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CharacterAlias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Icon] [varchar](150) NOT NULL,
	[CharacterID] [int] NOT NULL,
 CONSTRAINT [PK_CharacterAlias] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CharacterPoints]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterPoints](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CreatorID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[CharacterID] [int] NOT NULL,
 CONSTRAINT [PK_CharacterPoints] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Characters]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Characters](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Icon] [varchar](150) NOT NULL,
	[UserCount] [int] NOT NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Characters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CodeGift]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[CreatedQuestions]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[CreatedQuestionsVerifyType]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[DailyRewards]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DailyRewards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Icon] [varchar](150) NOT NULL,
	[Day] [int] NOT NULL,
	[Prize] [int] NOT NULL,
 CONSTRAINT [PK_DailyRewards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DailyRewardsAchieved]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyRewardsAchieved](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DailyRewardsID] [int] NOT NULL,
	[EarnedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DailyRewadsAchieved] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DisplayedNotification]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[Favorite]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[Gift]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[GiftType]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[Level]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[LevelNumber] [int] NOT NULL,
	[Star] [int] NOT NULL,
	[ScoreCeil] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED 
(
	[LevelNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manufacture]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[MarketInfo]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[PersonalizedCharacter]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalizedCharacter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CharacterID] [int] NOT NULL,
	[NewPointCount] [int] NOT NULL,
	[OldPointCount] [int] NOT NULL,
	[Rank] [int] NOT NULL,
 CONSTRAINT [PK_PersonalizedCharacter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PresentedAdvert]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[PriceHistory]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[PurchaseAvatar]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[PurchaseCategory]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[AnswerCount] [int] NOT NULL,
 CONSTRAINT [PK_PurchaseCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseTheme]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 8/7/2017 8:03:43 PM ******/
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
	[ActionID] [int] NULL,
	[CommentCount] [int] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionAction]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionAction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ActionNumber] [int] NOT NULL,
	[Coin] [int] NOT NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_QuestionAction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionBoost]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[ReportedQuestions]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[ReportType]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[ScoreTypes]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScoreTypes](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ScoreTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SelectedAvatar]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[SelectedCategory]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[SelectedTheme]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[SpinWheel]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SpinWheel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Icon] [varchar](150) NOT NULL,
	[SpinWheelTypeID] [int] NOT NULL,
	[Prize] [int] NOT NULL,
	[SpinWheelAlternativeID] [int] NULL,
	[FirstChance] [float] NOT NULL,
	[SecondChance] [float] NOT NULL,
	[Priority] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SpinWheel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SpinWheelType]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpinWheelType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SpinWheelType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Store]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[TagState]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[UnRepeatableAchievedSpinWheel]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnRepeatableAchievedSpinWheel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SpinWheelID] [int] NOT NULL,
 CONSTRAINT [PK_UnRepeatableAchievedSpinWheel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 8/7/2017 8:03:43 PM ******/
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
	[TotalCoin] [int] NOT NULL,
	[LevelProgress] [int] NOT NULL,
	[CurrentLevelNumber] [int] NULL,
	[IsAbleToWriteComment] [bit] NOT NULL,
	[LastSeenDateTime] [datetime] NOT NULL,
	[PrevLastSeenDateTime] [datetime] NOT NULL,
	[PreviousDaySeen] [datetime] NOT NULL,
	[DWMCount] [int] NOT NULL,
	[IsTutorial] [bit] NOT NULL,
	[RowVersion] [timestamp] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAvatar]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[UserCounts]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCounts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PurchasedCategoryCount] [int] NOT NULL,
	[PurchasedAvatarCount] [int] NOT NULL,
	[PurchasedThemeCount] [int] NOT NULL,
	[CreatedQuestionsCount] [int] NOT NULL,
 CONSTRAINT [PK_UserCounts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[UserStat]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[OldScore] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[SpinRemainedChance] [int] NOT NULL,
	[SpinWheelCount] [int] NOT NULL,
	[RowVersion] [timestamp] NULL,
 CONSTRAINT [PK_UserStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserType]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[WatchAdProvider]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  Table [dbo].[WatchedAd]    Script Date: 8/7/2017 8:03:43 PM ******/
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
/****** Object:  View [dbo].[AchievementStatistics]    Script Date: 8/7/2017 8:03:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AchievementStatistics]
AS
SELECT        dbo.[User].ID AS UserID, dbo.[User].CurrentLevelNumber AS LevelNumber, dbo.UserStat.Score, dbo.UserCounts.PurchasedCategoryCount, dbo.UserCounts.PurchasedAvatarCount, 
                         dbo.UserCounts.PurchasedThemeCount, dbo.UserCounts.CreatedQuestionsCount
FROM            dbo.[User] LEFT OUTER JOIN
                         dbo.UserCounts ON dbo.[User].ID = dbo.UserCounts.UserID LEFT OUTER JOIN
                         dbo.UserStat ON dbo.[User].ID = dbo.UserStat.UserID

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
INSERT [dbo].[AchievedGifts] ([ID], [UserID], [GiftID], [AchievedDate]) VALUES (41, 2221, 9, CAST(0x0000A77700C4F57F AS DateTime))
SET IDENTITY_INSERT [dbo].[AchievedGifts] OFF
SET IDENTITY_INSERT [dbo].[AchievedPosession] ON 

INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1201, 1158, 4, 3, CAST(0x0000A73A00092028 AS DateTime), CAST(0x0000A73A00091DD9 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1202, 1158, 5, 3, CAST(0x0000A73A000D661F AS DateTime), CAST(0x0000A73A000D63E8 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1209, 1160, 4, 3, CAST(0x0000A73A00D9D5A2 AS DateTime), CAST(0x0000A73A00D9D439 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1210, 1160, 5, 3, CAST(0x0000A73A00DB4A96 AS DateTime), CAST(0x0000A73A00DB495B AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1213, 1160, 10, 2, NULL, CAST(0x0000A73C00E5AC02 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1214, 1160, 8, 2, NULL, CAST(0x0000A73C00E5AC02 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1215, 1160, 11, 2, NULL, CAST(0x0000A73C00E5B350 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1216, 1160, 9, 2, NULL, CAST(0x0000A73C00E5B350 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1234, 1173, 4, 3, CAST(0x0000A74A011F8A4C AS DateTime), CAST(0x0000A74A011F85DA AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (1235, 1173, 5, 3, CAST(0x0000A74A0123B8B8 AS DateTime), CAST(0x0000A74A012023F6 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2239, 1170, 4, 2, NULL, CAST(0x0000A74C0172D298 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2241, 1173, 10, 3, CAST(0x0000A74F016586BC AS DateTime), CAST(0x0000A74F0165845C AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2244, 1170, 5, 2, NULL, CAST(0x0000A75300F8FA26 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2247, 2179, 4, 2, NULL, CAST(0x0000A75600C2995A AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2248, 2179, 5, 2, NULL, CAST(0x0000A756010086D2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2250, 2180, 4, 2, NULL, CAST(0x0000A75601096301 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2251, 1173, 11, 3, CAST(0x0000A75800DC5115 AS DateTime), CAST(0x0000A75800D57293 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2252, 2184, 4, 2, NULL, CAST(0x0000A75A00D0C791 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2254, 2185, 4, 3, CAST(0x0000A75A01009F03 AS DateTime), CAST(0x0000A75A01009CF2 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2258, 2187, 4, 3, CAST(0x0000A75D010F6079 AS DateTime), CAST(0x0000A75D010F5E6C AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2261, 2200, 4, 3, CAST(0x0000A76400D7994B AS DateTime), CAST(0x0000A75E014C083F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2263, 2197, 4, 3, CAST(0x0000A75F00CE7780 AS DateTime), CAST(0x0000A75F00CE7269 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2264, 2197, 5, 3, CAST(0x0000A75F00D01C5E AS DateTime), CAST(0x0000A75F00D01996 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2265, 2200, 5, 3, CAST(0x0000A7650189896C AS DateTime), CAST(0x0000A75F00F6065F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2273, 2200, 10, 3, CAST(0x0000A7660003F9DF AS DateTime), CAST(0x0000A764013FB085 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2274, 2200, 11, 3, CAST(0x0000A76600040019 AS DateTime), CAST(0x0000A7640140758A AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2276, 2202, 4, 3, CAST(0x0000A76500FD132C AS DateTime), CAST(0x0000A76500BDD7CB AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2277, 2202, 5, 2, NULL, CAST(0x0000A76500F937E7 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2283, 2207, 4, 2, NULL, CAST(0x0000A7650118F343 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2284, 2208, 4, 2, NULL, CAST(0x0000A7650118FDCB AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2285, 2209, 4, 2, NULL, CAST(0x0000A76501190BA7 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2286, 2209, 5, 2, NULL, CAST(0x0000A7650119D7B0 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2287, 2207, 5, 2, NULL, CAST(0x0000A765011C1FD5 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2288, 2205, 4, 2, NULL, CAST(0x0000A76501399EFD AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2289, 2200, 8, 3, CAST(0x0000A7660003FB44 AS DateTime), CAST(0x0000A765018B647D AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2290, 2200, 9, 3, CAST(0x0000A7660003FF54 AS DateTime), CAST(0x0000A76600033B8D AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2292, 2212, 4, 3, CAST(0x0000A76600B59421 AS DateTime), CAST(0x0000A76600B592EC AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2293, 2212, 5, 3, CAST(0x0000A76600B80A20 AS DateTime), CAST(0x0000A76600B80825 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2294, 2212, 8, 2, NULL, CAST(0x0000A76600BB7CE5 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2295, 2212, 9, 2, NULL, CAST(0x0000A76600BC660B AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2297, 2213, 4, 3, CAST(0x0000A76600BDDEF3 AS DateTime), CAST(0x0000A76600BDCDA0 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2302, 2208, 5, 2, NULL, CAST(0x0000A77301023B13 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2307, 2224, 4, 3, CAST(0x0000A77E00F47D7F AS DateTime), CAST(0x0000A7770167DBC6 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2308, 3275, 4, 2, NULL, CAST(0x0000A77800C95FB9 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2310, 3275, 5, 3, CAST(0x0000A77801388603 AS DateTime), CAST(0x0000A77801379E7F AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2311, 3275, 6, 3, CAST(0x0000A778013B5C2D AS DateTime), CAST(0x0000A778013B5A82 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2313, 2227, 4, 3, CAST(0x0000A77900025DF3 AS DateTime), CAST(0x0000A77900025A58 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2315, 2222, 4, 2, NULL, CAST(0x0000A78301180C49 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2316, 2222, 5, 2, NULL, CAST(0x0000A783011864B0 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2317, 3280, 4, 2, NULL, CAST(0x0000A78300000000 AS DateTime))
INSERT [dbo].[AchievedPosession] ([ID], [UserID], [AchievementID], [AchieveStateID], [AchievedDate], [AchievableDate]) VALUES (2318, 3280, 5, 3, NULL, CAST(0x0000A78300000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[AchievedPosession] OFF
SET IDENTITY_INSERT [dbo].[AchievedSpinWheel] ON 

INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (4, 1173, 14)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (5, 1173, 11)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (6, 1173, 11)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (7, 1173, 11)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (8, 1173, 14)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (9, 4286, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (10, 4286, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (11, 4286, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (12, 4286, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (13, 4286, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (14, 4288, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (15, 4288, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (16, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (17, 4288, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (18, 4288, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (19, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (20, 4288, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (21, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (22, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (23, 4288, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (24, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (25, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (26, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (27, 4288, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (28, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (29, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (30, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (31, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (32, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (33, 4289, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (34, 4289, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (35, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (36, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (37, 4290, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (38, 4290, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (39, 4290, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (40, 4290, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (41, 4290, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (42, 4290, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (43, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (44, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (45, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (46, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (47, 4289, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (48, 4289, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (49, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (50, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (51, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (52, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (53, 4289, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (54, 4289, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (55, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (56, 4289, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (57, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (58, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (59, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (60, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (61, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (62, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (63, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (64, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (65, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (66, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (67, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (68, 4288, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (69, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (70, 4288, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (71, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (72, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (73, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (74, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (75, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (76, 3278, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (77, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (78, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (79, 3278, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (80, 3278, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (81, 3278, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (82, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (83, 3278, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (84, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (85, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (86, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (87, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (88, 3278, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (89, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (90, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (91, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (92, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (93, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (94, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (95, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (96, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (97, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (98, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (99, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (100, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (101, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (102, 4289, 2)
GO
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (103, 4290, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (104, 4290, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (105, 4290, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (106, 4290, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (107, 4290, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (108, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (109, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (110, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (111, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (112, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (113, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (114, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (115, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (116, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (117, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (118, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (119, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (120, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (121, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (122, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (123, 4290, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (124, 4290, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (125, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (126, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (127, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (128, 4290, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (129, 4290, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (130, 4290, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (131, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (132, 4290, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (133, 4290, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (134, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (135, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (136, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (137, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (138, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (139, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (140, 4290, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (141, 4291, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (142, 4291, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (143, 4291, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (144, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (145, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (146, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (147, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (148, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (149, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (150, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (151, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (152, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (153, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (154, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (155, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (156, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (157, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (158, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (159, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (160, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (161, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (162, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (163, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (164, 3278, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (165, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (166, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (167, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (168, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (169, 3278, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (170, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (171, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (172, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (173, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (174, 3278, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (175, 3278, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (176, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (177, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (178, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (179, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (180, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (181, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (182, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (183, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (184, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (185, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (186, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (187, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (188, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (189, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (190, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (191, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (192, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (193, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (194, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (195, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (196, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (197, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (198, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (199, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (200, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (201, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (202, 4288, 2)
GO
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (203, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (204, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (205, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (206, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (207, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (208, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (209, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (210, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (211, 4288, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (212, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (213, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (214, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (215, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (216, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (217, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (218, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (219, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (220, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (221, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (222, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (223, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (224, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (225, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (226, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (227, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (228, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (229, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (230, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (231, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (232, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (233, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (234, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (235, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (236, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (237, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (238, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (239, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (240, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (241, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (242, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (243, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (244, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (245, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (246, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (247, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (248, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (249, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (250, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (251, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (252, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (253, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (254, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (255, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (256, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (257, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (258, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (259, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (260, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (261, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (262, 4289, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (263, 4292, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (264, 4292, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (265, 4292, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (266, 4292, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (267, 4293, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (268, 4293, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (269, 4293, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (270, 4293, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (271, 4293, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (272, 4293, 3)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (273, 4293, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (274, 4292, 2)
INSERT [dbo].[AchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (275, 4292, 2)
SET IDENTITY_INSERT [dbo].[AchievedSpinWheel] OFF
SET IDENTITY_INSERT [dbo].[Achievement] ON 

INSERT [dbo].[Achievement] ([ID], [Name], [Description], [QueryTypeID], [CategoryID], [Quantity], [Query], [Coin], [ScorePrize], [Icon], [CreatedDate], [UpdatedDate], [IsActive], [Priority]) VALUES (4, N'مرد چالش', N'جواب به 20 سوال چالشی', 1, 1, 20, NULL, 5, 4, N'images/category/challenge.png', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1, 1)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [QueryTypeID], [CategoryID], [Quantity], [Query], [Coin], [ScorePrize], [Icon], [CreatedDate], [UpdatedDate], [IsActive], [Priority]) VALUES (5, N'چالش جو', N'جواب به 40 سوال چالشی', 1, 1, 40, NULL, 10, 8, N'images/category/challenge.png', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1, 2)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [QueryTypeID], [CategoryID], [Quantity], [Query], [Coin], [ScorePrize], [Icon], [CreatedDate], [UpdatedDate], [IsActive], [Priority]) VALUES (6, N'چالشگر', N'جواب به 60 سوال چالشی', 1, 1, 60, NULL, 15, 16, N'images/category/challenge.png', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1, 3)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [QueryTypeID], [CategoryID], [Quantity], [Query], [Coin], [ScorePrize], [Icon], [CreatedDate], [UpdatedDate], [IsActive], [Priority]) VALUES (7, N'خنده دوست', N'جواب به 20 سوال خنده دار', 1, 2, 20, NULL, 5, 4, N'images/category/laugh.png', CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, 4)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [QueryTypeID], [CategoryID], [Quantity], [Query], [Coin], [ScorePrize], [Icon], [CreatedDate], [UpdatedDate], [IsActive], [Priority]) VALUES (8, N'خنده جو', N'جواب به 40 سوال خنده دار', 1, 2, 40, NULL, 10, 8, N'images/category/laugh.png', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, 5)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [QueryTypeID], [CategoryID], [Quantity], [Query], [Coin], [ScorePrize], [Icon], [CreatedDate], [UpdatedDate], [IsActive], [Priority]) VALUES (9, N'خنده گر', N'جواب به 80 سوال خنده دار', 1, 2, 80, NULL, 20, 20, N'images/category/laugh.png', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, 6)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [QueryTypeID], [CategoryID], [Quantity], [Query], [Coin], [ScorePrize], [Icon], [CreatedDate], [UpdatedDate], [IsActive], [Priority]) VALUES (10, N'با احساس', N'جواب به 20 سوال احساسی', 1, 5, 20, NULL, 5, 4, N'images/category/social.png', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 1, 7)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [QueryTypeID], [CategoryID], [Quantity], [Query], [Coin], [ScorePrize], [Icon], [CreatedDate], [UpdatedDate], [IsActive], [Priority]) VALUES (11, N'احساسی با جنم', N'جواب به 40 سوال احساسی', 1, 5, 40, NULL, 10, 8, N'images/category/social.png', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, 8)
INSERT [dbo].[Achievement] ([ID], [Name], [Description], [QueryTypeID], [CategoryID], [Quantity], [Query], [Coin], [ScorePrize], [Icon], [CreatedDate], [UpdatedDate], [IsActive], [Priority]) VALUES (13, N'لیلی و مجنون', N'جواب به 80 سوال احساسی', 1, 5, 80, NULL, 20, 20, N'images/category/social.png', CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), 1, 9)
SET IDENTITY_INSERT [dbo].[Achievement] OFF
INSERT [dbo].[AchievementQueryType] ([ID], [QueyName], [QueryDescription]) VALUES (1, N'Answer', N'Answer To Special Groups ')
INSERT [dbo].[AchievementQueryType] ([ID], [QueyName], [QueryDescription]) VALUES (2, N'Score', N'User Global Score')
INSERT [dbo].[AchievementQueryType] ([ID], [QueyName], [QueryDescription]) VALUES (3, N'Level', N'CurrentUserLevel')
INSERT [dbo].[AchievementQueryType] ([ID], [QueyName], [QueryDescription]) VALUES (4, N'Avatar', N'Number of Purchased Avatars')
INSERT [dbo].[AchievementQueryType] ([ID], [QueyName], [QueryDescription]) VALUES (5, N'Category', N'Number of Purchased Categories')
INSERT [dbo].[AchievementQueryType] ([ID], [QueyName], [QueryDescription]) VALUES (6, N'CreatedQuestions', N'Number of CreatedQuestions')
SET IDENTITY_INSERT [dbo].[AchieveStateType] ON 

INSERT [dbo].[AchieveStateType] ([ID], [Name], [Description]) VALUES (1, N'1', N'1')
INSERT [dbo].[AchieveStateType] ([ID], [Name], [Description]) VALUES (2, N'2', N'2')
INSERT [dbo].[AchieveStateType] ([ID], [Name], [Description]) VALUES (3, N'3', N'3')
SET IDENTITY_INSERT [dbo].[AchieveStateType] OFF
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5968, 3280, 1, 179, NULL, NULL, 0, CAST(0x0000A7BA01776A76 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5969, 3280, 1, 58, NULL, NULL, 0, CAST(0x0000A7BB00202069 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5970, 3280, 1, 74, NULL, NULL, 1, CAST(0x0000A7BB002038D5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5971, 3280, 1, 76, NULL, NULL, 1, CAST(0x0000A7BB00204638 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5973, 3280, 1, 117, NULL, NULL, 1, CAST(0x0000A7BB00209CD6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5974, 3280, 1, 114, NULL, NULL, 1, CAST(0x0000A7BB00212CA3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5975, 3280, 1, 53, NULL, NULL, 0, CAST(0x0000A7BB00213711 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5976, 3280, 1, 55, NULL, NULL, 0, CAST(0x0000A7BB0021584F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5977, 3280, 1, 56, NULL, NULL, 0, CAST(0x0000A7BB00216583 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5978, 3280, 1, 57, NULL, NULL, 1, CAST(0x0000A7BB00217008 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5979, 3280, 1, 72, NULL, NULL, 0, CAST(0x0000A7BB00217DBA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5980, 3280, 1, 59, NULL, NULL, 0, CAST(0x0000A7BB00218AA7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5981, 3280, 1, 69, NULL, NULL, 1, CAST(0x0000A7BB002199E4 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5982, 3280, 1, 37, NULL, NULL, 1, CAST(0x0000A7BB0021A74E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5983, 3280, 1, 118, NULL, NULL, 0, CAST(0x0000A7BB0021B207 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5984, 3280, 1, 119, NULL, NULL, 1, CAST(0x0000A7BB0021C092 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5985, 3280, 1, 116, NULL, NULL, 0, CAST(0x0000A7BB0021CD87 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5986, 3280, 1, 25, NULL, NULL, 0, CAST(0x0000A7BB0021E90C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5987, 3275, 1, 179, NULL, NULL, 0, CAST(0x0000A7BB010032F8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5988, 3275, 1, 58, NULL, NULL, 0, CAST(0x0000A7BB01007327 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5989, 3275, 1, 74, NULL, NULL, 1, CAST(0x0000A7BB0102A15C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5990, 3275, 1, 76, NULL, NULL, 1, CAST(0x0000A7BB0102F9FE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5991, 2266, 1, 179, NULL, NULL, 0, CAST(0x0000A7BB0105E710 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5992, 3278, 1, 179, NULL, NULL, 0, CAST(0x0000A7BB0123552F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5993, 2266, 1, 58, NULL, NULL, 0, CAST(0x0000A7BB0127AEC0 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5995, 3282, 1, 58, NULL, NULL, 0, CAST(0x0000A7BB014243CE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5996, 3282, 1, 74, NULL, NULL, 0, CAST(0x0000A7BB01425AE7 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5997, 3282, 1, 76, NULL, NULL, 1, CAST(0x0000A7BB01428086 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5998, 3282, 1, 114, NULL, NULL, 1, CAST(0x0000A7BB01428E49 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (5999, 3283, 1, 179, NULL, NULL, 0, CAST(0x0000A7BB01471D8E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6000, 3282, 1, 179, NULL, NULL, 0, CAST(0x0000A7BB014794C9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6001, 3282, 1, 117, NULL, NULL, 1, CAST(0x0000A7BB0147ABC8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6002, 3282, 1, 53, NULL, NULL, 1, CAST(0x0000A7BB0147B4FD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6003, 3282, 1, 55, NULL, NULL, 0, CAST(0x0000A7BB0147C2BD AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6004, 3282, 1, 56, NULL, NULL, 1, CAST(0x0000A7BB0147D892 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6005, 3282, 1, 57, NULL, NULL, 1, CAST(0x0000A7BB0147E697 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6006, 3282, 1, 72, NULL, NULL, 0, CAST(0x0000A7BB0147F9A3 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6007, 3283, 1, 58, NULL, NULL, 0, CAST(0x0000A7BB0147FE90 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6008, 3282, 1, 59, NULL, NULL, 0, CAST(0x0000A7BB01481150 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6009, 3282, 1, 69, NULL, NULL, 0, CAST(0x0000A7BB01482EB6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6010, 3282, 1, 37, NULL, NULL, 1, CAST(0x0000A7BB014846F2 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6011, 3282, 1, 118, NULL, NULL, 0, CAST(0x0000A7BB01487862 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6012, 3283, 1, 74, NULL, NULL, 0, CAST(0x0000A7BB01488743 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6013, 3282, 1, 119, NULL, NULL, 1, CAST(0x0000A7BB01489EB5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6014, 3282, 1, 116, NULL, NULL, 0, CAST(0x0000A7BB0148B02B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6015, 3282, 1, 25, NULL, NULL, 0, CAST(0x0000A7BB0148C923 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6016, 3283, 1, 76, NULL, NULL, 0, CAST(0x0000A7BB0148D56C AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6017, 3283, 1, 114, NULL, NULL, 0, CAST(0x0000A7BB0148F8A9 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6018, 3285, 1, 179, NULL, NULL, 0, CAST(0x0000A7BD00C116AE AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6019, 3284, 1, 179, NULL, NULL, 0, CAST(0x0000A7BF00B90117 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6020, 3284, 1, 58, NULL, NULL, 1, CAST(0x0000A7BF00B90CBB AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6021, 3284, 1, 74, NULL, NULL, 0, CAST(0x0000A7BF00B91813 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6022, 3284, 1, 76, NULL, NULL, 1, CAST(0x0000A7BF00B92580 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6023, 3284, 1, 57, NULL, NULL, 1, CAST(0x0000A7BF00B92D58 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6024, 3284, 1, 56, NULL, NULL, 0, CAST(0x0000A7BF00B93A9E AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6025, 3284, 1, 55, NULL, NULL, 0, CAST(0x0000A7BF00B94681 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6026, 3284, 1, 53, NULL, NULL, 1, CAST(0x0000A7BF00B95006 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6027, 3284, 1, 72, NULL, NULL, 0, CAST(0x0000A7BF00B95BD1 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6028, 3284, 1, 114, NULL, NULL, 0, CAST(0x0000A7BF00B9675F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6029, 3284, 1, 117, NULL, NULL, 1, CAST(0x0000A7BF00B9711A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6030, 3284, 1, 69, NULL, NULL, 0, CAST(0x0000A7BF00B97C9A AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6031, 3284, 1, 59, NULL, NULL, 0, CAST(0x0000A7BF00B988E6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6032, 3284, 1, 119, NULL, NULL, 0, CAST(0x0000A7BF00B99850 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6033, 3284, 1, 118, NULL, NULL, 1, CAST(0x0000A7BF00B9A21B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6034, 3284, 1, 116, NULL, NULL, 0, CAST(0x0000A7BF00B9B930 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6035, 3284, 1, 37, NULL, NULL, 1, CAST(0x0000A7BF00B9CAFC AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6036, 3284, 1, 25, NULL, NULL, 0, CAST(0x0000A7BF00B9D6BA AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6037, 4286, 1, 179, NULL, NULL, 0, CAST(0x0000A7C500B4F606 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6038, 4286, 1, 58, NULL, NULL, 1, CAST(0x0000A7C500B4F662 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6039, 4286, 1, 74, NULL, NULL, 0, CAST(0x0000A7C500B50024 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6040, 4286, 1, 76, NULL, NULL, 1, CAST(0x0000A7C500B50725 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6041, 4287, 1, 179, NULL, NULL, 0, CAST(0x0000A7C500C10F75 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6042, 4287, 1, 58, NULL, NULL, 1, CAST(0x0000A7C500C11CA5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6043, 4287, 1, 74, NULL, NULL, 0, CAST(0x0000A7C500C126C6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6044, 4287, 1, 76, NULL, NULL, 0, CAST(0x0000A7C500C12E96 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6045, 4287, 1, 114, NULL, NULL, 0, CAST(0x0000A7C500C133E6 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6046, 4287, 1, 117, NULL, NULL, 1, CAST(0x0000A7C500C138F5 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6047, 4286, 1, 114, NULL, NULL, 0, CAST(0x0000A7C501150E71 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6048, 4286, 1, 117, NULL, NULL, 0, CAST(0x0000A7C50115196F AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6049, 4286, 1, 53, NULL, NULL, 0, CAST(0x0000A7C5012C715B AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6050, 4286, 1, 55, NULL, NULL, 1, CAST(0x0000A7C5012C7949 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6052, 4288, 1, 179, NULL, NULL, 1, CAST(0x0000A7C5016C3116 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6053, 4286, 1, 56, NULL, NULL, 0, CAST(0x0000A7C700C795B8 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6054, 4286, 1, 57, NULL, NULL, 0, CAST(0x0000A7C700C79E97 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6055, 4286, 1, 72, NULL, NULL, 0, CAST(0x0000A7C701268F27 AS DateTime))
INSERT [dbo].[Answer] ([ID], [UserID], [CategoryID], [QuestionID], [Liked], [Dislike], [YesNoState], [CreatedDate]) VALUES (6056, 4286, 1, 59, NULL, NULL, 0, CAST(0x0000A7C701269AAB AS DateTime))
SET IDENTITY_INSERT [dbo].[Answer] OFF
SET IDENTITY_INSERT [dbo].[AppAdvertisements] ON 

INSERT [dbo].[AppAdvertisements] ([ID], [Icon], [Title], [Description], [BackgroundColor], [MarketPackageName], [MarketIntentString], [AppStoreUri], [StartTime], [ExpireTime], [Priority], [IsNew], [CreatedDate], [UpdatedDate]) VALUES (1, N'Data/Images/appAdvert/faceapp.png', N'FaceApp', N'نرم افزار خوبی برای ترکوندن صورت', N'#0d27e9', N'com.farsitel.bazaar', N'bazaar://details?id=io.faceapp', N'https://cafebazaar.ir/app/io.faceapp/?l=fa', CAST(0x0000A76B00000000 AS DateTime), CAST(0x0000A82800000000 AS DateTime), 1, 1, CAST(0x0000A76B00000000 AS DateTime), CAST(0x0000A76B00000000 AS DateTime))
INSERT [dbo].[AppAdvertisements] ([ID], [Icon], [Title], [Description], [BackgroundColor], [MarketPackageName], [MarketIntentString], [AppStoreUri], [StartTime], [ExpireTime], [Priority], [IsNew], [CreatedDate], [UpdatedDate]) VALUES (7, N'Data/Images/appAdvert/quizofkings.png', N'QuizofKing', N'کی بیشتر میدونه؟ با دوستات ', N'#0c29e7', N'ir.mservices.market', N'myket://details?id=co.palang.QuizOfKings', N'https://www.myket.ir/app/co.palang.QuizOfKings/?lang=fa', CAST(0x0000A76B00000000 AS DateTime), CAST(0x0000A82800000000 AS DateTime), 2, 1, CAST(0x0000A76B00000000 AS DateTime), CAST(0x0000A76B00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[AppAdvertisements] OFF
SET IDENTITY_INSERT [dbo].[ApplicationState] ON 

INSERT [dbo].[ApplicationState] ([ID], [Favorite_FavoritePrice], [Favorite_FreeNumberToFavorite], [User_DefaultUserName], [User_DefaultUserCoin], [Question_CreateQuestionPrice], [Question_DefaultReturnAmount], [Question_NumberToSkip], [Question_NoQuestionFoundWhat], [Question_NoQuestionFoundBut], [Question_NoQuestionFoundID], [Question_ServerBurntReturnAmount], [Prize_AnswerPrize], [Prize_LikePrize], [Prize_CreateNewQuestionPrize], [Prize_NewQuestionAcceptedPrize], [Paging_DefaultPageSize], [Leader_TopNumberToShow], [Comment_DefaultNumberAmount], [Comment_DefaultVerifyState], [Host_WebSiteNoReplyMail], [Host_WebSiteNoReplyMailPassword], [Host_SupportMail], [Host_SupportMailPassword], [Host_SmtpServer], [HostCredentialUserName], [HostCredentialPassword], [Store_DefaultReturnAmount], [WatchAdCoin], [SpinWheelFortuneThreshold], [SpinWheelLoopPrice]) VALUES (1, 5, 3, N'Guest_', 200, 50, 5, 2, N'یه خورده صبر میکردی', N'ولی اونطوری سرورمون آب نمیشد', -1, 1, 1, 1, 1, 10, 20, 20, 10, 1, N'noreply@flapp.ir', N'123123123', N'support@flapp.ir', N'@@@Visualbasic7', N'webmail.flapp.ir', N'Support', N'@@@Visualbasic7', 10, 5, 20, 5)
SET IDENTITY_INSERT [dbo].[ApplicationState] OFF
SET IDENTITY_INSERT [dbo].[AppTheme] ON 

INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate], [DiscountAmount], [TagStateID]) VALUES (1, N'آبی', N'آبی', N'آبی', N'#0d27e9', N'#102095', 5, N'Data/Images/Background/background6.jpg', N'Data/Images/Background/Dialog6.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EF00000000 AS DateTime), 0, 2)
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate], [DiscountAmount], [TagStateID]) VALUES (2, N'سبز', N'سبز', N'سبز', N'#1ec2bc', N'#157e7a', 5, N'Data/Images/Background/background7.jpg', N'Data/Images/Background/Dialog7.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 2)
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate], [DiscountAmount], [TagStateID]) VALUES (4, N'بنفش', N'بنفش', N'بنفش', N'#cb13d7', N'#8f0d97', 5, N'Data/Images/Background/background8.jpg', N'Data/Images/Background/Dialog8.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 10, 2)
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate], [DiscountAmount], [TagStateID]) VALUES (5, N'قرمز', N'قرمز', N'قرمز', N'#d30838', N'#9f062a', 5, N'Data/Images/Background/background9.jpg', N'Data/Images/Background/Dialog9.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate], [DiscountAmount], [TagStateID]) VALUES (6, N'زرد', N'زرد', N'زرد', N'#c6bf09', N'#c6bf09', 5, N'Data/Images/Background/background18.jpg', N'Data/Images/Background/Dialog18.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 2)
INSERT [dbo].[AppTheme] ([ID], [Name], [ShortDesciption], [LongDescription], [SquareColor], [CircleColor], [Price], [BackImage], [DialogImage], [CreatedDate], [UpdatedDate], [DiscountAmount], [TagStateID]) VALUES (9, N'زرد', N'زرد', N'زرد', N'#c6bf09', N'#c6bf09', 5, N'Data/Images/Background/background16.jpg', N'Data/Images/Background/Dialog16.jpg', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[AppTheme] OFF
SET IDENTITY_INSERT [dbo].[AssignedCharacter] ON 

INSERT [dbo].[AssignedCharacter] ([ID], [CharacterID], [CategoryID]) VALUES (1, 1, 1)
INSERT [dbo].[AssignedCharacter] ([ID], [CharacterID], [CategoryID]) VALUES (4, 2, 1)
INSERT [dbo].[AssignedCharacter] ([ID], [CharacterID], [CategoryID]) VALUES (5, 3, 1)
INSERT [dbo].[AssignedCharacter] ([ID], [CharacterID], [CategoryID]) VALUES (6, 4, 1)
INSERT [dbo].[AssignedCharacter] ([ID], [CharacterID], [CategoryID]) VALUES (7, 1, 2)
INSERT [dbo].[AssignedCharacter] ([ID], [CharacterID], [CategoryID]) VALUES (8, 2, 2)
INSERT [dbo].[AssignedCharacter] ([ID], [CharacterID], [CategoryID]) VALUES (9, 3, 2)
INSERT [dbo].[AssignedCharacter] ([ID], [CharacterID], [CategoryID]) VALUES (10, 4, 2)
SET IDENTITY_INSERT [dbo].[AssignedCharacter] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [Icon], [Price], [PrizeCoefficient], [DiscountAmount], [TagStateID], [CreatedDate], [UpdatedDate]) VALUES (1, N'سوالات مردم', N'سوالات مردم', N'سوالات مردم', N'images/category/social.png', 10, 1, 0, 1, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [Icon], [Price], [PrizeCoefficient], [DiscountAmount], [TagStateID], [CreatedDate], [UpdatedDate]) VALUES (2, N'ورزشی', N'ورزشی', N'ورزشی', N'images/category/sport.png', 10, 1, 0, 2, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6F000000000 AS DateTime))
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [Icon], [Price], [PrizeCoefficient], [DiscountAmount], [TagStateID], [CreatedDate], [UpdatedDate]) VALUES (5, N'خانوادگی', N'خانوادگی', N'خانوادگی', N'images/category/social.png', 10, 1, 0, 2, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6F000000000 AS DateTime))
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [Icon], [Price], [PrizeCoefficient], [DiscountAmount], [TagStateID], [CreatedDate], [UpdatedDate]) VALUES (6, N'سیاسی', N'سیاسی', N'سیاسی', N'images/category/policy.png', 10, 1, 0, 2, CAST(0x0000A70B00000000 AS DateTime), CAST(0x0000A81200000000 AS DateTime))
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [Icon], [Price], [PrizeCoefficient], [DiscountAmount], [TagStateID], [CreatedDate], [UpdatedDate]) VALUES (7, N'بزرگسال', N'بزرگسال', N'بزرگسال', N'images/category/social.png', 50, 1, 0, 2, CAST(0x0000A70B00000000 AS DateTime), CAST(0x0000A6F700000000 AS DateTime))
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [Icon], [Price], [PrizeCoefficient], [DiscountAmount], [TagStateID], [CreatedDate], [UpdatedDate]) VALUES (8, N'اجتماعی', N'اجتماعی اقتصادی', N'اجتماعی اقتصادی', N'images/category/social.png', 10, 1, 0, 2, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [Icon], [Price], [PrizeCoefficient], [DiscountAmount], [TagStateID], [CreatedDate], [UpdatedDate]) VALUES (10, N'خنده دار', N'خنده دار', N'خنده دار', N'images/category/laugh.png', 10, 1, 0, 2, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [Icon], [Price], [PrizeCoefficient], [DiscountAmount], [TagStateID], [CreatedDate], [UpdatedDate]) VALUES (11, N'چالشی', N'چالشی', N'چالشی', N'images/category/challenge.png', 20, 2, 30, 3, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime))
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [Icon], [Price], [PrizeCoefficient], [DiscountAmount], [TagStateID], [CreatedDate], [UpdatedDate]) VALUES (12, N'سینما', N'سینما', N'سینما', N'images/category/cinema.png', 5, 2, 0, 2, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime))
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [Icon], [Price], [PrizeCoefficient], [DiscountAmount], [TagStateID], [CreatedDate], [UpdatedDate]) VALUES (13, N'چرند و پرند', N'چرند و پرند', N'چرند و پرند', N'images/category/social.png', 20, 3, 2, 3, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime))
INSERT [dbo].[Category] ([ID], [Name], [ShortDescription], [LongDescription], [Icon], [Price], [PrizeCoefficient], [DiscountAmount], [TagStateID], [CreatedDate], [UpdatedDate]) VALUES (14, N'شخمی تخیلی', N'شخمی تخیلی', N'شخمی تخیلی', N'images/category/scifi.png', 20, 1, 0, 2, CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A70F00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[CharacterAlias] ON 

INSERT [dbo].[CharacterAlias] ([ID], [Title], [Icon], [CharacterID]) VALUES (1, N'دیوانه', N'Data/Images/4.png', 4)
INSERT [dbo].[CharacterAlias] ([ID], [Title], [Icon], [CharacterID]) VALUES (2, N'بدبخت', N'Data/Images/4.png', 4)
INSERT [dbo].[CharacterAlias] ([ID], [Title], [Icon], [CharacterID]) VALUES (3, N'بی مخ', N'Data/Images/1.png', 1)
INSERT [dbo].[CharacterAlias] ([ID], [Title], [Icon], [CharacterID]) VALUES (4, N'بی تربیت', N'Data/Images/2.png', 2)
INSERT [dbo].[CharacterAlias] ([ID], [Title], [Icon], [CharacterID]) VALUES (5, N'نفهم', N'Data/Images/2.png', 2)
INSERT [dbo].[CharacterAlias] ([ID], [Title], [Icon], [CharacterID]) VALUES (6, N'ساده ', N'Data/Images/3.png', 3)
INSERT [dbo].[CharacterAlias] ([ID], [Title], [Icon], [CharacterID]) VALUES (7, N'خرابکار', N'Data/Images/3.png', 3)
SET IDENTITY_INSERT [dbo].[CharacterAlias] OFF
SET IDENTITY_INSERT [dbo].[Characters] ON 

INSERT [dbo].[Characters] ([ID], [Title], [Icon], [UserCount], [Priority]) VALUES (1, N'خوشحال', N'Data/Images/1.png', 65, 1)
INSERT [dbo].[Characters] ([ID], [Title], [Icon], [UserCount], [Priority]) VALUES (2, N'بی مزه', N'Data/Images/2.png', 61, 2)
INSERT [dbo].[Characters] ([ID], [Title], [Icon], [UserCount], [Priority]) VALUES (3, N'باهوش', N'Data/Images/3.png', 61, 3)
INSERT [dbo].[Characters] ([ID], [Title], [Icon], [UserCount], [Priority]) VALUES (4, N'عاشق', N'Data/Images/4.png', 60, 4)
SET IDENTITY_INSERT [dbo].[Characters] OFF
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
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3211, 2252, 117, N'yjyjfjyjyyjytjtyjrtyjytjtyjtyjtyjtyjtyjtyjtyjtyjt', NULL, 1, CAST(0x0000A79E006EC25D AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3212, 2252, 55, N'fgdfgdfgdfgdfggdfgdfgdfgdfgdfgdfgdfgdfggghdfhgfhfgghfghfghfghfghfghfghfghfghfgfghgfhgfhgfhghgfhfghfghfghfghfggfjgfghmtymynfnfnfnfnfnfnfntfntfnftnftnfnftnftnftntfntfnfnftnfnfnfnfnfnftnftnftnftnfnftnftnft', NULL, 1, CAST(0x0000A7A00015DC61 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3213, 2253, 179, N'06410627064106420627064206410628062706280641062706280641062706280641062706280641', NULL, 1, CAST(0x0000A7A00016C490 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3214, 2253, 179, N'jyjfjgjghjghjghjghjjghghhkghjrxthwefksbvjhsbvsbkvsukvsekvusdkugvekvgkuvbhebvuhsbiugweuguebvuuabvbedsvbsibvseibvuesbvugsvsbdrfdrgy', NULL, 1, CAST(0x0000A7A00016D8B0 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3215, 2252, 55, N'fghfhfhfdhgffhfghfghfh', NULL, 1, CAST(0x0000A7A0002DD803 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3216, 2244, 37, N'وبووزوبگبگبویدددیوبوبویوبتبنبتبوفنب بتبتقو یتقتفت یاییوی یتبااس ییتاق ', NULL, 1, CAST(0x0000A7A0002F6D6B AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3217, 2244, 37, N'ودزطددلطل اتبیان ازطانرزیا ازیاتری اتبینریلهاطسب بسسیشس محتنمن زروزطی زیشقسسسطاکم ننوخزیس', NULL, 1, CAST(0x0000A7A0003105E9 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3218, 2244, 37, N'عع6عععععععععععععععععععععععععااارببلانننرزیییبزططراتتننننننننننتالبییسسطزبرلییبلیییزردرباننمختوتددتندربیسلانمندمالبییدتریبولبیلاایببییدریرانمنوتننرط زییرریییزروننابیطزردطسرونخای', NULL, 1, CAST(0x0000A7A000315C4E AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3219, 2252, 55, N'mInputComment.setFocusable(false);', NULL, 1, CAST(0x0000A7A000AD9606 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3220, 2255, 58, N'خیلی باحالی', NULL, 1, CAST(0x0000A7A000BD97CE AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3221, 2256, 179, N'اندروید خر است', NULL, 1, CAST(0x0000A7A000CEC613 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3222, 2257, 179, N'به نام خدا', NULL, 1, CAST(0x0000A7A0011720C1 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3223, 2257, 58, N'باحال بود', NULL, 1, CAST(0x0000A7A0011742A2 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3224, 2258, 74, N'اپ خیلی خوبیه', NULL, 1, CAST(0x0000A7A2000F5EC0 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3225, 2252, 55, N'ggggfdjhfd', NULL, 1, CAST(0x0000A7A300CB8F68 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3226, 2252, 55, N'dffhdfhd dxdhd hd dhdhthds hh dh d hdhdrhd ', NULL, 1, CAST(0x0000A7A300CCD179 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3227, 2252, 55, N'hddhdhdhhdhththththtdtrhrhfthd d dhth th stt th rth tr rthrth tr th rthh rt hrt trh trh trh tr trhrth rt hhtr hrt ffdff d dhdh dh d dh dt hdthdt hdt d', NULL, 1, CAST(0x0000A7A300CCE918 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3228, 2252, 55, N'i am a good boy. please hlp me', NULL, 1, CAST(0x0000A7A300D0B5F8 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3229, 2252, 55, N'hfhfghg  fh rtthr fhr fhfghfgh', NULL, 1, CAST(0x0000A7A300DC378D AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3230, 2257, 58, N'ادرردگوال ارلببللد للاوللللدد للللرد', NULL, 1, CAST(0x0000A7A300DD78D6 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3231, 2257, 58, N'عززتزنن نبتزب بزوی یاازهزیس زتیتطنخبهب تطتزنزهیهی نبتزتزتطتی تبتایتایینی تطتتطزیزهزه هتطط', NULL, 1, CAST(0x0000A7A300DD9B20 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3232, 2263, 53, N'چیز باحالی بود', NULL, 1, CAST(0x0000A7A600B45410 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3233, 2259, 179, N'nice game and app', NULL, 1, CAST(0x0000A7A8001160A5 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3234, 2259, 58, N'nice game with lots of information', NULL, 1, CAST(0x0000A7A800119EED AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3235, 2268, 58, N'سوال با حالی بود', NULL, 1, CAST(0x0000A7A7016BE1CF AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3236, 2268, 76, N'خیلی با حالی بود', NULL, 1, CAST(0x0000A7A7016C30AF AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3237, 2268, 119, N'سرعت این افتضاحه', NULL, 1, CAST(0x0000A7AA0010F1C0 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3238, 2268, 116, N'سوال باجالی هستش', NULL, 1, CAST(0x0000A7AA00111FB8 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3239, 3271, 179, N'کِی وان یین خیلی باحلی', NULL, 1, CAST(0x0000A7AC0102C272 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3240, 3271, 179, N'سلام علی، چه خبر', NULL, 1, CAST(0x0000A7AC0102CD9E AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3241, 3271, 58, N'خیلی اپ مزخرفی دارید ', NULL, 1, CAST(0x0000A7AC010399CA AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3242, 3271, 114, N'سوال رو ندیدم، نظری ندارم', NULL, 1, CAST(0x0000A7AC010428DE AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3243, 3280, 117, N'به نظرم باحال میشد', NULL, 1, CAST(0x0000A7BB0020937C AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3244, 3280, 55, N'نه', NULL, 1, CAST(0x0000A7BB002152B9 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3245, 3280, 25, N'نه اصلا خوب نیست', NULL, 1, CAST(0x0000A7BB0021E389 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3246, 3275, 179, N'خیلی اپ باحالی دارید', NULL, 1, CAST(0x0000A7BB01002506 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3247, 3283, 179, N'نودندل', NULL, 1, CAST(0x0000A7BB01444CCD AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3248, 3283, 179, N'تودراگ', NULL, 1, CAST(0x0000A7BB01445825 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3249, 3283, 179, N'کود', NULL, 1, CAST(0x0000A7BB0144599F AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3250, 3283, 179, N'ورر3', NULL, 1, CAST(0x0000A7BB01445F79 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3251, 3283, 179, N'ااتکا', NULL, 1, CAST(0x0000A7BB014466C8 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3252, 3283, 179, N'و ر', NULL, 1, CAST(0x0000A7BB01446D24 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3253, 3283, 179, N'ر', NULL, 1, CAST(0x0000A7BB014470AD AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3254, 3283, 179, N'تدزساترز', NULL, 1, CAST(0x0000A7BB01447885 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3255, 3283, 58, N'تنگوا', NULL, 1, CAST(0x0000A7BB014768ED AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3256, 3283, 58, N'ندلن', NULL, 1, CAST(0x0000A7BB01479F5A AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3257, 3283, 58, N'مالحن', NULL, 1, CAST(0x0000A7BB0147E4A4 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3258, 3283, 74, N'اودرتنا', NULL, 1, CAST(0x0000A7BB01487CB8 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3259, 3283, 76, N'توربتو', NULL, 1, CAST(0x0000A7BB0148CCB3 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3260, 3283, 117, N'ندانند', NULL, 1, CAST(0x0000A7BB01491127 AS DateTime))
INSERT [dbo].[Comment] ([ID], [UserID], [QuestionID], [CommentContent], [Response], [IsVerified], [InsertDate]) VALUES (3261, 4286, 56, N'tst ', NULL, 1, CAST(0x0000A7C700C7892A AS DateTime))
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
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (60, 2209, N'jsj', N'jsj', CAST(0x0000A77300DDF4B2 AS DateTime), 2, 6, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (61, 2227, N'همه زندگیت رو میدادی', N'عشقت برمیگشت؟ ', CAST(0x0000A77C0017C193 AS DateTime), 2, 1, 4)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (62, 2264, N'fgdfgdfg', N'dfgdfgdfgd', CAST(0x0000A7A7015F6A9D AS DateTime), 2, 1, 3)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (63, 2264, N'fgdfh', N'fhfghfghf', CAST(0x0000A7A7015F9A8E AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (64, 2268, N'کریستیانو رونالدو بودی', N'پیتزا فروش میشدی', CAST(0x0000A7AA0011F1D1 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (65, 3271, N'دوست داری با دوست من که دوست داره با دوست تو دوست بشه دوست بشی ', N'دوست تو که دوست شده با دوست من دهنت رو صاف کنه؟', CAST(0x0000A7AC01034027 AS DateTime), 2, 1, 3)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (66, 2271, N'fgfgdfgdff', N'dfgdfgdfgdfg', CAST(0x0000A7AF00D09B20 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (67, 2271, N'dfgdfghdf', N'fhdfh', CAST(0x0000A7AF00D26A1A AS DateTime), 2, 1, 6)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (68, 3280, N'ممه بودی', N'غذای همه بودی', CAST(0x0000A7BB0020CFF0 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (69, 2266, N'hhhhhhh', N'tsdffhh', CAST(0x0000A7BB00D1D54E AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (70, 4286, N'test1', N'test2', CAST(0x0000A7C7010A0720 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (71, 4286, N'dfgdfgdfg', N'dfgdfgdfgdfg', CAST(0x0000A7C7011578BD AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (72, 4286, N'0628062a0628062a06280644', N'06440628062706280644062a06280644062a0628', CAST(0x0000A7C70119DE4B AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (73, 4286, N'jjjjjjjjjjjjjjjjjjjj', N'jjjjjjjjjjjjjjjjj', CAST(0x0000A7C7011D5730 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (74, 4288, N'نماینده مجلس بودی', N'باید مویگرینی رو بوس میکردی', CAST(0x0000A7C700CD3DA9 AS DateTime), 2, 1, 1)
INSERT [dbo].[CreatedQuestions] ([ID], [UserID], [What_if], [But], [RegisterDateTime], [VerifyStateID], [CategoryID], [QuestionBoostID]) VALUES (75, 4293, N'الان ۲۰ سالت بود', N'بیانسه رو باید میگرفتی', CAST(0x0000A7C80130FBFE AS DateTime), 2, 1, 1)
SET IDENTITY_INSERT [dbo].[CreatedQuestions] OFF
SET IDENTITY_INSERT [dbo].[CreatedQuestionsVerifyType] ON 

INSERT [dbo].[CreatedQuestionsVerifyType] ([ID], [VerifyName], [Description]) VALUES (1, N'?? ???', NULL)
INSERT [dbo].[CreatedQuestionsVerifyType] ([ID], [VerifyName], [Description]) VALUES (2, N'?? ??? ?????', NULL)
INSERT [dbo].[CreatedQuestionsVerifyType] ([ID], [VerifyName], [Description]) VALUES (3, N'????? ???', NULL)
SET IDENTITY_INSERT [dbo].[CreatedQuestionsVerifyType] OFF
SET IDENTITY_INSERT [dbo].[DailyRewards] ON 

INSERT [dbo].[DailyRewards] ([ID], [Name], [Icon], [Day], [Prize]) VALUES (1, N'روز اول', N'Data/images/1.png', 1, 1)
INSERT [dbo].[DailyRewards] ([ID], [Name], [Icon], [Day], [Prize]) VALUES (2, N'روز دوم', N'Data/images/2.png', 2, 2)
INSERT [dbo].[DailyRewards] ([ID], [Name], [Icon], [Day], [Prize]) VALUES (3, N'روز سوم', N'Data/Images/4.png', 3, 3)
INSERT [dbo].[DailyRewards] ([ID], [Name], [Icon], [Day], [Prize]) VALUES (4, N'روز چهارم', N'Data/Images/5.png', 4, 4)
INSERT [dbo].[DailyRewards] ([ID], [Name], [Icon], [Day], [Prize]) VALUES (6, N'روز پنجم', N'Data/Images/6.png', 5, 5)
INSERT [dbo].[DailyRewards] ([ID], [Name], [Icon], [Day], [Prize]) VALUES (7, N'روز سی ام', N'Data/Images/7.png', 30, 1000)
SET IDENTITY_INSERT [dbo].[DailyRewards] OFF
SET IDENTITY_INSERT [dbo].[DailyRewardsAchieved] ON 

INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (1, 1173, 1, CAST(0x0000A77A010AFA92 AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (2, 1173, 2, CAST(0x0000A77A010B213E AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (3, 1173, 3, CAST(0x0000A77A010B2AFC AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (4, 1173, 4, CAST(0x0000A77A010B2DA4 AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (5, 1173, 6, CAST(0x0000A77A010C55B0 AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (6, 1173, 7, CAST(0x0000A77A010C565D AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (7, 2222, 6, CAST(0x0000A77A012965E8 AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (8, 2222, 2, CAST(0x0000A77A0129725B AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (9, 2222, 3, CAST(0x0000A77A012975D6 AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (10, 2222, 4, CAST(0x0000A77A01297ADA AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (11, 2222, 1, CAST(0x0000A77A0129A6DA AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (12, 2228, 1, CAST(0x0000A77D00B52C5F AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (13, 1173, 1, CAST(0x0000A77D012F2907 AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (14, 2224, 1, CAST(0x0000A77E000F179F AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (15, 1173, 2, CAST(0x0000A77E015ECB64 AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (16, 1173, 4, CAST(0x0000A78000B49F32 AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (17, 1173, 3, CAST(0x0000A78100C74120 AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (18, 1173, 6, CAST(0x0000A78100C7420A AS DateTime))
INSERT [dbo].[DailyRewardsAchieved] ([ID], [UserID], [DailyRewardsID], [EarnedDate]) VALUES (19, 2222, 1, CAST(0x0000A782011CF5E8 AS DateTime))
SET IDENTITY_INSERT [dbo].[DailyRewardsAchieved] OFF
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
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (103, 2209, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76F00C2DF68 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (104, 2208, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76F010C1835 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (105, 1173, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A76F0115225A AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (106, 2213, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77000EE3265 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (107, 2204, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77200F9211F AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (108, 2204, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77200F9214D AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (109, 2208, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7720122E842 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (110, 2208, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77301018AAC AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (111, 2209, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77500DB8900 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (112, 2218, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7750113C50C AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (113, 2209, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77700BE3AD1 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (114, 2221, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77700C4E19C AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (115, 2223, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77700CA8CD1 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (116, 2223, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77700CAB53F AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (117, 2223, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77700CB80C0 AS DateTime))
GO
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (118, 2223, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77700CB922E AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (119, 2223, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77700CB9CF3 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (120, 2224, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77700D19568 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (121, 2224, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77700D2E262 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (122, 2224, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77700D378BB AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (123, 2224, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77700D4807F AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (124, 2224, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77700D4A255 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (125, 2208, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77700E08A7B AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (126, 2225, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A778013F6E9D AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (127, 2225, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A778013F715C AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (128, 2225, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A778014239C1 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (129, 2226, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77801679BBB AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (130, 2226, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A778016892CB AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (131, 2226, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A778016892D0 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (132, 2226, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A778016892EC AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (133, 2227, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A778016E979D AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (134, 2227, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A778016E9DBA AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (135, 2227, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A778017B6174 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (136, 2227, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77900014D7D AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (137, 2227, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7790002E5B9 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (138, 2226, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7790003FFDA AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (139, 2222, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A779011BC699 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (140, 2222, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A779012572FA AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (141, 2226, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77901598E30 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (142, 2226, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77901598E30 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (143, 2226, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77901598E30 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (144, 2226, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77901598E30 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (145, 2226, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77901598E30 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (146, 1173, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77A00FF32BE AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (147, 1173, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77A00FF32BE AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (148, 1173, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77A00FF32BE AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (149, 1173, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77A00FF32BE AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (150, 1173, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77A00FF32BE AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (151, 2226, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77A0143FBEB AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (152, 2226, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77A0143FBA9 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (153, 2203, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77B0001CD5C AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (154, 2224, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77B00132E1F AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (155, 2203, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77B00A9D181 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (156, 2228, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77C012C5205 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (157, 2228, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77C013BD6FA AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (158, 2228, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77C013BD6FA AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (159, 2228, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77C01438DD5 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (160, 2228, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77C017CD10D AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (161, 2228, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77D000B8721 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (162, 2222, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77D00F62FF3 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (163, 2222, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A77E00C4615B AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (164, 2222, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A78100BF31DA AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (165, 2222, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A781011FF7A9 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (166, 2222, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A78200C5B11E AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (167, 2253, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7A00130F4DE AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (168, 2253, 11, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7A100F3C4A4 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (169, 2253, 12, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7A300CB8EDE AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (170, 4291, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7C701136979 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (171, 4291, 3, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7C701136B2F AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (172, 4291, 4, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7C7011EF68D AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (173, 4291, 6, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7C7011EF959 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (174, 4291, 7, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7C70155D138 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (175, 4290, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7C800AEC3E9 AS DateTime))
INSERT [dbo].[DisplayedNotification] ([ID], [UserID], [NotificationID], [ExpireDate], [InsertDate]) VALUES (176, 4290, 9, CAST(0x0000A82700000000 AS DateTime), CAST(0x0000A7C800AEC41D AS DateTime))
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
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3185, 1173, 103, CAST(0x0000A77A010454E5 AS DateTime))
INSERT [dbo].[Favorite] ([ID], [UserID], [QuestionID], [SelectedDate]) VALUES (3186, 2222, 58, CAST(0x0000A78301182BC8 AS DateTime))
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
INSERT [dbo].[Level] ([LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (1, 100, 20, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[Level] ([LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (2, 120, 30, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[Level] ([LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (3, 140, 40, CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Level] ([LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (4, 150, 50, CAST(0x0000A70E00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime))
INSERT [dbo].[Level] ([LevelNumber], [Star], [ScoreCeil], [CreatedDate], [UpdatedDate]) VALUES (5, 160, 60, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A70D00000000 AS DateTime))
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
INSERT [dbo].[Manufacture] ([ID], [UserID], [QuestionID], [InsertedDate]) VALUES (250, 2177, 179, CAST(0x0000A73900000000 AS DateTime))
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
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (33, 2200, 4, 0, 200, CAST(0x0000A771014AA124 AS DateTime), N'WAoqYA-T6xmt7Uc7', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (34, 2208, 4, 0, 200, CAST(0x0000A77301024AC8 AS DateTime), N'_KD2FWtnd_uElQ-J', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (35, 2208, 4, 0, 200, CAST(0x0000A77301064EAD AS DateTime), N'u45ev-LSjYShEQe3', 0, 1, 0, NULL, NULL)
INSERT [dbo].[Order] ([ID], [UserID], [StoreID], [ClientPrice], [ServerPrice], [PurchasedDate], [PurchasedToken], [PurchaseState], [ConsumptionState], [IsFailed], [ErrorCode], [ErrorDescription]) VALUES (36, 2208, 4, 0, 200, CAST(0x0000A77700E12503 AS DateTime), N'6RDPaXS_byPNuvpZ', 0, 1, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[PersonalizedCharacter] ON 

INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75432, 2220, 1, 20, 20, 6)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75435, 2220, 2, 65, 65, 2)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75436, 2220, 3, 65, 65, 1)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75437, 2220, 4, 621, 621, 1)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75438, 2231, 1, 3201, 3201, 2)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75439, 2231, 2, 32, 32, 3)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75440, 2231, 3, 13, 13, 4)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75441, 2231, 4, 541, 541, 2)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75442, 2240, 1, 321, 321, 4)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75443, 2240, 2, 1, 1, 4)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75444, 2240, 4, 1, 1, 4)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75448, 2200, 1, 3546, 3546, 1)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75449, 2201, 1, 321, 321, 3)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75451, 2201, 2, 123, 123, 1)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75452, 2203, 1, 0, 0, 7)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75453, 2203, 3, 16, 16, 3)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75454, 2204, 4, 321, 321, 3)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75455, 2205, 1, 321, 321, 5)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75456, 2206, 3, 20, 20, 2)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75457, 2206, 1, 0, 0, 8)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75458, 2207, 1, 0, 0, 9)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75459, 2207, 2, 0, 0, 8)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75460, 2207, 3, 0, 0, 5)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75461, 2241, 1, 0, 0, 10)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75462, 2241, 2, 0, 0, 7)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75463, 2241, 3, 0, 0, 6)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75464, 2241, 4, 0, 0, 7)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75465, 2242, 1, 0, 0, 11)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75466, 2242, 2, 0, 0, 6)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75467, 2242, 3, 0, 0, 7)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75468, 2242, 4, 0, 0, 6)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75469, 2243, 1, 0, 0, 12)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75470, 2243, 2, 0, 0, 5)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75471, 2243, 3, 0, 0, 8)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75472, 2243, 4, 0, 0, 5)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75473, 2244, 1, 0, 0, 13)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75474, 2244, 2, 0, 0, 16)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75475, 2244, 3, 0, 0, 9)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75476, 2244, 4, 0, 0, 15)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75477, 2245, 1, 0, 0, 14)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75478, 2245, 2, 0, 0, 15)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75479, 2245, 3, 0, 0, 10)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75480, 2245, 4, 0, 0, 14)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75481, 2246, 1, 0, 0, 15)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75482, 2246, 2, 0, 0, 14)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75483, 2246, 3, 0, 0, 11)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75484, 2246, 4, 0, 0, 13)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75485, 2247, 1, 0, 0, 16)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75486, 2247, 2, 0, 0, 13)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75487, 2247, 3, 0, 0, 12)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75488, 2247, 4, 0, 0, 12)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75489, 2248, 1, 0, 0, 17)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75490, 2248, 2, 0, 0, 12)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75491, 2248, 3, 0, 0, 13)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75492, 2248, 4, 0, 0, 11)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75493, 2249, 1, 0, 0, 18)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75494, 2249, 2, 0, 0, 11)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75495, 2249, 3, 0, 0, 14)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75496, 2249, 4, 0, 0, 10)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75497, 2250, 1, 0, 0, 19)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75498, 2250, 2, 0, 0, 10)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75499, 2250, 3, 0, 0, 15)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75500, 2250, 4, 0, 0, 9)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75501, 2251, 1, 0, 0, 20)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75502, 2251, 2, 0, 0, 9)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75503, 2251, 3, 0, 0, 16)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75504, 2251, 4, 0, 0, 8)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75505, 2252, 1, 0, 0, 21)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75506, 2252, 2, 0, 0, 32)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75507, 2252, 3, 0, 0, 17)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75508, 2252, 4, 0, 0, 31)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75509, 2253, 1, 0, 0, 22)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75510, 2253, 2, 0, 0, 31)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75511, 2253, 3, 0, 0, 18)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75512, 2253, 4, 0, 0, 30)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75513, 2254, 1, 0, 0, 23)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75514, 2254, 2, 0, 0, 30)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75515, 2254, 3, 0, 0, 19)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75516, 2254, 4, 0, 0, 29)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75517, 2255, 1, 0, 0, 24)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75518, 2255, 2, 0, 0, 29)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75519, 2255, 3, 0, 0, 20)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75520, 2255, 4, 0, 0, 28)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75521, 2256, 1, 0, 0, 25)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75522, 2256, 2, 0, 0, 28)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75523, 2256, 3, 0, 0, 21)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75524, 2256, 4, 0, 0, 27)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75525, 2257, 1, 0, 0, 26)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75526, 2257, 2, 0, 0, 27)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75527, 2257, 3, 0, 0, 22)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75528, 2257, 4, 0, 0, 26)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75529, 2258, 1, 0, 0, 27)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75530, 2258, 2, 0, 0, 26)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75531, 2258, 3, 0, 0, 23)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75532, 2258, 4, 0, 0, 25)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75533, 2259, 1, 0, 0, 28)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75534, 2259, 2, 0, 0, 25)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75535, 2259, 3, 0, 0, 24)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75536, 2259, 4, 0, 0, 24)
GO
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75537, 2260, 1, 0, 0, 29)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75538, 2260, 2, 0, 0, 24)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75539, 2260, 3, 0, 0, 25)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75540, 2260, 4, 0, 0, 23)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75541, 2261, 1, 0, 0, 30)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75542, 2261, 2, 0, 0, 23)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75543, 2261, 3, 0, 0, 26)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75544, 2261, 4, 0, 0, 22)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75545, 2262, 1, 0, 0, 31)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75546, 2262, 2, 0, 0, 22)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75547, 2262, 3, 0, 0, 27)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75548, 2262, 4, 0, 0, 21)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75549, 2263, 1, 0, 0, 32)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75550, 2263, 2, 0, 0, 21)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75551, 2263, 3, 0, 0, 28)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75552, 2263, 4, 0, 0, 20)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75553, 2264, 1, 0, 0, 33)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75554, 2264, 2, 0, 0, 20)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75555, 2264, 3, 0, 0, 29)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75556, 2264, 4, 0, 0, 19)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75557, 2265, 1, 0, 0, 34)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75558, 2265, 2, 0, 0, 19)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75559, 2265, 3, 0, 0, 30)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75560, 2265, 4, 0, 0, 18)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75561, 2266, 1, 0, 0, 35)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75562, 2266, 2, 0, 0, 18)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75563, 2266, 3, 0, 0, 31)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75564, 2266, 4, 0, 0, 17)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75565, 2267, 1, 0, 0, 36)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75566, 2267, 2, 0, 0, 17)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75567, 2267, 3, 0, 0, 32)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75568, 2267, 4, 0, 0, 16)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75569, 2268, 1, 0, 0, 37)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75570, 2268, 2, 0, 0, 61)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75571, 2268, 3, 0, 0, 33)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75572, 2268, 4, 0, 0, 60)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75573, 2269, 1, 0, 0, 38)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75574, 2269, 2, 0, 0, 60)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75575, 2269, 3, 0, 0, 34)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75576, 2269, 4, 0, 0, 59)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75577, 2270, 1, 0, 0, 39)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75578, 2270, 2, 0, 0, 59)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75579, 2270, 3, 0, 0, 35)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75580, 2270, 4, 0, 0, 58)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75581, 2271, 1, 0, 0, 40)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75582, 2271, 2, 0, 0, 58)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75583, 2271, 3, 0, 0, 36)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (75584, 2271, 4, 0, 0, 57)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76581, 3271, 1, 0, 0, 41)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76582, 3271, 2, 0, 0, 57)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76583, 3271, 3, 0, 0, 37)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76584, 3271, 4, 0, 0, 56)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76585, 3272, 1, 0, 0, 42)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76586, 3272, 2, 0, 0, 56)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76587, 3272, 3, 0, 0, 38)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76588, 3272, 4, 0, 0, 55)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76589, 3273, 1, 0, 0, 43)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76590, 3273, 2, 0, 0, 55)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76591, 3273, 3, 0, 0, 39)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76592, 3273, 4, 0, 0, 54)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76593, 3274, 1, 0, 0, 44)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76594, 3274, 2, 0, 0, 54)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76595, 3274, 3, 0, 0, 40)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76596, 3274, 4, 0, 0, 53)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76597, 3275, 1, 0, 0, 45)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76598, 3275, 2, 0, 0, 53)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76599, 3275, 3, 0, 0, 41)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76600, 3275, 4, 0, 0, 52)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76601, 3276, 1, 0, 0, 46)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76602, 3276, 2, 0, 0, 52)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76603, 3276, 3, 0, 0, 42)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76604, 3276, 4, 0, 0, 51)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76605, 3277, 1, 0, 0, 47)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76606, 3277, 2, 0, 0, 51)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76607, 3277, 3, 0, 0, 43)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76608, 3277, 4, 0, 0, 50)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76609, 3278, 1, 0, 0, 48)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76610, 3278, 2, 0, 0, 50)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76611, 3278, 3, 0, 0, 44)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76612, 3278, 4, 0, 0, 49)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76613, 3279, 1, 0, 0, 49)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76614, 3279, 2, 0, 0, 49)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76615, 3279, 3, 0, 0, 45)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76616, 3279, 4, 0, 0, 48)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76617, 3280, 1, 0, 0, 50)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76618, 3280, 2, 0, 0, 48)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76619, 3280, 3, 0, 0, 46)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76620, 3280, 4, 0, 0, 47)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76621, 3281, 1, 0, 0, 51)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76622, 3281, 2, 0, 0, 47)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76623, 3281, 3, 0, 0, 47)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76624, 3281, 4, 0, 0, 46)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76625, 3282, 1, 0, 0, 52)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76626, 3282, 2, 0, 0, 46)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76627, 3282, 3, 0, 0, 48)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76628, 3282, 4, 0, 0, 45)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76629, 3283, 1, 0, 0, 53)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76630, 3283, 2, 0, 0, 45)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76631, 3283, 3, 0, 0, 49)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76632, 3283, 4, 0, 0, 44)
GO
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76633, 3284, 1, 0, 0, 54)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76634, 3284, 2, 0, 0, 44)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76635, 3284, 3, 0, 0, 50)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76636, 3284, 4, 0, 0, 43)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76637, 3285, 1, 0, 0, 55)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76638, 3285, 2, 0, 0, 43)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76639, 3285, 3, 0, 0, 51)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76640, 3285, 4, 0, 0, 42)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76641, 3286, 1, 0, 0, 56)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76642, 3286, 2, 0, 0, 42)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76643, 3286, 3, 0, 0, 52)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (76644, 3286, 4, 0, 0, 41)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77641, 4286, 1, 0, 0, 57)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77642, 4286, 2, 0, 0, 41)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77643, 4286, 3, 0, 0, 53)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77644, 4286, 4, 0, 0, 40)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77645, 4287, 1, 0, 0, 58)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77646, 4287, 2, 0, 0, 40)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77647, 4287, 3, 0, 0, 54)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77648, 4287, 4, 0, 0, 39)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77649, 4288, 1, 0, 0, 59)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77650, 4288, 2, 0, 0, 39)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77651, 4288, 3, 0, 0, 55)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77652, 4288, 4, 0, 0, 38)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77653, 4289, 1, 0, 0, 60)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77654, 4289, 2, 0, 0, 38)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77655, 4289, 3, 0, 0, 56)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77656, 4289, 4, 0, 0, 37)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77657, 4290, 1, 0, 0, 61)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77658, 4290, 2, 0, 0, 37)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77659, 4290, 3, 0, 0, 57)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77660, 4290, 4, 0, 0, 36)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77661, 4291, 1, 0, 0, 62)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77662, 4291, 2, 0, 0, 36)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77663, 4291, 3, 0, 0, 58)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77664, 4291, 4, 0, 0, 35)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77665, 4292, 1, 0, 0, 63)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77666, 4292, 2, 0, 0, 35)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77667, 4292, 3, 0, 0, 59)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77668, 4292, 4, 0, 0, 34)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77669, 4293, 1, 0, 0, 64)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77670, 4293, 2, 0, 0, 34)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77671, 4293, 3, 0, 0, 60)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77672, 4293, 4, 0, 0, 33)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77673, 4294, 1, 0, 0, 65)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77674, 4294, 2, 0, 0, 33)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77675, 4294, 3, 0, 0, 61)
INSERT [dbo].[PersonalizedCharacter] ([ID], [UserID], [CharacterID], [NewPointCount], [OldPointCount], [Rank]) VALUES (77676, 4294, 4, 0, 0, 32)
SET IDENTITY_INSERT [dbo].[PersonalizedCharacter] OFF
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
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (10, 2225, 1, CAST(0x0000A7780139656C AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (11, 2225, 7, CAST(0x0000A77801396C49 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (12, 2225, 1, CAST(0x0000A778013FF83D AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (13, 2225, 7, CAST(0x0000A77801400790 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (14, 2227, 1, CAST(0x0000A7780184C971 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (15, 2227, 7, CAST(0x0000A7780184D846 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (16, 2227, 7, CAST(0x0000A779017B2420 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (17, 2227, 1, CAST(0x0000A779017B275E AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (18, 2227, 1, CAST(0x0000A77A01660D38 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (19, 2227, 7, CAST(0x0000A77A01688E8C AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (20, 2227, 1, CAST(0x0000A77A01689304 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (21, 2227, 1, CAST(0x0000A77C0017521A AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (22, 2228, 1, CAST(0x0000A77D00EF00F6 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (23, 1173, 7, CAST(0x0000A77E01618836 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (24, 1173, 7, CAST(0x0000A78201766426 AS DateTime))
INSERT [dbo].[PresentedAdvert] ([ID], [UserID], [AdvertID], [InsertDate]) VALUES (25, 1173, 1, CAST(0x0000A782017667FA AS DateTime))
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
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1060, 5, 2208, CAST(0x0000A77301071C92 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1061, 1, 3280, CAST(0x0000A7B901297E77 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1062, 1, 3281, CAST(0x0000A7BB010657E5 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1063, 1, 3282, CAST(0x0000A7BB01415852 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1064, 1, 3283, CAST(0x0000A7BB014435F1 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1065, 1, 3284, CAST(0x0000A7BB014772CC AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1066, 1, 3285, CAST(0x0000A7BC00ECB11B AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (1067, 1, 3286, CAST(0x0000A7C40024CAB7 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (2067, 1, 4286, CAST(0x0000A7C4013EDF6F AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (2068, 1, 4287, CAST(0x0000A7C500C0283F AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (2069, 1, 4288, CAST(0x0000A7C5011954A6 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (2070, 1, 4289, CAST(0x0000A7C700CDA52F AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (2071, 1, 4290, CAST(0x0000A7C700D0119E AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (2072, 1, 4291, CAST(0x0000A7C700FCB4A1 AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (2073, 1, 4292, CAST(0x0000A7C80115EFDD AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (2074, 1, 4293, CAST(0x0000A7C8013078DB AS DateTime))
INSERT [dbo].[PurchaseAvatar] ([ID], [UserAvatarID], [UserID], [PurchasedDate]) VALUES (2075, 1, 4294, CAST(0x0000A7C80140C97B AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseAvatar] OFF
SET IDENTITY_INSERT [dbo].[PurchaseCategory] ON 

INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1061, 1158, 7, CAST(0x0000A73A000DA0B8 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1065, 1160, 5, CAST(0x0000A73A00D266EC AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1066, 1160, 14, CAST(0x0000A73A00D9BE16 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1067, 1160, 13, CAST(0x0000A73A00D9BFA0 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1068, 1160, 12, CAST(0x0000A73A00D9C1E5 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1069, 1160, 11, CAST(0x0000A73A00D9C4DC AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1070, 1160, 10, CAST(0x0000A73A00D9C747 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1071, 1160, 8, CAST(0x0000A73A00D9C9C9 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1072, 1160, 7, CAST(0x0000A73A00D9CBEE AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1073, 1160, 6, CAST(0x0000A73A00D9CDAB AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1074, 1160, 2, CAST(0x0000A73A00D9D90A AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1075, 1162, 6, CAST(0x0000A73A015647F4 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1076, 1162, 11, CAST(0x0000A73A0156E83A AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1077, 1162, 10, CAST(0x0000A73A01580235 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1086, 1173, 11, CAST(0x0000A74E0166965B AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1091, 1173, 8, CAST(0x0000A74F0162031B AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1093, 2181, 7, CAST(0x0000A757013BC251 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1094, 2181, 12, CAST(0x0000A757013BD492 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1095, 2184, 2, CAST(0x0000A759010821D5 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1096, 2184, 5, CAST(0x0000A7590108FC0A AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1097, 1170, 2, CAST(0x0000A75A0006F187 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1098, 1170, 6, CAST(0x0000A75A00070DFC AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1099, 2185, 14, CAST(0x0000A75A0100EAA7 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1100, 2185, 13, CAST(0x0000A75A0100EC7C AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1101, 2185, 12, CAST(0x0000A75A0100EDC4 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1102, 2185, 11, CAST(0x0000A75A0100EF1A AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1103, 2185, 10, CAST(0x0000A75A0100F0BC AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1104, 2185, 8, CAST(0x0000A75A0100F24A AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1105, 2185, 7, CAST(0x0000A75A0100F4C8 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1106, 2185, 6, CAST(0x0000A75A0100F74A AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1107, 2185, 5, CAST(0x0000A75A0100F87F AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1108, 2185, 2, CAST(0x0000A75A0100F9DF AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1109, 1173, 13, CAST(0x0000A75B01558B62 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1110, 1173, 14, CAST(0x0000A75B015590A8 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1111, 1173, 6, CAST(0x0000A75B01559414 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1112, 2183, 11, CAST(0x0000A75C00EC5FDC AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1113, 2189, 2, CAST(0x0000A75E00CF927A AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1114, 2189, 5, CAST(0x0000A75E00CF93A1 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1115, 2189, 6, CAST(0x0000A75E00CF956C AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1116, 2189, 7, CAST(0x0000A75E00CF982C AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1117, 2189, 8, CAST(0x0000A75E00CF99AC AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1118, 2189, 10, CAST(0x0000A75E00CF9B98 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1119, 2189, 11, CAST(0x0000A75E00CF9D47 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1120, 2189, 12, CAST(0x0000A75E00CF9F88 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1121, 2189, 13, CAST(0x0000A75E00CFA174 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1122, 2197, 2, CAST(0x0000A75F00D0FE81 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1123, 2201, 2, CAST(0x0000A76000CF07B6 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1124, 2201, 5, CAST(0x0000A76000CF0F91 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1125, 2201, 13, CAST(0x0000A76000CF1AA9 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1126, 2201, 14, CAST(0x0000A76000CF243D AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1127, 2201, 6, CAST(0x0000A76000CF32BD AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1128, 2201, 7, CAST(0x0000A76000CF38CD AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1129, 2201, 8, CAST(0x0000A76000CF4265 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1130, 2201, 10, CAST(0x0000A76000CF4B59 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1131, 2201, 11, CAST(0x0000A76000CF5432 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1132, 2197, 6, CAST(0x0000A76100C5F9FE AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1133, 2203, 2, CAST(0x0000A763015C4412 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1134, 2200, 6, CAST(0x0000A76301717FEF AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1135, 2200, 2, CAST(0x0000A76400D7BF90 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1136, 2200, 5, CAST(0x0000A76400D7C173 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1137, 2200, 7, CAST(0x0000A76400D7C424 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1138, 2200, 8, CAST(0x0000A76400D7C571 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1139, 2200, 10, CAST(0x0000A76400D7C766 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1140, 2200, 11, CAST(0x0000A76400D7C8F0 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1141, 2200, 12, CAST(0x0000A76400D7CAC0 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1142, 2209, 2, CAST(0x0000A765011A0EEA AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1143, 2212, 2, CAST(0x0000A76600B6D1E4 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1144, 2212, 6, CAST(0x0000A76600B85F6A AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1145, 2212, 7, CAST(0x0000A76600B860EF AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1146, 2209, 6, CAST(0x0000A76600D42A65 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1147, 1173, 7, CAST(0x0000A76600D43DE0 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1148, 1173, 5, CAST(0x0000A76600D442D7 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1151, 1173, 10, CAST(0x0000A76600D4492C AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1152, 2208, 6, CAST(0x0000A76E0108FFC4 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1153, 2218, 10, CAST(0x0000A77000FDD8FD AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1154, 2209, 10, CAST(0x0000A77300DDCEFE AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1155, 2209, 5, CAST(0x0000A77300EFBBE2 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1156, 2225, 8, CAST(0x0000A778013FDACB AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1157, 1173, 2, CAST(0x0000A77E00D5BEB5 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1158, 1173, 12, CAST(0x0000A77E015E9497 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1159, 3279, 2, CAST(0x0000A77A00000000 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1160, 3280, 1, CAST(0x0000A7B901297E77 AS DateTime), 18)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1161, 3281, 1, CAST(0x0000A7BB010657E5 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1162, 3282, 1, CAST(0x0000A7BB01415852 AS DateTime), 18)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1163, 3283, 1, CAST(0x0000A7BB014435F1 AS DateTime), 5)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1164, 3284, 1, CAST(0x0000A7BB014772CC AS DateTime), 18)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1165, 3285, 1, CAST(0x0000A7BC00ECB11B AS DateTime), 1)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1166, 2266, 2, CAST(0x0000A7BC0101AD91 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1167, 2266, 6, CAST(0x0000A7BC01038266 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1168, 2266, 5, CAST(0x0000A7BC0103A682 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1169, 2266, 8, CAST(0x0000A7BC0103B094 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1170, 2266, 7, CAST(0x0000A7BC01047035 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1171, 2266, 11, CAST(0x0000A7BC0105F40F AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1172, 2266, 10, CAST(0x0000A7BC0109E80F AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1173, 2266, 13, CAST(0x0000A7BC0109F49B AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1174, 3285, 2, CAST(0x0000A7BC013A6F06 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1175, 3285, 6, CAST(0x0000A7BC013ABAE7 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1176, 3285, 5, CAST(0x0000A7BC013B57CB AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1177, 3285, 12, CAST(0x0000A7BC013BAAB9 AS DateTime), 0)
GO
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1178, 3285, 10, CAST(0x0000A7BC013BACD6 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1179, 3285, 11, CAST(0x0000A7BC013BAF19 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1180, 3285, 13, CAST(0x0000A7BC013BB225 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1181, 3285, 14, CAST(0x0000A7BC013BB8B5 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1182, 3285, 7, CAST(0x0000A7BC013C0ECC AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1183, 3285, 8, CAST(0x0000A7BC013C3310 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1184, 2266, 12, CAST(0x0000A7BC01413A71 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (1185, 3286, 1, CAST(0x0000A7C40024CAB7 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (2185, 4286, 1, CAST(0x0000A7C4013EDF6E AS DateTime), 12)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (2186, 4287, 1, CAST(0x0000A7C500C0283F AS DateTime), 6)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (2187, 4288, 1, CAST(0x0000A7C5011954A6 AS DateTime), 1)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (2188, 4289, 1, CAST(0x0000A7C700CDA52F AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (2189, 4288, 2, CAST(0x0000A7C700CDDF81 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (2190, 4288, 5, CAST(0x0000A7C700CDE4C1 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (2191, 4290, 1, CAST(0x0000A7C700D0119E AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (2192, 4291, 1, CAST(0x0000A7C700FCB4A1 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (2193, 4292, 1, CAST(0x0000A7C80115EFDD AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (2194, 4293, 1, CAST(0x0000A7C8013078DB AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (2195, 4289, 2, CAST(0x0000A7C8013442B1 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (2196, 4289, 6, CAST(0x0000A7C8013463D9 AS DateTime), 0)
INSERT [dbo].[PurchaseCategory] ([ID], [UserID], [CategoryID], [PurchaseDate], [AnswerCount]) VALUES (2197, 4294, 1, CAST(0x0000A7C80140C97B AS DateTime), 0)
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
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1132, 2218, 5, CAST(0x0000A76F00BBEF5F AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1133, 2218, 9, CAST(0x0000A76F00BBF33C AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1134, 2218, 2, CAST(0x0000A76F00BBFE2A AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1135, 2218, 4, CAST(0x0000A76F00BC01AA AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1136, 2209, 4, CAST(0x0000A77300DDC715 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1137, 2209, 5, CAST(0x0000A77300EFB801 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1138, 2225, 5, CAST(0x0000A778014010B3 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1139, 2225, 6, CAST(0x0000A77801401584 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1140, 2227, 5, CAST(0x0000A77A0163CB93 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1141, 2227, 6, CAST(0x0000A77A0167DC59 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1142, 2224, 2, CAST(0x0000A77D00CB19FA AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1143, 3280, 1, CAST(0x0000A7B901297E77 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1144, 3281, 1, CAST(0x0000A7BB010657E5 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1145, 3282, 1, CAST(0x0000A7BB01415852 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1146, 3283, 1, CAST(0x0000A7BB014435F1 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1147, 3284, 1, CAST(0x0000A7BB014772CC AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1148, 3285, 1, CAST(0x0000A7BC00ECB11B AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (1149, 3286, 1, CAST(0x0000A7C40024CAB7 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (2149, 4286, 1, CAST(0x0000A7C4013EDF6E AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (2150, 4287, 1, CAST(0x0000A7C500C0283F AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (2151, 4288, 1, CAST(0x0000A7C5011954A6 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (2152, 4289, 1, CAST(0x0000A7C700CDA52F AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (2153, 4290, 1, CAST(0x0000A7C700D0119E AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (2154, 4291, 1, CAST(0x0000A7C700FCB4A1 AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (2155, 4292, 1, CAST(0x0000A7C80115EFDD AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (2156, 4293, 1, CAST(0x0000A7C8013078DB AS DateTime))
INSERT [dbo].[PurchaseTheme] ([ID], [UserID], [ThemeID], [PurchaseDate]) VALUES (2157, 4294, 1, CAST(0x0000A7C80140C97B AS DateTime))
SET IDENTITY_INSERT [dbo].[PurchaseTheme] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (1, N'هر روز یه پیتزا بهت میدادن', N'باید بدون سس میخوردی', 1, 66, 17, 0, 1, 75, CAST(0x0000A6EE00AD2C08 AS DateTime), CAST(0x0000A6EE00AD2C08 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (2, N'از هر مغازه ای که میخواستی، رایگان لباس میخریدی', N'مجبور بودی مثل سوپر من، شرتت رو رو شلوار میپوشیدی', 10, 37, 4, 2, 0, 20, CAST(0x0000A80800AD2C08 AS DateTime), CAST(0x0000A80800AD2C08 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (3, N'هیچوقت گرسنه ات نمیشد', N'رنگت مثل درختا سبز بود و باید روزی 1 ساعت پاهات رو تو زمین فرو میکردی', 11, 37, 8, 0, 1, 30, CAST(0x0000A6F700000000 AS DateTime), CAST(0x0000A6F700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (4, N'کنکور رو کلا حذف میکردن', N'دانشگاه ها تفکیک جنسیتی میشدن', 11, 38, 4, 2, 0, 40, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (5, N'وقتی شیر آب رو باز میکردی ازش پول میومد', N'برای بدست اوردن آب باید روزی هشت ساعت کار میکردی', 11, 39, 3, 1, 0, 50, CAST(0x0000A81C00000000 AS DateTime), CAST(0x0000A81C00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (6, N'یه خونه رایگان بهت میدادن', N'10 سال از عمرت کم میشد', 11, 42, 4, 1, 0, 60, CAST(0x0000A7FF00000000 AS DateTime), CAST(0x0000A7FF00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (7, N'به جای اینکه یارانه بدن، همه ماهی 10 هزار تومن هم میدادن', N'دیگه کسی اختلاس و دزدی نمیکرد', 8, 37, 8, 1, 0, 70, CAST(0x0000A80800000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (8, N'پولداری میشدی', N'باید با کسی که کنارت نشسته ازدواج میکردی', 13, 43, 6, 2, 0, 80, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (9, N'یارانت دوبرابر میشد ', N'باید به غرضی رای میدادی', 6, 53, 13, 1, 0, 90, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1, NULL, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (10, N'حقوقت سه میلیون بود ', N'نصفش رو باید پول ایزی لایف میدادی', 10, 41, 3, 2, 0, 91, CAST(0x0000A80800000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (11, N'یه شغل با آبرو داشتی', N'یه زن بی آبرو گیرت میومد', 13, 42, 4, 1, 0, 92, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (12, N'رتبه یک کنکور میشدی', N'باید بعدش رفتگر می شدی', 11, 52, 9, 3, 1, 93, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (15, N'سال نو آیفون هدیه بگیری', N'ولی تا آخر سال اجازه نداشتی روش برنامه بریزی', 11, 12, 1, 0, 0, 40, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A81C00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (16, N'روحانی رئیس جمهور بشه', N'دیگه قید انرژی هسته ای رو بزنیم', 7, 13, 4, 0, 0, 2, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A80800000000 AS DateTime), 1, NULL, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (17, N'هر کتابی رو که میخواستی به مغزت تزریق میکردی', N'کور میشدی', 11, 20, 14, 12, 10, 50, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (18, N'اندازه بیل گیتس پول داشتی', N'یه دست و یه پا نداشتی', 8, 25, 32, 11, 10, 60, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (19, N'زورت ده برابر میشد', N'عقلت نصف میشد', 13, 22, 15, 12, 3, 55, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (20, N'هر چه قدر میخواستی میخوردی و چاق نمیشدی', N'روزی 10 بار باید دستشویی میرفتی', 13, 29, 14, 10, 10, 70, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (21, N'میتونستی ذهن بقیه رو بخونی', N'بقیه هم میتونستن ذهنت رو بخونن', 11, 20, 27, 3, 5, 39, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (22, N'میتونستی زیر آب هم نفس بکشی', N'برای اینکه زنده بمونی باید همیشه بدنت رو خیس نگه میداشتی', 11, 40, 13, 7, 6, 60, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (23, N'پدر و مادرت رو خودت انتخاب میکردی', N'40 سال بشتر عمر نمیکردی', 11, 20, 20, 18, 17, 45, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (24, N'یارانه هر نفر 500 هزار تومن میشد', N'ترامپ رئیس جمهور ایران میشد', 6, 29, 19, 10, 10, 65, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1, NULL, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (25, N'تو 30 سالگی یک میلیارد برنده میشدی', N'باید خرج ساخت سرویس بهداشتی میکردی', 1, 13, 28, 0, 1, 20, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0, 1, NULL, 2)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (26, N'تا ابد زنده بودی', N'دیگه هیچکس باهات حرف نمیزد', 11, 22, 3, 0, 0, 80, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (27, N'میتونستی تو رویاهات زندگی کنی', N'دیگه هیچوقت نمیتونستی ازشون خارج بشی', 11, 14, 3, 1, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (28, N'دیگه سرما نمیخوردی', N'همیشه  کفشات لنگه به لنگه بودن', 13, 14, 3, 1, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (29, N'هیچوقت چاق نمیشدی', N'هیچوقت هم گشنت نمیشد', 11, 16, 1, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (30, N'برای 25 سال ماهی 100 میلیون درآمد داشتی', N'برای 5 سال نمیتونستی لباسات را حتی برای قضای حاجت در بیاری', 10, 6, 3, 0, 0, 60, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (31, N'تو زندگی به هر چی که میخواستی  میرسیدی', N'دیگه هیچوقت نمیرسیدی خانواده و دوستات رو بینی', 11, 60, 11, 5, 0, 99, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1, NULL, 2)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (32, N'به جای بتمن بودی', N'بهترین دوستت جای جوکر بود', 14, 13, 1, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (34, N'هفته ای یه بار قضای حاجت میکردی', N'ولی یه یارش به اندازه 10 بار پر سر و صدا تر بود', 10, 39, 11, 0, 0, 99, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (35, N'هر کی رو میخواستی عاشقت میشد', N'هر کی هم میخواستت عاشقش میشدی', 11, 14, 2, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (36, N'چند برابر خوشگل تر میشدی', N'ولی آخر هفته ها جنسیتت عوض میشد', 13, 14, 1, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (37, N'یه همزاد داشتی که هر چی میگفتی رو انجام میداد', N'عاشق اونی میشد که میخوای باهاش عروسی کنی', 1, 19, 22, 1, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1, NULL, 4)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (38, N'جای رستم بودی', N'دوستت جای اسفندیار بود', 14, 24, 6, 1, 0, 80, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (39, N'هر چی میگفتی هیج عواقب بدی برات نداشت', N'ولی لهجه خیلی آبرو ریز داشتی', 13, 11, 2, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (40, N'هیچوقت تو زندگیت شکست نمیخوردی', N'هیچوقت هم عاشق نمیشدی', 11, 12, 2, 0, 0, 70, CAST(0x0000A81F00000000 AS DateTime), CAST(0x0000A81F00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (41, N'صدای باد معده نصف میشد', N'پخش بوش 2 برابر بود', 10, 21, 4, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (42, N'دستگاه پرینتی داشتی که پول واقعی چاپ میکرد', N'تا آخر عمر باید دامن میپوشیدی و دیگه نمیتونستی زیرش شورت بپوشی', 13, 21, 3, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (43, N'میتونستی 5 نفر رو به همراه خودت میلیاردر کنی', N'همزمان به دلیل کار تو 5 نفر هم به زمین گرم میخوردن', 11, 19, 7, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (44, N'قالی پرنده داشتی', N'هیچوقت نمیتونستی ازش پیاده شی', 11, 19, 6, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (45, N'کت جادویی داشتی و هر موقع اراده میکردی یک میلیون از جیبش بر میداشتی', N'هر موقع که یک میلیونش رو خرج میکردی یک نفر توی اون گوشه دنیا میمرد', 11, 10, 3, 0, 0, 70, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (46, N'خوشگل ترین آدم دنیا بودی', N'نمیتونستی با کسی همبستر بشی', 10, 31, 8, 2, 0, 90, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (47, N'خونت همیشه تمیز بود و همه کارا خونه خود به خود انجام میشد', N'همیشه باید با کفشهای کثیف اینور و اونور میرفتی', 11, 26, 8, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (48, N'شخصیتهای کارتونی واقعی بودن', N'آدما تخیلی بودن', 14, 27, 7, 0, 1, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (49, N'هر عکسی که تو ایستاگرام پست میکردی 1 میلیون لایک میخورد', N' تو همشون چشات چپ بود و انگشتت تو دماقت بود', 10, 34, 7, 0, 0, 90, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (50, N'همیشه هیکلت رو فرم بود', N'به جای روزی 1 ساعت ورزش، روزی 60 نفر رو ماچ میکردی', 10, 49, 6, 4, 0, 100, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (51, N'10 تا سکه میگرفتی', N'هر چی که توی چی میشد... جواب دادی واقعا اتفاق میاق میفتاد', 1, 32, 13, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 1, 1, NULL, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (52, N'سی تا سکه بهت میدادیم تا اینکه بتونی یک بسته رو بخری', N'باید پاسخ مثبت بدی و ما به فروشگاه وصلت کنیم', 1, 11, 6, 0, 0, 60, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (53, N'سه تا زبان جدید را مثل آب خوردن یاد میگرفتی', N'زبان مادریت رو کلا فراموش میکردی', 1, 45, 23, 2, 1, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 5)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (54, N'جذابیت چند برابر میشد', N'عقلت نصف میشد', 13, 25, 6, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (55, N'احتیاج به خواب نداشتی', N'20 سال زودتر میمردی', 1, 37, 26, 1, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 10)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (56, N'ساعت جادویی داشتی و میتونستی زمان رو متوقف کنی', N'هر موقع زمان رو متوقف میکردی یک نفر سکته میزد', 1, 34, 27, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (57, N'هر موقع خوشحال بودی هوا آفتابی میشد', N'هر موقع هم که ناراحت بودی هوا بارونی میشد', 1, 41, 17, 2, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 2)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (58, N'دیگه هیچ جنگی روی زمین نبود', N'اینترنت هم  وجود نداشت', 1, 61, 40, 6, 0, 90, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 15)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (59, N'هر کسی رو که اراده میکردی بهترین دوستت میشد', N'فقط و فقط یک روز میتونستید با هم باشید', 1, 16, 22, 0, 0, 70, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (60, N'کچل میشدی', N'روزی 100 هزار تومن بهت میدادن', 13, 7, 3, 0, 0, 70, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (61, N'همه مردم سیاه بودن', N'تو سفید بودی', 11, 20, 5, 0, 0, 80, CAST(0x0000A83D00000000 AS DateTime), CAST(0x0000A83D00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (62, N'اراده کنی و بری به 50 سال دیگه', N'20 سال از عمرت کم میشد', 11, 7, 3, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (63, N'میتونستی یه هفته تمام با یکی از معروف ترین بازیگرا باشی', N'هر جا که با هم میرفتید خبرنگرا ولتون نمیکردن', 11, 9, 4, 1, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1, NULL, 2)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (64, N'قدرتمند ترین آدم دنیا میشدی', N'برای اینکه مقامت رو از دست ندی روزی 1000 نفر رو میکشتی', 11, 28, 12, 0, 0, 99, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (65, N'میتونستی همسرت رو هر جوری که دوست داشتی  چه ظاهری چه باطنی تغییرش بدی', N'اونم میتونست هر جوری که دوست داشت تغییرت بده', 11, 11, 2, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (66, N'هر جایی که میرفتی بهترین دما و آب و هوا رو داشت', N'ولی توی رخت خوابت غندیل میبستی', 11, 8, 2, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (67, N'از این به بعد به همه غذاها، فیلمها، کتابهاو بازیها دسترسی رایگان داشتی', N'به مدت 10 سال نمیتونستی از خونت بیرون بری', 11, 11, 3, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (68, N'میتونستی یکی از شخصیتهای دنیای غیر واقعی بشی', N'بعدش دیگه نمیتونستی به حالت قبلیت برگردی', 14, 10, 4, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (69, N'ببینی توی یکسال آینده چی قراره اتفاق بیفته', N'بعدش به ازای هر سال که میگذره خاطرات اون سال و سال قبلش رو فراموش کنی', 1, 13, 22, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1, NULL, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (70, N'هر لباسی رو از هر فروشگاهی که میخواستی میتونستی بخری', N'همیشه کفشات و جورابات لنگه به لنگه بودن', 13, 6, 2, 0, 0, 70, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (72, N'هر ماشینی رو که دوست داشتی میتونستی بخری', N'هفته ای یکبار باید باهاش جنازه جا به جا میکردی', 1, 18, 24, 0, 0, 80, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (74, N'راننده شخصی داشتی که هر موقع که میخواستی هر جایی که میگفتی میبردت', N'با ژیان میرسوندت', 1, 35, 39, 0, 0, 90, CAST(0x0000A71A00000000 AS DateTime), CAST(0x0000A71A00000000 AS DateTime), 0, 1, NULL, 5)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (76, N'میدونستی کی و چجوری میمیری', N'نمیتونستی هیچ کاری برای جلوگیری ازش بکنی', 1, 31, 34, 1, 0, 90, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1, NULL, 2)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (78, N'حقوقت 4 برابر میشد', N'قدت نصف میشد', 8, 16, 7, 1, 0, 90, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (79, N'روزی 100 هزار تومن بهت میدادن', N'سالی 1 سانت قدت کوتاه تر میشد', 8, 13, 3, 0, 0, 80, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (80, N'میتونستی پادشاه یا ملکه هر کشوری که میخواستی بشی', N'دیگه نمیتونستی زندگی شادی داشته باشی', 11, 11, 3, 0, 0, 80, CAST(0x0000A71C00000000 AS DateTime), CAST(0x0000A71C00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (81, N'25سال کمتر عمر میکردی', N'همیشه سالم و سلامت بودی', 11, 10, 3, 0, 0, 80, CAST(0x0000A71D00000000 AS DateTime), CAST(0x0000A71D00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (82, N'فضاییها واقعی بودن و به زمین میومدن', N'با آدما میتونستن عروسی کنن و بچه هاشون آدم فضایی میشدن', 14, 6, 3, 0, 0, 70, CAST(0x0000A71D00000000 AS DateTime), CAST(0x0000A71D00000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (83, N'از زمان مردنت مطلع میشدی', N'اگه به کسی در موردش میگفتی همون موقع سوسک میشدی', 13, 13, 2, 0, 0, 80, CAST(0x0000A71D00000000 AS DateTime), CAST(0x0000A71D00000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (84, N'توی بهشت بودی و هر کاری دلت میخواست میتونستی بکنی', N'نباید به درخت سیب دست میزدی و ازش میخوردی', 11, 8, 2, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (85, N'یه درخت داشتی که به جای میوه پول میداد', N'هر موقع پولش رو میچیندی به اندازه مبلغی که بر میداشتی به همون تعداد درختای دیگه خشک میشدن', 14, 5, 3, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (86, N'یه مرغ داشتی که تخم طلا میداد', N'همه دنبال این بودن که ازت بدزدنش', 11, 5, 2, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (87, N'همیشه زندگیت رو به راه بود', N'هر روزبه 10 نفر کمک میکردی', 8, 15, 2, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (88, N'تمام سختیها و بدبختیهای زندگیت تموم میشد', N'باید به بهترین دوستت میدادیشون', 11, 5, 5, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (89, N'میتونستی به گذشته برگردی ', N'نمیتونستی با اونایی که میشناختی حرف بزنی', 11, 6, 3, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (90, N'موفقیت بچه هات تضمین میشد', N'باید حتما 3 تا بچه داشتی و اسمشون رو سوای اینکه پسرن یا دختر میذاشتی اتل و متل و توتوله', 13, 12, 3, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (91, N'همه از زندگیشون لذت میبردن و هیچکس فقیر نبود', N'برای اینکه اوضاع همه خوب باشه تو باید سختی میکشیدی', 11, 11, 3, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (92, N'هر روز خوشمزه ترین غذاها رو میخوردی', N'یه روز در میون اسهال بودی', 10, 10, 4, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (94, N'همه غذاهات توسط آقای گلریز سرو میشد', N'همیشه باید با دست غذا میخوردی', 13, 7, 4, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (95, N'هر موقع که اراده میکردی میتونستی جنسیت رو عوض کنی', N'هر بار که اینکار رو میکردی یکم زشتتر میشدی', 13, 6, 5, 1, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (96, N'همیشه خدا خوشحال بودی', N'عقلت معیوب بود', 11, 6, 6, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (97, N'یه ویلای لوکس بغل ساحل داشتی', N'به محض اینکه ازش خارج میشدی خرابش میکردن', 11, 6, 6, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (98, N'میتونستی مثل هر کسی که دوست داشتی بشی', N'خانوادت و دوستات دیگه نمیشناختنت', 11, 8, 4, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (99, N'ستاره یه فیلم میشدی', N'فیلمش مستهجن بود', 7, 8, 10, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (100, N'قدت 10سانت بلندتر میشد', N'دستات 5 سانت کوتاه میشدن', 11, 7, 5, 0, 0, 80, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (101, N'ثروتنمندترین آدم دنیا میشدی', N'هر کسی رو که میشناختی میمرد', 11, 3, 3, 0, 0, 70, CAST(0x0000A72100000000 AS DateTime), CAST(0x0000A72100000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (102, N'با شعبده بازی گربه ظاهر کنی', N'روز بعد گربهایی که ظاهر میکردی میمردن', 11, 0, 1, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (103, N'هر روز 2 ساعت زودتر به محل کارت یا مدرسه و دانشگاه میرفتی', N'یه روز بیشتر تو هفته تعطیلی داشتی', 11, 1, 1, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (104, N'میتونستی هر اندازه که دلت بخواد بدون اینکه اثری رو سلامتیت بذاره بستنی بخوری', N'مجبور بودی تا آخر عمرت تو پارکها بستنی بفروشی', 11, 1, 0, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (105, N'آلت تناسلی نداشتی', N'100 تا همسر داشتی', 7, 1, 5, 0, 1, 90, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (106, N'خونه رویاهات رو داشتی و هر چی که آرزو داتشی درونش بود', N'دیگه نمیتونستی ازش خارج بشی', 11, 0, 1, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (107, N'5 تا سکه رایگان میگرفتی', N'یک ویدئو چند ثانیه ای درباره ی یک چیز باحال میدیدی', 11, 1, 0, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 1, 1, NULL, 0)
GO
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (108, N'هر کلیپی که روی یوتیوب میذاشتی جز پر بازدیدترینها میشسد', N'تو همشون 10 دقیقه گریه و زاری میکردی', 11, 1, 2, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (109, N'میتونستی انتخاب کنی به سیاره زنان ونوسی یا مردان مریخی بری', N'دیگه بعدش نمیتونستی اون سیاره رو ترک کنی', 11, 0, 1, 0, 0, 70, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (110, N'میتونستی با نوک انگشتت لوازم الکترونیکی رو خاموش و روشن کنی', N'یک بار در ماه برای 24 ساعت باسنت رو بزنی به شارژ ', 10, 0, 1, 0, 0, 80, CAST(0x0000A72B00000000 AS DateTime), CAST(0x0000A72B00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (111, N'دکترای فیزیک هسته ای داشتی', N'شغلت تو سازمان انرژی اتمی ساخت آبمیوه گیر بود', 6, 6, 27, 12, 1, 100, CAST(0x0000A72F00000000 AS DateTime), CAST(0x0000A72F00000000 AS DateTime), 0, 1, NULL, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (112, N'شبا خوشگل بودی', N'روزا باهوش بودی', 7, 5, 1, 0, 0, 80, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (113, N'سالی 2 بار سرما میخوردی', N'موقعی که میخوردی بد میخوردی', 11, 1, 0, 0, 0, 70, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (114, N'مجبور بودی برای 10 سال تو بیابون زندگی کنی', N'وقتی که برمیگشتی 10 میلیارد بهت میدادن', 1, 14, 26, 1, 0, 80, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1, NULL, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (115, N'یک میلیارد بهت میدادن', N'برای اینکه ازت نگیرن باید روزی 100 بار ازشون تشکر میکردی', 13, 0, 1, 0, 0, 70, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (116, N'میتونستی دو برابر سریعتر بخونی', N'مجبور بودی دوبرابر هم تند تر حرف بزنی', 1, 4, 20, 0, 0, 70, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1, NULL, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (117, N'میتونستی یه کار خیلی خلاف انجام بدی', N'هیچکس هم متوجه نمیشد', 1, 14, 24, 3, 0, 80, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1, NULL, 4)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (118, N'دیگه لازم نبود هر شب بخوابی', N'مثل خرسها سالی یه بار به خواب زمستونی میرفتی', 1, 8, 16, 1, 0, 70, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1, NULL, 1)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (119, N'مذهبی که داری تو دنیا همه گیر میشد', N'برای اینکه همه گیر بشه باید تا آخر عمرت ملا میشدی', 1, 8, 15, 1, 2, 70, CAST(0x0000A73500000000 AS DateTime), CAST(0x0000A73500000000 AS DateTime), 0, 1, NULL, 3)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (120, N'جای یکی از خواننده‌های معروف بشی', N'باید بین شهرام شپره و شماعی زاده یکی رو انتخاب می‌کردی', 13, 0, 0, 0, 0, 60, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (121, N'یه شهر دریایی داشتی', N'دیگه نمی‌تونستی ازش خارج بشی', 11, 0, 0, 0, 0, 70, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (122, N'می‌تونستی آب دریا رو دوغ کنی', N'به جای آب باید دوغ می‌خوردی', 1, 0, 0, 0, 0, 70, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (123, N'بهترین دوست بیل گیتس می‌شدی', N'بهترین دوست خودت رو از دست می‌دادی', 11, 0, 0, 0, 0, 70, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (124, N'می‌تونستی از حزب رقیبت تو انتخابات شرکت کنی و رای بیاری', N'مردم دیگه بعدش قبولت نداشتن', 6, 0, 0, 0, 0, 80, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (125, N'خوش اخلاق‌ترین همسر دنیا رو داشتی', N'قدش نیم متر کوتاه تر از خودت بود', 11, 0, 0, 0, 0, 80, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (126, N'همه لباسات مارک بودن و لوکس', N'نباید دیگه شورت پات می‌کردی', 13, 0, 0, 0, 0, 70, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (127, N'هر چیزی که بهش فکر می‌کردی اتفاق میفتاد', N'هر کار بدی که می‌شد همه از چشم تو میدیدن', 11, 0, 0, 0, 0, 80, CAST(0x0000A74B00000000 AS DateTime), CAST(0x0000A74B00000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (128, N'برنده یک سفر دو نفره به هر کجا که دلت می‌خواست می‌شدی و همه هزینه‌هاش از قبل برای 2 ماه پرداخت شده بود', N'بعدش برای 10 سال نمی‌تونستی کشورت رو ترک کنی', 11, 0, 0, 0, 0, 80, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (129, N'می‌تونستی رهبر کره شمالی باشی', N'همونطور که الان اداره میشه باید حکومت می‌کردی', 11, 0, 0, 0, 0, 80, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (130, N'آخرین نفری رو که ماچ کردی دیوونه وار عاشقت می‌شد و دیگه تا آخر عمر ولت نمی‌کرد', N'اگر ظرف 24 ساعت دیگه مجدد ماچش نکنی تا آخر عمر تنها می‌موندی', 11, 0, 0, 0, 0, 80, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (131, N'100 میلیون تومن بهت می‌دادن', N'تا آخر عمر دیگه نیابد هیچ فیلمی می‌دیدی', 11, 0, 0, 0, 0, 90, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (132, N'بال داشتی و می‌تونستی پرواز کنی', N'طول هر بالت 2 متر بود ', 14, 0, 0, 0, 0, 60, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (133, N'دو برابر با هوش‌تر می‌شدی', N'دیگه به زیبایی قبل نبودی', 11, 0, 0, 0, 0, 60, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (134, N'زمانی که حضرت نوح خواست کشتی بسازه اونجا بودی', N'یکی از اونایی بودی که مسخره می‌کردی', 14, 0, 0, 0, 0, 80, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (135, N'هر روز 100 هزار تومن روی زمین پیدا می‌کردی', N'هر موقع می‌خواستی بر داری لیز می‌خوردی و زمین میفتادی', 13, 0, 0, 0, 0, 70, CAST(0x0000A7E400000000 AS DateTime), CAST(0x0000A7E400000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (136, N'می‌تونستی به هر کجای دنیا که بخوای تله پورت بشی', N'هر موقع اینکار رو می‌کردی توی مقصد یه نفر دیگه هم همراهت ظاهر می‌شد', 14, 0, 0, 0, 0, 70, CAST(0x0000A80200000000 AS DateTime), CAST(0x0000A80200000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (137, N'می‌تونستی هر کسی که مریضه رو خوب کنی', N'باید پیشش بمونی و ترکش نکنی مگر نه دوباره مریض میشه', 11, 0, 0, 0, 0, 80, CAST(0x0000A80200000000 AS DateTime), CAST(0x0000A80200000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (138, N'اسم و سن و مشخصات هر کی رو می‌دیدی بدونی', N'هیچکس اسم و مشخصات تو رو به یاد نمیاورد', 11, 0, 0, 0, 0, 70, CAST(0x0000A80200000000 AS DateTime), CAST(0x0000A80200000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (139, N'با همسر رویاهات عروسی می‌کردی', N'هیچوقت از شغلت راضی نبودی', 11, 0, 0, 0, 0, 95, CAST(0x0000A80200000000 AS DateTime), CAST(0x0000A80200000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (140, N' 100 سال بیشتر عمر می‌کردی اونم مثل یه جوون 25 ساله', N'موقع مرگ زنده زنده می‌سوختی', 11, 0, 0, 0, 0, 80, CAST(0x0000A80200000000 AS DateTime), CAST(0x0000A80200000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (141, N'توی زندگی مشترک همسرت  لذت بیشتری از وقایع می‌برد', N' تو نصف اون از زندگی با اون لذت می‌بردی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (142, N'می‌تونستی هر کسی رو برای هر کاری قانع کنی تا انجامش بده', N'هر کسی هم می‌تونست تو رو برای انجام هر کاری قانع کنه', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (143, N'هر چیزی رو که دوست داشتی بتونی بخوری', N'فقط توی چین این اجازه رو داشتی', 13, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (144, N'پلاستیک مزه شکلات بده، کاغذ مزه سیب زمینی بده و بقیه اشیا خوراکی باشن', N'غذاهای عادی دیگه سمی بودن', 11, 0, 0, 0, 0, 60, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (145, N'خیلی مشهور می‌شدی', N'نصف دندونات می‌ریخت', 13, 0, 0, 0, 0, 60, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (146, N'قدرتمندترین انسان روی زمین می‌شدی', N'توان جنسی دیگه نداشتی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (147, N'قهرمان ملی می‌شدی و خیلی از خیابون‌ها و اماکن رو به اسم تو میذاشتن', N'توی 40 سالگی می‌مردی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (148, N'توی 1000 سال دیگه زندگی کنی', N'تا اون موقع باید منجمد می‌شدی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (149, N'باد معدت بوی شکلات می‌داد', N'ولی اگه کسی 2 بار ازش تنفس عمیق می‌کرد مسموم میشد', 10, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (150, N'روی سرت یه سیب میذاشتن و با شمشیر سیب رو از وسط نصف میکردن', N'اگر اشتباه می‌کردن و  تو را بجاش نصف می‌کردن 1 میلیارد به خانوادت می‌دادن', 11, 0, 0, 0, 0, 60, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (151, N'هر موقعی که دلت می‌خواست می‌تونستی نا مرئی بشی', N'هر موقع گشنه می‌شدی اون جایی که نباید دیده می‌شد مرئی می‌شد', 10, 0, 0, 0, 0, 80, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (152, N'موقعی که بقیه خوابن بتونی ببینی چی خواب می‌بینن', N'بقیه هم می‌تونستن ببین چی خواب می‌بینی موقعی که خوابی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (153, N'توی یه فیلم هالیوودی بازی کنی و 1 میلیارد بگیری', N'اون فیلم به خاطر بازی داغون تو بدترین فیلم تاریخ هالیوود می‌شد', 13, 0, 0, 0, 0, 80, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (154, N'نشون بدی که این بازی رو دوست داری و ازش خوشت اومده', N'برای این کار پیج ایستاگرام ما رو ... می‌کردی ما هم 10 تا سکه بهت می‌دادیم', 1, 0, 0, 0, 0, 60, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (155, N'همه بهت اطمینان 100 درصد داشتن', N'نمی‌تونستی بهشون حقیقت رو بگی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (156, N'شنوایی فوق العاده‌ای داشتی', N'هر شب یه صداهایی رو می‌شنیدی که نباید می‌شنیدی', 14, 0, 0, 0, 0, 90, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (157, N'نیمه گمشدت رو پیدا می‌کردی', N'برای اینکه باهاش ازدواج کنی باید 5 سال صبر می‌کردی تا از زندان در بیاد', 11, 0, 0, 0, 0, 80, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (158, N'همیشه آخرین پرچمدار تلفن هوشمند اندرویدی رو داشتی', N'دیگه هیچ وقت نمی‌تونستی از اپل استفاده کنی', 11, 0, 0, 0, 0, 80, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (159, N'پوکمون واقعی بود', N'بقیه حیوونا خیالی بودن', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (160, N'خدا بهت امر می‌کرد هر کی رو که بهش اعتقاد نداره بکشی', N'بهشت رفتنت قطعی می‌شد', 11, 0, 0, 0, 0, 80, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (161, N'همیشه تو زندگی خوشحال بودی', N'نمی‌تونستی بقیه رو تو خوشحالیت سهیم کنی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (162, N'می‌تونستی زمان رو متوقف کنی', N'هر موقع که زمان متوقف می‌شد خودت رو خیس می‌کردی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (163, N'می‌تونستی ذهن مردم رو بخونی', N'هر موقع که داشتی اینکار رو می‌کردی ول می‌دادی و تا موقعی که ذهن خوندنت ادامه داشت طول می‌کشید', 10, 0, 0, 0, 0, 70, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (164, N'تا آخر عمر اینترنت رایگان داشتی', N'مجبور بودی از اینترنت اکسپلولر 6 به عنوان مرورگر استفاده کنی', 11, 0, 0, 0, 0, 80, CAST(0x0000A75700000000 AS DateTime), CAST(0x0000A75700000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (165, N' که دوست من با دوست تو دوست بشه', N'دوست تو که دوست داره با دوست من دوست بشه 10 تا سکه بگیره', 8, 0, 0, 0, 0, 70, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (166, N'یه اسکنر سه بعدی داشتی که اشیا رو با دقت تمام چاپ می‌کرد', N'اگه باهاش پول چاپ می‌کردی دستگاه می‌سوخت', 11, 0, 0, 0, 0, 60, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (167, N'توی سریال مورد علاقت بازی کنی', N'نمی‌تونستی اون سریال رو ببینی', 12, 0, 0, 0, 0, 70, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (168, N'به شادی ابدی می‌رسیدی', N'دیگه زنده نبودی', 11, 0, 0, 0, 0, 80, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (169, N'تا آخر عمر تریاک رایگان بهت می‌دادن', N'هر روز نعشه بودی', 8, 0, 0, 0, 0, 70, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (170, N'بهت یک میلیارد می‌دادن', N'اگه دروغ می‌گفتی با سودش ازت پس می‌گرفتن', 8, 0, 0, 0, 0, 80, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (171, N'یک میلیارد بهت بدن', N'از بیت المال و حق و حقوق بقیه بود', 8, 0, 0, 0, 0, 80, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (172, N'می‌تونستی روی آب راه بری', N'نمی‌تونستی شنا کنی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (173, N'حافظه فوق العاده‌ای داشتی', N'فقط اسم بقیه رو فراموش می‌کردی', 11, 0, 0, 0, 0, 60, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (174, N'می‌تونستی یک نفر رو برای 5 سال به عنوان نوکرخودت انتخاب کنی', N'بعد از 5 سال تو هم باید همون اندازه نوکریش رو بکنی', 11, 0, 0, 0, 0, 60, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (175, N'همه مخارجت تا آخر عمر پرداخت می‌شد', N'باید تو خیابون زندگی می‌کردی', 11, 0, 0, 0, 0, 70, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (176, N'حقوقت چند برابر می‌شد', N'باید هر چی از قبل بیشتر می‌گیری رو بدی به آسایشگاه', 8, 0, 0, 0, 0, 70, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (177, N'بهترین فیلم تاریخ سینما رو بسازی', N'ساختش 20 سال طول می‌کشید', 12, 0, 0, 0, 0, 80, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1, NULL, 0)
INSERT [dbo].[Question] ([ID], [What_if], [But], [Catgory_ID], [Yes_Count], [No_Count], [Like_Count], [Dislike_Count], [Weight], [CreatedDate], [UpdateDate], [Banned], [QuestionBoostID], [ActionID], [CommentCount]) VALUES (179, N'پنج تا ستاره بگیری', N'تو کافه بازار بهمون رای بدی', 1, 13, 34, 3, 0, 100, CAST(0x0000A75800000000 AS DateTime), CAST(0x0000A75800000000 AS DateTime), 0, 1, 5, 16)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[QuestionAction] ON 

INSERT [dbo].[QuestionAction] ([ID], [Name], [ActionNumber], [Coin], [Priority]) VALUES (1, N'WatchVideo', 1001, 5, 1)
INSERT [dbo].[QuestionAction] ([ID], [Name], [ActionNumber], [Coin], [Priority]) VALUES (5, N'BazaarRate', 1000, 5, 2)
SET IDENTITY_INSERT [dbo].[QuestionAction] OFF
SET IDENTITY_INSERT [dbo].[QuestionBoost] ON 

INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (1, N'+100', N'عادی', 0, N'images/boost/boost1.png', N'#fffff', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (3, N'+500', N'متوسط', 60, N'images/boost/boost2.png', N'#ffee32', CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A72300000000 AS DateTime))
INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (4, N'+1000', N'حرفه ای', 70, N'images/boost/boost3.png', N'#ff3e55', CAST(0x0000A72300000000 AS DateTime), CAST(0x0000A72300000000 AS DateTime))
INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (6, N'+5000', N'هیولا', 100, N'images/boost/boost4.png', N'#ff3e55', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (7, N'+10000', N'یا علی', 150, N'images/boost/boost5.png', N'#ff3e55', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
INSERT [dbo].[QuestionBoost] ([ID], [Name], [Description], [Price], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate]) VALUES (8, N'+20000', N'یا خدا', 200, N'images/boost/boost6.png', N'#ff3e55', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime))
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
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (1120, 1173, 9)
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
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2154, 2208, 5)
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
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2165, 2219, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2166, 2220, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2167, 2221, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2168, 2222, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2169, 2223, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2170, 2224, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2171, 2225, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2172, 2226, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2173, 2227, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2174, 2228, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2175, 2229, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2176, 2230, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2177, 2231, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2178, 2240, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2179, 2241, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2180, 2242, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2181, 2243, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2182, 2244, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2183, 2245, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2184, 2246, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2185, 2247, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2186, 2248, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2187, 2249, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2188, 2250, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2189, 2251, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2190, 2252, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2191, 2253, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2192, 2254, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2193, 2255, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2194, 2256, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2195, 2257, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2196, 2258, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2197, 2259, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2198, 2260, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2199, 2261, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2200, 2262, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2201, 2263, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2202, 2264, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2203, 2265, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2204, 2266, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2205, 2267, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2206, 2268, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2207, 2269, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2208, 2270, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (2209, 2271, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3209, 3271, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3210, 3272, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3211, 3273, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3212, 3274, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3213, 3275, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3214, 3276, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3215, 3277, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3216, 3278, 1)
GO
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3217, 3279, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3218, 3280, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3219, 3281, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3220, 3282, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3221, 3283, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3222, 3284, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3223, 3285, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (3224, 3286, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (4224, 4286, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (4225, 4287, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (4226, 4288, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (4227, 4289, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (4228, 4290, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (4229, 4291, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (4230, 4292, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (4231, 4293, 1)
INSERT [dbo].[SelectedAvatar] ([ID], [UserID], [UserAvatarID]) VALUES (4232, 4294, 1)
SET IDENTITY_INSERT [dbo].[SelectedAvatar] OFF
SET IDENTITY_INSERT [dbo].[SelectedCategory] ON 

INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1135, 1158, 7)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1137, 1160, 14)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1139, 1162, 10)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1147, 1170, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (1150, 1173, 12)
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
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2184, 2208, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2185, 2209, 5)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2186, 2210, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2187, 2211, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2188, 2212, 6)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2189, 2213, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2190, 2214, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2191, 2215, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2192, 2216, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2193, 2217, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2194, 2218, 10)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2195, 2219, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2196, 2220, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2197, 2221, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2198, 2222, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2199, 2223, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2200, 2224, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2201, 2225, 8)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2202, 2226, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2203, 2227, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2204, 2228, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2205, 2229, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2206, 2230, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2207, 2231, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2208, 2240, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2209, 2241, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2210, 2242, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2211, 2243, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2212, 2244, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2213, 2245, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2214, 2246, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2215, 2247, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2216, 2248, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2217, 2249, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2218, 2250, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2219, 2251, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2220, 2252, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2221, 2253, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2222, 2254, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2223, 2255, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2224, 2256, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2225, 2257, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2226, 2258, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2227, 2259, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2228, 2260, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2229, 2261, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2230, 2262, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2231, 2263, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2232, 2264, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2233, 2265, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2234, 2266, 2)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2235, 2267, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2236, 2268, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2237, 2269, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2238, 2270, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (2239, 2271, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3239, 3271, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3240, 3272, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3241, 3273, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3242, 3274, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3243, 3275, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3244, 3276, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3245, 3277, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3246, 3278, 1)
GO
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3247, 3279, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3248, 3280, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3249, 3281, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3250, 3282, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3251, 3283, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3252, 3284, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3253, 3285, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (3254, 3286, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (4254, 4286, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (4255, 4287, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (4256, 4288, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (4257, 4289, 2)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (4258, 4290, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (4259, 4291, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (4260, 4292, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (4261, 4293, 1)
INSERT [dbo].[SelectedCategory] ([ID], [UserID], [CategoryID]) VALUES (4262, 4294, 1)
SET IDENTITY_INSERT [dbo].[SelectedCategory] OFF
SET IDENTITY_INSERT [dbo].[SelectedTheme] ON 

INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1135, 1158, 6)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1137, 1160, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1139, 1162, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1147, 1170, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (1150, 1173, 4)
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
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2176, 2200, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2177, 2201, 6)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2178, 2202, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2179, 2203, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2180, 2204, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2181, 2205, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2182, 2206, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2183, 2207, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2184, 2208, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2185, 2209, 5)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2186, 2210, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2187, 2211, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2188, 2212, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2189, 2213, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2190, 2214, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2191, 2215, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2192, 2216, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2193, 2217, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2194, 2218, 4)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2195, 2219, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2196, 2220, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2197, 2221, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2198, 2222, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2199, 2223, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2200, 2224, 2)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2201, 2225, 5)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2202, 2226, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2203, 2227, 5)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2204, 2228, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2205, 2229, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2206, 2230, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2207, 2231, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2208, 2240, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2209, 2241, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2210, 2242, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2211, 2243, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2212, 2244, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2213, 2245, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2214, 2246, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2215, 2247, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2216, 2248, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2217, 2249, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2218, 2250, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2219, 2251, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2220, 2252, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2221, 2253, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2222, 2254, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2223, 2255, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2224, 2256, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2225, 2257, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2226, 2258, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2227, 2259, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2228, 2260, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2229, 2261, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2230, 2262, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2231, 2263, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2232, 2264, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2233, 2265, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2234, 2266, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2235, 2267, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2236, 2268, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2237, 2269, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2238, 2270, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (2239, 2271, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3239, 3271, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3240, 3272, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3241, 3273, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3242, 3274, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3243, 3275, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3244, 3276, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3245, 3277, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3246, 3278, 1)
GO
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3247, 3279, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3248, 3280, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3249, 3281, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3250, 3282, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3251, 3283, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3252, 3284, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3253, 3285, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (3254, 3286, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (4254, 4286, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (4255, 4287, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (4256, 4288, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (4257, 4289, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (4258, 4290, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (4259, 4291, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (4260, 4292, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (4261, 4293, 1)
INSERT [dbo].[SelectedTheme] ([ID], [UserID], [AppThemeID]) VALUES (4262, 4294, 1)
SET IDENTITY_INSERT [dbo].[SelectedTheme] OFF
SET IDENTITY_INSERT [dbo].[SpinWheel] ON 

INSERT [dbo].[SpinWheel] ([ID], [Title], [Icon], [SpinWheelTypeID], [Prize], [SpinWheelAlternativeID], [FirstChance], [SecondChance], [Priority], [CreatedDate], [UpdatedDate]) VALUES (2, N'دو سکه', N'Images/spin/1.png', 4, 2, NULL, 20, 30, 1, CAST(0x0000A78000000000 AS DateTime), CAST(0x0000A78000000000 AS DateTime))
INSERT [dbo].[SpinWheel] ([ID], [Title], [Icon], [SpinWheelTypeID], [Prize], [SpinWheelAlternativeID], [FirstChance], [SecondChance], [Priority], [CreatedDate], [UpdatedDate]) VALUES (3, N'چهارسکه', N'Images/spin/2.png', 4, 4, NULL, 15, 20, 2, CAST(0x0000A78000000000 AS DateTime), CAST(0x0000A78000000000 AS DateTime))
INSERT [dbo].[SpinWheel] ([ID], [Title], [Icon], [SpinWheelTypeID], [Prize], [SpinWheelAlternativeID], [FirstChance], [SecondChance], [Priority], [CreatedDate], [UpdatedDate]) VALUES (4, N'ده سکه', N'Images/spin/3.png', 4, 10, NULL, 8, 11, 3, CAST(0x0000A76F00000000 AS DateTime), CAST(0x0000A78000000000 AS DateTime))
INSERT [dbo].[SpinWheel] ([ID], [Title], [Icon], [SpinWheelTypeID], [Prize], [SpinWheelAlternativeID], [FirstChance], [SecondChance], [Priority], [CreatedDate], [UpdatedDate]) VALUES (5, N'پوچ', N'Images/spin/13.png', 5, 0, NULL, 999, 999, 13, CAST(0x0000A76F00000000 AS DateTime), CAST(0x0000A78000000000 AS DateTime))
INSERT [dbo].[SpinWheel] ([ID], [Title], [Icon], [SpinWheelTypeID], [Prize], [SpinWheelAlternativeID], [FirstChance], [SecondChance], [Priority], [CreatedDate], [UpdatedDate]) VALUES (6, N'بیست سکه', N'Images/spin/5.png', 4, 20, NULL, 20, 20, 5, CAST(0x0000A78E00000000 AS DateTime), CAST(0x0000A78000000000 AS DateTime))
INSERT [dbo].[SpinWheel] ([ID], [Title], [Icon], [SpinWheelTypeID], [Prize], [SpinWheelAlternativeID], [FirstChance], [SecondChance], [Priority], [CreatedDate], [UpdatedDate]) VALUES (7, N'سی سکه', N'Images/spin/6.png', 4, 30, NULL, 2, 2, 6, CAST(0x0000A78100000000 AS DateTime), CAST(0x0000A78100000000 AS DateTime))
INSERT [dbo].[SpinWheel] ([ID], [Title], [Icon], [SpinWheelTypeID], [Prize], [SpinWheelAlternativeID], [FirstChance], [SecondChance], [Priority], [CreatedDate], [UpdatedDate]) VALUES (8, N'پوچ', N'Images/spin/7.png', 5, 0, NULL, 10, 13, 7, CAST(0x0000A78100000000 AS DateTime), CAST(0x0000A78100000000 AS DateTime))
INSERT [dbo].[SpinWheel] ([ID], [Title], [Icon], [SpinWheelTypeID], [Prize], [SpinWheelAlternativeID], [FirstChance], [SecondChance], [Priority], [CreatedDate], [UpdatedDate]) VALUES (9, N'پنجاه سکه', N'Images/spin/8.png', 4, 50, NULL, 1, 2, 8, CAST(0x0000A78100000000 AS DateTime), CAST(0x0000A78100000000 AS DateTime))
INSERT [dbo].[SpinWheel] ([ID], [Title], [Icon], [SpinWheelTypeID], [Prize], [SpinWheelAlternativeID], [FirstChance], [SecondChance], [Priority], [CreatedDate], [UpdatedDate]) VALUES (10, N'پوچ', N'Images/spin/9.png', 4, 0, NULL, 10, 13, 9, CAST(0x0000A78200000000 AS DateTime), CAST(0x0000A78100000000 AS DateTime))
INSERT [dbo].[SpinWheel] ([ID], [Title], [Icon], [SpinWheelTypeID], [Prize], [SpinWheelAlternativeID], [FirstChance], [SecondChance], [Priority], [CreatedDate], [UpdatedDate]) VALUES (11, N'هفتاد سکه', N'Images/spin/10.png', 4, 70, NULL, 0.5, 2, 10, CAST(0x0000A78200000000 AS DateTime), CAST(0x0000A78100000000 AS DateTime))
INSERT [dbo].[SpinWheel] ([ID], [Title], [Icon], [SpinWheelTypeID], [Prize], [SpinWheelAlternativeID], [FirstChance], [SecondChance], [Priority], [CreatedDate], [UpdatedDate]) VALUES (12, N'پوچ', N'Images/spin/11.png', 4, 0, NULL, 10, 13, 11, CAST(0x0000A78100000000 AS DateTime), CAST(0x0000A78100000000 AS DateTime))
INSERT [dbo].[SpinWheel] ([ID], [Title], [Icon], [SpinWheelTypeID], [Prize], [SpinWheelAlternativeID], [FirstChance], [SecondChance], [Priority], [CreatedDate], [UpdatedDate]) VALUES (13, N'نود سکه', N'Images/spin/4.png', 4, 90, NULL, 0.1, 2, 4, CAST(0x0000A78100000000 AS DateTime), CAST(0x0000A78100000000 AS DateTime))
INSERT [dbo].[SpinWheel] ([ID], [Title], [Icon], [SpinWheelTypeID], [Prize], [SpinWheelAlternativeID], [FirstChance], [SecondChance], [Priority], [CreatedDate], [UpdatedDate]) VALUES (14, N'دسته خنده دار', N'Images/spin/12.png', 1, 10, 5, 1000, 1000, 12, CAST(0x0000A78100000000 AS DateTime), CAST(0x0000A78100000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[SpinWheel] OFF
SET IDENTITY_INSERT [dbo].[SpinWheelType] ON 

INSERT [dbo].[SpinWheelType] ([ID], [Title]) VALUES (1, N'Category')
INSERT [dbo].[SpinWheelType] ([ID], [Title]) VALUES (2, N'Theme')
INSERT [dbo].[SpinWheelType] ([ID], [Title]) VALUES (3, N'Avatar')
INSERT [dbo].[SpinWheelType] ([ID], [Title]) VALUES (4, N'Coin')
INSERT [dbo].[SpinWheelType] ([ID], [Title]) VALUES (5, N'Blank')
INSERT [dbo].[SpinWheelType] ([ID], [Title]) VALUES (6, N'Fortune')
SET IDENTITY_INSERT [dbo].[SpinWheelType] OFF
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([ID], [Name], [Description], [MarketID], [Price], [SKU], [Coin], [IsAccessibleInAllStores], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [DiscountAmount]) VALUES (2, N'بسته 100', N'100 تومنی', 2, 100, N'seke100', 1000, 0, N'images/coin/coin1.png', N'#c33d3d', CAST(0x0000A6EF00000000 AS DateTime), CAST(0x0000A6EF00000000 AS DateTime), 0)
INSERT [dbo].[Store] ([ID], [Name], [Description], [MarketID], [Price], [SKU], [Coin], [IsAccessibleInAllStores], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [DiscountAmount]) VALUES (4, N'بسته 200', N'200 تومنی', 2, 200, N'seke200', 200, 0, N'images/coin/coin2.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Store] ([ID], [Name], [Description], [MarketID], [Price], [SKU], [Coin], [IsAccessibleInAllStores], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [DiscountAmount]) VALUES (5, N'بسته 300', N'300 تومنی', 2, 300, N'seke300', 300, 0, N'images/coin/coin3.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Store] ([ID], [Name], [Description], [MarketID], [Price], [SKU], [Coin], [IsAccessibleInAllStores], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [DiscountAmount]) VALUES (7, N'بسته 400', N'400 تومنی', 2, 400, N'seke400', 400, 0, N'images/coin/coin4.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Store] ([ID], [Name], [Description], [MarketID], [Price], [SKU], [Coin], [IsAccessibleInAllStores], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [DiscountAmount]) VALUES (8, N'بسته 500', N'500 تومنی', 2, 500, N'seke400', 500, 0, N'images/coin/coin5.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
INSERT [dbo].[Store] ([ID], [Name], [Description], [MarketID], [Price], [SKU], [Coin], [IsAccessibleInAllStores], [Icon], [RectangleColor], [CreatedDate], [UpdatedDate], [DiscountAmount]) VALUES (10, N'بسته 600', N'600 تومنی', 2, 600, N'seke400', 600, 0, N'images/coin/coin6.png', N'#c33d3d', CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Store] OFF
SET IDENTITY_INSERT [dbo].[TagState] ON 

INSERT [dbo].[TagState] ([ID], [Name]) VALUES (1, N'Regular')
INSERT [dbo].[TagState] ([ID], [Name]) VALUES (2, N'NewItem')
INSERT [dbo].[TagState] ([ID], [Name]) VALUES (3, N'OffItem')
SET IDENTITY_INSERT [dbo].[TagState] OFF
SET IDENTITY_INSERT [dbo].[UnRepeatableAchievedSpinWheel] ON 

INSERT [dbo].[UnRepeatableAchievedSpinWheel] ([ID], [UserID], [SpinWheelID]) VALUES (2, 1173, 14)
SET IDENTITY_INSERT [dbo].[UnRepeatableAchievedSpinWheel] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (1158, N'b3bd4e43-c5af-472c-a221-ae5fbee7a01c', N'Jeb', 1, 115, 6, 1, 1, CAST(0x0000A751017CD3EF AS DateTime), CAST(0x0000A751016CEF35 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (1160, N'04108948-40aa-4118-acb1-728184b1fbaa', N'keyvan', 1, 105, 59, 5, 1, CAST(0x0000A73A00D240BB AS DateTime), CAST(0x000007DC00000000 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (1162, N'3de29d61-46c7-4714-9a24-c18ff59b99d7', N'محمدرضا', 1, 155, 16, 1, 1, CAST(0x0000A73A015602AA AS DateTime), CAST(0x000007DC00000000 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (1170, N'9a264610-453a-4a94-ba02-3ec5d74ae602', N' کیوان', 1, 45, 9, 2, 1, CAST(0x0000A79A01154AA9 AS DateTime), CAST(0x0000A79A01143289 AS DateTime), CAST(0x0000A79A00B883E0 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (1173, N'5eefd408-6cd8-434c-8704-00924011a1cc', N'JebReal', 1, 4890, 25, 3, 1, CAST(0x0000A78400BC1C0F AS DateTime), CAST(0x0000A78400B901D6 AS DateTime), CAST(0x0000A78400B83460 AS DateTime), 8, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2177, N'empty', N'مدیر', 1, 100, 21, 1, 1, CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A6EE00000000 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2178, N'afe785b1-7c4f-4e8b-982c-ccbba5dc06e7', N'Guest_5969030', 1, 218, 5, 2, 1, CAST(0x0000A765011F9AF9 AS DateTime), CAST(0x0000A75E0116F20F AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2179, N'76f6c8bf-0759-443a-a7e0-a47977f263d1', N'keyvanOfficial', 1, 10180, 8, 1, 1, CAST(0x0000A7AF0102A8FD AS DateTime), CAST(0x0000A7A30110099D AS DateTime), CAST(0x0000A7AF0102A8FD AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2180, N'd3e9c138-9853-4919-86f8-0c181a3efcdd', N'Guest_2102810', 1, 310, 2, 1, 1, CAST(0x0000A75900CA29DF AS DateTime), CAST(0x0000A75900C80498 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2181, N'4969a35a-edd1-4500-b6d6-70b70851ed1c', N'designer92', 1, 155, 9, 2, 1, CAST(0x0000A759010449C9 AS DateTime), CAST(0x0000A7590102DFB2 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2182, N'6070c6e6-6108-4d2e-8b78-598e1879adf3', N'Guest_9094190', 1, 210, 15, 1, 1, CAST(0x0000A758011FDE58 AS DateTime), CAST(0x0000A75800B64921 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2183, N'7aa7e99c-dbb3-41b0-ab91-bf71584c412e', N'Guest_7112246', 1, 193, 13, 2, 1, CAST(0x0000A75C00EC3D4F AS DateTime), CAST(0x0000A75C00EB9AA8 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2184, N'e020988f-994c-4571-b6ff-6217b3ee9ffc', N'zrostami', 1, 143, 6, 2, 1, CAST(0x0000A760011DAB19 AS DateTime), CAST(0x0000A75B00F045DF AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2185, N'a77d9489-6891-4994-9c77-d0d0a1c5cfb6', N'Guest_6208689', 1, 1440, 4, 1, 1, CAST(0x0000A75A010104D2 AS DateTime), CAST(0x0000A75A01000ECD AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2186, N'4f1d4a2b-21f0-4599-a8f6-6229772820f4', N'sana1374', 1, 200, 1, 1, 1, CAST(0x0000A75B012BFF85 AS DateTime), CAST(0x0000A75B012BEBAC AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2187, N'1d239eea-cf68-4a1d-9c54-79d320527527', N'Guest_0677772', 1, 210, 3, 1, 1, CAST(0x0000A75E00BBDC48 AS DateTime), CAST(0x0000A75E0098D3CB AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2188, N'b7ac77f6-e55e-4318-bf18-1db332e80e0f', N'Guest_4243176', 1, 200, 0, 1, 1, CAST(0x0000A75E00D532B7 AS DateTime), CAST(0x0000A75E00D4F7C1 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2189, N'04be959d-13f3-4a53-9920-07f0251c4558', N'Guest_2189', 1, 105, 4, 1, 1, CAST(0x0000A75E0118A276 AS DateTime), CAST(0x0000A75E00E87B6E AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2190, N'09e81a77-2a8f-4e0c-bc85-33fcf3be25d7', N'Guest_2190', 1, 200, 2, 1, 1, CAST(0x0000A75E00F8F481 AS DateTime), CAST(0x0000A75E00F8BF3D AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2191, N'cf974a75-d364-40b8-a101-6eee762a8c9e', N'Guest_2191', 1, 200, 0, 1, 1, CAST(0x0000A75E01051405 AS DateTime), CAST(0x0000A75E01051405 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2192, N'8b21b4ff-c66e-4c5d-915b-1cf701fc2916', N'Guest_2192', 1, 200, 0, 1, 1, CAST(0x0000A75E01066674 AS DateTime), CAST(0x0000A75E01065209 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2193, N'38dc4d3e-60ec-428d-9e0e-d2dc4391d2a3', N'Guest_2193', 1, 200, 0, 1, 1, CAST(0x0000A75E0106B2D8 AS DateTime), CAST(0x0000A75E0106B2D8 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2194, N'477b9a79-5024-4f96-ab19-4264f42baafc', N'Guest_2194', 1, 200, 0, 1, 1, CAST(0x0000A75E011605EC AS DateTime), CAST(0x0000A75E011605EC AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2195, N'8b6959ce-bf96-4cae-9b20-bfaffc4747fe', N'Guest_2195', 1, 200, 0, 1, 1, CAST(0x0000A75E0118129D AS DateTime), CAST(0x0000A75E0117CDB1 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2196, N'd9d7ef44-0cf2-4b09-b312-f67459908f1b', N'Guest_2196', 1, 200, 3, 1, 1, CAST(0x0000A75E01183500 AS DateTime), CAST(0x0000A75E01183500 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2197, N'a147c5c3-c9a4-4880-8668-d0bdad53b89e', N'Guest_2197', 1, 170, 2, 2, 1, CAST(0x0000A76200FB1CD0 AS DateTime), CAST(0x0000A76200FACAED AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2198, N'6e8dac8e-a0c5-4a5a-9c03-a410b9b5cc68', N'Guest_2198', 1, 200, 0, 1, 1, CAST(0x0000A75E01192C52 AS DateTime), CAST(0x0000A75E01192C52 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2199, N'0d6d1f77-1610-4d4a-ab15-bc7304d489ef', N'Guest_2199', 1, 200, 0, 1, 1, CAST(0x0000A75E01195382 AS DateTime), CAST(0x0000A75E01195382 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2200, N'438d7ab3-b040-4ea6-83fa-840016b6b4fa', N'Guest_2200', 1, 700, 22, 2, 1, CAST(0x0000A77700C9A0AF AS DateTime), CAST(0x0000A77601873C0A AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2201, N'25a3335d-e409-4d5d-a102-4f845bca6fb4', N'Guest_2201', 1, 15, 3, 1, 1, CAST(0x0000A79B00147B48 AS DateTime), CAST(0x0000A79A01656E57 AS DateTime), CAST(0x0000A79B00147B48 AS DateTime), 2, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2202, N'0215b03c-ec78-45bf-9eb0-2d6a80158363', N'Guest_2202', 1, 225, 4, 1, 1, CAST(0x0000A76501133E3E AS DateTime), CAST(0x0000A765010F2D53 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2203, N'5bc28c8e-f497-4f96-b8bf-841ff461fc05', N'Guest_2203', 1, 190, 5, 1, 1, CAST(0x0000A76301715EF1 AS DateTime), CAST(0x0000A763015B7944 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2204, N'512df3b4-f6c9-4208-94c7-3dfec39dbebe', N'Guest_2204', 1, 200, 0, 1, 1, CAST(0x0000A76400E07F5E AS DateTime), CAST(0x0000A76400DEA033 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2205, N'e60b5fbd-a9b8-4956-b08c-c23989ef89cb', N'Guest_2205', 1, 180, 1, 1, 1, CAST(0x0000A765013970D8 AS DateTime), CAST(0x0000A76501341096 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2206, N'1974704a-2add-46b9-948d-d382953f9f12', N'Guest_2206', 1, 180, 0, 1, 1, CAST(0x0000A765011C2655 AS DateTime), CAST(0x0000A765011B82CD AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2207, N'd4d3f234-8107-4480-a600-439b06584af4', N'Guest_2207', 1, 180, 2, 1, 1, CAST(0x0000A78000E1A635 AS DateTime), CAST(0x0000A78000E01C4B AS DateTime), CAST(0x0000A78000BA56B0 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2208, N'da0a24e1-ed88-4461-b339-dd74c6eaa446', N'Guest_2208', 1, 725, 6, 1, 1, CAST(0x0000A79D0167A3E6 AS DateTime), CAST(0x0000A77700ED8926 AS DateTime), CAST(0x0000A79D0167A3E6 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2209, N'e116a997-359f-4b99-b32d-886a5813848f', N'Guest_2209', 1, 5, 12, 1, 1, CAST(0x0000A77300F6EF03 AS DateTime), CAST(0x0000A77300F61B5C AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2210, N'ba27e5de-c274-4a4a-8ce7-700354855993', N'Guest_2210', 1, 200, 0, 1, 1, CAST(0x0000A7760145CA61 AS DateTime), CAST(0x0000A7660100F744 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2211, N'97380d07-a9d7-45d2-870b-dd02cabeefff', N'Guest_2211', 1, 200, 0, 1, 1, CAST(0x0000A7650140B8B7 AS DateTime), CAST(0x0000A7650140AAF7 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2212, N'40b47470-9d10-4ce4-bbfa-be6988d2d0c9', N'KivKiv', 1, 1380, 13, 1, 1, CAST(0x0000A76600C18345 AS DateTime), CAST(0x0000A76600C09609 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2213, N'57df3536-9ed0-41ed-b984-86fd97279c19', N'Guest_2213', 1, 320, 19, 1, 1, CAST(0x0000A77000EE3B0F AS DateTime), CAST(0x0000A77000EE328B AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2214, N'd85f3af5-0490-46a5-8371-1aed07339400', N'Guest_2214', 1, 200, 2, 1, 1, CAST(0x0000A768018B77B4 AS DateTime), CAST(0x0000A768018B77B4 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2215, N'95799465-426d-4592-b036-2631427c8529', N'Guest_2215', 1, 200, 0, 1, 1, CAST(0x0000A76A011CAD1E AS DateTime), CAST(0x0000A76A011CAD1E AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2216, N'09f0637a-b5e3-4daf-990c-48e5be16f137', N'Guest_2216', 1, 200, 0, 1, 1, CAST(0x0000A76A012C4D07 AS DateTime), CAST(0x0000A76A0124B620 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2217, N'f3e58f46-92df-4fa6-a76e-ca9b8e334c54', N'Guest_2217', 1, 300, 1, 1, 1, CAST(0x0000A76E00A9BBD3 AS DateTime), CAST(0x0000A76E00A978B8 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2218, N'146b9671-d6c0-4ae7-b552-22192e496929', N'Guest_2218', 1, 270, 1, 1, 1, CAST(0x0000A778011D4B77 AS DateTime), CAST(0x0000A77800F19E23 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2219, N'880748b8-8721-4f87-9847-f90e874934a2', N'Guest_2219', 1, 200, 1, 1, 1, CAST(0x0000A76F00C0CC45 AS DateTime), CAST(0x0000A76F00C027FD AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2220, N'ae776620-798c-44e0-bc14-638aac93a676', N'Guest_2220', 1, 200, 0, 1, 1, CAST(0x0000A77601198C5D AS DateTime), CAST(0x0000A77601198C5D AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2221, N'd5bf415d-0324-413a-9a83-74b1e16db8d2', N'Guest_2221', 1, 210, 2, 1, 1, CAST(0x0000A77700C87874 AS DateTime), CAST(0x0000A77700C70DD5 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2222, N'a7b616d5-d237-47fd-9144-c29d23c52ae4', N'Guest_2222', 1, 932, 3, 1, 1, CAST(0x0000A78400C0E583 AS DateTime), CAST(0x0000A78400BEC8BA AS DateTime), CAST(0x0000A78400B087FA AS DateTime), 3, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2223, N'b361ecce-6f8c-4b68-b103-8428d4c30afe', N'Guest_2223', 1, 200, 0, 1, 1, CAST(0x0000A77700D07A61 AS DateTime), CAST(0x0000A77700CF658A AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2224, N'caacfe07-e1c9-4e25-afdb-5633d2f8cfee', N'Guest_2224', 1, 316, 11, 1, 1, CAST(0x0000A78400B964C0 AS DateTime), CAST(0x0000A783014A95DA AS DateTime), CAST(0x0000A78400B964C0 AS DateTime), 4, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2225, N'ae9a47ee-3d56-43f3-b554-c6015e646da7', N'Guest_2225', 1, 340, 5, 1, 1, CAST(0x0000A778013FCD3E AS DateTime), CAST(0x0000A77801395A95 AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2226, N'ded6eb82-44f1-4602-beeb-d96c34a9ece2', N'Guest_2226', 1, 200, 1, 1, 1, CAST(0x0000A778013CCA0A AS DateTime), CAST(0x0000A778013CCA0A AS DateTime), CAST(0x0000A779012ED1A2 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2227, N'5f5f4d4f-7b5b-4d2c-9200-2418d652f809', N'Guest_2227', 1, 200, 4, 1, 1, CAST(0x0000A77C00FB78B1 AS DateTime), CAST(0x0000A77C00FAAF6C AS DateTime), CAST(0x0000A77C001737A9 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2228, N'c13c36fc-92ae-470c-917a-e83183700306', N'Guest_2228', 1, 301, 1, 1, 1, CAST(0x0000A77D00EE85A3 AS DateTime), CAST(0x0000A77D00EDED0E AS DateTime), CAST(0x0000A77D00B50759 AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2229, N'ebe43e11-d1de-41b0-ab89-1cfe78f1d1f5', N'Guest_2229', 1, 200, 0, 1, 1, CAST(0x0000A77D0128CD72 AS DateTime), CAST(0x0000A77D0120C581 AS DateTime), CAST(0x0000A77D0120C581 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2230, N'5eefd408-6cd8-434c-8704-00924011a1bb', N'Guest_2230', 1, 200, 0, 1, 1, CAST(0x0000A78E00DD0DB6 AS DateTime), CAST(0x0000A78E00DD0DB7 AS DateTime), CAST(0x0000A78E00DD0DB7 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2231, N'5eefd408-6cd8-434c-8704-00924011a1gg', N'Guest_2231', 1, 200, 0, 1, 1, CAST(0x0000A78E00DE7242 AS DateTime), CAST(0x0000A78E00DE7243 AS DateTime), CAST(0x0000A78E00DE7243 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2240, N'5eefd408-6cd8-434c-8704-00924011a1ss', N'Guest_2240', 1, 200, 0, 1, 1, CAST(0x0000A78E00E998D7 AS DateTime), CAST(0x0000A78E00E998D7 AS DateTime), CAST(0x0000A78E00E998D7 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2241, N'4b5a41a0-14c7-42df-b79f-ecbbb9650876', N'Guest_2241', 1, 200, 0, 1, 1, CAST(0x0000A79F007D6D46 AS DateTime), CAST(0x0000A79F007D4AC2 AS DateTime), CAST(0x0000A79F007D4AC2 AS DateTime), 5, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2242, N'cad21614-7eeb-43dd-a4d1-c050134dac98', N'Guest_2242', 1, 200, 0, 1, 1, CAST(0x0000A79B0056D1A5 AS DateTime), CAST(0x0000A79B0052A7B5 AS DateTime), CAST(0x0000A79B001047DF AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2243, N'603ede84-46d0-4be7-b1bc-33faa760619e', N'Guest_2243', 1, 205, 2, 1, 1, CAST(0x0000A79A018B01D6 AS DateTime), CAST(0x0000A79A018AA89C AS DateTime), CAST(0x0000A79A018AA89C AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2244, N'c32f41c1-9719-40eb-ae15-fcd8ba74a760', N'Guest_2244', 1, 200, 13, 1, 1, CAST(0x0000A7A000DEFDBA AS DateTime), CAST(0x0000A7A000CDF3ED AS DateTime), CAST(0x0000A7A0002F4025 AS DateTime), 4, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2245, N'98295844-2ae1-465d-8d00-04c4be4fddeb', N'Guest_2245', 1, 200, 18, 1, 1, CAST(0x0000A79D016A847F AS DateTime), CAST(0x0000A79D016A2C04 AS DateTime), CAST(0x0000A79D00030984 AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2246, N'6ca00ad5-b4f8-4eb7-9c26-4c77b172802c', N'Guest_2246', 1, 200, 0, 1, 1, CAST(0x0000A79D0052E6B6 AS DateTime), CAST(0x0000A79D00253635 AS DateTime), CAST(0x0000A79D00252CE3 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2247, N'362b9136-5cd9-4a85-b238-7db456ceb5b0', N'Guest_2247', 1, 200, 14, 1, 1, CAST(0x0000A79D009F31EB AS DateTime), CAST(0x0000A79D009D34EF AS DateTime), CAST(0x0000A79D009D34EF AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2248, N'3b88c4bb-cc53-46a9-b5ed-d71142ae844d', N'Guest_2248', 1, 200, 18, 1, 1, CAST(0x0000A79D016ED707 AS DateTime), CAST(0x0000A79D016EB45F AS DateTime), CAST(0x0000A79D016ABD55 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2249, N'867ae574-d37a-445a-b4ae-4957b7730558', N'Guest_2249', 1, 200, 18, 1, 1, CAST(0x0000A79D0179E5A1 AS DateTime), CAST(0x0000A79D0178A7BA AS DateTime), CAST(0x0000A79D016F0966 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2250, N'de995948-7d72-4856-a5d9-b5827e53a714', N'Guest_2250', 1, 200, 18, 1, 1, CAST(0x0000A79E0040F509 AS DateTime), CAST(0x0000A79E0040A772 AS DateTime), CAST(0x0000A79E001ED217 AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2251, N'70a79640-a6d8-48a8-a93f-0154e8cf815a', N'Guest_2251', 1, 205, 1, 1, 1, CAST(0x0000A79E006D424D AS DateTime), CAST(0x0000A79E0051AC79 AS DateTime), CAST(0x0000A79E005111D4 AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2252, N'021d72ae-5129-4054-b016-6f5b4003064d', N'Guest_2252', 1, 200, 18, 1, 1, CAST(0x0000A7A3010B688F AS DateTime), CAST(0x0000A7A3010B46FA AS DateTime), CAST(0x0000A7A300CB7697 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2253, N'33d91044-d30b-471d-bfbd-f4e9554edc16', N'Guest_2253', 1, 200, 1, 1, 1, CAST(0x0000A7A000B587CA AS DateTime), CAST(0x0000A7A000B4BBDE AS DateTime), CAST(0x0000A7A000169E8B AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2254, N'b102a7cf-2bdd-4a54-b332-bd928508454d', N'Guest_2254', 1, 200, 1, 1, 1, CAST(0x0000A79F01537199 AS DateTime), CAST(0x0000A79F011650DF AS DateTime), CAST(0x0000A79F0105109A AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2255, N'c0d934e0-db5e-4350-8c40-dffb33a6b438', N'Guest_2255', 1, 200, 1, 1, 1, CAST(0x0000A7A000C751FD AS DateTime), CAST(0x0000A7A000C15C62 AS DateTime), CAST(0x0000A7A000BC13A7 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2256, N'58b1e541-89a4-458b-93b1-73d37a4ff3a3', N'Guest_2256', 1, 200, 0, 1, 1, CAST(0x0000A7A000CE7C9F AS DateTime), CAST(0x0000A7A000CE7C9F AS DateTime), CAST(0x0000A7A000CE7C9F AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2257, N'3cf3f4d1-c87e-4484-9964-648fe22e3c55', N'Guest_2257', 1, 200, 18, 1, 1, CAST(0x0000A7B70009110F AS DateTime), CAST(0x0000A7B600FF695C AS DateTime), CAST(0x0000A7B70009110F AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2258, N'048d3585-a384-4709-a151-d4fd5937e107', N'Guest_2258', 1, 200, 2, 1, 1, CAST(0x0000A7A300CE0267 AS DateTime), CAST(0x0000A7A300762BFD AS DateTime), CAST(0x0000A7A300762BFD AS DateTime), 3, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2259, N'd0ddd9a3-541d-478a-958f-0f106f4023f2', N'Guest_2259', 1, 205, 2, 1, 1, CAST(0x0000A7AC00FCC40B AS DateTime), CAST(0x0000A7A800111033 AS DateTime), CAST(0x0000A7AC00FCC40B AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2260, N'd9a9c179-4a4e-4b87-a93d-d783ac1d13ac', N'Guest_2260', 1, 200, 0, 1, 1, CAST(0x0000A7A30129CF87 AS DateTime), CAST(0x0000A7A30129BFC8 AS DateTime), CAST(0x0000A7A300CE3BDD AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2261, N'07797ed1-1cbb-4dc0-b710-ee4c8ed1c8b3', N'Guest_2261', 1, 200, 18, 1, 1, CAST(0x0000A7A3012802EF AS DateTime), CAST(0x0000A7A30127E129 AS DateTime), CAST(0x0000A7A3010BE0D6 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2262, N'6e8904d0-992a-438a-bad9-52e7db810367', N'Guest_2262', 1, 200, 6, 1, 1, CAST(0x0000A7A40133AA8D AS DateTime), CAST(0x0000A7A401335964 AS DateTime), CAST(0x0000A7A400A83203 AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2263, N'254e559d-5cc1-4821-bc46-afd726076ff3', N'Guest_2263', 1, 205, 7, 1, 1, CAST(0x0000A7A7009A5DF5 AS DateTime), CAST(0x0000A7A70099B1E7 AS DateTime), CAST(0x0000A7A700029D77 AS DateTime), 4, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2264, N'06dbc66d-718c-49fe-a91b-dd545830c796', N'Guest_2264', 1, 40, 3, 1, 1, CAST(0x0000A7A701615DB4 AS DateTime), CAST(0x0000A7A70160D5A1 AS DateTime), CAST(0x0000A7A80013C94F AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2265, N'8a3ffc02-d4ea-4e9f-b65a-a126140a042e', N'Guest_2265', 1, 200, 0, 1, 1, CAST(0x0000A7B600E4A3F8 AS DateTime), CAST(0x0000A7AF01192A6F AS DateTime), CAST(0x0000A7B600E4A3F8 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2266, N'00cc1f04-63fe-4346-a197-1e23920e497d', N'Guest_2266', 1, 5, 9, 1, 1, CAST(0x0000A7BC0141C651 AS DateTime), CAST(0x0000A7BC01417365 AS DateTime), CAST(0x0000A7BC00B49526 AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2267, N'b293868d-166a-4a11-9a51-8eb523f4435c', N'Guest_2267', 1, 200, 2, 1, 1, CAST(0x0000A7AD00D804FC AS DateTime), CAST(0x0000A7AD00D223E1 AS DateTime), CAST(0x0000A7AD00B4D15A AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2268, N'370a00db-4b43-4bd4-adf3-f5320cb57612', N'Guest_2268', 1, 155, 19, 1, 1, CAST(0x0000A7AB01481A1A AS DateTime), CAST(0x0000A7AB01481376 AS DateTime), CAST(0x0000A7AB0104344D AS DateTime), 4, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2269, N'77656d30-f37f-4853-aeec-5a9d01b41427', N'Guest_2269', 1, 200, 0, 1, 1, CAST(0x0000A7AA00B6C30F AS DateTime), CAST(0x0000A7AA00B69181 AS DateTime), CAST(0x0000A7AA00B671C3 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2270, N'2e92d5d5-42a6-4673-a7ba-01b6e84a41ad', N'Guest_2270', 1, 210, 1, 1, 1, CAST(0x0000A7AC014E6CB5 AS DateTime), CAST(0x0000A7AC014E5B56 AS DateTime), CAST(0x0000A7AC0004B637 AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (2271, N'c3205b53-a0d2-492e-aaf5-78571999cc31', N'Guest_2271', 1, 0, 5, 1, 1, CAST(0x0000A7AF00D2401B AS DateTime), CAST(0x0000A7AF00D0D57D AS DateTime), CAST(0x0000A7AF00C37235 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3271, N'6be80a86-d6fb-4dfb-a0ff-cd57707532d5', N'Guest_3271', 1, 100, 8, 1, 1, CAST(0x0000A7AC013B728B AS DateTime), CAST(0x0000A7AC013A2C0F AS DateTime), CAST(0x0000A7AC00FFFC8C AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3272, N'031dc986-52d7-477d-a118-5adcbf8e8f94', N'Guest_3272', 1, 205, 0, 1, 1, CAST(0x0000A7AD011B99D2 AS DateTime), CAST(0x0000A7AD00E6E225 AS DateTime), CAST(0x0000A7AD00B6C2FD AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3273, N'0137d012-e153-4838-9fe7-c9b8d03871eb', N'Guest_3273', 1, 210, 0, 1, 1, CAST(0x0000A7AF0109E72C AS DateTime), CAST(0x0000A7AF0109DFAC AS DateTime), CAST(0x0000A7AF00A0EA6F AS DateTime), 3, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3274, N'406d1a24-5dcc-43f6-ae5e-b7a4239c75dd', N'Guest_3274', 1, 210, 0, 1, 1, CAST(0x0000A7B600E9988C AS DateTime), CAST(0x0000A7AF01179A38 AS DateTime), CAST(0x0000A7B600E9988C AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3275, N'9112f764-1267-41e4-8b7a-fb92351c9d69', N'Guest_3275', 1, 200, 4, 1, 1, CAST(0x0000A7C8010C75A5 AS DateTime), CAST(0x0000A7C500C3C7C7 AS DateTime), CAST(0x0000A7C8010C75A5 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3276, N'131e3882-57bf-4a80-8563-b5a598aef97e', N'Guest_3276', 1, 230, 0, 1, 1, CAST(0x0000A7B600EDFD98 AS DateTime), CAST(0x0000A7B600176010 AS DateTime), CAST(0x0000A7B600165E7C AS DateTime), 7, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3277, N'4de83eb4-73bc-4410-8188-341328c22c72', N'Guest_3277', 1, 200, 0, 1, 1, CAST(0x0000A7B80117F6F0 AS DateTime), CAST(0x0000A7B80117F41C AS DateTime), CAST(0x0000A7B80008B8B5 AS DateTime), 2, 1)
GO
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3278, N'f8455b67-48a8-4b7d-b583-1faa98935371', N'Guest_3278', 1, 155, 1, 1, 1, CAST(0x0000A7C700FE8A92 AS DateTime), CAST(0x0000A7C700E54A8E AS DateTime), CAST(0x0000A7C700E502FB AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3279, N'7991ee10-5ae0-4355-839e-81c157641f85', N'Guest_3279', 1, 200, 0, 1, 1, CAST(0x0000A7B900E8E1F9 AS DateTime), CAST(0x0000A7B900BAEA8A AS DateTime), CAST(0x0000A7B9009290C0 AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3280, N'693f2751-eddf-40df-97aa-130def41c5b7', N'Guest_3280', 1, 155, 19, 1, 1, CAST(0x0000A7BB0105EA1C AS DateTime), CAST(0x0000A7BB00221299 AS DateTime), CAST(0x0000A7BB001B8585 AS DateTime), 2, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3281, N'858eef98-08eb-49e5-8689-8d884363b245', N'Guest_3281', 1, 205, 0, 1, 1, CAST(0x0000A7BC00034037 AS DateTime), CAST(0x0000A7BB017D0895 AS DateTime), CAST(0x0000A7BC00034037 AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3282, N'ecd8c8c7-9120-4391-b377-585b367d2085', N'Guest_3282', 1, 205, 18, 1, 1, CAST(0x0000A7BC012F9F69 AS DateTime), CAST(0x0000A7BB0146FC87 AS DateTime), CAST(0x0000A7BC012F9F69 AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3283, N'f672b809-494d-4678-93e2-ad8e0ecb82cb', N'Guest_3283', 1, 200, 5, 1, 1, CAST(0x0000A7C0009A908E AS DateTime), CAST(0x0000A7C00097E82A AS DateTime), CAST(0x0000A7C00097E82A AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3284, N'f816187f-9796-4341-bd0b-1f9838097f27', N'Guest_3284', 1, 200, 18, 1, 1, CAST(0x0000A7BF00B8E76C AS DateTime), CAST(0x0000A7BB014772CC AS DateTime), CAST(0x0000A7BF00B8E76C AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3285, N'46934b13-80ba-4a29-b797-0dcee4a1c226', N'Guest_3285', 1, 40, 1, 1, 1, CAST(0x0000A7C001866710 AS DateTime), CAST(0x0000A7C00186231E AS DateTime), CAST(0x0000A7C000A61255 AS DateTime), 4, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (3286, N'2bfe9d49-b8f4-4d58-8659-da2c733ded33', N'Guest_3286', 1, 200, 0, 1, 1, CAST(0x0000A7C500A8C094 AS DateTime), CAST(0x0000A7C5009EDD11 AS DateTime), CAST(0x0000A7C50008CEDF AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (4286, N'a3bffe12-1f84-46d0-8d79-c55befb75b3f', N'Guest_4286', 1, 4, 16, 1, 1, CAST(0x0000A7C700CD22A6 AS DateTime), CAST(0x0000A7C700CC2B41 AS DateTime), CAST(0x0000A7C700B40641 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (4287, N'1a014e95-7a25-4791-be4c-2edd91490019', N'Guest_4287', 1, 200, 6, 1, 1, CAST(0x0000A7C500C7C251 AS DateTime), CAST(0x0000A7C500C2A806 AS DateTime), CAST(0x0000A7C500C0280E AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (4288, N'48c5df29-1cc5-46ca-9c34-ff35ef30081d', N'Guest_4288', 1, 931, 2, 1, 1, CAST(0x0000A7C8012FF4FD AS DateTime), CAST(0x0000A7C8010C064C AS DateTime), CAST(0x0000A7C800AF8AA0 AS DateTime), 3, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (4289, N'c547e5d6-3528-46cd-8919-81894d09d746', N'Guest_4289', 1, 824, 0, 1, 1, CAST(0x0000A7C801412871 AS DateTime), CAST(0x0000A7C801334D84 AS DateTime), CAST(0x0000A7C800AEAEC9 AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (4290, N'9d15e784-caee-48ed-884a-ce2023ae3d79', N'Guest_4290', 1, 170, 0, 1, 1, CAST(0x0000A7C700FC6397 AS DateTime), CAST(0x0000A7C700FB2B46 AS DateTime), CAST(0x0000A7C700D0119C AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (4291, N'7c977689-4173-4a9c-b902-827c87ccf152', N'Guest_4291', 1, 206, 0, 1, 1, CAST(0x0000A7C80125D671 AS DateTime), CAST(0x0000A7C800AF77E9 AS DateTime), CAST(0x0000A7C800AF77E9 AS DateTime), 1, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (4292, N'f7b783a9-489e-4d63-acec-cacd5900e2e3', N'Guest_4292', 1, 201, 0, 1, 1, CAST(0x0000A7C8013FB9F5 AS DateTime), CAST(0x0000A7C8012BA4D7 AS DateTime), CAST(0x0000A7C80115EFBE AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (4293, N'fa941749-9522-4818-95fd-bb57687643e8', N'Guest_4293', 1, 154, 1, 1, 1, CAST(0x0000A7C801413CE2 AS DateTime), CAST(0x0000A7C80131E95D AS DateTime), CAST(0x0000A7C8013078D9 AS DateTime), 0, 1)
INSERT [dbo].[User] ([ID], [UUID], [UserName], [UserTypeID], [TotalCoin], [LevelProgress], [CurrentLevelNumber], [IsAbleToWriteComment], [LastSeenDateTime], [PrevLastSeenDateTime], [PreviousDaySeen], [DWMCount], [IsTutorial]) VALUES (4294, N'd8c16567-6a28-4d08-b9e3-2cd9aeea2b8f', N'Guest_4294', 1, 200, 0, 1, 1, CAST(0x0000A7C80140C97A AS DateTime), CAST(0x0000A7C80140C97A AS DateTime), CAST(0x0000A7C80140C97A AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserAvatar] ON 

INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (1, N'Images/avatar/cinema1.png', 1, N'سینمایی', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (2, N'Images/avatar/politic4.png', 30, N'کره شمالی', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (3, N'Images/avatar/politic3.png', 30, N'آلمان', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (4, N'Images/avatar/politic2.png', 40, N'امریکا', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (5, N'Images/avatar/politic1.png', 50, N'فرانسه', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (6, N'Images/avatar/girl1.png', 20, N'دختر 1', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (7, N'Images/avatar/girl_avatar.png', 20, N'دختر 2', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (8, N'Images/avatar/girl3.png', 20, N'دختر 3', 0, 1)
INSERT [dbo].[UserAvatar] ([ID], [PicUrl], [Price], [Name], [DiscountAmount], [TagStateID]) VALUES (9, N'Images/avatar/girl4.png', 20, N'دختر 4', 0, 1)
SET IDENTITY_INSERT [dbo].[UserAvatar] OFF
SET IDENTITY_INSERT [dbo].[UserCounts] ON 

INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (1, 3274, 0, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (2, 3275, 0, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (3, 3276, 0, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (4, 3277, 0, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (5, 3278, 0, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (6, 3279, 1, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (7, 3280, 0, 0, 0, 1)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (8, 3281, 0, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (9, 3282, 0, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (10, 3283, 0, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (11, 3284, 0, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (12, 3285, 10, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (13, 3286, 0, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (1013, 4286, 0, 0, 0, 4)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (1014, 4287, 0, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (1015, 4288, 2, 0, 0, 1)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (1016, 4289, 2, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (1017, 4290, 0, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (1018, 4291, 0, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (1019, 4292, 0, 0, 0, 0)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (1020, 4293, 0, 0, 0, 1)
INSERT [dbo].[UserCounts] ([ID], [UserID], [PurchasedCategoryCount], [PurchasedAvatarCount], [PurchasedThemeCount], [CreatedQuestionsCount]) VALUES (1021, 4294, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[UserCounts] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1143, 1158, N'ja7ad.borhani@gmail.com', N'123456789', NULL, NULL, 0, 0, 1, CAST(0x0000A73901747A4C AS DateTime), CAST(0x0000A73A000AFEE8 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1145, 1160, N'keivan.moazami@gmail.com', N'mo', NULL, NULL, 0, 0, 1, CAST(0x0000A73A00D240BB AS DateTime), CAST(0x0000A73A00DAD167 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1147, 1162, N'mohammad134613@yahoo.com', N'mo1811360', NULL, NULL, 0, 0, 1, CAST(0x0000A73A0156031B AS DateTime), CAST(0x0000A73A0157D6A1 AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1155, 1170, N'keivan.moazami@hotmail.com', N'mo1811360', NULL, NULL, 0, 0, 1, CAST(0x0000A74600DBC3DA AS DateTime), CAST(0x0000A7530164DDEA AS DateTime))
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (1158, 1173, N'javadborhani@yahoo.com', N'123456', NULL, NULL, 0, 0, 1, CAST(0x0000A74A011F3ED7 AS DateTime), CAST(0x0000A75001502B99 AS DateTime))
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
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2203, 2219, NULL, N'636300131771788015', NULL, NULL, 0, 0, 2, CAST(0x0000A76F00C02802 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2204, 2220, NULL, N'636306375055847188', NULL, NULL, 0, 0, 2, CAST(0x0000A77601198CDC AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2205, 2221, NULL, N'636307045209801038', NULL, NULL, 0, 0, 2, CAST(0x0000A77700C0D086 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2206, 2222, NULL, N'636307063383751677', NULL, NULL, 0, 0, 2, CAST(0x0000A77700C92249 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2207, 2223, NULL, N'636307064989224258', NULL, NULL, 0, 0, 2, CAST(0x0000A77700C9DE6D AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2208, 2224, NULL, N'636307080363480054', NULL, NULL, 0, 0, 2, CAST(0x0000A77700D0E818 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2209, 2225, NULL, N'636308168431406886', NULL, NULL, 0, 0, 2, CAST(0x0000A77801377A0E AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2210, 2226, NULL, N'636308180036747277', NULL, NULL, 0, 0, 2, CAST(0x0000A778013CCA0F AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2211, 2227, NULL, N'636308196911475349', NULL, NULL, 0, 0, 2, CAST(0x0000A77801448390 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2212, 2228, NULL, N'636311494407142765', NULL, NULL, 0, 0, 2, CAST(0x0000A77C00FBF4D6 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2213, 2229, NULL, N'636312438832488232', NULL, NULL, 0, 0, 2, CAST(0x0000A77D0120C5AE AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2214, 2230, NULL, N'636326978926417968', NULL, NULL, 0, 0, 2, CAST(0x0000A78E00DD10F0 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2215, 2231, NULL, N'636326981962875209', NULL, NULL, 0, 0, 2, CAST(0x0000A78E00DE74C6 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2216, 2240, NULL, N'636327006300954760', NULL, NULL, 0, 0, 2, CAST(0x0000A78E00E998E5 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2217, 2241, NULL, N'636336864808926375', NULL, NULL, 0, 0, 2, CAST(0x0000A79A00005ECC AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2218, 2242, NULL, N'636337660817808520', NULL, NULL, 0, 0, 2, CAST(0x0000A79A016CC116 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2219, 2243, NULL, N'636337726147665174', NULL, NULL, 0, 0, 2, CAST(0x0000A79A018AA8EE AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2220, 2244, NULL, N'636338984205021939', NULL, NULL, 0, 0, 2, CAST(0x0000A79C00B38987 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2221, 2245, NULL, N'636339449941720554', NULL, NULL, 0, 0, 2, CAST(0x0000A79C0188BC0C AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2222, 2246, NULL, N'636339537210782059', NULL, NULL, 0, 0, 2, CAST(0x0000A79D00252CE3 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2223, 2247, NULL, N'636339799423679779', NULL, NULL, 0, 0, 2, CAST(0x0000A79D009D34F6 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2224, 2248, NULL, N'636340248417030730', NULL, NULL, 0, 0, 2, CAST(0x0000A79D016ABD5F AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2225, 2249, NULL, N'636340257803957631', NULL, NULL, 0, 0, 2, CAST(0x0000A79D016F0967 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2226, 2250, NULL, N'636340282005881902', NULL, NULL, 0, 0, 2, CAST(0x0000A79D017A1D90 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2227, 2251, NULL, N'636340310760646580', NULL, NULL, 0, 0, 2, CAST(0x0000A79D01874744 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2228, 2252, NULL, N'636340464891292349', NULL, NULL, 0, 0, 2, CAST(0x0000A79E00425373 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2229, 2253, NULL, N'636342097415177374', NULL, NULL, 0, 0, 2, CAST(0x0000A7A000169ED7 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2230, 2254, NULL, N'636341754304986807', NULL, NULL, 0, 0, 2, CAST(0x0000A79F0105109D AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2231, 2255, NULL, N'636342458860025050', NULL, NULL, 0, 0, 2, CAST(0x0000A7A000BC13A9 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2232, 2256, NULL, N'636342499077335349', NULL, NULL, 0, 0, 2, CAST(0x0000A7A000CE7CA0 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2233, 2257, NULL, N'636342538492609774', NULL, NULL, 0, 0, 2, CAST(0x0000A7A000E0879A AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2234, 2258, NULL, N'636342657031289798', NULL, NULL, 0, 0, 2, CAST(0x0000A7A00116CADB AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2235, 2259, NULL, N'636345083978111002', NULL, NULL, 0, 0, 2, CAST(0x0000A7A300CB3CAF AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2236, 2260, NULL, N'636345090524811002', NULL, NULL, 0, 0, 2, CAST(0x0000A7A300CE3BE0 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2237, 2261, NULL, N'636345225189101002', NULL, NULL, 0, 0, 2, CAST(0x0000A7A3010BE0D9 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2238, 2262, NULL, N'636345294597691002', NULL, NULL, 0, 0, 2, CAST(0x0000A7A3012BA6AB AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2239, 2263, NULL, N'636345298638061002', NULL, NULL, 0, 0, 2, CAST(0x0000A7A3012D8026 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2240, 2264, NULL, N'636346822318801844', NULL, NULL, 0, 0, 2, CAST(0x0000A7A500CFF87C AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2241, 2265, NULL, N'636346823588824485', NULL, NULL, 0, 0, 2, CAST(0x0000A7A500D08D50 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2242, 2266, NULL, N'636346830898702586', NULL, NULL, 0, 0, 2, CAST(0x0000A7A500D3E5F1 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2243, 2267, NULL, N'636346831497236820', NULL, NULL, 0, 0, 2, CAST(0x0000A7A500D42C15 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2244, 2268, NULL, N'636348875636371830', NULL, NULL, 0, 0, 2, CAST(0x0000A7A70164E39F AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2245, 2269, NULL, N'636351086566289788', NULL, NULL, 0, 0, 2, CAST(0x0000A7AA00B672FD AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2246, 2270, NULL, N'636352269265604716', NULL, NULL, 0, 0, 2, CAST(0x0000A7AB01485690 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (2247, 2271, NULL, N'636352915182869070', NULL, NULL, 0, 0, 2, CAST(0x0000A7AC00E481FE AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3247, 3271, NULL, N'636352975213696355', NULL, NULL, 0, 0, 2, CAST(0x0000A7AC00FFFCDB AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3248, 3272, NULL, N'636353149576009309', NULL, NULL, 0, 0, 2, CAST(0x0000A7AC014FCDF0 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3249, 3273, NULL, N'636353161487130586', NULL, NULL, 0, 0, 2, CAST(0x0000A7AC015541C6 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3250, 3274, NULL, N'636353892679432394', NULL, NULL, 0, 0, 2, CAST(0x0000A7AD0118765F AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3251, 3275, NULL, N'636355453234881060', NULL, NULL, 0, 0, 2, CAST(0x0000A7AF00CBCFF6 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3252, 3276, NULL, N'636355593908967157', NULL, NULL, 0, 0, 2, CAST(0x0000A7AF010C3535 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3253, 3277, NULL, N'636361612086225687', NULL, NULL, 0, 0, 2, CAST(0x0000A7B600FE8E5B AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3254, 3278, NULL, N'636361941349728482', NULL, NULL, 0, 0, 2, CAST(0x0000A7B70009C5EC AS DateTime), NULL)
GO
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3255, 3279, NULL, N'636363441282869751', NULL, NULL, 0, 0, 2, CAST(0x0000A7B8012CE156 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3256, 3280, NULL, N'636364297885554622', NULL, NULL, 0, 0, 2, CAST(0x0000A7B901297E77 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3257, 3281, NULL, N'636365949097762579', NULL, NULL, 0, 0, 2, CAST(0x0000A7BB010657E5 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3258, 3282, NULL, N'636366077988864729', NULL, NULL, 0, 0, 2, CAST(0x0000A7BB01415852 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3259, 3283, NULL, N'636366084249112795', NULL, NULL, 0, 0, 2, CAST(0x0000A7BB014435F1 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3260, 3284, NULL, N'636366091322007341', NULL, NULL, 0, 0, 2, CAST(0x0000A7BB014772CC AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3261, 3285, NULL, N'636366757061155442', NULL, NULL, 0, 0, 2, CAST(0x0000A7BC00ECB11B AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (3262, 3286, NULL, N'636373232373039166', NULL, NULL, 0, 0, 2, CAST(0x0000A7C40024CAB7 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (4262, 4286, NULL, N'636373848588206453', NULL, NULL, 0, 0, 2, CAST(0x0000A7C4013EDF6E AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (4263, 4287, NULL, N'636374435773811548', NULL, NULL, 0, 0, 2, CAST(0x0000A7C500C0283E AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (4264, 4288, NULL, N'636374630576193607', NULL, NULL, 0, 0, 2, CAST(0x0000A7C5011954A6 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (4265, 4289, NULL, N'636376193238892617', NULL, NULL, 0, 0, 2, CAST(0x0000A7C700CDA52F AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (4266, 4290, NULL, N'636376198533245436', NULL, NULL, 0, 0, 2, CAST(0x0000A7C700D0119E AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (4267, 4291, NULL, N'636376296043752718', NULL, NULL, 0, 0, 2, CAST(0x0000A7C700FCB4A1 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (4268, 4292, NULL, N'636377215162553904', NULL, NULL, 0, 0, 2, CAST(0x0000A7C80115EFDD AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (4269, 4293, NULL, N'636377273129439420', NULL, NULL, 0, 0, 2, CAST(0x0000A7C8013078DB AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([ID], [UserID], [Email], [Password], [PhoneNumber], [GoogleID], [IsVerified], [IsBanned], [IsEditable], [RegisterDateTime], [ChangeInfoDate]) VALUES (4270, 4294, NULL, N'636377308769947940', NULL, NULL, 0, 0, 2, CAST(0x0000A7C80140C97B AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
SET IDENTITY_INSERT [dbo].[UserStat] ON 

INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1, 1158, 3, 3, 60, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (2, 1160, 700, 700, 12, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (3, 1162, 78, 78, 37, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (4, 1170, 8, 8, 51, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (5, 1173, 578, 578, 21, 0, 5)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (6, 2177, 456456, 456456, 2, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (7, 2178, 45, 45, 49, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (8, 2179, 7567, 7567, 10, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (9, 2180, 567, 567, 22, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (10, 2181, 7, 7, 52, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (11, 2182, 678, 678, 13, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (12, 2183, 645645, 645645, 1, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (13, 2184, 6, 6, 57, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (14, 2185, 567, 567, 24, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (15, 2186, 56, 56, 41, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (16, 2187, 567, 567, 23, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (17, 2188, 657, 657, 17, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (18, 2189, 57, 57, 40, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (19, 2190, 567, 567, 25, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (20, 2191, 567, 567, 26, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (21, 2192, 7, 7, 54, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (22, 2193, 645, 645, 18, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (23, 2194, 456, 456, 34, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (24, 2195, 345456, 345456, 3, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (25, 2196, 45, 45, 47, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (26, 2197, 6, 6, 55, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (27, 2198, 45645, 45645, 7, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (28, 2199, 46, 46, 46, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (29, 2200, 0, 0, 61, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (30, 2201, 567, 567, 27, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (31, 2202, 456, 456, 33, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (32, 2203, 7, 7, 53, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (33, 2204, 6, 6, 56, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (34, 2205, 464, 464, 32, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (35, 2206, 34, 34, 50, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (36, 2207, 56, 56, 43, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (37, 2208, 10787, 10787, 9, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (38, 2209, 45, 45, 48, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (39, 2210, 567, 567, 30, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (40, 2211, 68, 68, 38, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (41, 2212, 678, 678, 15, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (42, 2213, 23421, 23421, 8, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (43, 2214, 67, 67, 39, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (44, 2215, 2435, 2435, 11, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (45, 2216, 678, 678, 14, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (46, 2217, 567, 567, 31, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (47, 2218, 6, 6, 58, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (48, 2219, 567, 567, 29, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (49, 2220, 123123, 123123, 4, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (50, 2221, 56, 56, 42, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (51, 2222, 645, 645, 20, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (52, 2223, 64564, 64564, 5, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (53, 2224, 456, 456, 35, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (54, 2225, 45646, 45646, 6, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (55, 2226, 678, 678, 16, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (56, 2227, 85, 85, 36, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (57, 2228, 56, 56, 44, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (59, 2229, 4, 4, 59, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (60, 2230, 56, 56, 45, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (61, 2231, 645, 645, 19, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (63, 2240, 567, 567, 28, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (64, 2241, 0, 0, 62, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (65, 2242, 0, 0, 63, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (66, 2243, 0, 0, 64, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (67, 2244, 0, 0, 65, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (68, 2245, 0, 0, 66, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (69, 2246, 0, 0, 67, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (70, 2247, 0, 0, 68, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (71, 2248, 0, 0, 69, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (72, 2249, 0, 0, 70, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (73, 2250, 0, 0, 71, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (74, 2251, 0, 0, 72, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (75, 2252, 0, 0, 73, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (76, 2253, 0, 0, 74, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (77, 2254, 0, 0, 75, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (78, 2255, 0, 0, 76, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (79, 2256, 0, 0, 77, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (80, 2257, 0, 0, 78, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (81, 2258, 0, 0, 79, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (82, 2259, 0, 0, 80, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (83, 2260, 0, 0, 81, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (84, 2261, 0, 0, 82, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (85, 2262, 0, 0, 83, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (86, 2263, 0, 0, 84, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (87, 2264, 0, 0, 85, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (88, 2265, 0, 0, 86, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (89, 2266, 0, 0, 87, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (90, 2267, 0, 0, 88, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (91, 2268, 0, 0, 89, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (92, 2269, 0, 0, 90, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (93, 2270, 0, 0, 91, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (94, 2271, 0, 0, 92, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1094, 3271, 0, 0, 93, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1095, 3272, 0, 0, 94, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1096, 3273, 0, 0, 95, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1097, 3274, 0, 0, 96, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1098, 3275, 0, 0, 97, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1099, 3276, 0, 0, 98, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1100, 3277, 0, 0, 99, 3, 0)
GO
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1101, 3278, 0, 0, 100, 0, 26)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1102, 3279, 0, 0, 101, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1103, 3280, 0, 0, 102, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1104, 3281, 0, 0, 103, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1105, 3282, 0, 0, 104, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1106, 3283, 0, 0, 105, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1107, 3284, 0, 0, 106, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1108, 3285, 0, 0, 107, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (1109, 3286, 0, 0, 108, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (2109, 4286, 0, 0, 109, 0, 5)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (2110, 4287, 0, 0, 110, 3, 0)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (2111, 4288, 0, 0, 111, 0, 80)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (2112, 4289, 0, 0, 112, 0, 121)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (2113, 4290, 0, 0, 113, 0, 19)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (2114, 4291, 0, 0, 114, 0, 3)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (2115, 4292, 0, 0, 115, 0, 6)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (2116, 4293, 0, 0, 116, 0, 7)
INSERT [dbo].[UserStat] ([ID], [UserID], [Score], [OldScore], [Rank], [SpinRemainedChance], [SpinWheelCount]) VALUES (2117, 4294, 0, 0, 117, 3, 0)
SET IDENTITY_INSERT [dbo].[UserStat] OFF
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
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (15, 2209, 1, N'6ccccfb7-dcce-461d-a5ec-966ee6417926', CAST(0x0000A76F010255B5 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (16, 2209, 1, N'6dd3f7b4-6e6a-4cfd-97e5-e18fae98723a', CAST(0x0000A77300EF7194 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (17, 2225, 1, N'18084bdb-6d61-425d-bdb8-2315e85638b3', CAST(0x0000A7780140ACA7 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (18, 2227, 1, N'91294e0b-ce04-4929-a6c3-a94d53b93c7e', CAST(0x0000A779017B0A62 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (19, 1173, 1, N'ba1e54aa-c417-40e1-a377-bf99e6b40b61', CAST(0x0000A77E015FE366 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (20, 2263, 1, N'bfd806bb-453e-40ec-a7a4-3bc270dfbe0f', CAST(0x0000A7A601796081 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (21, 2268, 1, N'1f9238a0-ecfa-437e-bbc0-d1d684bd3d80', CAST(0x0000A7A7016FE332 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (22, 2270, 1, N'94c07898-31a9-4886-b695-eca35f5b4024', CAST(0x0000A7AC00065B4C AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (23, 3271, 1, N'e1959b2d-803e-4e36-960c-a17ac372cff6', CAST(0x0000A7AC0103F5F2 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (24, 3272, 1, N'e21d6e04-97b5-42d5-825f-af5cb805bea9', CAST(0x0000A7AD00E56D6E AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (25, 3274, 1, N'16598054-a99d-42b8-9da2-85adcb824a5f', CAST(0x0000A7AD011A8D74 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (26, 3274, 1, N'7f776163-dcad-4e40-935d-38360146ca79', CAST(0x0000A7AD011D6CD8 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (27, 3273, 1, N'5bb739a6-d185-4f2e-ae66-d8deb588ac53', CAST(0x0000A7AE000A8E17 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (28, 3273, 1, N'd18b66f2-a5c0-40c3-941d-f02d4ca87534', CAST(0x0000A7AE00952DE9 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (29, 3276, 1, N'eb613bf3-8823-4fd1-9f84-9cacd187c82c', CAST(0x0000A7B001673B4C AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (30, 3276, 1, N'04d294fc-a5f7-4999-ae54-d04ed70b5803', CAST(0x0000A7B2017BB0DD AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (31, 3276, 1, N'0a12afde-b96d-4b66-9fe0-5c116e1df042', CAST(0x0000A7B2017D1726 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (32, 3276, 1, N'e2952562-aaba-4f6d-abea-8a910986afab', CAST(0x0000A7B40167DF4D AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (33, 3276, 1, N'aa7d8cef-bad8-488b-9bca-8d1d6a9047ff', CAST(0x0000A7B40168D444 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (34, 3276, 1, N'15c053c6-11f7-4ba5-bf3e-c6dc0ce0fefe', CAST(0x0000A7B50001FD9B AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (35, 3280, 1, N'3e019d35-6798-4189-8ee1-8d275f4584da', CAST(0x0000A7BA0001D3D9 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (36, 3282, 1, N'7f982e67-1e8f-4b52-a2a9-5f3a1f0a2d1d', CAST(0x0000A7BB014944A2 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (37, 3281, 1, N'b3f9ddb7-6b76-49e7-a747-bcf6479efa4a', CAST(0x0000A7BB017B6A72 AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (38, 3285, 1, N'b4ef9032-ca31-4c17-9d60-5987190de365', CAST(0x0000A7BC014C138F AS DateTime))
INSERT [dbo].[WatchedAd] ([ID], [UserID], [WatchAdProviderId], [WatchAdId], [InsertDate]) VALUES (39, 4288, 1, N'5f492f24-1a4e-45a5-bd50-0582ad46fc49', CAST(0x0000A7C5014AE3CB AS DateTime))
SET IDENTITY_INSERT [dbo].[WatchedAd] OFF
ALTER TABLE [dbo].[Achievement] ADD  CONSTRAINT [DF_Achievement_Prize]  DEFAULT ((0)) FOR [ScorePrize]
GO
ALTER TABLE [dbo].[Achievement] ADD  CONSTRAINT [DF_Achievement_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Achievement] ADD  CONSTRAINT [DF_Achievement_Priority]  DEFAULT ((1)) FOR [Priority]
GO
ALTER TABLE [dbo].[Answer] ADD  CONSTRAINT [DF_Answer_CategoryID]  DEFAULT ((1)) FOR [CategoryID]
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
ALTER TABLE [dbo].[Characters] ADD  CONSTRAINT [DF_Characters_UserCount]  DEFAULT ((0)) FOR [UserCount]
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
ALTER TABLE [dbo].[PersonalizedCharacter] ADD  CONSTRAINT [DF_PersonalizedCharacter_OldPointCount]  DEFAULT ((0)) FOR [OldPointCount]
GO
ALTER TABLE [dbo].[PurchaseCategory] ADD  CONSTRAINT [DF_PurchaseCategory_AnswerCount]  DEFAULT ((0)) FOR [AnswerCount]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_Banned]  DEFAULT ((0)) FOR [Banned]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_CommentCount]  DEFAULT ((0)) FOR [CommentCount]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_MarketID]  DEFAULT ((1)) FOR [MarketID]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_SKU]  DEFAULT ('SKU_1000_Toman') FOR [SKU]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_IsAccessibleInAllStore]  DEFAULT ((0)) FOR [IsAccessibleInAllStores]
GO
ALTER TABLE [dbo].[Store] ADD  CONSTRAINT [DF_Store_IsInOff]  DEFAULT ((0)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_LevelProgress]  DEFAULT ((0)) FOR [LevelProgress]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsAbleToWriteComment]  DEFAULT ((1)) FOR [IsAbleToWriteComment]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_PrevLastSeenDateTime]  DEFAULT (((2017)-(1))-(4)) FOR [PrevLastSeenDateTime]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_PreviousDaySeen]  DEFAULT (getdate()) FOR [PreviousDaySeen]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_DWMCount]  DEFAULT ((0)) FOR [DWMCount]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsTutorial]  DEFAULT ((1)) FOR [IsTutorial]
GO
ALTER TABLE [dbo].[UserAvatar] ADD  CONSTRAINT [DF_UserAvatar_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[UserAvatar] ADD  CONSTRAINT [DF_UserAvatar_Name]  DEFAULT (N'No-Name') FOR [Name]
GO
ALTER TABLE [dbo].[UserAvatar] ADD  CONSTRAINT [DF_UserAvatar_DiscountAmount]  DEFAULT ((0)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[UserAvatar] ADD  CONSTRAINT [DF_UserAvatar_IsNew]  DEFAULT ((1)) FOR [TagStateID]
GO
ALTER TABLE [dbo].[UserCounts] ADD  CONSTRAINT [DF_UserCounts_PurchasedCategoryCount]  DEFAULT ((0)) FOR [PurchasedCategoryCount]
GO
ALTER TABLE [dbo].[UserCounts] ADD  CONSTRAINT [DF_UserCounts_PurchasedAvatarCount]  DEFAULT ((0)) FOR [PurchasedAvatarCount]
GO
ALTER TABLE [dbo].[UserCounts] ADD  CONSTRAINT [DF_UserCounts_PurchasedThemeCount]  DEFAULT ((0)) FOR [PurchasedThemeCount]
GO
ALTER TABLE [dbo].[UserCounts] ADD  CONSTRAINT [DF_UserCounts_CreatedQuestionsCount]  DEFAULT ((0)) FOR [CreatedQuestionsCount]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_Password]  DEFAULT (N'Password') FOR [Password]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsVerified]  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsBanned]  DEFAULT ((0)) FOR [IsBanned]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsEdited]  DEFAULT ((2)) FOR [IsEditable]
GO
ALTER TABLE [dbo].[UserStat] ADD  CONSTRAINT [DF_UserStat_Score]  DEFAULT ((0)) FOR [Score]
GO
ALTER TABLE [dbo].[UserStat] ADD  CONSTRAINT [DF_UserStat_OldScore]  DEFAULT ((0)) FOR [OldScore]
GO
ALTER TABLE [dbo].[UserStat] ADD  CONSTRAINT [DF_UserStat_Rank]  DEFAULT ((0)) FOR [Rank]
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
ALTER TABLE [dbo].[AchievedScore]  WITH CHECK ADD  CONSTRAINT [FK_AchievedScore_ScoreTypes] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ScoreTypes] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AchievedScore] CHECK CONSTRAINT [FK_AchievedScore_ScoreTypes]
GO
ALTER TABLE [dbo].[AchievedScore]  WITH CHECK ADD  CONSTRAINT [FK_AchievedScore_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AchievedScore] CHECK CONSTRAINT [FK_AchievedScore_User]
GO
ALTER TABLE [dbo].[AchievedSpinWheel]  WITH CHECK ADD  CONSTRAINT [FK_AchievedSpinWheel_SpinWheel] FOREIGN KEY([SpinWheelID])
REFERENCES [dbo].[SpinWheel] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AchievedSpinWheel] CHECK CONSTRAINT [FK_AchievedSpinWheel_SpinWheel]
GO
ALTER TABLE [dbo].[AchievedSpinWheel]  WITH CHECK ADD  CONSTRAINT [FK_AchievedSpinWheel_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AchievedSpinWheel] CHECK CONSTRAINT [FK_AchievedSpinWheel_User]
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
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Category]
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
ALTER TABLE [dbo].[AssignedCharacter]  WITH CHECK ADD  CONSTRAINT [FK_AssignedCharacter_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AssignedCharacter] CHECK CONSTRAINT [FK_AssignedCharacter_Category]
GO
ALTER TABLE [dbo].[AssignedCharacter]  WITH CHECK ADD  CONSTRAINT [FK_AssignedCharacter_Characters] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Characters] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AssignedCharacter] CHECK CONSTRAINT [FK_AssignedCharacter_Characters]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_TagState] FOREIGN KEY([TagStateID])
REFERENCES [dbo].[TagState] ([ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_TagState]
GO
ALTER TABLE [dbo].[CharacterAlias]  WITH CHECK ADD  CONSTRAINT [FK_CharacterAlias_Characters] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Characters] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CharacterAlias] CHECK CONSTRAINT [FK_CharacterAlias_Characters]
GO
ALTER TABLE [dbo].[CharacterPoints]  WITH CHECK ADD  CONSTRAINT [FK_CharacterPoints_Characters] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Characters] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CharacterPoints] CHECK CONSTRAINT [FK_CharacterPoints_Characters]
GO
ALTER TABLE [dbo].[CharacterPoints]  WITH CHECK ADD  CONSTRAINT [FK_CharacterPoints_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CharacterPoints] CHECK CONSTRAINT [FK_CharacterPoints_Question]
GO
ALTER TABLE [dbo].[CharacterPoints]  WITH CHECK ADD  CONSTRAINT [FK_CharacterPoints_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[CharacterPoints] CHECK CONSTRAINT [FK_CharacterPoints_User]
GO
ALTER TABLE [dbo].[CharacterPoints]  WITH CHECK ADD  CONSTRAINT [FK_CharacterPoints_User1] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CharacterPoints] CHECK CONSTRAINT [FK_CharacterPoints_User1]
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
ALTER TABLE [dbo].[DailyRewardsAchieved]  WITH CHECK ADD  CONSTRAINT [FK_DailyRewardsAchieved_DailyRewards] FOREIGN KEY([DailyRewardsID])
REFERENCES [dbo].[DailyRewards] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DailyRewardsAchieved] CHECK CONSTRAINT [FK_DailyRewardsAchieved_DailyRewards]
GO
ALTER TABLE [dbo].[DailyRewardsAchieved]  WITH CHECK ADD  CONSTRAINT [FK_DailyRewardsAchieved_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DailyRewardsAchieved] CHECK CONSTRAINT [FK_DailyRewardsAchieved_User]
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
ALTER TABLE [dbo].[PersonalizedCharacter]  WITH CHECK ADD  CONSTRAINT [FK_PersonalizedCharacter_Characters] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Characters] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonalizedCharacter] CHECK CONSTRAINT [FK_PersonalizedCharacter_Characters]
GO
ALTER TABLE [dbo].[PersonalizedCharacter]  WITH CHECK ADD  CONSTRAINT [FK_PersonalizedCharacter_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonalizedCharacter] CHECK CONSTRAINT [FK_PersonalizedCharacter_User]
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
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_QuestionAction] FOREIGN KEY([ActionID])
REFERENCES [dbo].[QuestionAction] ([ID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_QuestionAction]
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
ALTER TABLE [dbo].[SpinWheel]  WITH CHECK ADD  CONSTRAINT [FK_SpinWheel_SpinWheel] FOREIGN KEY([SpinWheelAlternativeID])
REFERENCES [dbo].[SpinWheel] ([ID])
GO
ALTER TABLE [dbo].[SpinWheel] CHECK CONSTRAINT [FK_SpinWheel_SpinWheel]
GO
ALTER TABLE [dbo].[SpinWheel]  WITH CHECK ADD  CONSTRAINT [FK_SpinWheel_SpinWheelType] FOREIGN KEY([SpinWheelTypeID])
REFERENCES [dbo].[SpinWheelType] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SpinWheel] CHECK CONSTRAINT [FK_SpinWheel_SpinWheelType]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_MarketInfo] FOREIGN KEY([MarketID])
REFERENCES [dbo].[MarketInfo] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_MarketInfo]
GO
ALTER TABLE [dbo].[UnRepeatableAchievedSpinWheel]  WITH CHECK ADD  CONSTRAINT [FK_UnRepeatableAchievedSpinWheel_SpinWheel] FOREIGN KEY([SpinWheelID])
REFERENCES [dbo].[SpinWheel] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UnRepeatableAchievedSpinWheel] CHECK CONSTRAINT [FK_UnRepeatableAchievedSpinWheel_SpinWheel]
GO
ALTER TABLE [dbo].[UnRepeatableAchievedSpinWheel]  WITH CHECK ADD  CONSTRAINT [FK_UnRepeatableAchievedSpinWheel_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UnRepeatableAchievedSpinWheel] CHECK CONSTRAINT [FK_UnRepeatableAchievedSpinWheel_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Level] FOREIGN KEY([CurrentLevelNumber])
REFERENCES [dbo].[Level] ([LevelNumber])
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
ALTER TABLE [dbo].[UserCounts]  WITH CHECK ADD  CONSTRAINT [FK_UserCounts_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserCounts] CHECK CONSTRAINT [FK_UserCounts_User]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_User]
GO
ALTER TABLE [dbo].[UserStat]  WITH CHECK ADD  CONSTRAINT [FK_UserStatus_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserStat] CHECK CONSTRAINT [FK_UserStatus_User]
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
/****** Object:  Trigger [dbo].[achievedCodeGift_afterInsert_update_number_of_users_achieved]    Script Date: 8/7/2017 8:03:49 PM ******/
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
/****** Object:  Trigger [dbo].[after_insert_achieved_score_updating_score_board]    Script Date: 8/7/2017 8:03:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[after_insert_achieved_score_updating_score_board]
   ON  [dbo].[AchievedScore]
   after Insert , Delete
AS 
BEGIN
  
	Update 
	[dbo].[UserStat]
	Set 
		Score = Score + 
		(
		Select SUM(Score)
		From inserted I 
		Where I.UserID = [dbo].[UserStat].UserID
		)
	Where 
		UserID IN (Select UserID from inserted)

	Update 
	[dbo].[UserStat]
	Set 
		Score = Score - 
		(
		Select SUM(Score)
		From deleted I 
		Where I.UserID = [dbo].[UserStat].UserID
		)
	Where 
		UserID IN (Select UserID from deleted)
	
END

GO
/****** Object:  Trigger [dbo].[update_reaminedChance_SpinCount_afterInsert]    Script Date: 8/7/2017 8:03:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--— =============================================
--— Author:    <Jeb,JavadBorhani>
--— Create date: <Now I mean Now>
--— Description:  <Put last rank to the new created user>
--— =============================================
Create TRIGGER [dbo].[update_reaminedChance_SpinCount_afterInsert]
   ON  [dbo].[AchievedSpinWheel]
   after Delete , insert
AS 
BEGIN
  
	Update 
	[dbo].[UserStat]
	Set 
		SpinRemainedChance = SpinRemainedChance - 
		(
		Select COUNT(*)
		From inserted I 
		Where I.UserID = [dbo].[UserStat].UserID
		)
		,
		SpinWheelCount = SpinWheelCount + 
		(
		Select COUNT(*)
		From inserted I 
		Where I.UserID = [dbo].[UserStat].UserID
		)
	Where 
		UserID IN (Select UserID from inserted)

		Update 
	[dbo].[UserStat]
	Set 
		SpinRemainedChance = SpinRemainedChance + 
		(
		Select COUNT(*)
		From deleted I 
		Where I.UserID = [dbo].[UserStat].UserID
		)
		,
		SpinWheelCount = SpinWheelCount - 
		(
		Select COUNT(*)
		From deleted I 
		Where I.UserID = [dbo].[UserStat].UserID
		)
	Where 
		UserID IN (Select UserID from deleted)
END

GO
/****** Object:  Trigger [dbo].[answer_after_user_answer]    Script Date: 8/7/2017 8:03:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[answer_after_user_answer]
   ON  [dbo].[Answer]
   after Delete , insert
AS 
BEGIN
  
  --// insert // update question table 
	Update Question 
	Set Dislike_Count = Dislike_Count + Answers.DisLikeCount,
		Like_Count = Like_Count  + Answers.LikeCount,
		Yes_Count = Yes_Count + Answers.YesCount,
		No_Count = No_Count + (Answers.TotalAnswer - Answers.YesCount)
	From
	(
    select QuestionID , 
    COALESCE(sum(cast(Liked as int)) , 0) LikeCount , 
    COALESCE(sum(cast(Dislike as int)) , 0) DisLikeCount , 
    COALESCE(sum(cast(YesNoState as int)) , 0) YesCount, 
	COUNT(QuestionID) TotalAnswer
	from inserted
		Group by QuestionID
	) as Answers
	Where Question.ID = Answers.QuestionID

 --—-------------------------------------------------------------------------
  --—//insert// update number of answers in purchased cateogry
  Update PurchaseCategory 
  Set AnswerCount = AnswerCount + Counter.Answers
  From 
    (Select UserID , CategoryID , Count(QuestionID) as Answers
    From inserted i 
    Group by UserID, CategoryID) as Counter
  Where 
    PurchaseCategory.UserID = Counter.UserID And 
    PurchaseCategory.CategoryID = Counter.CategoryID
  --—-------------------------------------------------------------------------



	--// delete // update question table 
	Update Question 
	Set Dislike_Count = Dislike_Count - Answers.DisLikeCount,
		Like_Count = Like_Count  - Answers.LikeCount,
		Yes_Count = Yes_Count - Answers.YesCount,
		No_Count = No_Count - (Answers.TotalAnswer - Answers.YesCount)
	From
	(
    select QuestionID , 
    COALESCE(sum(cast(Liked as int)) , 0) LikeCount , 
    COALESCE(sum(cast(Dislike as int)) , 0) DisLikeCount , 
    COALESCE(sum(cast(YesNoState as int)) , 0) YesCount, 
	COUNT(QuestionID) TotalAnswer
	from deleted
		Group by QuestionID
	) as Answers
	Where Question.ID = Answers.QuestionID


	--// delete // update question table 
  --—-------------------------------------------------------------------------
  Update PurchaseCategory 
    Set AnswerCount = AnswerCount - Counter.Answers
    From 
      (Select UserID , CategoryID , Count(QuestionID) as Answers
      From deleted d 
      Group by UserID, CategoryID) as Counter
    Where 
      PurchaseCategory.UserID = Counter.UserID And 
      PurchaseCategory.CategoryID = Counter.CategoryID
  --—-------------------------------------------------------------------------
END

GO
/****** Object:  Trigger [dbo].[update_personalized_character_rank_after_update]    Script Date: 8/7/2017 8:03:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--— =============================================
--— Author:    <Jeb,JavadBorhani>
--— Create date: <Now I mean Now>
--— Description:  <trigger to update table>
--— =============================================
CREATE TRIGGER [dbo].[update_personalized_character_rank_after_update]
   ON  [dbo].[CharacterPoints]
   after Delete , insert
AS 
BEGIN
  
	Update 
	[dbo].[PersonalizedCharacter]
	Set 
		NewPointCount = NewPointCount + 
		(
		Select COUNT(*)
		From inserted I 
		Where I.CreatorID = [dbo].[PersonalizedCharacter].UserID And I.CharacterID = [dbo].[PersonalizedCharacter].CharacterID
		)
	Where 
			UserID IN (Select CreatorID from inserted)
		And 
			CharacterID IN (Select CharacterID from inserted)

	Update 
	[dbo].[PersonalizedCharacter]
	Set 
		NewPointCount = NewPointCount - 
		(
		Select COUNT(*)
		From deleted I 
		Where I.CreatorID = [dbo].[PersonalizedCharacter].UserID And I.CharacterID = [dbo].[PersonalizedCharacter].CharacterID
		)
	Where 
			UserID IN (Select CreatorID from deleted)
		And 
			CharacterID IN (Select CharacterID from deleted)
END

GO
/****** Object:  Trigger [dbo].[after_insert_comment_count]    Script Date: 8/7/2017 8:03:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[after_insert_comment_count]
   ON  [dbo].[Comment]
   after Delete , insert
AS 
BEGIN
  
	Update 
	[dbo].[Question]
	Set 
		CommentCount = CommentCount + 
		(
		Select COUNT(*)
		From inserted I 
		Where I.QuestionID = [dbo].[Question].ID
		)
	Where 
		ID IN (Select QuestionID from inserted)


		Update 
	[dbo].[Question]
	Set 
		CommentCount = CommentCount - 
		(
		Select COUNT(*)
		From deleted I 
		Where I.QuestionID = [dbo].[Question].ID
		)
	Where 
		ID IN (Select QuestionID from deleted)
END

GO
/****** Object:  Trigger [dbo].[created_questions_after_insert_UserCount]    Script Date: 8/7/2017 8:03:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create TRIGGER [dbo].[created_questions_after_insert_UserCount]
   ON  [dbo].[CreatedQuestions]
   after Delete , insert
AS 
BEGIN
  
	Update 
	[dbo].[UserCounts]
	Set 
		[CreatedQuestionsCount] = [CreatedQuestionsCount] + 
		(
		Select COUNT(*)
		From inserted I 
		Where I.UserID = [dbo].[UserCounts].UserID
		)
	Where 
		UserID IN (Select UserID from inserted)

	Update 
	[dbo].[UserCounts]
	Set 
		[CreatedQuestionsCount] = [CreatedQuestionsCount] - 
		(
		Select COUNT(*)
		From deleted I 
		Where I.UserID = [dbo].[UserCounts].UserID
		)
	Where 
		UserID IN (Select UserID from deleted)
END

GO
/****** Object:  Trigger [dbo].[instead_of_insert_rank_calculation]    Script Date: 8/7/2017 8:03:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery34.sql|7|0|C:\Users\Jeb\AppData\Local\Temp\~vs56A4.sql
-- =============================================
-- Author:		<Jeb,JavadBorhani>
-- Create date: <Now I mean Now>
-- Description:	<Put last rank to the new created user>
-- =============================================
Create TRIGGER [dbo].[instead_of_insert_rank_calculation]
   ON  [dbo].[PersonalizedCharacter]
   instead of Insert
AS 
BEGIN
	insert into [dbo].[PersonalizedCharacter]
	Select 
		M.UserID , 
		M.CharacterID,
		0,
		0,
		coalesce(SS.RNK , 0) + 1 as Rank
	  From 
		inserted M 
		left Join 
				( Select  N.CharacterID , MAX(Rank) as RNK  From [dbo].[PersonalizedCharacter] N Where N.CharacterID IN (Select CharacterID From inserted ) Group by N.CharacterID ) SS
		 On 
				(M.CharacterID = SS.CharacterID) 
		 Where 
				M.UserID IN ( Select UserID From inserted)
	select ID from [dbo].[PersonalizedCharacter] where @@ROWCOUNT > 0 and [ID] = scope_identity() 
END


GO
/****** Object:  Trigger [dbo].[personalized_character_increase_character_user_count]    Script Date: 8/7/2017 8:03:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[personalized_character_increase_character_user_count]
   ON  [dbo].[PersonalizedCharacter]
   AFTER INSERT , Delete
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Update 
	[dbo].[Characters]
	Set 
		UserCount = UserCount + Temp.TotalCount
	From 
		(
		Select CharacterID , COUNT(*) as TotalCount
		From inserted I 
		Group By CharacterID
		) as Temp
	Where 
		ID = Temp.CharacterID


	Update 
	[dbo].[Characters]
	Set 
		UserCount = UserCount - Temp.TotalCount
	From 
		(
		Select CharacterID , COUNT(*) as TotalCount
		From deleted I 
		Group By CharacterID
		) as Temp
	Where 
		ID = Temp.CharacterID
END


GO
/****** Object:  Trigger [dbo].[purchase_avatar_after_insert_count_calculation]    Script Date: 8/7/2017 8:03:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[purchase_avatar_after_insert_count_calculation]
   ON  [dbo].[PurchaseAvatar]
   after Delete , insert
AS 
BEGIN
  
	Update 
	[dbo].[UserCounts]
	Set 
		[PurchasedAvatarCount] = [PurchasedAvatarCount] + 
		(
		Select COUNT(*)
		From inserted I 
		Where I.UserID = [dbo].[UserCounts].UserID
		)
	Where 
		UserID IN (Select UserID from inserted)

	Update 
	[dbo].[UserCounts]
	Set 
		[PurchasedAvatarCount] = [PurchasedAvatarCount] - 
		(
		Select COUNT(*)
		From deleted D 
		Where D.UserID = [dbo].[UserCounts].UserID
		)
	Where 
		UserID IN (Select UserID from deleted)
END

GO
/****** Object:  Trigger [dbo].[purchase_category_after_insert_user_purchase_count]    Script Date: 8/7/2017 8:03:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[purchase_category_after_insert_user_purchase_count]
   ON  [dbo].[PurchaseCategory]
   after Delete , insert
AS 
BEGIN
  
	Update 
	[dbo].[UserCounts]
	Set 
		[PurchasedCategoryCount] = [PurchasedCategoryCount] + 
		(
		Select COUNT(*)
		From inserted I 
		Where I.UserID = [dbo].[UserCounts].UserID
		)
	Where 
		UserID IN (Select UserID from inserted)

	Update 
	[dbo].[UserCounts]
	Set 
		[PurchasedCategoryCount] = [PurchasedCategoryCount] - 
		(
		Select COUNT(*)
		From deleted D 
		Where D.UserID = [dbo].[UserCounts].UserID
		)
	Where 
		UserID IN (Select UserID from deleted)
END

GO
/****** Object:  Trigger [dbo].[purchase_theme_after_insert_user_purchase_count]    Script Date: 8/7/2017 8:03:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[purchase_theme_after_insert_user_purchase_count]
   ON  [dbo].[PurchaseTheme]
   after Delete , insert
AS 
BEGIN
  
	Update 
	[dbo].[UserCounts]
	Set 
		[PurchasedThemeCount] = [PurchasedThemeCount] + 
		(
		Select COUNT(*)
		From inserted I 
		Where I.UserID = [dbo].[UserCounts].UserID
		)
	Where 
		UserID IN (Select UserID from inserted)

	Update 
	[dbo].[UserCounts]
	Set 
		[PurchasedThemeCount] = [PurchasedThemeCount] - 
		(
		Select COUNT(*)
		From deleted D 
		Where D.UserID = [dbo].[UserCounts].UserID
		)
	Where 
		UserID IN (Select UserID from deleted)
END

GO
/****** Object:  Trigger [dbo].[user_stat_instead_of_insert_rank_calculation]    Script Date: 8/7/2017 8:03:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery34.sql|7|0|C:\Users\Jeb\AppData\Local\Temp\~vs56A4.sql
-- =============================================
-- Author:		<Jeb,JavadBorhani>
-- Create date: <Now I mean Now>
-- Description:	<Put last rank to the new created user>
-- =============================================
CREATE TRIGGER [dbo].[user_stat_instead_of_insert_rank_calculation]
   ON  [dbo].[UserStat]
   instead of Insert
AS 
BEGIN
	Declare @maxRank int ;
	Set @maxRank = ( Select MAX(Rank) as RNK  From [dbo].[UserStat]) + 1 ; 

	insert into [dbo].[UserStat](UserID , Score , OldScore , Rank , SpinRemainedChance , SpinWheelCount)
	Select 
		M.UserID , 
		0,
		0,
		@maxRank, 
		M.SpinRemainedChance,
		M.SpinWheelCount
	  From 
		inserted M 
	select ID from [dbo].[UserStat] where @@ROWCOUNT > 0 and [ID] = scope_identity() 
END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[30] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "User"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 255
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "UserCounts"
            Begin Extent = 
               Top = 179
               Left = 316
               Bottom = 309
               Right = 541
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UserStat"
            Begin Extent = 
               Top = 6
               Left = 502
               Bottom = 136
               Right = 707
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2040
         Width = 1815
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2685
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AchievementStatistics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AchievementStatistics'
GO
