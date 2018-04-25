USE [SocialChimishodLive]
GO
/****** Object:  Trigger [dbo].[quest_answer_answer_after_updating_likecount_ansd_dislike]    Script Date: 4/25/2018 2:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
ALTER TRIGGER [dbo].[quest_answer_answer_after_updating_likecount_ansd_dislike]
   ON  [dbo].[QuestAnswer]
   after Update
AS 
BEGIN
  
  --// update // update question table 
  ------------------------------------------------------------------
	Update Question 
	Set Dislike_Count = Dislike_Count + Answers.DisLikeCount - Answers.MinusDisLikeCount,
		Like_Count = Like_Count  + Answers.LikeCount - Answers.MinusLikeCount,
		Yes_Count = Yes_Count + Answers.YesCount - Answers.MinusYesCount,
		No_Count = No_Count + Answers.NoCount - Answers.MinusNoCount
	From
	(
    select QuestionID , 
    COALESCE(sum(cast(Liked as int)) , 0) LikeCount , 
    COALESCE(sum(cast(Dislike as int)) , 0) DisLikeCount , 
    COALESCE(sum(cast(YesState as int)) , 0) YesCount, 
	COALESCE(sum(cast(NoState as int)) , 0) NoCount,

	COALESCE(sum(cast(MinusLiked as int)) , 0) MinusLikeCount , 
    COALESCE(sum(cast(MinusDisliked as int)) , 0) MinusDisLikeCount , 
    COALESCE(sum(cast(MinusYes as int)) , 0) MinusYesCount, 
	COALESCE(sum(cast(MinusNo as int)) , 0) MinusNoCount
	from (select i.QuestionID , i.YesState ,  i.NoState , i.Liked ,  i.Dislike,
				d.YesState MinusYes , d.NoState MinusNo , d.Liked MinusLiked , d.Dislike MinusDisliked 
				from inserted i join deleted d on i.QuestionID = d.QuestionID  
		) updated
		Group by QuestionID
	) as Answers
	Where Question.ID = Answers.QuestionID
  ------------------------------------------------------------------
END

