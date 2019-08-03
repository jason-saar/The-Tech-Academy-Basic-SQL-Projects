CREATE DATABASE library

USE library

CREATE TABLE library_branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

CREATE TABLE publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE book_authors (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE book_copies (
	BookID INT NOT NULL CONSTRAINT fk_Book2ID FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE book_loans (
	BookID INT NOT NULL CONSTRAINT fk_Book3ID FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_Branch2ID FOREIGN KEY REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);


INSERT INTO library_branch (BranchName, Address)
VALUES
	('Sharpstown', '3451 sw 10th ave'),
	('Central', '6829 ne 6th ave'),
	('Beaverton', '2210 sw 21st ave'),
	('Hillsboro', '6802 sw 201st ave'),
	('Forest Grove', '1207 sw 270th ave')
;

SELECT * FROM library_branch

INSERT INTO publisher (PublisherName, Address, Phone)
VALUES
	('Penguin Random House', '8389 sw 190th ave', '503-212-2389'),
	('Hacette Livre', '7594 ne 3rd ave', '503-769-7598'),
	('Springer Nature', '5789 nw 153rd ave', '503-860-1292'),
	('Scholastic', '3123 se 66th ave', '503-102-5930'),
	('Wiley', '5634 sw 12th ave', '503-291-6904')
;

SELECT * FROM publisher

INSERT INTO books(Title,PublisherName)
VALUES
	('The Lost Tribe', 'Penguin Random House'),
	('It', 'Wiley'),
	('The Shining', 'Wiley'),
	('The Great Gatsby', 'Scholastic'),
	('Moby Dick', 'Springer Nature'),
	('Hamlet',  'Penguin Random House'),
	('The Odyssey', 'Penguin Random House'),
	('The Brothers Karamazov', 'Hacette Livre'),
	('The Adventures of Huckleberry Finn', 'Scholastic'),
	('The Iliad', 'Penguin Random House'),
	('The Catcher in the Rye', 'Wiley'),
	('1984', 'Scholastic'),
	('Catch 22', 'Scholastic'),
	('The Grapes of Wrath', 'Scholastic'),
	('Invisible Man', 'Springer Nature'),
	('To Kill a Mockingbird', 'Penguin Random House'),
	('Candide', 'Penguin Random House'),
	('The Sun Also Rises', 'Hacette Livre'),
	('A Portrait of the Artist as a Young Man', 'Springer Nature'),
	('Leaves of Grass', 'Hacette Livre')
;

SELECT * FROM books

INSERT INTO book_authors(BookID, AuthorName)
VALUES
	(1, 'Mark Lee'),
	(2, 'Stephen King'),
	(3, 'Stephen King'),
	(4, 'F. Scott Fitzgerald'),
	(5, 'Herman Melville'),
	(6, 'William Shakespeare'),
	(7, 'Homer'),
	(8, 'Fyodor Dostoyevsky'),
	(9, 'Mark Twain'),
	(10, 'Homer'),
	(11, 'J.D. Salinger'),
	(12, 'George Orwell'),
	(13, 'Joseph Heller'),
	(14, 'John Steinbeck'),
	(15, 'Ralph Ellison'),
	(16, 'Harper Lee'),
	(17, 'Voltaire'),
	(18, 'Ernest Hemingway'),
	(19, 'James Joyce'),
	(20, 'Walt Whitman')
;

SELECT books.Title, books.PublisherName, book_authors.AuthorName
FROM books
INNER JOIN book_authors ON books.BookID = book_authors.BookID
WHERE book_authors.AuthorName = 'Stephen King'
;

INSERT INTO borrower(Name, Address, Phone)
VALUES
	('Jason', '2138 sw 183rd ave', '503-239-2390'),
	('Brent', '5685 sw 120th ave', '503-231-3520'),
	('Calvin', '2108 sw 73rd ave', '503-506-8560'),
	('Mina', '2108 sw 73rd ave', '503-609-9830'),
	('Nikolaj', '5125 sw 90th ave', '503-801-2039'),
	('Kristina', '1202 ne 120th ave', '503-385-3029'),
	('Logan', '6043 sw 12th ave', '503-120-3030'),
	('Igor', '4310 nw 59th ave', '503-303-5040'),
	('Natalya', '2138 sw 183rd ave', '503-121-5604'),
	('Kodie', '2138 sw 183rd ave', '503-950-9090'),
	('Zach', '2901 sw 192nd ave', '503-555-2902'),
	('Melissa', '2201 sw 130th ave', '503-604-6590')
;

SELECT * FROM borrower

INSERT INTO book_copies(BookID,BranchID, Number_Of_Copies)
VALUES
	(1, 1, 2),
	(2, 1, 2),
	(3, 1, 2),
	(4, 1, 2),
	(5, 1, 2),
	(6, 1, 2),
	(7, 1, 2),
	(8, 1, 2),
	(9, 1, 2),
	(10, 1, 2),
	(11, 1, 2),
	(1, 2, 2),
	(2, 2, 2),
	(3, 2, 2),
	(4, 2, 2),
	(5, 2, 2),
	(6, 2, 2),
	(7, 2, 2),
	(8, 2, 2),
	(9, 2, 2),
	(10, 2, 2),
	(11, 2, 2),
	(12, 2, 2),
	(13, 2, 2),
	(14, 2, 2),
	(15, 2, 2),
	(16, 2, 2),
	(17, 2, 2),
	(18, 2, 2),
	(19, 2, 2),
	(20, 2, 2),
	(1, 3, 2),
	(2, 3, 2),
	(3, 3, 2),
	(4, 3, 2),
	(5, 3, 2),
	(6, 3, 2),
	(7, 3, 2),
	(8, 3, 2),
	(9, 3, 2),
	(10, 3, 2),
	(11, 3, 2),
	(12, 3, 2),
	(13, 3, 2),
	(14, 3, 2),
	(15, 3, 2),
	(1, 4, 2),
	(2, 4, 2),
	(3, 4, 2),
	(4, 4, 2),
	(5, 4, 2),
	(7, 4, 2),
	(9, 4, 2),
	(11, 4, 2),
	(13, 4, 2),
	(15, 4, 2),
	(17, 4, 2),
	(19, 4, 2),
	(2, 5, 2),
	(3, 5, 2),
	(4, 5, 2),
	(6, 5, 2),
	(7, 5, 2),
	(9, 5, 2),
	(11, 5, 2),
	(12, 5, 2),
	(14, 5, 2),
	(15, 5, 2),
	(16, 5, 2),
	(17, 5, 2),
	(19, 5, 2)
;


INSERT INTO book_loans(BookID,BranchID,CardNo,DateOut,DateDue)
VALUES
	(1,1,1,'08/03/2019','09/03/2019'),
	(2,1,1,'08/03/2019','09/03/2019'),
	(3,1,1,'08/03/2019','09/03/2019'),
	(5,1,1,'08/03/2019','09/03/2019'),
	(7,1,1,'08/03/2019','09/03/2019'),
	(5,2,2,'08/03/2019','09/03/2019'),
	(6,2,2,'08/03/2019','09/03/2019'),
	(7,2,2,'08/03/2019','09/03/2019'),
	(8,2,2,'08/03/2019','09/03/2019'),
	(9,2,2,'08/03/2019','09/03/2019'),
	(1,2,3,'08/03/2019','09/03/2019'),
	(11,2,3,'08/03/2019','09/03/2019'),
	(12,2,3,'08/03/2019','09/03/2019'),
	(13,2,3,'08/03/2019','09/03/2019'),
	(14,2,3,'08/03/2019','09/03/2019'),
	(15,2,3,'08/03/2019','09/03/2019'),
	(16,2,3,'08/03/2019','09/03/2019'),
	(17,2,3,'08/03/2019','09/03/2019'),
	(18,2,3,'08/03/2019','09/03/2019'),
	(3,4,4,'08/03/2019','09/03/2019'),
	(1,4,4,'08/03/2019','09/03/2019'),
	(7,4,4,'08/03/2019','09/03/2019'),
	(6,4,4,'08/03/2019','09/03/2019'),
	(4,4,4,'08/03/2019','09/03/2019'),
	(17,4,4,'08/03/2019','09/03/2019'),
	(11,5,5,'08/03/2019','09/03/2019'),
	(12,4,5,'08/03/2019','09/03/2019'),
	(13,4,5,'08/03/2019','09/03/2019'),
	(14,4,5,'08/03/2019','09/03/2019'),
	(15,4,5,'08/03/2019','09/03/2019'),
	(16,4,5,'08/03/2019','09/03/2019'),
	(17,4,5,'08/03/2019','09/03/2019'),
	(18,4,5,'08/03/2019','09/03/2019'),
	(1,5,6,'08/03/2019','09/03/2019'),
	(2,5,6,'08/03/2019','09/03/2019'),
	(3,5,6,'08/03/2019','09/03/2019'),
	(4,5,6,'08/03/2019','09/03/2019'),
	(5,5,6,'08/03/2019','09/03/2019'),
	(6,5,6,'08/03/2019','09/03/2019'),
	(7,5,6,'08/03/2019','09/03/2019'),
	(8,5,6,'08/03/2019','09/03/2019'),
	(9,5,6,'08/03/2019','09/03/2019'),
	(10,5,6,'08/03/2019','09/03/2019'),
	(18,5,6,'08/03/2019','09/03/2019'),
	(11,1,7,'08/03/2019','09/03/2019'),
	(12,1,7,'08/03/2019','09/03/2019'),
	(13,1,7,'08/03/2019','09/03/2019'),
	(14,1,7,'08/03/2019','09/03/2019'),
	(15,1,7,'08/03/2019','09/03/2019'),
	(16,1,7,'08/03/2019','09/03/2019'),
	(17,1,7,'08/03/2019','09/03/2019'),
	(1,2,8,'08/03/2019','09/03/2019'),
	(3,2,8,'08/03/2019','09/03/2019'),
	(4,2,8,'08/03/2019','09/03/2019'),
	(5,2,8,'08/03/2019','09/03/2019'),
	(10,2,8,'08/03/2019','09/03/2019'),
	(11,2,8,'08/03/2019','09/03/2019'),
	(12,2,8,'08/03/2019','09/03/2019'),
	(13,2,8,'08/03/2019','09/03/2019'),
	(14,2,8,'08/03/2019','09/03/2019'),
	(1,3,9,'07/03/2019','08/03/2019'),
	(2,3,9,'07/03/2019','08/03/2019'),
	(3,3,9,'07/03/2019','08/03/2019'),
	(4,3,9,'07/03/2019','08/03/2019'),
	(5,3,9,'07/03/2019','08/03/2019'),
	(6,3,9,'07/03/2019','08/03/2019'),
	(7,3,9,'07/03/2019','08/03/2019'),
	(8,3,9,'07/03/2019','08/03/2019'),
	(9,3,9,'07/03/2019','08/03/2019'),
	(10,3,9,'07/03/2019','08/03/2019'),
	(11,3,9,'07/03/2019','08/03/2019'),
	(12,3,9,'07/03/2019','08/03/2019'),
	(17,3,9,'07/03/2019','08/03/2019'),
	(1,4,10,'08/03/2019','10/03/2019'),
	(2,4,10,'08/03/2019','10/03/2019'),
	(3,4,10,'08/03/2019','10/03/2019'),
	(4,4,10,'08/03/2019','10/03/2019'),
	(5,4,10,'08/03/2019','10/03/2019'),
	(6,4,10,'08/03/2019','10/03/2019'),
	(7,4,10,'08/03/2019','10/03/2019'),
	(1,5,11,'08/03/2019','10/03/2019'),
	(2,5,11,'08/03/2019','10/03/2019'),
	(3,5,11,'08/03/2019','10/03/2019'),
	(4,5,11,'08/03/2019','10/03/2019'),
	(5,5,11,'08/03/2019','10/03/2019'),
	(6,5,11,'08/03/2019','10/03/2019'),
	(7,5,11,'08/03/2019','10/03/2019'),
	(8,5,11,'08/03/2019','10/03/2019')
;


USE library
GO
CREATE PROCEDURE dbo.TheLostTribeSharpstown
AS
SELECT library_branch.BranchName, books.Title, book_copies.Number_Of_Copies AS Copies
FROM library_branch
INNER JOIN book_copies ON library_branch.BranchID = book_copies.BranchID
INNER JOIN books ON book_copies.BookID = books.BookID
WHERE library_branch.BranchName = 'Sharpstown'
AND books.Title = 'The Lost Tribe'
GO


USE library
GO
CREATE PROCEDURE dbo.TheLostTribeCopies
AS
SELECT library_branch.BranchName, books.Title, book_copies.Number_Of_Copies AS Copies
FROM library_branch
INNER JOIN book_copies ON library_branch.BranchID = book_copies.BranchID
INNER JOIN books ON book_copies.BookID = books.BookID
WHERE books.Title = 'The Lost Tribe'
GO


USE library
GO
CREATE PROCEDURE dbo.BorrowersWithoutLoans
AS
SELECT borrower.CardNo, borrower.Name
FROM borrower
LEFT JOIN book_loans ON borrower.CardNo = book_loans.CardNo
WHERE book_loans.CardNo IS NULL
GO


USE library
GO
CREATE PROCEDURE dbo.SharpstownDueToday
AS
SELECT books.Title, borrower.Name, borrower.Address, library_branch.BranchName, book_loans.DateDue
FROM library_branch
INNER JOIN book_loans ON book_loans.BranchID = library_branch.BranchID
INNER JOIN borrower ON borrower.CardNo = book_loans.CardNo
INNER JOIN books ON books.BookID = book_loans.BookID
WHERE library_branch.BranchName = 'Sharpstown' AND book_loans.DateDue = CONVERT(date, GETDATE())
GO


USE library
GO
CREATE PROCEDURE dbo.TotalLoansByBranch
AS
SELECT library_branch.BranchID, library_branch.BranchName, COUNT(*) as Loans
FROM book_loans
LEFT JOIN library_branch ON library_branch.BranchID = book_loans.BranchID
GROUP BY library_branch.BranchID, library_branch.BranchName
GO


USE library
GO
CREATE PROCEDURE dbo.BorrowersOverFiveLoans
AS
SELECT borrower.CardNo, Name, borrower.Address, COUNT(*) as Loans
FROM book_loans
LEFT JOIN borrower ON borrower.CardNo = book_loans.CardNo
GROUP BY borrower.CardNo, borrower.Name, borrower.Address
HAVING COUNT(*) > 5
GO


USE library
GO
CREATE PROCEDURE dbo.StephenKingCentral
AS
SELECT books.Title, book_copies.Number_Of_Copies AS Copies
FROM books
INNER JOIN book_authors on book_authors.BookID = books.BookID
INNER JOIN book_copies on book_copies.BookID = books.BookID
INNER JOIN library_branch on library_branch.BranchID = book_copies.BranchID
WHERE book_authors.AuthorName = 'Stephen King' and library_branch.BranchName = 'Central'
GO