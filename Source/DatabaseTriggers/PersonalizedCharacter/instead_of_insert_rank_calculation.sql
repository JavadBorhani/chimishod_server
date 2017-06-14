USE [what_if]
GO
/****** Object:  Trigger [dbo].[instead_of_insert_rank_calculation]    Script Date: 6/14/2017 12:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery34.sql|7|0|C:\Users\Jeb\AppData\Local\Temp\~vs56A4.sql
-- =============================================
-- Author:		<Jeb,JavadBorhani>
-- Create date: <Now I mean Now>
-- Description:	<Put last rank to the new created user>
-- =============================================
ALTER TRIGGER [dbo].[instead_of_insert_rank_calculation]
   ON  [dbo].[PersonalizedCharacter]
   instead of Insert
AS 
BEGIN
	insert into [dbo].[PersonalizedCharacter]
	Select 
		M.UserID , 
		M.CharacterID,
		0,
		coalesce(SS.RNK , 0) + 1 as Rank
	  From 
		inserted M 
		left Join 
				( Select  N.CharacterID , MAX(Rank) as RNK  From [dbo].[PersonalizedCharacter] N Where N.CharacterID IN (Select CharacterID From inserted ) Group by N.CharacterID ) SS
		 On 
				(M.CharacterID = SS.CharacterID) 
		 Where 
				M.UserID IN ( Select UserID From inserted)
	select ID from [dbo].[PersonalizedCharacter] where @@ROWCOUNT > 0 and [ID] = scope_identity() 
END
