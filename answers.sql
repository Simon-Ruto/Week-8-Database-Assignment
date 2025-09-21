-- Create the database then use the databace in order to work with it

CREATE DATABASE library;

USE library;

-- Creating the tables

-- Creating Tables

-- Creating table for library members

CREATE TABLE members (
memberId INT PRIMARY KEY AUTO_INCREMENT,
firstName VARCHAR(50) NOT NULL,
lastName VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
phone VARCHAR(20) UNIQUE,
joinDate DATE NOT NULL 
);

-- Creating table for books inventory
CREATE TABLE books (
bookId INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
author VARCHAR(100) NOT NULL,
publisher VARCHAR(100),
yearPublisshed YEAR,
copiesAvailable INT NOT NULL DEFAULT 1
);


-- Creating table for the staff members

CREATE TABLE staff (
staffId INT PRIMARY KEY AUTO_INCREMENT,
firtsName  VARCHAR(100) NOT NULL,
lastName VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
role ENUM('Librarian','Admin') NOT NULL,
hireDate DATE NOT NULL
);

-- Creating table for loans (to track borrowed books )
CREATE TABLE LOANS (
loanId INT PRIMARY KEY AUTO_INCREMENT,
memberId INT NOT NULL,
bookId INT NOT NULL,
staffId INT NOT NULL,
loanDate DATE NOT NULL,
dueDate DATE NOT NULL,
returnDate DATE,
FOREIGN KEY (memberId) REFERENCES members(memberId),
FOREIGN KEY (bookId) REFERENCES books(bookId),
FOREIGN KEY (staffId) REFERENCES staff(staffId)
);

-- Creating table reservations (When a book is requested but not available)

CREATE TABLE reservations(
reservationId INT PRIMARY KEY AUTO_INCREMENT,
memberId INT NOT NULL,
bookId INT NOT NULL,
reservationDate DATE,
status ENUM('Pending','Fullfilled','Cancelled') DEFAULT 'Pending',
FOREIGN KEY (memberId) REFERENCES members(memberId),
FOREIGN KEY (bookId) REFERENCES books(bookId)
);

-- Relationships:
-- 1. One Member can borrow many Books (via loans).
-- 2. One Book can be borrowed by many Members (over time).
-- 3. Many-to-Many between Members and Books is resolved by Loans.
-- 4. Staff manage Loans (who issued the book).
-- 5. Reservations link Members and Books.

--END