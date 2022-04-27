#PROJECT: To create a relational DB - various tables needed that have Primary and Foreign key constraints creating relations between the tables

# CORE REQUIREMENTS OF PROJECT ACHIEVED
# 1. Relational database with 12 tables created
# 2. Primary and Foreign Key constraints create relations between the tables (seen clearly in ER diagram)

CREATE DATABASE Bartram_Library;

USE Bartram_Library;

CREATE TABLE Books (
Book_ID INT PRIMARY KEY AUTO_INCREMENT, 
Title VARCHAR(100), 
Category_ID INT, 
Publication_Year INT, 
Total_Copies INT
);

INSERT INTO Books (Book_ID, Title, Category_ID, Publication_Year, Total_Copies) VALUES 
(1, '10 Day Green Smoothie Cleanse', 1, 2016, 2),
(2, '1984 (Signet Classics)', 2, 2017, 3),
(3, 'Animal Farm', 2, 1945, 3),
(4, 'A Dance with Dragons (A Song of Ice and Fire)', 2, 2011, 5),
(5, 'A Game of Thrones / A Clash of Kings / A Storm of Swords / A Feast of Crows / A Dance with Dragons', 2, 2014, 5),
(6, 'Decision Points', 1, 2010, 2),
(7, 'Becoming', 1, 2019, 2),
(8, 'Catching Fire (The Hunger Games)', 2, 2010, 5),
(9, 'Diagnostic and Statistical Manual of Mental Disorders, 5th Edition: DSM-5', 1, 2013, 3),
(10, 'Double Down (Diary of a Wimpy Kid #11)', 2, 2016, 3),
(11, 'Divergent', 2, 2013, 3),
(12, 'Giraffes Cant Dance', 2, 2015, 3),
(13, 'Harry Potter and the Chamber of Secrets: The Illustrated Edition (Harry Potter, Book 2)', 2, 2016, 5),
(14, 'I, Alex Cross', 2, 2009, 3);


CREATE TABLE Authors (
Author_ID INT PRIMARY KEY AUTO_INCREMENT, 
First_Name VARCHAR(100), 
Last_Name VARCHAR(100)
);

INSERT INTO Authors (Author_ID, First_Name, Last_Name) VALUES
(1, 'JJ', 'Smith'),
(2, 'George', 'Orwell'), 
(3, 'George RR', 'Martin'),
(4, 'George W', 'Bush'),
(5, 'Michelle', 'Obama'),
(6, 'Suzanne', 'Collins'),
(7, 'American Psychiatric Association', ''),
(8, 'Jeff', 'Kinney'),
(9, 'Veronica', 'Roth'),
(10, 'Giles', 'Andreae'),
(11, 'J.K.', 'Rowling'),
(12, 'James', 'Patterson');

CREATE TABLE Authors_Books (
Book_ID INT, 
Author_ID INT
);

INSERT INTO Authors_Books (Book_ID, Author_ID) VALUES
(1,1),
(2, 2),
(3, 2),
(4, 3),
(5, 3),
(6, 4),
(7, 5),
(8, 6),
(9, 7),
(10, 8),
(11, 9),
(12, 10),
(13, 11),
(14, 12);

ALTER TABLE Authors_Books
ADD CONSTRAINT FK_Book_ID
FOREIGN KEY (Book_ID)
REFERENCES Books (Book_ID);

ALTER TABLE Authors_Books
ADD CONSTRAINT FK_Author_ID
FOREIGN KEY (Author_ID)
REFERENCES Authors (Author_ID);

CREATE TABLE Category (
Category_ID INT PRIMARY KEY, 
Category VARCHAR(50)
);

INSERT INTO Category (Category_ID, Category) VALUES
(1, 'NonFiction'),
(2, 'Fiction');

ALTER TABLE Books
ADD CONSTRAINT FK_Category_ID
FOREIGN KEY (Category_ID)
REFERENCES Category (Category_ID);

