USE db_LibMS
GO

ALTER PROCEDURE uspStephenKingBooksatCentralBranch
AS

SELECT BK.Title, CP.No_Of_Copies
FROM tbl_Book BK
INNER JOIN tbl_Book_Copies CP ON BK.BookID = CP.BookID
INNER JOIN tbl_Book_Authors BA ON BA.BookID = BK.BookID
INNER JOIN tbl_Library_Branch LB ON LB.BranchID = CP.BranchID
WHERE BA.AuthorName = 'Stephen King' AND LB.BranchName = 'Central';
GO

EXEC uspStephenKingBooksatCentralBranch

