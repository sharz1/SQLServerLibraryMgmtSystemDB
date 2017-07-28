USE db_LibMS;
GO

CREATE PROCEDURE usp_SharpstownCopiesOfLostTribe
AS
SELECT copies.No_Of_Copies 
FROM tbl_Book_Copies copies
INNER JOIN tbl_Library_Branch branch ON branch.BranchID = copies.BranchID
INNER JOIN tbl_Book book ON book.BookID = copies.BookID
WHERE branch.BranchName = 'Sharpstown' AND book.Title = 'The Lost Tribe';
GO

EXEC usp_SharpstownCopiesOfLostTribe;