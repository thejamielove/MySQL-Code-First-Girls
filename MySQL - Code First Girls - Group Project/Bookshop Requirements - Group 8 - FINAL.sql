USE bookshop;
-- ************************************************CORE REQUIREMENTS****************************************************
-- 1. Using any type of the joins create a view that combines multiple tables in a logical way - ****Daniela****
USE bookshop;

CREATE VIEW vw_TotalsPerCountry AS
SELECT 
	Customers.Country as Country,
	SUM(OrderDetails.Price) AS Total 
FROM OrderDetails
INNER JOIN Orders ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Country
ORDER BY Total Desc;

-- 2. In your database, create a stored function that can be applied to a query in your DB - ****Suwayda**** 
USE bookshop;

DELIMITER $$
CREATE FUNCTION CalculateTotalOrderAmount(OrderID INT) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total DECIMAL(10, 2);

    SELECT SUM(Price * Quantity) INTO Total
    FROM OrderDetails
    WHERE OrderID = OrderID;

    RETURN IFNULL(Total, 0.00);
END$$
DELIMITER ;

-- Calling Function
SELECT CalculateTotalOrderAmount(1) AS TotalAmount;

-- 3. Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis - ****Daniela****
USE bookshop;

SELECT
	Customers.Name,
	Customers.Email,
	Customers.Phone,
	Customers.Address,
	Customers.City 
FROM Customers 
WHERE Customers.Country = (SELECT Country FROM vw_TotalsPerCountry 
LIMIT 1);

-- ************************************************ADVANCED REQUIREMENTS****************************************************
-- 4. In your database, create a stored procedure and demonstrate how it runs ****Suwayda****
USE bookshop;

DELIMITER $$
CREATE PROCEDURE UpdateBookStock(
    IN BookID INT,
    IN NewStockQty INT
)
BEGIN
    UPDATE Books
    SET StockQuantity = NewStockQty
    WHERE BookID = BookID;
END$$;
DELIMITER ;

-- Calling Stored Procedure
CALL UpdateBookStock(3,25);

SELECT
	BookID,
    Title,
    StockQuantity
FROM Books
WHERE BookID = 3;

-- 7. Create a view that uses at least 3-4 base tables; **Jamie**
-- Stored view to create a Master Book Sales table using all tables in database except publishers & employees
-- Syntax: Table name.table column name
-- "AS" clause is used to rename column
USE bookshop;

CREATE VIEW BookSales AS
SELECT
    Books.BookID,
    Books.Title,
    Authors.Name AS Author,
    Genres.GenreName,
    Customers.Name AS Customer,
    Orders.OrderDate,
    OrderDetails.Quantity AS QuantitySold,
    OrderDetails.Price,
    OrderDetails.Quantity * OrderDetails.Price AS TotalSales

-- Joining (linking up) FK's to PK's to retrieve the details for the above view, example: author/customer names
FROM
    Books
    JOIN Authors ON Books.AuthorID = Authors.AuthorID
    JOIN Genres ON Books.GenreID = Genres.GenreID
    JOIN OrderDetails ON Books.BookID = OrderDetails.BookID
    JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
    JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- 7. Prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis. **Jamie**
-- Using BookSales view to analyse total sales & QTY's by Genre in Descending order to see our top performing Genre's sold
USE bookshop;

SELECT
    GenreName,
    SUM(TotalSales) AS TotalSales,
    SUM(QuantitySold) AS TotalQuantitySold
FROM BookSales
GROUP BY GenreName
ORDER BY TotalSales DESC;

-- 8. Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis. **Jamie**
-- Using Genres table to lookup total sales & QTY's sold by All Genres from the Book Sales view, descending by total sales
-- & filtering the results on QTY's sold that are less than or equal to 10. The Coalesce function is used to make sure this analysis includes
-- Genre's that have not been sold/record doesn't exist in Book Sales view & will return with 0 values sold
USE bookshop;

SELECT
    Genres.GenreName,
    COALESCE(SUM(BookSales.TotalSales), 0) AS TotalSales,
    COALESCE(SUM(BookSales.QuantitySold), 0) AS TotalQuantitySold
FROM Genres
LEFT JOIN BookSales ON Genres.GenreName = BookSales.GenreName
GROUP BY Genres.GenreName
HAVING COALESCE(SUM(BookSales.QuantitySold),0) <= 10
ORDER BY TotalSales DESC;