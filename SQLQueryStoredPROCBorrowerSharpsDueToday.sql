USE db_LibMS
GO

CREATE PROCEDURE uspBorrowerSharpDueToday
AS
SELECT BK.Title, BR.Name, BR.Address
FROM tbl_Book_Loans LN
INNER JOIN tbl_Book BK ON BK.BookID = LN.BookID
INNER JOIN tbl_Borrower BR ON LN.CardNO = BR.CardNo
INNER JOIN tbl_Library_Branch LB ON LB.BranchID = LN.BranchID
WHERE LB.BranchName = 'Sharpstown' AND LN.DueDate = GETDATE();
GO

EXEC uspBorrowerSharpDueToday;