USE db_LibMS
GO

CREATE PROCEDURE usp_BranchCopiesLostTribe
AS
SELECT a.BranchID, a.No_Of_Copies FROM tbl_Book_Copies a
INNER JOIN tbl_Library_Branch b ON a.BranchID = b.BranchID
INNER JOIN tbl_Book c ON c.BookID = a.BookID
WHERE c.Title = 'The Lost Tribe';
GO

EXEC usp_BranchCopiesLostTribe;