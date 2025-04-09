use superstore;
-- The goal is to analyze the sales performance of the superstore to identify key drivers of revenue and profitability. Specifically:
SELECT* FROM superstore;
-- Identify the top-performing product categories and subcategories.
-- Determine the region and customer segment contributing the most to sales and profit.
-- Highlight areas of concern, such as regions with low profit margins or products with high sales but low profitability.
-- Provide actionable insights for optimizing inventory and targeting high-value customers.
-- SELECT * FROM superstore

--  Top Product Categories and Subcategories


SELECT 
    Category, 
    Sub_Category, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Category, Sub_Category
ORDER BY Total_Sales DESC;

-- 2. regional and segment analysis
SELECT 
    Region, 
    Segment, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Region, Segment
ORDER BY Total_Profit DESC;
-- Insight: The West Region performs the best, while the South Region faces profitability challenges.

-- 3. regions with low profit margin
SELECT 
    Region, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit, 
    (SUM(Profit) / SUM(Sales)) * 100 AS Profit_Margin
FROM Superstore
GROUP BY Region
HAVING Profit_Margin < 10
ORDER BY Profit_Margin ASC;
-- Insight: Corporate customers contribute significantly to profits, while Consumer customers drive sales.

-- 4. product with high sales but low profitability
SELECT 
    Product_Name, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit, 
    (SUM(Profit) / SUM(Sales)) * 100 AS Profit_Margin
FROM Superstore
GROUP BY Product_Name
HAVING Profit_Margin < 10
ORDER BY Total_Sales DESC;

-- Insight: These products require pricing or cost adjustments for better profitability.


-- high value customers
SELECT 
    Customer_Name, 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit, 
    COUNT(Order_ID) AS Number_Of_Orders
FROM Superstore
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

