USE [what_if]
GO
/****** Object:  Trigger [dbo].[achievedCodeGift_afterInsert_update_number_of_users_achieved]    Script Date: 6/27/2017 8:32:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[achievedCodeGift_afterInsert_update_number_of_users_achieved]
   ON  [dbo].[AchievedCodeGift]
   after Delete , insert
AS 
BEGIN
  
	Update 
	[dbo].[CodeGift]
	Set 
		TotalUserRegistered = TotalUserRegistered + 
		(
		Select COUNT(*)
		From inserted I 
		Where I.CodeGiftID = [dbo].[CodeGift].ID
		)
	Where 
		ID IN (Select CodeGiftID from inserted)


	Update 
	[dbo].[CodeGift]
	Set 
		TotalUserRegistered = TotalUserRegistered - 
		(
		Select COUNT(*)
		From deleted I 
		Where I.CodeGiftID = [dbo].[CodeGift].ID
		)
	Where 
		ID IN (Select CodeGiftID from deleted)
END