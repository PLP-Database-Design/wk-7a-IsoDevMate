CREATE DATABASE normalizations;
USE normalizations;

-- Question 1.
-- SQL query to transform this table into 1NF, ensuring that each row represents a single product for an order
-- multiple value in the table provided thus the column values should be atomic 

CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

INSERT INTO ProductDetail (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Question 2.
-- SQL query to transform this table into 2NF by removing partial dependencies. Ensure that each non-key column fully 
-- depends on the entire primary key.
-- approach is to like Remove CustomerName from this table, create a separate Orders table.
--  CustomerName depends only on OrderID → partial dependency = violates 2NF.

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');


CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

select * from OrderItems;