CREATE TABLE MemberStatus (
Member_Status_ID INT PRIMARY KEY, 
Member_Status CHAR(50)
);

INSERT INTO MemberStatus (Member_Status_ID, Member_Status) VALUES
(1, 'Active'),
(2, 'Inactive'),
(3, 'Cancelled');

CREATE TABLE Members (
Member_ID INT PRIMARY KEY AUTO_INCREMENT, 
First_Name VARCHAR(100), 
Last_Name VARCHAR(100), 
Member_Status_ID INT,
City VARCHAR(100), 
Date_Joined DATETIME, 
FOREIGN KEY (Member_Status_ID) REFERENCES MemberStatus (Member_Status_ID)
);

INSERT INTO Members (Member_ID, First_Name, Last_Name, Member_Status_ID, City, Date_Joined) VALUES
(1, 'Bob', 'Smith', 1, 'Bartramville', '2015/06/23'),
(2, 'Ryley', 'Mason', 2, 'Bartramville', '2012/08/20'),
(3, 'Sizwe', 'Malone', 1, 'Bartramville', '2017/01/31'),
(4, 'Daphne', 'Mckay', 1, 'Smithville', '2022/03/04'),
(5, 'Ursula', 'Witch', 3, 'Bartramville', '2000/06/09'),
(6, 'George', 'Clooney', 1, 'Bartramville', '2022-04-09'),
(7, 'Mariah', 'Carey', 1, 'Bartramville', '2022-04-10'),
(8, 'Bob', 'Ross', 1, 'Bartramville', '2022-04-21'),
(9, 'Koos', 'Visagie', 1, 'Bartramville', '2022-04-21');

CREATE TABLE Loans (
Loan_ID INT PRIMARY KEY AUTO_INCREMENT,
Book_ID INT, 
Member_ID INT, 
Loan_Date DATETIME,
Return_Date DATETIME
);

ALTER TABLE Loans
ADD CONSTRAINT FK_Book_ID_Loans
FOREIGN KEY (Book_ID)
REFERENCES Books (Book_ID);

ALTER TABLE Loans
ADD CONSTRAINT FK_Member_ID_Loans
FOREIGN KEY (Member_ID)
REFERENCES Members (Member_ID);

INSERT INTO Loans (Book_ID, Member_ID, Loan_Date, Return_Date) VALUES 
(3, 2, '2016/03/07', '2016/03/21'),
(5, 2, '2017/05/11', '2017/05/25'),
(10, 2, '2018/11/07', '2018/11/21'),
(14, 5, '2010/02/02', '2010/02/16'),
(13, 5, '2011/03/07', '2011/03/21'),
(12, 5, '2012/01/17', '2016/01/31'),
(11, 5, '2013/08/14', '2013/04/28'),
(10, 5, '2013/12/07', '2013/12/21'),
(9, 5, '2013/05/05', '2013/05/19'),
(7, 5, '2014/09/27', '2014/10/11'),
(3, 2, '2016/03/07', '2016/03/21'),
(1, 1, '2016/03/07', '2016/03/21'),
(6, 1, '2017/10/02', '2017/10/16'),
(9, 1, '2018/11/01', '2018/11/15'),
(11, 1, '2021/06/06', '2021/06/20'),
(8, 1, '2022/03/07', '2022/03/21'),
(7, 1, '2022/02/14', '2022/02/28'),
(3, 4, '2022/03/04', '2022/03/18'),
(2, 4, '2022/03/04', '2022/03/18'),
(1, 4, '2022/03/04', '2022/03/18'),
(9, 9, '2022/04/22', '2022/05/06'),
(11, 8, '2022/04/22', '2022/05/06'),
(5, 7, '2022/04/10', '2022/04/24'),
(9, 3, '2017/01/31', '2017/02/14'),
(11, 7, '2022/03/01', '2022/03/15'),
(1, 6, '2022/04/12', '2022/04/26'),
(4, 1, '2022/03/22', '2022/04/05');

ALTER TABLE Loans 
RENAME COLUMN Return_Date TO Due_Date;

