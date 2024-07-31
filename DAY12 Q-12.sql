-- Dropping existing tables if they exist
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS transactions;

-- Creating the users table
CREATE TABLE users (
    user_id INT,
    user_name VARCHAR(20),
    credit_limit INT
);

-- Creating the transactions table
CREATE TABLE transactions (
    trans_id INT,
    paid_by INT,
    paid_to INT,
    amount INT,
    trans_date DATE
);

-- Inserting records into the users table
INSERT INTO users(user_id, user_name, credit_limit) VALUES
(1, 'Peter', 100),
(2, 'Roger', 200),
(3, 'Jack', 10000),
(4, 'John', 800),
(5, 'Alice', 1500),
(6, 'Bob', 1200),
(7, 'Charlie', 3000),
(8, 'Diana', 5000),
(9, 'Eve', 2500),
(10, 'Frank', 3500);

-- Inserting records into the transactions table
INSERT INTO transactions(trans_id, paid_by, paid_to, amount, trans_date) VALUES
(1, 1, 3, 400, '2024-01-01'),
(2, 3, 2, 500, '2024-01-02'),
(3, 2, 1, 200, '2024-01-02'),
(4, 1, 4, 300, '2024-01-03'),
(5, 4, 2, 150, '2024-01-04'),
(6, 2, 3, 250, '2024-01-05'),
(7, 3, 4, 700, '2024-01-06'),
(8, 4, 1, 600, '2024-01-07'),
(9, 1, 2, 100, '2024-01-08'),
(10, 2, 4, 400, '2024-01-09'),
(11, 3, 1, 800, '2024-01-10'),
(12, 4, 3, 900, '2024-01-11'),
(13, 5, 6, 450, '2024-01-12'),
(14, 6, 7, 320, '2024-01-13'),
(15, 7, 8, 600, '2024-01-14'),
(16, 8, 9, 700, '2024-01-15'),
(17, 9, 10, 800, '2024-01-16'),
(18, 10, 5, 900, '2024-01-17'),
(19, 5, 1, 100, '2024-01-18'),
(20, 6, 2, 200, '2024-01-19'),
(21, 7, 3, 300, '2024-01-20'),
(22, 8, 4, 400, '2024-01-21'),
(23, 9, 5, 500, '2024-01-22'),
(24, 10, 6, 600, '2024-01-23');


-- Write query to find users whose transactions had reached their credit limit 

SELECT * FROM users;
SELECT * FROM transactions;

-- METHOD-1 USING CTEs & JOINS

WITH total_transactions as (
SELECT u.user_id,u.user_name,SUM(t.amount) as total_amount,u.credit_limit
FROM users u
LEFT JOIN transactions t
ON u.user_id=t.paid_by
group by u.user_id,u.user_name,t.paid_by,u.credit_limit) 
SELECT user_id,user_name
FROM total_transactions 
WHERE total_amount>=credit_limit;

-- METHOD-2 USING JOINS & AGG FUNCTIONS

SELECT u.user_id,u.user_name,SUM(t.amount) as total_amount,u.credit_limit
FROM users u
LEFT JOIN transactions t
ON u.user_id=t.paid_by
group by u.user_id,u.user_name,t.paid_by,u.credit_limit
HAVING SUM(t.amount) >= u.credit_limit;


-- METHOD-3 WITHOUT JOINS

SELECT user_id,user_name
FROM users
WHERE user_id IN (
SELECT paid_by
FROM transactions
GROUP BY paid_by
HAVING SUM(amount)>=(SELECT credit_limit FROM users WHERE user_id=paid_by))
