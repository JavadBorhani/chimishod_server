USE [SocialChimishod]
GO
/****** Object:  Trigger [dbo].[answer_after_updating_likecount_ansd_dislike]    Script Date: 2/27/2018 4:11:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[answer_after_updating_likecount_ansd_dislike]
   ON  [dbo].[Answer]
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