# BookReturns table added after creating procedures revealed its necessity 
CREATE TABLE BookReturns (
Return_ID INT PRIMARY KEY AUTO_INCREMENT,
Book_ID INT, 
Member_ID INT, 
Return_Date DATETIME
);

ALTER TABLE BookReturns
ADD CONSTRAINT FK_Member_ID_BookReturns
FOREIGN KEY (Member_ID)
REFERENCES Members (Member_ID);

ALTER TABLE BookReturns
ADD CONSTRAINT FK_Book_ID_BookReturns
FOREIGN KEY (Book_ID)
REFERENCES Books (Book_ID);

INSERT INTO BookReturns (Book_ID, Member_ID, Return_Date) VALUES
(3, 2, '2016/03/21'),
(5, 2, '2017/05/25'),
(10, 2, '2018/11/21'),
(14, 5, '2010/02/20'),
(13, 5, '2011/03/28'),
(12, 5, '2016/02/14'),
(11, 5, '2013/04/29'),
(10, 5, '2013/12/20'),
(9, 5, '2013/05/24'),
(7, 5, '2014/10/14'),
(3, 2, '2016/03/21'),
(1, 1, '2016/03/21'),
(6, 1, '2017/10/16'),
(9, 1, '2018/11/15'),
(11, 1, '2021/06/20'),
(8, 1, '2022/03/21'),
(7, 1, '2022/02/28'),
(3, 4, '2022/03/18'),
(2, 4, '2022/03/18'),
(1, 4, '2022/03/18'),
(9, 9, '2022/05/06'),
(11, 8, '2022/05/06'),
(5, 7, '2022/04/24'),
(9, 3, '2017/02/14'),
(11, 7, '2022/03/27'),
(4, 1, '2022/04/22');

CREATE TABLE Reservations (
Reservation_ID INT PRIMARY KEY AUTO_INCREMENT, 
Book_ID INT, 
Member_ID INT, 
Reservation_Date DATE, 
Res_Status_ID INT
);

INSERT INTO Reservations (Book_ID, Member_ID, Reservation_Date, Res_Status_ID) VALUES 
(5, 3, '2022/04/25', 1),
(7, 4, '2022/01/17', 2);

ALTER TABLE Reservations
ADD CONSTRAINT FK_Book_ID_Res
FOREIGN KEY (Book_ID)
REFERENCES Books (Book_ID);

ALTER TABLE Reservations
ADD CONSTRAINT FK_Member_ID_Res
FOREIGN KEY (Member_ID)
REFERENCES Members (Member_ID);

CREATE TABLE Reservation_Status (
Res_Status_ID INT PRIMARY KEY, 
Res_Status CHAR(50)
);

INSERT INTO Reservation_Status (Res_Status_ID, Res_Status) VALUES
(1, 'Reserved'),
(2, 'Fulfilled');

ALTER TABLE Reservations
ADD CONSTRAINT FK_Res_Status_ID
FOREIGN KEY (Res_Status_ID)
REFERENCES Reservation_Status (Res_Status_ID);

ALTER TABLE Reservations
MODIFY COLUMN Reservation_ID INT AUTO_INCREMENT;

CREATE TABLE Fines (
Fine_ID INT PRIMARY KEY AUTO_INCREMENT, 
Member_ID INT, 
Loan_ID INT, 
Fine_Date DATETIME, 
FineAmount DECIMAL(3.2)
);

INSERT INTO Fines (Member_ID, Loan_ID, Fine_Date, FineAmount) VALUES 
(5, 4, '2010/02/20', 1),
(5, 5, '2011/03/28', 1),
(5, 6, '2016/02/14', 1),
(5, 7, '2013/04/29', 1),
(5, 9, '2013/05/24', 1),
(5, 10, '2014/10/14', 1),
(7, 25, '2022/03/27', 1),
(1, 27, '2022/04/22', 1);

ALTER TABLE Fines
ADD CONSTRAINT FK_Member_ID_Fines
FOREIGN KEY (Member_ID)
REFERENCES Members (Member_ID);

