

-- EXPloratory data : It help understand the data before jumping into modeling or visualizations.

SELECT * FROM grocerytwo;


SELECT COUNT(*) FROM grocerytwo;

-- date of start and finish
SELECT MIN(transaction_date) FROM groceryTWO;
SELECT MAX(transaction_date) FROM groceryTWO;

-- min and max values of loyalty points 
SELECT MIN(loyalty_points) FROM groceryTWO;
SELECT MAX(loyalty_points) FROM groceryTWO;

SELECT * FROM grocerytwo;

SELECT SUM(final_amount) FROM groceryTWO;

SELECT SUM(discount_amount) FROM groceryTWO;

-- sum of final abmount of every store 
SELECT store_name, SUM(final_amount) FROM groceryTWO
GROUP BY store_name
ORDER BY 2 DESC;


-- sum of quantity of each product
SELECT product_name , SUM(quantity) FROM groceryTWO
GROUP BY product_name
ORDER BY 2 DESC;

-- sum of quantity of every aisle 
SELECT aisle , SUM(quantity) FROM groceryTWO
GROUP BY aisle
ORDER BY 2 DESC;

SELECT * FROM grocerytwo;
-- the most expensive product 
SELECT product_name , MAX(unit_price) FROM groceryTWO
GROUP BY product_name
ORDER BY 2 DESC;
