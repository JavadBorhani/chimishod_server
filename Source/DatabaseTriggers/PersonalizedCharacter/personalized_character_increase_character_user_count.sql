USE [what_if]
GO
/****** Object:  Trigger [dbo].[personalized_character_increase_character_user_count]    Script Date: 6/17/2017 2:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[personalized_character_increase_character_user_count]
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
