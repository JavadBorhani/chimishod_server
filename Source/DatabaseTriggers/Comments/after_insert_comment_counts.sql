USE [what_if]
GO
/****** Object:  Trigger [dbo].[after_insert_comment_count]    Script Date: 6/25/2017 4:56:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[after_insert_comment_count]
   ON  [dbo].[Comment]
   after Delete , insert
AS 
BEGIN
  
	Update 
	[dbo].[Question]
	Set 
		CommentCount = CommentCount + 
		(
		Select COUNT(*)
		From inserted I 
		Where I.QuestionID = [dbo].[Question].ID
		)
	Where 
		ID IN (Select QuestionID from inserted)


		Update 
	[dbo].[Question]
	Set 
		CommentCount = CommentCount - 
		(
		Select COUNT(*)
		From deleted I 
		Where I.QuestionID = [dbo].[Question].ID
		)
	Where 
		ID IN (Select QuestionID from deleted)
END