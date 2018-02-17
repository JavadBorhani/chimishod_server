USE [SocialChimishod]
GO
/****** Object:  Trigger [dbo].[after_update_quest_score_of_player]    Script Date: 2/17/2018 8:21:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--— =============================================
--— Author:    <Jeb,JavadBorhani>
--— Create date: <Now I mean Now>
--— Description:  <trigger to update table>
--— =============================================
ALTER TRIGGER [dbo].[after_update_quest_score_of_player]
   ON  [dbo].[UserQuestAnswers]
   after Delete , insert
AS 
BEGIN
  
	Update 
	[dbo].[QuestScore]
	Set 
		Score = Score + 
		(
		Select SUM(Point)
		From inserted I 
		Where I.UserID = [dbo].[QuestScore].UserID And I.QuestNumber = [dbo].[QuestScore].QuestNumber
		)
	Where 
			UserID IN (Select UserID from inserted)
		And 
			QuestNumber IN (Select QuestNumber from inserted)

	Update 
	[dbo].[QuestScore]
	Set 
		Score = Score -
		(
		Select SUM(Point)
		From deleted I 
		Where I.UserID = [dbo].[QuestScore].UserID And I.QuestNumber = [dbo].[QuestScore].QuestNumber
		)
	Where 
			UserID IN (Select UserID from deleted)
		And 
			QuestNumber IN (Select QuestNumber from deleted)

END
