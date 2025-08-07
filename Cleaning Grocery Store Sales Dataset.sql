-- dataset link : https://www.kaggle.com/datasets/pratyushpuri/grocery-store-sales-dataset-in-2025-1900-record



-- delete duplicate
-- standarize data and fix errors
-- check null values 
-- remove unessecery column 

SELECT *FROM grocery_chain_data;

-- create a new table 
CREATE TABLE grocery
LIKE grocery_chain_data;

INSERT INTO grocery 
SELECT * FROM grocery_chain_data;

-- create a new column : row_num to show duplicate , if number is greater than 1 so the columns are duplicated 
WITH cte_duplicate AS(SELECT *, ROW_NUMBER() OVER (PARTITION BY customer_id) AS row_num
FROM grocery
)

-- show all duplicated columns 
SELECT * FROM cte_duplicate
WHERE row_num > 1;

-- we can't delete from cte , so we need to create another table with new table putting in it values of cte  
SELECT * FROM grocery 
WHERE customer_id = 2494 ;

CREATE TABLE `groceryTWO` (
  `customer_id` int DEFAULT NULL,
  `store_name` text,
  `transaction_date` text,
  `aisle` text,
  `product_name` text,
  `quantity` int DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `final_amount` double DEFAULT NULL,
  `loyalty_points` int DEFAULT NULL,
  row_num INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM groceryTWO;

INSERT INTO groceryTWO
SELECT *, ROW_NUMBER() OVER (PARTITION BY customer_id) AS row_num FROM grocery;

-- delete duplicated 
DELETE FROM groceryTWO 
WHERE row_num > 1;


-- confirm that there's no duplicated values 
SELECT * FROM groceryTWO WHERE row_num > 1;

-- STandarizing data : it means finding isssus and fixing them !!

SELECT * FROM groceryTWO;

-- trim all String columns

SELECT store_name, TRIM(store_name) FROM groceryTWO;

UPDATE groceryTWO
-- SET store_name = TRIM(store_name);
-- SET product_name = TRIM(product_name);
SET aisle = TRIM(aisle);

-- verify that no same column

SELECT DISTINCT store_name from groceryTWO;

SELECT * FROM groceryTWO;
SELECT DISTINCT aisle from groceryTWO ORDER BY aisle ASC;
SELECT DISTINCT product_name from groceryTWO ORDER BY 1;

-- update transatction date type : from str to date
SELECT transaction_date from groceryTwo;

UPDATE groceryTWO
SET transaction_date = str_to_date(transaction_date, '%Y-%m-%d');

ALTER TABLE groceryTWO
MODIFY COLUMN transaction_date DATE;


-- BLANk and null values !!

SELECT * FROM groceryTWO;

SELECT * FROM groceryTWO
WHERE customer_id = '' OR customer_id = NULL;



SELECT * FROM groceryTWO
WHERE aisle = '' OR aisle = NULL;


SELECT * FROM groceryTWO
WHERE store_name = '' OR store_name = NULL;


SELECT store_name, aisle,product_name FROM groceryTWO WHERE product_name = "Salmon"
ORDER BY 2 ASC;

UPDATE groceryTWO 
SET store_name = "City Fresh Store" 
-- WHERE aisle IN ('Frozen Foods' , 'Canned Goods')
-- WHERE aisle IN ('Meat & Seafood' , 'Beverages');
WHERE store_name = '' OR store_name = NULL
AND aisle IN ('Produce' , 'Household Items');


SELECT * FROM groceryTWO
WHERE product_name = '' OR product_name = NULL;

SELECT * FROM groceryTWO
WHERE quantity = '' OR quantity = NULL;

SELECT * FROM groceryTWO
WHERE unit_price = '' OR unit_price = NULL;

SELECT * FROM groceryTWO
WHERE total_amount = '' OR total_amount = NULL;
-- NORmal CASE 
SELECT * FROM groceryTWO
WHERE discount_amount = '' OR discount_amount = NULL;

SELECT * FROM groceryTWO
WHERE final_amount = '' OR final_amount = NULL;

-- ALSO NORMAL case ;
SELECT * FROM groceryTWO
WHERE loyalty_points = '' OR loyalty_points = NULL;


-- DELETE Column 

ALTER TABLE groceryTWO
DROP COLUMN row_num;

SELECT * FROM groceryTWO;
