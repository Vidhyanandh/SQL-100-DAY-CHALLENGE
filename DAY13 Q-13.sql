CREATE TABLE user_activities (
    user_id INT,
    activity VARCHAR(10), 
    activity_time TIMESTAMP
);


INSERT INTO user_activities (user_id, activity, activity_time) VALUES
(1, 'Login', '2024-01-02 08:00:00'),
(1, 'Logout', '2024-01-02 12:30:00'),
(1, 'Login', '2024-01-02 13:30:00'),
(1, 'Logout', '2024-01-02 17:15:00'),
(2, 'Login', '2024-01-02 09:00:00'),
(2, 'Logout', '2024-01-02 11:30:00'),
(2, 'Login', '2024-01-02 12:00:00'),
(2, 'Logout', '2024-01-02 15:00:00'),
(2, 'Login', '2024-01-02 16:00:00'),
(2, 'Logout', '2024-01-02 18:30:00'),
(3, 'Login', '2024-01-02 08:30:00'),
(3, 'Logout', '2024-01-02 12:00:00'),
(3, 'Login', '2024-01-02 13:00:00'),
(3, 'Logout', '2024-01-02 15:30:00'),
(4, 'Login', '2024-01-02 10:00:00'),
(4, 'Logout', '2024-01-02 14:00:00'),
(4, 'Login', '2024-01-02 15:00:00'),
(4, 'Logout', '2024-01-02 17:45:00'),
(5, 'Login', '2024-01-01 08:45:00'),
(5, 'Logout', '2024-01-01 11:45:00'),
(5, 'Login', '2024-01-01 13:30:00'),
(5, 'Logout', '2024-01-01 16:30:00');


-- write sql query to get each employees total productivity hour 
-- productivity hour = logintime-logouttime
-- METHOD-1 

SELECT user_id, 
       SUM(productivity_time) AS productivity_hour
FROM (
    SELECT a.user_id, 
           TIMESTAMPDIFF(HOUR, a.activity_time, b.activity_time) AS productivity_time
    FROM user_activities a
    JOIN user_activities b 
    ON a.user_id = b.user_id
    WHERE a.activity = 'Login' 
      AND b.activity = 'Logout'
      AND b.activity_time > a.activity_time
) AS sub_query
GROUP BY user_id;

-- METHOD-2

WITH Productivity AS (
    SELECT a.user_id, 
           TIMESTAMPDIFF(HOUR, a.activity_time, b.activity_time) AS product_time
    FROM user_activities a
    JOIN user_activities b 
    ON a.user_id = b.user_id
    WHERE a.activity = 'Login' 
      AND b.activity = 'Logout'
      AND b.activity_time > a.activity_time
)
SELECT user_id, 
       SUM(product_time) AS productivity_hour
FROM Productivity
GROUP BY user_id;



