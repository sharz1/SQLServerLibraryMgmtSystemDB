USE db_LibMS
GO

CREATE PROCEDURE usp_BorrowerNoBooksOut
AS
SELECT DISTINCT a.Name FROM tbl_Borrower a 
LEFT JOIN tbl_Book_Loans b ON a.CardNo = b.CardNo
WHERE GETDATE() > b.DueDate OR b.CardNo IS NULL;
GO

EXEC usp_BorrowerNoBooksOut;

