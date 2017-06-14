USE [what_if]
GO
/****** Object:  Trigger [dbo].[user_stat_instead_of_insert_rank_calculation]    Script Date: 6/14/2017 2:24:22 PM ******/
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
ALTER TRIGGER [dbo].[user_stat_instead_of_insert_rank_calculation]
   ON  [dbo].[UserStat]
   instead of Insert
AS 
BEGIN
	insert into [dbo].[UserStat]
	Select 
		M.UserID , 
		0,
		0,
		coalesce(SS.RNK , 0) + 1 as Rank,
		M.SpinRemainedChance,
		M.SpinWheelCount
	  From 
		inserted M 
		left Join 
				( Select UserID, MAX(Rank) as RNK  From [dbo].[UserStat] Group By UserID) SS
		 On 
				(M.UserID = SS.UserID) 
		 Where 
				M.UserID IN ( Select UserID From inserted)

	select ID from [dbo].[UserStat] where @@ROWCOUNT > 0 and [ID] = scope_identity() 
END

