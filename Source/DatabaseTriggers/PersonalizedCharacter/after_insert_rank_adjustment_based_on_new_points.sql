USE [what_if]
GO
/****** Object:  Trigger [dbo].[after_insert_rank_adjustment_based_on_new_points]    Script Date: 6/13/2017 12:43:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--— =============================================
--— Author:    <Jeb,JavadBorhani>
--— Create date: <Now I mean Now>
--— Description:  <Put last rank to the new created user>
--— =============================================
ALTER TRIGGER [dbo].[after_insert_rank_adjustment_based_on_new_points]
   ON  [dbo].[PersonalizedCharacter]
   after update
AS 
BEGIN
 
  if UPDATE(PointCount)
  Begin
  Declare @Result Table (UserID int , PointCount int , CharacterID int , Rank int , Min int)
		Begin
			insert into @Result 
			SELECT 
				pc.UserID , pc.PointCount , pc.CharacterID , pc.Rank -1, null as me 
			FROM 
				[what_if].[dbo].[PersonalizedCharacter] pc
				inner join inserted i  on pc.CharacterID = i.CharacterID
				inner join deleted d on pc.CharacterID = d.CharacterID
			Where 
				pc.CharacterID IN (Select CharacterID From inserted) And (pc.PointCount >= d.PointCount And Pc.PointCount <= i.PointCount)
			Union
			Select 
				i.UserID , i.PointCount , i.CharacterID , i.Rank -1  , null From inserted i
		End
		
		Begin
		Update 
			@Result 
			Set 
			SR.Min = min2.MinReal
			From @Result SR
			Cross Apply (Select Min([RANK]) as MinReal, CharacterID From @Result Group BY CharacterID ) as Min2
			Where 
			SR.CharacterID = min2.CharacterID
		End

		Begin
			Update  
					[what_if].[dbo].[PersonalizedCharacter]
				Set 
					[what_if].[dbo].[PersonalizedCharacter].Rank = Final.NewRank

			from 
				(
				SELECT 
						Sr.UserID, Sr.CharacterID ,  Sr.PointCount , (Row_Number() over (Partition by SR.CharacterID Order by SR.PointCount DESC)) + Sr.Min NewRank , Sr.Min as Min
				FROM @Result Sr
				) as Final			
			Where 
					[what_if].[dbo].[PersonalizedCharacter].UserID = Final.UserID And [what_if].[dbo].[PersonalizedCharacter].CharacterID = Final.CharacterID
		End
	End
End