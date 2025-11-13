----------------------------------------------------
-- Exploratory Data Analysis
-- To check the columns names among other things.
SELECT *
FROM casestudy.brightcoffee.shopsales
LIMIT 50;

-- Checking the number of coffee shops
SELECT DISTINCT store_location
FROM casestudy.brightcoffee.shopsales;

-- Checking the different product category
SELECT DISTINCT product_category
FROM casestudy.brightcoffee.shopsales;

-- Checking the different product type
SELECT DISTINCT product_type
FROM casestudy.brightcoffee.shopsales;

-- Checking the different product detail
SELECT DISTINCT product_detail
FROM casestudy.brightcoffee.shopsales;

-- First operating date
SELECT MIN(transaction_date) AS First_operating_date
FROM casestudy.brightcoffee.shopsales;

-- Last operating date
SELECT MAX(transaction_date) AS Last_operating_date
FROM casestudy.brightcoffee.shopsales;

--Check what time the shops open
SELECT MIN(transaction_time) AS open_time
FROM casestudy.brightcoffee.shopsales;

-- Check what time the shop closes
SELECT MAX(transaction_time) AS closing_time
FROM casestudy.brightcoffee.shopsales;


----------------------------------------------------

SELECT store_location,
       product_category,
       product_type,
       product_detail,
       transaction_date,
       product_id,
       DAYNAME(transaction_date) AS day_name,
       CASE
            WHEN day_name IN ('Sat', 'Sun') THEN 'Weekend'
            ELSE 'Weekday'
            END AS day_classification,
        MONTHNAME(transaction_date) AS month_name,
        transaction_time,
        HOUR(transaction_time) AS hour_of_day,
               CASE
            WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
            WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
            WHEN transaction_time > '17:00:00'  THEN 'Evening'
            END AS time_classification,
        -- IDs
        COUNT(DISTINCT transaction_id) AS Number_of_Transactions,
        unit_price,
        transaction_qty,
        -- Revenue Calculation
        SUM(transaction_qty*unit_price) AS total_revenue
FROM casestudy.brightcoffee.shopsales
GROUP BY ALL;
----------------------------------------------------------------------------------------
