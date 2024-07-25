-- Drop the existing tables if they exist
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS cities;

-- Create cities table with city_id as AUTO_INCREMENT
CREATE TABLE cities (
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(50)
);

-- Create restaurants table with city_id as INT
CREATE TABLE restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

-- Create orders table with rating column
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT,
    order_value DECIMAL(10, 2),
    order_date DATE,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);


-- Insert data into cities table
INSERT INTO cities (city_name) VALUES
('Mumbai'),
('Delhi'),
('Bengaluru');

-- Insert data into restaurants table
INSERT INTO restaurants (restaurant_name, city_id) VALUES
('Bademiya', 1),
('Bombay Canteen', 1),
('Trishna', 1),
('Karims', 2),
('Indian Accent', 2),
('Bukhara', 2),
('Toit', 3),
('Koshys', 3),
('MTR', 3);

-- Insert data into orders table with rating
INSERT INTO orders (restaurant_id, order_value, order_date, rating) VALUES
(1, 500.00, '2024-01-01', 4),
(1, 450.00, '2024-01-02', 5),
(1, 550.00, '2024-01-03', 4),
(2, 300.00, '2024-01-01', 3),
(2, 350.00, '2024-01-02', 4),
(2, 250.00, '2024-01-03', 3),
(3, 700.00, '2024-01-01', 5),
(3, 750.00, '2024-01-02', 4),
(3, 800.00, '2024-01-03', 5),
(4, 400.00, '2024-01-01', 4),
(4, 500.00, '2024-01-02', 5),
(4, 450.00, '2024-01-03', 4),
(5, 600.00, '2024-01-01', 5),
(5, 550.00, '2024-01-02', 4),
(5, 650.00, '2024-01-03', 5),
(6, 900.00, '2024-01-01', 5),
(6, 850.00, '2024-01-02', 5),
(6, 950.00, '2024-01-03', 4),
(7, 400.00, '2024-01-01', 3),
(7, 450.00, '2024-01-02', 4),
(7, 500.00, '2024-01-03', 3),
(8, 1000.00, '2024-01-01', 5),
(8, 1050.00, '2024-01-02', 4),
(8, 1100.00, '2024-01-03', 5),
(9, 800.00, '2024-01-01', 5),
(9, 850.00, '2024-01-02', 4),
(9, 900.00, '2024-01-03', 5);

SELECT * FROM cities;
SELECT * FROM restaurants;
SELECT * FROM orders;

-- Write a SQL query to find the top 2 restaurants in each city with the highest average rating. 
-- return city_id, city_name, restaurant id, restaurant_name and avg_rating

-- METHOD 1: USING JOINS 

SELECT*
FROM(
SELECT c.city_id,
	   c.city_name,
       r.restaurant_name,
       r.restaurant_id,
       ROUND(AVG(o.rating),2) as avg_rating,DENSE_RANK() OVER(PARTITION BY c.city_name ORDER BY AVG(o.rating) DESC) AS rating_rank
FROM cities c
LEFT JOIN restaurants r 
ON c.city_id=r.city_id
JOIN orders o ON r.restaurant_id=o.restaurant_id
GROUP BY c.city_id,r.restaurant_id,c.city_name,r.restaurant_name
) as rankings
WHERE rating_rank<=2
ORDER BY avg_rating DESC;

-- METHOD USING SUBQUERY

SELECT *
FROM(
SELECT c.city_id,
	   c.city_name,
       r.restaurant_id,
       r.restaurant_name,
       ROUND(AVG(o.rating),2) as avg_rating,
       dense_rank() OVER(partition by c.city_name order by AVG(o.rating) DESC) as rating_rank
FROM restaurants r,cities c,orders o
WHERE r.city_id=c.city_id AND r.restaurant_id=o.restaurant_id
GROUP BY c.city_id,c.city_name,r.restaurant_id,r.restaurant_name) restaurant_rankings
WHERE rating_rank<3
ORDER BY city_id ASC,avg_rating DESC;




