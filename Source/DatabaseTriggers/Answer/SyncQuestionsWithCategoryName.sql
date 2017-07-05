use what_if
go 

UPDATE 
	[dbo].[Answer] 
SET 
	dbo.Answer.CategoryID = Data.Catgory_ID
FROM
	(
		Select distinct b.Catgory_ID , QuestionID From dbo.Answer a
		inner join dbo.Question b on a.QuestionID = b.ID 
	) as Data
WHERE 
	Data.QuestionID = dbo.Answer.QuestionID
