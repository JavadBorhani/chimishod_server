USE [SocialChimishodLive]
GO
/****** Object:  Trigger [dbo].[quest_answer_answer_after_user_answer]    Script Date: 4/25/2018 2:51:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[quest_answer_answer_after_user_answer]
   ON  [dbo].[QuestAnswer]
   after Delete , insert
AS 
BEGIN
  
  --// insert // update question table 
  ------------------------------------------------------------------
	Update Question 
	Set Dislike_Count = Dislike_Count + Answers.DisLikeCount,
		Like_Count = Like_Count  + Answers.LikeCount,
		Yes_Count = Yes_Count + Answers.YesCount,
		No_Count = No_Count + Answers.NoCount,
		AnswerCount = AnswerCount + Answers.Answer_Count
	From
	(
    select QuestionID , 
    COALESCE(sum(cast(Liked as int)) , 0) LikeCount , 
    COALESCE(sum(cast(Dislike as int)) , 0) DisLikeCount , 
    COALESCE(sum(cast(YesState as int)) , 0) YesCount, 
	COALESCE(sum(cast(NoState as int)) , 0) NoCount,
	count(QuestionID) Answer_Count
	from inserted
		Group by QuestionID
	) as Answers
	Where Question.ID = Answers.QuestionID
	------------------------------------------------------------------

	--// delete // update question table 
	------------------------------------------------------------------
	Update Question 
	Set Dislike_Count = Dislike_Count - Answers.DisLikeCount,
		Like_Count = Like_Count - Answers.LikeCount,
		Yes_Count = Yes_Count - Answers.YesCount,
		No_Count = No_Count - Answers.NoCount,
		AnswerCount = AnswerCount - Answers.Answer_Count
	From
	(
    select QuestionID , 
    COALESCE(sum(cast(Liked as int)) , 0) LikeCount , 
    COALESCE(sum(cast(Dislike as int)) , 0) DisLikeCount , 
    COALESCE(sum(cast(YesState as int)) , 0) YesCount, 
	COALESCE(sum(cast(NoState as int)) , 0) NoCount,
	count(QuestionID) Answer_Count
	from deleted
		Group by QuestionID
	) as Answers
	Where Question.ID = Answers.QuestionID
	------------------------------------------------------------------
END


