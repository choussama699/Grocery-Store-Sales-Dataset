

-- EXPloratory data 

SELECT * FROM grocerytwo;

SELECT COUNT(*) FROM grocerytwo;

SELECT MIN(transaction_date) FROM groceryTWO;
SELECT MAX(transaction_date) FROM groceryTWO;

SELECT MIN(loyalty_points) FROM groceryTWO;
SELECT MAX(loyalty_points) FROM groceryTWO;

SELECT * FROM grocerytwo;

SELECT SUM(final_amount) FROM groceryTWO;

SELECT SUM(discount_amount) FROM groceryTWO;

SELECT store_name, SUM(final_amount) FROM groceryTWO
GROUP BY store_name
ORDER BY 2 DESC;

SELECT * FROM grocerytwo;

SELECT product_name , SUM(quantity) FROM groceryTWO
GROUP BY product_name
ORDER BY 2 DESC;

SELECT aisle , SUM(quantity) FROM groceryTWO
GROUP BY aisle
ORDER BY 2 DESC;

SELECT * FROM grocerytwo;

SELECT product_name , MAX(unit_price) FROM groceryTWO
GROUP BY product_name
ORDER BY 2 DESC;
