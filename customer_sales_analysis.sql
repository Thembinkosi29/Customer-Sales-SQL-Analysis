-- database: :memory:
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT,
    Region TEXT,
    Age INTEGER
);

CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT,
    Category TEXT,
    Price REAL
);

CREATE TABLE Sales (
    SaleID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    ProductID INTEGER,
    Quantity INTEGER,
    SaleDate TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (CustomerID, CustomerName, Region, Age) VALUES
(1, 'Thabo Mokoena', 'Gauteng', 28),
(2, 'Lerato Dlamini', 'Mpumalanga', 34),
(3, 'Sipho Nkosi', 'Limpopo', 41),
(4, 'Naledi Molefe', 'Gauteng', 25),
(5, 'Kabelo Maseko', 'North West', 39),
(6, 'Precious Ndlovu', 'Mpumalanga', 31),
(7, 'Tshepo Modise', 'Gauteng', 45),
(8, 'Amanda Khumalo', 'Limpopo', 29),
(9, 'Brian Mokoena', 'North West', 36),
(10, 'Nomsa Dube', 'Gauteng', 52);
INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop', 'Electronics', 8500),
(2, 'Monitor', 'Electronics', 4200),
(3, 'Printer', 'Electronics', 3800),
(4, 'Office Chair', 'Furniture', 2500),
(5, 'Desk', 'Furniture', 3200),
(6, 'Keyboard', 'Accessories', 650),
(7, 'Mouse', 'Accessories', 450),
(8, 'Headset', 'Accessories', 900);
INSERT INTO Sales (SaleID, CustomerID, ProductID, Quantity, SaleDate) VALUES
(1, 1, 1, 2, '2026-01-05'),
(2, 2, 4, 1, '2026-01-08'),
(3, 3, 2, 1, '2026-01-12'),
(4, 4, 6, 3, '2026-01-15'),
(5, 5, 3, 2, '2026-01-20'),
(6, 6, 7, 4, '2026-01-23'),
(7, 7, 1, 1, '2026-02-02'),
(8, 8, 5, 2, '2026-02-06'),
(9, 9, 8, 3, '2026-02-10'),
(10, 10, 2, 2, '2026-02-14'),
(11, 1, 3, 1, '2026-02-18'),
(12, 2, 6, 5, '2026-02-22'),
(13, 3, 4, 2, '2026-03-03'),
(14, 4, 7, 3, '2026-03-07'),
(15, 5, 1, 1, '2026-03-12'),
(16, 6, 8, 2, '2026-03-16'),
(17, 7, 2, 1, '2026-03-20'),
(18, 8, 5, 1, '2026-03-24'),
(19, 9, 6, 4, '2026-03-27'),
(20, 10, 3, 2, '2026-03-30');
SELECT 
    COUNT(*) AS Total_Sales,
    SUM(Quantity) AS Total_Units_Sold,
    SUM(Quantity * Products.Price) AS Total_Revenue,
    AVG(Quantity * Products.Price) AS Average_Sale_Value
FROM Sales
JOIN Products 
    ON Sales.ProductID = Products.ProductID;