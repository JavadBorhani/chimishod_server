USE [what_if]
GO
/****** Object:  Trigger [dbo].[after_insert_achieved_score_updating_score_board]    Script Date: 6/29/2017 10:26:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[after_insert_achieved_score_updating_score_board]
   ON  [dbo].[AchievedScore]
   after Insert , Delete
AS 
BEGIN
  
	Update 
	[dbo].[UserStat]
	Set 
		Score = Score + 
		(
		Select SUM(Score)
		From inserted I 
		Where I.UserID = [dbo].[UserStat].UserID
		)
	Where 
		UserID IN (Select UserID from inserted)

	Update 
	[dbo].[UserStat]
	Set 
		Score = Score - 
		(
		Select SUM(Score)
		From deleted I 
		Where I.UserID = [dbo].[UserStat].UserID
		)
	Where 
		UserID IN (Select UserID from deleted)
	
END