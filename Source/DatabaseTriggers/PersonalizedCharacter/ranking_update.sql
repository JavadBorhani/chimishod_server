use what_if
GO
Set statistics Time on
Begin
Update 
	[what_if].[dbo].[PersonalizedCharacter]
Set 
	[what_if].[dbo].[PersonalizedCharacter].Rank = Ranking.NewRank,
	[what_if].[dbo].[PersonalizedCharacter].OldPointCount = Ranking.NewPointCount
FROM
	(Select 
			ID , 
			NewPointCount ,
			ROW_NUMBER() over (PARTITION by	CharacterID Order BY NewPointCount) as NewRank
	FROM
		[what_if].[dbo].[PersonalizedCharacter]
	) as Ranking
WHERE
	[what_if].[dbo].[PersonalizedCharacter].ID = Ranking.ID
	
End
Set statistics Time off