USE [what_if]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserGlobalRank]    Script Date: 6/14/2017 2:41:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UpdateUserGlobalRank]
AS
BEGIN
	
	SET NOCOUNT ON;
		Update 
			[what_if].[dbo].[UserStat]
		Set 
			[what_if].[dbo].[UserStat].Rank  = Ranking.NewRank,
			[what_if].[dbo].[UserStat].OldScore = Ranking.Score
		FROM
			(Select 
					ID , 
					Score ,
					ROW_NUMBER() over (Order BY Score DESC) as NewRank
			FROM
				[what_if].[dbo].[UserStat]
			) as Ranking
		WHERE
			[what_if].[dbo].[UserStat].ID = Ranking.ID
END