ALTER TABLE Fines
ADD CONSTRAINT FK_Loan_ID_Fines
FOREIGN KEY (Loan_ID)
REFERENCES Loans (Loan_ID);

CREATE TABLE Fine_Payments (
Fine_Payments_ID INT PRIMARY KEY AUTO_INCREMENT, 
Member_ID INT, 
Payment_Date DATETIME, 
Payment_Amount DECIMAL(3,2)
);

INSERT INTO Fine_Payments (Member_ID, Payment_Date, Payment_Amount) VALUES 
(5, '2010/02/20', 1),
(5, '2011/03/28', 1),
(5, '2016/02/14', 1),
(5, '2013/04/29', 1),
(5, '2013/05/24', 1),
(5, '2014/10/14', 1),
(7, '2022/03/27', 1);

ALTER TABLE Fine_Payments
ADD CONSTRAINT FK_Member_ID_FP
FOREIGN KEY (Member_ID)
REFERENCES Members (Member_ID);

# CORE REQUIREMENTS OF PROJECT CONTINUED
# 3. Use of a join to create a view that combines multiple tables in a logical way (Member's city and number of loans)
SELECT First_Name as MemberFirstName, Last_Name as MemberLastName, City, Count(Title) AS NumberOfLoans
FROM books
JOIN loans
ON books.Book_ID = loans.Book_ID
JOIN members
ON members.Member_ID = loans.Member_ID
GROUP BY members.Member_ID
ORDER BY NumberOfLoans DESC;

# 4. Stored function that can be applied to a query (Months of membership in descending order)
DROP FUNCTION IF EXISTS GetMonths;
DELIMITER //
CREATE FUNCTION GetMonths(sampledate date) 
RETURNS int 
DETERMINISTIC
BEGIN
DECLARE currentDate DATE;
Select current_date()into currentDate;
RETURN (12 * (YEAR(currentDate)
- YEAR(sampledate))
+ (MONTH(currentDate)
- MONTH(sampledate)));
END
//
DELIMITER ;

#Use of function GetMonths (longest membership by months)
SELECT First_Name, Last_Name, getMonths(Date_Joined) AS NumberOfMonths 
FROM Members
ORDER BY NumberOfMonths DESC;

# 5. Example query with a subquery to demonstrate how to extract data for analysis (Titles loaned the most)
SELECT sub.Title, sub.NumberOfLoans
FROM (SELECT b.Title, COUNT(l.Loan_ID) AS NumberOfLoans
		FROM loans l
		JOIN books b
		ON l.Book_ID = b.Book_ID
		GROUP BY l.Book_ID
		ORDER BY NumberOfLoans DESC) sub
        WHERE sub.NumberOfLoans >= 4;
                        
## ADVANCED OPTIONS
## 1. STORED PROCEDURES 
# Stored Procedure - To insert a new member's details
DROP PROCEDURE IF EXISTS New_Member;
DELIMITER //
CREATE PROCEDURE New_Member (
IN First_Name VARCHAR(100),
IN Last_Name VARCHAR(100),
IN Member_Status_ID INT,
IN City VARCHAR(100),
In Date_Joined TIMESTAMP) 
BEGIN
INSERT INTO Members (First_Name, Last_Name, Member_Status_ID, City, Date_Joined)
VALUES (First_Name, Last_Name, Member_Status_ID, City, Date_Joined);
END//
SET DELIMITER TO;

#New entry Demonstration
# Select * from members;
CALL New_Member ('Neville', 'Marsh', 1, 'Bartramville', CURRENT_DATE());

## Additional procedure to do book loans
DROP PROCEDURE IF EXISTS New_loan;
DELIMITER //
CREATE PROCEDURE New_loan (
IN Book_ID INT,
IN Member_ID INT,
IN Loan_Date DATETIME,
IN Due_Date DATETIME
) 
BEGIN
INSERT INTO Loans (Book_ID, Member_ID, Loan_Date, Due_Date)
VALUES (Book_ID, Member_ID, Loan_Date, Due_Date);
END//
SET DELIMITER TO;

