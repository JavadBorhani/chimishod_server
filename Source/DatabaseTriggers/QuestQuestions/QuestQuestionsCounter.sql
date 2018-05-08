USE [SocialChimishodDev]
GO
/****** Object:  Trigger [dbo].[question_counter]    Script Date: 5/8/2018 5:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[question_counter]
   ON  [dbo].[QuestQuestions]
   after Update , insert , Delete
AS 
BEGIN
  
  --// insert // update question table 
	UPDATE quest 
	SET    numberofquestionsinquest = questioncount 
	FROM   (SELECT 0 AS QuestionCount, 
				   questnumber 
			FROM   [dbo].quest 
			GROUP  BY questnumber) AS Quests
	Where[dbo].[quest].QuestNumber = Quests.QuestNumber
  ------------------------------------------------------------------
	UPDATE quest 
	SET    numberofquestionsinquest = Quests.questioncount 
	FROM   (SELECT Count(questionid) QuestionCount, 
					questnumber 
			FROM   [dbo].[questquestions] 
			GROUP  BY questnumber) AS Quests 
	WHERE  quest.questnumber = Quests.questnumber 
	------------------------------------------------------------------
END