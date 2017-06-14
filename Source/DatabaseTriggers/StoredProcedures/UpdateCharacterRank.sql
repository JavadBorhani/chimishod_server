USE [what_if]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCharacterRank]    Script Date: 6/14/2017 2:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UpdateCharacterRank]
AS
BEGIN
	
	SET NOCOUNT ON;
		Update 
			[what_if].[dbo].[PersonalizedCharacter]
		Set 
			[what_if].[dbo].[PersonalizedCharacter].Rank = Ranking.NewRank,
			[what_if].[dbo].[PersonalizedCharacter].OldPointCount = Ranking.NewPointCount
		FROM
			(Select 
					ID , 
					NewPointCount ,
					ROW_NUMBER() over (PARTITION by	CharacterID Order BY NewPointCount DESC) as NewRank
			FROM
				[what_if].[dbo].[PersonalizedCharacter]
			) as Ranking
		WHERE
			[what_if].[dbo].[PersonalizedCharacter].ID = Ranking.ID
END
