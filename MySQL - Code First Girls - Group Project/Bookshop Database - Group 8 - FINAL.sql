CREATE DATABASE bookshop;
USE bookshop;

-- Authors Table Suwayda
CREATE TABLE Authors (
AuthorID INT NOT NULL,
Name VARCHAR(255) NOT NULL,
CONSTRAINT PK_Authors PRIMARY KEY (AuthorID)
);

INSERT INTO Authors (AuthorID, Name)
VALUES
(1, 'Evelyn Hart'),
(2, 'Marcus Reed'),
(3, 'Lily Tanaka'),
(4, 'Alexandre Dubois'),
(5, 'Heidi Schmidt'),
(6, 'Nikos Stavros'),
(7, 'Richard Grayson'),
(8, 'Sarah Jenkins'),
(9, 'Emma Laurent'),
(10, 'Olivia Brown');

-- Genres Table Daniela
CREATE TABLE Genres(
GenreID INTEGER NOT NULL,
GenreName VARCHAR(50) NOT NULL,
CONSTRAINT 
PK_GenreID PRIMARY KEY (GenreID)
);

INSERT INTO Genres 
(GenreId, GenreName)
VALUES 
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Children'),
(4, 'Teen & Young Adult'),
(5, 'Graphic Novels and Manga'),
(6, 'Education and Revision book'),
(7, 'Crime, Mystery and Thrillers'),
(8, 'Romance Fiction'),
(9, 'Biography & Autobiography'),
(10, 'Cookery Books'),
(11, 'Travel Guides & Maps'),
(12, 'Science Fiction & Fantasy');

-- Publishers Table Daniela
CREATE TABLE Publishers(
PublisherID INTEGER NOT NULL,
Name VARCHAR(55) NOT NULL,
Email VARCHAR(55) NOT NULL,
Phone VARCHAR(30),
Address VARCHAR(255) NOT NULL,
City VARCHAR(20) NOT NULL,
PostCode VARCHAR(20) NOT NULL,
Country VARCHAR(50) NOT NULL,
CONSTRAINT
PK_PublisherID PRIMARY KEY (PublisherID)
);

INSERT INTO publishers 
(PublisherId, Name, Email, Phone, Address, City, PostCode, Country)
VALUES
(1, 'Black Stone', 'blackstone@email.com', '45676-4657', '45 Cornell Street', 'London', 'E65 8UI', 'United Kingdom'),
(2, 'Transworld', 'transworld@gmail.com', '8753-9898', '35 Pathway Road', 'New York', 'NY6 789', 'United State of America'),
(3, 'Orion Books', 'orion@email.com', '6453-9008', '25 Holland Road', 'Tokyo','TY9 675','Japan'),
(4, 'Endeavour', 'endeavour@email.com', '1234-6789', '65 Parkview', 'Paris', 'FR8 908', 'France'),
(5, 'Voyager', 'voyager@email.com', '9878-3425', '85 Dressden Street', 'Berlin', 'DE4 098', 'Germany'),
(6, 'Octopus', 'octopus@email.com', '8765-0987', '105 Konstantin Road', 'Athens', 'Gk98 098', 'Greece'),
(7, 'Profile Books', 'profile@email.com', '8976-9876', '68 Whitecross Street', 'London', 'EC3 9RG', 'United Kingdom'),
(8, 'Blind Carrier', 'blindcarrier@email.com', '2345-8987','51 Orange Road', 'London', 'E20 8YT', 'United Kingdom'),
(9, 'Blue Bell', 'bluebell@email.com', '2649-8463', '17 Amsterdam Street', 'Brussels', 'BE4 9OP', 'Belgium'),
(10, 'Magic Hat', 'magichat@email.com', '3459-0987', '98 Shetland Road', 'Cambridge', 'C76 7TD', 'United Kingdom');

