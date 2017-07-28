USE db_LibMS
GO

CREATE PROCEDURE uspBooksLoanedByBranch
AS
SELECT LB.BranchName, COUNT(LN.BranchID) AS Books_Loaned
FROM tbl_Library_Branch LB
INNER JOIN tbl_Book_Loans LN ON LB.BranchID = LN.BranchID
WHERE GETDATE() BETWEEN LN.DateOut AND LN.DueDate
GROUP BY LB.BranchName;
GO

EXEC uspBooksLoanedByBranch;
