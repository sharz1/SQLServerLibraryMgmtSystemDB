USE db_LibMS
GO

CREATE PROCEDURE uspBorrowersMorethan5Books
AS

SELECT BRW.Name, BRW.Address, COUNT(LN.CardNo)
FROM tbl_Borrower BRW
INNER JOIN tbl_Book_Loans LN ON BRW.CardNo = LN.CardNo
WHERE GETDATE() BETWEEN LN.DateOut AND LN.DueDate 
GROUP BY BRW.Name, BRW.Address
HAVING COUNT(LN.CardNo) > 5 
GO

EXEC uspBorrowersMorethan5Books;