To Test:
Select * from loans;
CALL New_loan (11, 10, current_date(), DATE_ADD(now(),INTERVAL 2 WEEK));

##Additional procedure for book returns
DROP PROCEDURE IF EXISTS New_bookreturn;
DELIMITER //
CREATE PROCEDURE New_bookreturn (
IN Book_ID INT,
IN Member_ID INT,
IN Return_Date DATETIME
) 
BEGIN
INSERT INTO bookreturns (Book_ID, Member_ID, Return_Date)
VALUES (Book_ID, Member_ID, Return_Date);
END//
SET DELIMITER TO;

#To Test:
Select * from bookreturns;
CALL New_bookreturn (4, 1, CURRENT_DATE());

## Additional procedure to add a book reservation
DROP PROCEDURE IF EXISTS Add_Reservation;
DELIMITER //
CREATE PROCEDURE Add_Reservation (
IN Book_ID INT,
IN Member_ID INT,
IN Reservation_Date DATE,
IN Res_Status_ID INT
) 
BEGIN
INSERT INTO reservations (Book_ID, Member_ID, Reservation_Date, Res_Status_ID)
VALUES (Book_ID, Member_ID, Reservation_Date, Res_Status_ID);
END//
SET DELIMITER TO;

To Test:
Select * From Reservations;
CALL Add_Reservation (5, 11, CURRENT_DATE(), 1);

## Additional procedure to add a fine for a late book return
DROP PROCEDURE IF EXISTS Add_Fine;
DELIMITER //
CREATE PROCEDURE Add_Fine (
IN Member_ID INT,
IN Loan_ID INT,
IN Fine_Date DATE,
IN FineAmount INT
) 
BEGIN
INSERT INTO Fines (Member_ID, Loan_ID, Fine_Date, FineAmount)
VALUES (Member_ID, Loan_ID, Fine_Date, FineAmount);
END//
SET DELIMITER TO;

## Additional procedure to pay a fine
DROP PROCEDURE IF EXISTS Pay_Fine;
DELIMITER //
CREATE PROCEDURE Pay_Fine (
IN Member_ID INT,
IN Payment_Date DATETIME,
IN Payment_Amount INT
) 
BEGIN
INSERT INTO Fine_payments (Member_ID, Payment_Date, Payment_Amount)
VALUES (Member_ID, Payment_Date, Payment_Amount);
END//
SET DELIMITER TO;

To Test:
SELECT * FROM Fine_Payments;
CALL Pay_Fine (1, CURRENT_DATE(), 1);

## 2. Trigger
## Trigger created that will deduct 1 from total copies of a book available in the books when a loan is issued in the loans table)
DROP TRIGGER IF EXISTS Deduct_Books_Available;
DELIMITER //
CREATE TRIGGER Deduct_Books_Available
AFTER INSERT 
ON Loans FOR EACH ROW
BEGIN 
UPDATE books
JOIN loans
on books.Book_ID = loans.Book_ID
SET books.Total_Copies = books.Total_Copies -1 
WHERE loans.Book_ID = books.Book_ID;
END //
DELIMITER ;

# To test trigger works
/*
SELECT * FROM books;

INSERT INTO Loans (Book_ID, Member_ID, Loan_Date, Due_Date) VALUES 
(4, 11, CURRENT_DATE(), DATE_ADD(now(),INTERVAL 2 WEEK));
*/
# Select * From books; Total copies column has shown a decrease of 1 copy for books.Book_ID 4. The trigger works!

#Second Trigger created for returning books to increase the total copies of books available in the books table when a book is returned
DELIMITER //
CREATE TRIGGER Returned_Books_Available
AFTER INSERT 
ON bookreturns FOR EACH ROW
BEGIN 
UPDATE books
JOIN bookreturns
on books.Book_ID = bookreturns.Book_ID
SET books.Total_Copies = books.Total_Copies +1 
WHERE bookreturns.Book_ID = books.Book_ID;
END //
DELIMITER ;

