DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS orders;


CREATE TABLE Restaurants (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,
    restaurant_id INT REFERENCES Restaurants(id),
    order_time TIMESTAMP,
    dispatch_time TIMESTAMP
);

INSERT INTO Restaurants (name, location) VALUES
('Restaurant A', 'Delhi'),
('Restaurant B', 'Delhi'),
('Restaurant C', 'Delhi'),
('Restaurant D', 'Delhi'),
('Restaurant E', 'Delhi');

INSERT INTO Orders (restaurant_id, order_time, dispatch_time) VALUES
(1, '2024-07-23 12:00:00', '2024-07-23 12:14:00'),
(1, '2024-07-23 12:30:00', '2024-07-23 12:48:00'),
(1, '2024-07-23 13:00:00', '2024-07-23 13:16:00'),
(2, '2024-07-23 13:30:00', '2024-07-23 13:50:00'),
(2, '2024-07-23 14:00:00', '2024-07-23 14:14:00'),
(3, '2024-07-23 14:30:00', '2024-07-23 14:49:00'),
(3, '2024-07-23 15:00:00', '2024-07-23 15:16:00'),
(3, '2024-07-23 15:30:00', '2024-07-23 15:40:00'),
(4, '2024-07-23 16:00:00', '2024-07-23 16:10:00'),
(4, '2024-07-23 16:30:00', '2024-07-23 16:50:00'),
(5, '2024-07-23 17:00:00', '2024-07-23 17:25:00'),
(5, '2024-07-23 17:30:00', '2024-07-23 17:55:00'),
(5, '2024-07-23 18:00:00', '2024-07-23 18:19:00'),
(1, '2024-07-23 18:30:00', '2024-07-23 18:44:00'),
(2, '2024-07-23 19:00:00', '2024-07-23 19:13:00');


/*
You are given two tables: Restaurants and Orders. After receiving an order, 
each restaurant has 15 minutes to dispatch it. Dispatch times are categorized as follows:

on_time_dispatch: Dispatched within 15 minutes of order received.
late_dispatch: Dispatched between 15 and 20 minutes after order received.
super_late_dispatch: Dispatched after 20 minutes.
Task: Write an SQL query to count the number of dispatched orders in each category for each restaurant.
*/

SELECT * FROM restaurants;
SELECT * FROM Orders;


SELECT r.id,
       r.name,
       CASE 
           WHEN TIMESTAMPDIFF(MINUTE, o.order_time, o.dispatch_time) <= 15 THEN 'on_time_dispatch'
           WHEN TIMESTAMPDIFF(MINUTE, o.order_time, o.dispatch_time) BETWEEN 16 AND 20 THEN 'late_dispatch'
           WHEN TIMESTAMPDIFF(MINUTE, o.order_time, o.dispatch_time) > 20 THEN 'super_late_dispatch'
           ELSE 'NOT_DELIVERED'
       END AS delivery_status,
       COUNT(*) AS no_of_deliveries
FROM Orders o
JOIN restaurants r ON o.restaurant_id = r.id
GROUP BY r.id, r.name, delivery_status;


-- METHOD2:

WITH Classified_Orders AS (
    SELECT o.restaurant_id,
           CASE 
               WHEN TIMESTAMPDIFF(MINUTE, o.order_time, o.dispatch_time) <= 15 THEN 'on_time_dispatch'
               WHEN TIMESTAMPDIFF(MINUTE, o.order_time, o.dispatch_time) BETWEEN 16 AND 20 THEN 'late_dispatch'
               WHEN TIMESTAMPDIFF(MINUTE, o.order_time, o.dispatch_time) > 20 THEN 'super_late_dispatch'
               ELSE 'NOT_DELIVERED'
           END AS delivery_status
    FROM Orders o
)
SELECT r.id,
       r.name,
       c.delivery_status,
       COUNT(*) AS no_of_deliveries
FROM restaurants r
JOIN Classified_Orders c ON r.id = c.restaurant_id
GROUP BY r.id, r.name, c.delivery_status;


