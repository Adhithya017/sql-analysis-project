CREATE DATABASE SalesAnalysis;

USE SalesAnalysis;

SELECT TOP 5* FROM DIM_Customer;
SELECT TOP 5* FROM DIM_Product;
SELECT TOP 5* FROM DIM_Calendar;
SELECT TOP 5* FROM FACT_InternetSales;


SELECT TOP 5 *
FROM DIM_Calendar;


SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Fact_InternetSales';




SELECT 
    C.Year,
    SUM(F.SalesAmount) AS TotalSales
FROM 
    Fact_InternetSales F
JOIN 
    DIM_Calendar C ON F.OrderDateKey = C.DateKey
GROUP BY 
    C.Year
ORDER BY 
    C.Year;

SELECT TOP 5 * FROM DIM_Product;


SELECT TOP 5 
    P.Product_name,
    SUM(F.SalesAmount) AS Revenue
FROM FACT_InternetSales F
JOIN DIM_Product P ON F.ProductKey = P.ProductKey
GROUP BY P.Product_name
ORDER BY Revenue DESC;


SELECT TOP 5 * FROM DIM_Customer;


SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'DIM_Customer';


SELECT 
    C.Customer_City AS City,
    COUNT(DISTINCT C.CustomerKey) AS CustomerCount
FROM DIM_Customer C
GROUP BY C.Customer_City
ORDER BY CustomerCount DESC;


SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'DIM_Calendar';

SELECT 
    C.Year,
    C.Month AS MonthName,
    SUM(F.SalesAmount) AS MonthlySales
FROM FACT_InternetSales F
JOIN DIM_Calendar C ON F.OrderDateKey = C.DateKey
GROUP BY C.Year, C.Month, C.MonthNo
ORDER BY C.Year, C.MonthNo;