-- Books Table Suwayda 
CREATE TABLE Books (
BookID INT NOT NULL,
Title VARCHAR(255) NOT NULL,
AuthorID INT NOT NULL,
GenreID INT NOT NULL,
PublisherID INT NOT NULL,
ISBN VARCHAR(20),
PublicationDate DATE,
Price DECIMAL(10, 2),
StockQuantity INT,
CONSTRAINT PK_Books PRIMARY KEY (BookID),
FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
FOREIGN KEY (GenreID) REFERENCES Genres(GenreID),
FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

INSERT INTO Books (BookID, Title, AuthorID, GenreID, PublisherID, ISBN, PublicationDate, Price, StockQuantity)
VALUES
(1, 'Shadows of Time', 1, 1, 1, '978-0452789631', '2018-01-01', 15.99, 12),
(2, 'Beyond the Horizon', 2, 12, 2, '978-0395874562', '2020-01-01', 13.99, 14),
(3, 'Whispers in Tokyo', 3, 7, 3, '978-0486895234', '2019-01-01', 16.99, 11),
(4, 'Lights of Paris', 4, 8, 4, '978-0678112345', '2017-01-01', 14.99, 16),
(5, 'Galactic Dreams', 5, 12, 5, '978-0567945673', '2021-01-01', 18.99, 10),
(6, 'Legends of Olympus', 6, 12, 6, '978-0452789631', '2016-01-01', 17.99, 14),
(7, 'Chronicles of the Modern Age', 7, 2, 7, '978-0395874562', '2018-01-01', 19.99, 15),
(8, 'Invisible Ties', 8, 7, 8, '978-0486895234', '2017-01-01', 12.99, 11),
(9, 'The Garden of Secrets', 9, 12, 9, '978-0678112345', '2020-01-01', 14.99, 15),
(10, 'Enchanted Realms', 10, 3, 10, '978-0567945673', '2019-01-01', 11.99, 11);

-- Customers Table Naadia
CREATE TABLE Customers (
CustomerID INT NOT NULL,
Name VARCHAR(60) NOT NULL,
Email VARCHAR(45) NOT NULL,
Phone VARCHAR(45) NOT NULL,
Address VARCHAR(45) NOT NULL,
City VARCHAR(45) NOT NULL,
PostCode VARCHAR(45) NOT NULL,
Country VARCHAR(45) NOT NULL,
CONSTRAINT PK_CustomerID PRIMARY KEY (CustomerID)
);

INSERT INTO Customers 
(CustomerID, Name, Email, Phone, Address, City, PostCode, Country) 
VALUES 
(1, 'Steve Wonder', 'stevewonder@email.com', '45676-4657', '45 Cornell Street', 'London', 'E65 8UI', 'United Kingdom'),
(2, 'Oliva Woolf', 'owoolfd@gmail.com', '8753-9898', '35 Pathway Road', 'New York', 'NY6 789', 'United State of America'),
(3, 'Mary Smith', 'marySmith@email.com', '6453-9008', '25 Holland Road', 'Tokyo','TY9 675','Japan'),
(4, 'John Brown', 'johnbrown@email.com', '1234-6789', '65 Parkview', 'Paris', 'FR8 908', 'France'),
(5, 'Jessica Hilton', 'jessicahilton@email.com', '9878-3425', '85 Dressden Street', 'Berlin', 'DE4 098', 'Germany'),
(6, 'Fred James', 'fredjames@email.com', '8765-0987', '105 Konstantin Road', 'Athens', 'Gk98 098', 'Greece'),
(7, 'Camila Paker', 'camilaparker@email.com', '8976-9876', '68 Whitecross Street', 'London', 'EC3 9RG', 'United Kingdom'),
(8, 'Marc Pierre', 'marcpierre@email.com', '2345-8987','51 Orange Road', 'London', 'E20 8YT', 'United Kingdom');

-- Orders Table Naadia
CREATE TABLE Orders (
OrderID INT NOT NULL,
CustomerID INT NOT NULL,
OrderDate TIMESTAMP,
-- TotalAmount DECIMAL(10,2), -- NEED TO DOUBLE CHECK IF WE SHOULD HAVE THIS OR NOT
CONSTRAINT PK_OrderID PRIMARY KEY (OrderID),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders
(OrderID, CustomerID, OrderDate)
VALUES
(1, 1, '2023-10-20 08:00:27'),
(2, 3, '2023-10-25 10:00:35'),
(3, 2, '2023-11-01 19:15:41'),
(4, 8, '2023-11-02 14:20:15'),
(5, 7, '2023-11-02 19:15:32'),
(6, 7, '2023-12-05 11:45:15'),
(7, 5, '2023-12-13 09:22:09'),
(8, 5, '2023-12-20 12:15:27'),
(9, 6, '2023-12-22 08:06:44'),
(10, 4, '2023-12-22 15:22:32');

-- Order Details Table - Jamie
CREATE TABLE OrderDetails (
Order_Detail_ID INT NOT NULL,
OrderID INT NOT NULL,
BookID INT NOT NULL,
Quantity INT NOT NULL,
Price DECIMAL(10,2),
CONSTRAINT PK_Order_Detail_ID PRIMARY KEY (Order_Detail_ID),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Order Details Table - Jamie - Price & QTY's as per Books table checking against BookID - Data check in Excel before inserting below
INSERT INTO OrderDetails (Order_Detail_ID, OrderID, BookID, Quantity, Price)
VALUES
(1, 1, 1, 3, 15.99),
(2, 1, 8, 4, 12.99),
(3, 1, 4, 7, 14.99),
(4, 4, 6, 10, 17.99),
(5, 5, 2, 5, 13.99),
(6, 2, 3, 6, 16.99),
(7, 2, 1, 5, 15.99),
(8, 7, 8, 5, 12.99),
(9, 7, 9, 4, 14.99),
(10, 3, 10, 7, 11.99),
(11, 8, 5, 3, 18.99),
(12, 8, 2, 5, 13.99),
(13, 6, 7, 6, 19.99),
(14, 9, 7, 4, 19.99),
(15, 10, 1, 3, 15.99);

-- Employees Table - Jamie -- Table to be used for future -- Examples are checking Customer Service teams & how many customers queries they solved
CREATE TABLE Employees (
EmployeeID INT NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Role VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL,
Phone VARCHAR(50) NOT NULL,
CONSTRAINT PK_EmployeeID PRIMARY KEY (EmployeeID)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Role, Email, Phone)
VALUES
(1, "Luke", "Skywalker", "Software Engineer", "LukeSkywalker@gmail.com", "793-456-1234"),
(2, "Helena", "Velez", "Software Engineer", "HelenaVelez@outlook.com", "443-645-5554"),
(3, "Soren", "Wolf", "Customer Service Representative", "SorenWolf55@gmail.com", "755-899-7812"),
(4, "Guillermo", "Costa", "Customer Service Representative", "MrGuillermoCosta@outlook.com", "763-487-3335"),
(5, "Lexie", "Eaton", "Financial Controller", "LexieEaton@outlook.com", "415-845-6785"),
(6, "Anahi", "Silva", "Commercial Finance Director", "AnahiSilva@outlook.com", "755-634-8788");