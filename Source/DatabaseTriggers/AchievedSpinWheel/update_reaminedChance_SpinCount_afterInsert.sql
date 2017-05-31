USE [what_if]
GO
/****** Object:  Trigger [dbo].[update_reaminedChance_SpinCount_afterInsert]    Script Date: 5/30/2017 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--— =============================================
--— Author:    <Jeb,JavadBorhani>
--— Create date: <Now I mean Now>
--— Description:  <Put last rank to the new created user>
--— =============================================
ALTER TRIGGER [dbo].[update_reaminedChance_SpinCount_afterInsert]
   ON  [dbo].[AchievedSpinWheel]
   after Delete , insert
AS 
BEGIN
  
	Update 
	[dbo].[UserStat]
	Set 
		SpinRemainedChance = SpinRemainedChance - 
		(
		Select COUNT(*)
		From inserted I 
		Where I.UserID = [dbo].[UserStat].UserID
		)
		,
		SpinWheelCount = SpinWheelCount + 
		(
		Select COUNT(*)
		From inserted I 
		Where I.UserID = [dbo].[UserStat].UserID
		)
	Where 
		UserID IN (Select UserID from inserted)

		Update 
	[dbo].[UserStat]
	Set 
		SpinRemainedChance = SpinRemainedChance - 
		(
		Select COUNT(*)
		From deleted I 
		Where I.UserID = [dbo].[UserStat].UserID
		)
		,
		SpinWheelCount = SpinWheelCount + 
		(
		Select COUNT(*)
		From deleted I 
		Where I.UserID = [dbo].[UserStat].UserID
		)
	Where 
		UserID IN (Select UserID from deleted)
END