/*
To test trigger works:
SELECT* FROM loans;
SELECT * FROM books;
INSERT INTO bookreturns (Book_ID, Member_ID, Return_Date) VALUES (4, 11, current_date());
SELECT * FROM books; Total_Copies for Book_ID 4 increases by 1. The trigger works
*/

## Trigger created to update return date in loans table
## First found that I needed to alter my loans table to include a Date_Returned Column 
## This new column will then update with the returned date when a return is processed

ALTER TABLE Loans
ADD COLUMN Date_Returned DATETIME
	AFTER Due_Date;

DROP TRIGGER IF EXISTS Add_Return_Date;
DELIMITER //
CREATE TRIGGER Add_Return_Date
AFTER INSERT 
ON bookreturns FOR EACH ROW
BEGIN 
UPDATE loans
JOIN bookreturns
on loans.Book_ID = bookreturns.Book_ID
SET loans.Date_Returned = bookreturns.Return_Date 
WHERE loans.Book_ID = bookreturns.Book_ID;
END //
DELIMITER ;

## Trigger created to update reservations status in reservations once a loan has been issued
DROP TRIGGER IF EXISTS Reservation_Fulfilled;
DELIMITER //
CREATE TRIGGER Reservation_Fulfilled
AFTER INSERT 
ON loans FOR EACH ROW
BEGIN 
UPDATE reservations
JOIN loans
on loans.Book_ID = reservations.Book_ID
SET reservations.Res_Status_ID = 2 
WHERE loans.Book_ID = reservations.Book_ID;
END //
DELIMITER ;
# To test trigger - 
select * from reservations;
CALL New_loan (5, 3, CURRENT_DATE(), DATE_ADD(now(),INTERVAL 2 WEEK));
# Res_Status_ID change from reserved (1) to fulfilled (2).

## 3. Event Creation
# To check whether event_scheduler is on:
SHOW VARIABLES LIKE "event_scheduler";

# Turn Global Event Scheduler On:
SET GLOBAL event_scheduler = ON;

# Delete event if it already exists:
DROP EVENT IF EXISTS Delete_Old_Fines;
DELIMITER //
CREATE EVENT Delete_Old_Fines
ON SCHEDULE EVERY 1 MONTH
DO 
BEGIN
DELETE FROM fines WHERE Fine_Date < NOW() - INTERVAL 1 MONTH;
END//
DELIMITER ;

SHOW EVENTS;

# TO Turn Global Event Scheduler OFF:
SET GLOBAL event_scheduler = OFF;

## 4. A view that uses at least 3-4 tables. With a query that uses the view to produce a logically arranged result set for analysis
##Titles of books reserved and the date of their reservation 
##Note: Titles will not appear once the state of the reservation changes to fulfilled (i.e. loan issued)
CREATE OR REPLACE VIEW Books_Reserved AS
    SELECT Title, First_Name, Last_Name, Total_Copies, Res_Status, Reservation_Date
	FROM books
		JOIN authors_books
		ON books.Book_ID = authors_books.Book_ID
			JOIN authors
			ON authors_books.Author_ID = authors.Author_ID
				JOIN Reservations
                on reservations.Book_ID = books.Book_ID
					JOIN Reservation_Status
                    on reservation_status.Res_Status_ID = reservations.Res_Status_ID
		WHERE Res_Status = 'Reserved';

#Query of view created
SELECT Title, Total_Copies, Reservation_Date
FROM Books_Reserved;

#Example query with group by and having to demonstrate how to extract data for analysis (Number of loans per member)
SELECT First_Name, Last_Name, COUNT(Loan_ID) AS NumberOfLoans
FROM loans AS l
JOIN members AS m
ON l.Member_ID = m.Member_ID
GROUP BY l.member_ID
HAVING COUNT(l.member_ID) >= 3
ORDER BY COUNT(Loan_ID) DESC;