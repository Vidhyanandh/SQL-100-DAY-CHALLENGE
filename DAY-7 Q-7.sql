/*
Advanced Walmart Sales Analysis Question
Question:
Walmart wants to identify seasonal sales trends and understand customer purchasing behavior during different times of the year. You have the following tables: Sales, Products, and Customers.
*/

DROP TABLE IF EXISTS products;
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO Products (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 999.99),
(2, 'Smartphone', 'Electronics', 799.99),
(3, 'Headphones', 'Electronics', 199.99),
(4, 'Refrigerator', 'Appliances', 1499.99),
(5, 'Microwave', 'Appliances', 299.99),
(6, 'T-shirt', 'Clothing', 19.99),
(7, 'Jeans', 'Clothing', 49.99),
(8, 'Blender', 'Appliances', 99.99),
(9, 'Coffee Maker', 'Appliances', 79.99),
(10, 'Shoes', 'Clothing', 89.99);




DROP TABLE IF EXISTS sales;
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    sale_date DATE,
    quantity INT,
    amount DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Sales (sale_id, product_id, customer_id, sale_date, quantity, amount) VALUES
(1, 1, 101, '2023-01-15', 1, 999.99),
(2, 2, 102, '2023-02-16', 2, 1599.98),
(3, 3, 103, '2023-03-17', 3, 599.97),
(4, 4, 104, '2023-04-18', 1, 1499.99),
(5, 5, 105, '2023-05-19', 2, 599.98),
(6, 6, 101, '2023-06-20', 5, 99.95),
(7, 7, 102, '2023-07-21', 3, 149.97),
(8, 8, 103, '2023-08-22', 1, 99.99),
(9, 9, 104, '2023-09-23', 2, 159.98),
(10, 10, 105, '2023-10-24', 1, 89.99),
(11, 1, 101, '2023-11-24', 1, 999.99),
(12, 2, 102, '2023-11-25', 2, 1599.98),
(13, 3, 103, '2023-11-26', 3, 599.97),
(14, 4, 104, '2023-11-27', 1, 1499.99),
(15, 5, 105, '2023-11-28', 2, 599.98);




/*
1. Write a query to find the top 3 products with the 
highest sales volume (total quantity sold) for each quarter of the year 2023.
*/

-- METHOD 1: USING LEFT JOIN

SELECT product_id,
	   total_quantity,
       product_name
	FROM(
		SELECT p.product_id,
			   p.product_name,
               SUM(s.quantity) as total_quantity,
               quarter(s.sale_date) as quarter,
               DENSE_RANK() OVER(partition by quarter(s.sale_date) ORDER BY SUM(s.quantity) DESC) as sales_ranking
			FROM Products p
			LEFT JOIN Sales s
			ON p.product_id=s.product_id
			WHERE YEAR(sale_date)='2023'
			group by p.product_id,quarter(s.sale_date)) as sales_table 
WHERE sales_ranking<4;

-- METHOD-2: USING SUBQUERY


SELECT product_id,
	   product_name,
       total_quantity
FROM(
SELECT p.product_id,
	   p.product_name,
	   QUARTER(s.sale_date) as quarter,SUM(s.quantity) as total_quantity,
       dense_rank() OVER(partition by  QUARTER(s.sale_date) order by SUM(s.quantity) desc) as sales_ranking
	FROM products p,sales s
	WHERE p.product_id=s.product_id  AND YEAR(s.sale_date) = 2023
	GROUP BY p.product_id,QUARTER(s.sale_date)) as sales_ranking_table
WHERE sales_ranking <4;

-- METOD-3: USING CTE's

WITH QuarterlySales AS (
    SELECT 
        p.product_id,
        p.product_name,
        QUARTER(s.sale_date) AS quarter,
        SUM(s.quantity) AS total_quantity
    FROM 
        Products p
    JOIN 
        Sales s ON p.product_id = s.product_id
    WHERE 
        YEAR(s.sale_date) = 2023
    GROUP BY 
        p.product_id,
        p.product_name,
        QUARTER(s.sale_date)
),
RankedSales AS (
    SELECT 
        product_id,
        product_name,
        quarter,
        total_quantity,
        DENSE_RANK() OVER (PARTITION BY quarter ORDER BY total_quantity DESC) AS sales_ranking
    FROM 
        QuarterlySales
)
SELECT 
    product_id,
    product_name,
    total_quantity
FROM 
    RankedSales
WHERE 
    sales_ranking < 4;
    
    

    
    






