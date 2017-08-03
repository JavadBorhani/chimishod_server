USE [what_if]
GO
/****** Object:  Trigger [dbo].[answer_after_user_answer]    Script Date: 7/23/2017 12:08:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[answer_after_user_answer]
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
