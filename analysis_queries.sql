SELECT 
    COUNT(*) AS Total_Sales,
    SUM(Quantity) AS Total_Units_Sold,
    SUM(Quantity * Products.Price) AS Total_Revenue,
    AVG(Quantity * Products.Price) AS Average_Sale_Value
FROM Sales
JOIN Products 
    ON Sales.ProductID = Products.ProductID;