CREATE DATABASE db_LibMS;

USE db_LibMS;
GO

CREATE TABLE tbl_Publisher (
	Name VARCHAR (60) PRIMARY KEY NOT NULL,
	Address VARCHAR (200),
	Phone VARCHAR (20)
);

CREATE TABLE tbl_Book (
	BookID BIGINT PRIMARY KEY NOT NULL, 
	Title VARCHAR(200) NOT NULL,
	PublisherName VARCHAR (60) FOREIGN KEY REFERENCES tbl_Publisher (Name) 
);

CREATE TABLE tbl_Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (100,100),
	BranchName VARCHAR (50) NOT NULL,
	Address VARCHAR (200) NOT NULL
);

CREATE TABLE tbl_Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (12345,1),
	Name NVARCHAR (50) NOT NULL,
	Address VARCHAR (250) NOT NULL,
	Phone VARCHAR (20) NOT NULL
);

CREATE TABLE tbl_Book_Authors (
	BookID BIGINT NOT NULL FOREIGN KEY REFERENCES tbl_Book (BookID),
	AuthorName VARCHAR (50) NOT NULL
);

CREATE TABLE tbl_Book_Loans (
	BookID BIGINT NOT NULL FOREIGN KEY REFERENCES tbl_Book (BookID),
	BranchID INT NOT NULL FOREIGN KEY REFERENCES tbl_Library_Branch (BranchID) ,
	CardNo INT NOT NULL FOREIGN KEY REFERENCES tbl_Borrower (CardNo),
	DateOut DATE NOT NULL,
	DueDate DATE NOT NULL
);

CREATE TABLE tbl_Book_Copies (
	BookID BIGINT NOT NULL FOREIGN KEY REFERENCES tbl_Book (BookID),
	BranchID INT NOT NULL FOREIGN KEY REFERENCES tbl_Library_Branch (BranchID),
	No_Of_Copies INT NOT NULL
);

INSERT INTO tbl_Publisher (Name, Address, Phone)
	VALUES 
	('Harper Perennial', '195 Broadway, New York, NY 10007', '212-207-7000'),
	('Picador USA', '175 5th Ave, New York, NY 10010', '800-221-7945'),
	('Gallery Books', '195 Broadway, New York, NY 10007', '12-698-2807'),
	('CreateSpace', '4900 LaCross Road, North Charleston, SC 29406', '800-890-9249'),
	('Hackett Publishing Company, Inc.', '3333 Massachusetts Ave, Indianapolis, IN 46218', '317-635-9250'),
	('Wordsworth Editions Ltd', '8B East St, Ware SG12 9HJ, UK', '+44 1920 465167'),
	('Penguin Classics', '80 Strand, London, WC2R 0RL', '+44 0(20) 7139 3000'),
	('Benediction Books', '11 Kiln Lane Garsington OX44 9AR', '718-246-2665'),
	('Berkley', '80 Strand, London, WC2R 0RL', '+44 0(20) 7139 3000'),
	('Back Bay Books', '1271 Avenue of the Americas 11th Floor, New York NY 10020', '800-759-0190'),
	('University Of Chicago Press', '1427 E 60th St, Chicago, IL 60637', '773-702-7700');

INSERT INTO tbl_Book (BookID, Title, PublisherName)
	VALUES 
	(9780060934347, 'Don Quixote', 'Harper Perennial'),
	(9780312186951, 'The Lost Tribe', 'Picador USA'),
	(9781501144288, 'The Tommyknockers', 'Gallery Books'),
	(9781533577092, 'In Search of Lost Time', 'CreateSpace'),
	(9781548765606, 'Ulysses', 'CreateSpace'),
	(9780872204843, 'The Odyssey', 'Hackett Publishing Company, Inc.'),
	(9781853260629, 'War and Peace', 'Wordsworth Editions Ltd'),
	(9781503280786, 'Moby Dick', 'CreateSpace'),
	(9780142437223, 'The Divine Comedy', 'Penguin Classics'),
	(9781853260094, 'Hamlet', 'Wordsworth Editions Ltd'),
	(9781517736729, 'The Adventures of Huckleberry Finn', 'CreateSpace'),
	(9781781396834, 'The Great Gatsby', 'Benediction Books'),
	(9780060883287, 'One Hundred Years of Solitude', 'Harper Perennial'),
	(9780141439518, 'Pride and Prejudice', 'Penguin Classics'),
	(9781853260018, 'Wuthering Heights', 'Wordsworth Editions Ltd'),
	(9780452262935, '1984', 'Berkley'),
	(9781781397978, 'To the Lighthouse', 'Benediction Books'),
	(9781503275188, 'Great Expectations', 'CreateSpace'),
	(9780316769174, 'The Catcher in the Rye', 'Back Bay Books'),
	(9780143105138, 'The Aeneid', 'Penguin Classics'),
	(9781534671065, 'The Canterbury Tales', 'CreateSpace'),
	(9781534663329, 'The Stranger', 'CreateSpace'),
	(9780143039433, 'The Grapes of Wrath', 'Penguin Classics'),
	(9781541276727, 'The Trial', 'CreateSpace'),
	(9780226768687, 'Oedipus the King', 'University Of Chicago Press');

