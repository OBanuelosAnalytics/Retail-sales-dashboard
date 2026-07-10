-- Sales Performance Dashboard:
Select *
FROM Retail_sales_dataset
LIMIT 10;

-- Total Units Sold
Select SUM(Quantity) AS Units_Sold
from retail_sales_dataset;

-- Total Customers
Select count( DISTINCT `Customer ID`) AS Total_Customers
from Retail_sales_dataset;

-- Total Sales
SELECT SUM(`Total Amount`) AS Total_sales
FROM Retail_sales_dataset;

-- Average Price per Unit
SELECT AVG(`Price per Unit`) AS Average_Price_Per_Unit
FROM Retail_sales_dataset;

-- Total Sales and Units Sold per Month
SELECT MONTH(Date) AS Month, SUM(`Total Amount`) AS Total_Amount, SUM(`Quantity`) AS Units_Sold
FROM Retail_sales_dataset
Group by MONTH(date)
Order by Month(Date) ASC;

-- Total Sales and Average Price by Catagory
SELECT `Product Category`, sum(`total amount`) AS total_sales, AVG(`Price per Unit`) AS average_price
FROM Retail_sales_dataset
GROUP BY `Product Category`
ORDER BY Total_Sales DESC;

-- Total Sales, Units Sold, and Average Spending by Gender
SELECT Gender, SUM(`Total Amount`) AS Total_Sales, SUM(Quantity) AS Units_Sold, AVG(`total amount`) AS Average_Spending
FROM Retail_sales_dataset
GROUP BY Gender;

-- Total Sale, Units Sold, and Average Spending by Age
SELECT Age, SUM(`total amount`) AS Total_Sales, SUM(Quantity) AS Units_Sold, AVG (`total amount`) AS Average_Spending
FROM Retail_sales_dataset
GROUP BY Age
ORDER BY Age ASC;
 
-- Age with the Highest Purchase Amount
SELECT Age, SUM(`total amount`) AS Total_Sales
FROM Retail_sales_dataset
GROUP BY AGE
ORDER BY Total_Sales DESC
LIMIT 10;

-- Customers with the Highest Purchase Amount
SELECT `Customer ID`, `Total Amount`
FROM Retail_sales_dataset
WHERE `Total Amount` = (
  SELECT MAX(`Total Amount`)
  FROM Retail_sales_dataset
);

-- Highest Selling Catagory
SELECT `Product Category`, SUM(`total amount`) AS Total_Sales
FROM Retail_sales_dataset
GROUP BY `Product Category`
ORDER BY Total_Sales DESC
LIMIT 1; 

-- Lowest Selling Catagory
SELECT `Product Category`, SUM(`total amount`) AS Total_Sales
FROM Retail_sales_dataset
GROUP BY `Product Category`
ORDER BY Total_Sales ASC
LIMIT 1;

-- Customers who spend above average
SELECT Count(*) AS Customer_Above_Average
FROM Retail_sales_dataset
WHERE `Total Amount` > (
SELECT AVG(`Total Amount`)
FROM Retail_sales_dataset
); 