INSERT INTO tbl_Book_Authors (BookID, AuthorName)
	VALUES
	(9780060934347, 'Miguel De Cervantes'),
	(9780312186951, 'Mark Lee'),
	(9781501144288, 'Stephen King'),
	(9781533577092, 'Marcel Proust'),
	(9781548765606, 'James Joyce'),
	(9780872204843, 'Homer'),
	(9781853260629, 'Leo Tolstoy'),
	(9781503280786, 'Herman Melville'),
	(9780142437223, 'Dante Alighieri'),
	(9781853260094, 'William Shakespeare'),
	(9781517736729, 'Mark Twain'),
	(9781781396834, 'F. Scott Fitzgerald'),
	(9780060883287, 'Gabriel Garcia Marquez'),
	(9780141439518, 'Jane Austen'),
	(9781853260018, 'Emily Brontë'),
	(9780452262935, 'George Orwell'),
	(9781781397978, 'Virginia Woolf'),
	(9781503275188, 'Charles Dickens'),
	(9780316769174, 'J. D. Salinger'),
	(9780143105138, 'Virgil'),
	(9781534671065, 'Geoffrey Chaucer'),
	(9781534663329, 'Albert Camus'),
	(9780143039433, 'John Steinbeck'),
	(9781541276727, 'Franz Kafka'),
	(9780226768687, 'Sophocles');

INSERT INTO tbl_Library_Branch (BranchName, Address)
	VALUES 
	('Sharpstown', '3300 S Gessner Rd, Houston, TX 77063'), 
	('Central', '10103 Fondren, Houston, TX 77035'), 
	('Southwest', '6400 High Star Dr, Houston, TX 77074'), 
	('Jungman', '5830 Westheimer Rd, Houston, TX 77057'), 
	('Walter', '7660 Clarewood Dr, Houston, TX 77036');

INSERT INTO tbl_Book_Copies (BookID, BranchID, No_Of_Copies)
	VALUES 
	(9780060934347, 100, 5),
	(9780312186951, 100, 3),
	(9781501144288, 100, 2),
	(9781533577092, 100, 6),
	(9781548765606, 100, 5),
	(9780872204843, 100, 4),
	(9781853260629, 100, 3),
	(9781503280786, 100, 3),
	(9780142437223, 100, 8),
	(9781853260094, 100, 6),
	(9781517736729, 100, 4),
	(9781781396834, 200, 2),
	(9780060883287, 200, 3),
	(9780141439518, 200, 3),
	(9781853260018, 200, 5),
	(9780452262935, 200, 4),
	(9781781397978, 200, 2),
	(9781503275188, 200, 6),
	(9780316769174, 200, 4),
	(9780143105138, 200, 3),
	(9781534671065, 200, 4),
	(9781534663329, 200, 3),
	(9780143039433, 200, 2),
	(9781503280786, 200, 4),
	(9781501144288, 200, 3),
	(9781541276727, 300, 4),
	(9780226768687, 300, 3),
	(9781503280786, 300, 5),
	(9780142437223, 300, 3),
	(9781853260094, 300, 7),
	(9781517736729, 300, 4),
	(9781781396834, 300, 5),
	(9780060883287, 300, 5),
	(9780141439518, 300, 4),
	(9781853260018, 300, 3),
	(9781781397978, 400, 2),
	(9781503275188, 400, 2),
	(9780316769174, 400, 4),
	(9780143105138, 400, 3),
	(9781534671065, 400, 4),
	(9781534663329, 400, 4),
	(9780143039433, 400, 3),
	(9781541276727, 400, 4),
	(9780226768687, 400, 5),
	(9781503280786, 400, 7),
	(9780142437223, 400, 4),
	(9781853260094, 400, 2),
	(9781548765606, 500, 3),
	(9780872204843, 500, 6),
	(9781853260629, 500, 4),
	(9781503280786, 500, 3),
	(9780142437223, 500, 4),
	(9781853260094, 500, 3),
	(9781517736729, 500, 5),
	(9781541276727, 500, 3),
	(9780226768687, 500, 3),
	(9781503275188, 500, 2);

INSERT INTO tbl_Borrower (Name, Address, Phone)
	VALUES 
	('Beyonce Knowles', '2803 Kings Crossing Dr APT 112, Humble, TX 77345', '281-221-7945'),
	('Luke Wilson', '16843 Ivy Wild Ln, Houston, TX 77095', '346-698-2807'),
	('Matthew McConaughey', '6427 Gladewell Dr, Houston, TX 77072', '713-890-9249'),
	('Rick Perry', '14730 Forest Trails Dr, Houston, TX 77095', '832-635-9250'),
	('Jennifer Garner', '302 Bremond St, Houston, TX 77006', '281-207-7045'),
	('Tommy Lee Jones', '9431 Fannin St, Houston, TX 77045', '346-450-8225'),
	('Gary Busey', '8107 Green Devon Dr, Houston, TX 77095', '713-255-3000'),
	('Jamie Fox', '7830 Palm Brook Ct, Houston, TX 77095', '832-246-2665'),
	('Lou Diamond Phillips', '13747 Rolling River Ln, Houston, TX 77044', '281-702-7700'),
	('Carol Burnette', '7703 Glenbrae St, Houston, TX 77061', '832-711-8542');

INSERT INTO tbl_Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate)
	VALUES
	(9780060883287, 200, 12348, ' 2017-07-21',' 2017-08-11'),
	(9780141439518, 200, 12348, ' 2017-07-21',' 2017-08-11'),
	(9781853260018, 200, 12348, ' 2017-07-21',' 2017-08-11'),
	(9780452262935, 200, 12348, ' 2017-07-25',' 2017-08-15'),
	(9781781397978, 200, 12348, ' 2017-07-25',' 2017-08-15'),
	(9781781397978, 400, 12353, ' 2017-07-25',' 2017-08-15'),
	(9781503275188, 400, 12353, ' 2017-07-19',' 2017-08-08'),
	(9780316769174, 400, 12353, ' 2017-07-19',' 2017-08-08'),
	(9780143105138, 400, 12353, ' 2017-07-17',' 2017-08-06'),
	(9781534671065, 400, 12353, ' 2017-07-10',' 2017-07-31'),
	(9781534663329, 400, 12353, ' 2017-07-10',' 2017-07-31'),
	(9781503275188, 200, 12348, ' 2017-07-10',' 2017-07-31'),
	(9781501144288, 100, 12350, ' 2017-07-12',' 2017-08-02'),
	(9781533577092, 100, 12350, ' 2017-07-12',' 2017-08-02'),
	(9781548765606, 100, 12346, ' 2017-06-07',' 2017-06-21'),
	(9780872204843, 100, 12346, ' 2017-06-07',' 2017-06-21'),
	(9781503280786, 300, 12352, ' 2017-06-05',' 2017-06-19'),
	(9780142437223, 300, 12352, ' 2017-06-05',' 2017-06-19'),
	(9781853260094, 300, 12352, ' 2017-06-05',' 2017-06-19'),
	(9781517736729, 300, 12352, ' 2017-06-15',' 2017-07-06'),
	(9781781396834, 300, 12354, ' 2017-06-15',' 2017-07-06'),
	(9780060883287, 300, 12354, ' 2017-06-15',' 2017-07-06'),
	(9781853260629, 500, 12347, ' 2017-05-08',' 2017-05-22'),
	(9781503280786, 500, 12347, ' 2017-05-08',' 2017-05-22'),
	(9780142437223, 500, 12347, ' 2017-05-08',' 2017-05-22'),
	(9781853260094, 500, 12347, ' 2017-05-08',' 2017-05-22'),
	(9781517736729, 500, 12354, ' 2017-07-18',' 2017-08-08'),
	(9780060934347, 100, 12351, ' 2017-07-18',' 2017-08-08'),
	(9780312186951, 100, 12351, ' 2017-07-18',' 2017-08-08'),
	(9781501144288, 100, 12351, ' 2017-07-18',' 2017-08-08'),
	(9781533577092, 100, 12351, ' 2017-07-24',' 2017-08-14'),
	(9781548765606, 100, 12351, ' 2017-07-24',' 2017-08-14'),
	(9780872204843, 100, 12351, ' 2017-07-24',' 2017-08-14'),
	(9781781396834, 200, 12347, ' 2017-05-10',' 2017-05-31'),
	(9780060883287, 200, 12347, ' 2017-05-10',' 2017-05-31'),
	(9780141439518, 200, 12347, ' 2017-05-10',' 2017-05-31'),
	(9781781397978, 200, 12349, ' 2017-07-10',' 2017-07-31'),
	(9781503275188, 200, 12349, ' 2017-07-10',' 2017-07-31'),
	(9780316769174, 200, 12349, ' 2017-07-10',' 2017-07-31'),
	(9780226768687, 300, 12349, ' 2017-07-10',' 2017-07-31'),
	(9781503280786, 300, 12349, ' 2017-07-20',' 2017-08-10'),
	(9781517736729, 300, 12349, ' 2017-07-20',' 2017-08-10'),
	(9781781396834, 300, 12349, ' 2017-07-20',' 2017-08-10'),
	(9780060883287, 300, 12349, ' 2017-07-20',' 2017-08-10'),
	(9780143039433, 400, 12345, ' 2017-06-12',' 2017-07-03'),
	(9781503280786, 400, 12345, ' 2017-06-12',' 2017-07-03'),
	(9781541276727, 400, 12345, ' 2017-06-12',' 2017-07-03'),
	(9780226768687, 400, 12345, ' 2017-07-05',' 2017-07-26'),
	(9781853260094, 500, 12345, ' 2017-07-05',' 2017-07-26'),
	(9781517736729, 500, 12345, ' 2017-07-05',' 2017-07-26'),
	(9781541276727, 500, 12346, ' 2017-07-13',' 2017-08-03'),
	(9780226768687, 500, 12346, ' 2017-07-13',' 2017-08-03');







