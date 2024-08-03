-- Drop existing tables if they exist
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS plays;

-- Create users table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    country VARCHAR(100)
);

-- Insert sample data into users table
INSERT INTO users (user_id, user_name, country) VALUES
(1, 'Alice', 'USA'),
(2, 'Bob', 'Canada'),
(3, 'Charlie', 'UK'),
(4, 'David', 'Germany'),
(5, 'Eva', 'France'),
(6, 'Frank', 'Australia'),
(7, 'Grace', 'Italy'),
(8, 'Hannah', 'Japan'),
(9, 'Ian', 'China'),
(10, 'Jack', 'India'),
(11, 'Karen', 'Brazil'),
(12, 'Leo', 'Mexico'),
(13, 'Mia', 'Russia'),
(14, 'Nina', 'South Korea'),
(15, 'Oscar', 'Spain'),
(16, 'Paul', 'Netherlands'),
(17, 'Quinn', 'Sweden'),
(18, 'Rita', 'Norway'),
(19, 'Sam', 'South Africa'),
(20, 'Tina', 'New Zealand');

-- Create plays table
CREATE TABLE plays (
    user_id INT,
    song_id INT,
    genre VARCHAR(100),
    listening_time INT
);

-- Insert extended sample data into plays table
INSERT INTO plays (user_id, song_id, genre, listening_time) VALUES
(1, 101, 'Rock', 120),
(1, 102, 'Pop', 80),
(2, 103, 'Rock', 90),
(2, 104, 'Jazz', 60),
(3, 105, 'Classical', 150),
(3, 106, 'Rock', 110),
(4, 107, 'Pop', 90),
(4, 108, 'Classical', 70),
(5, 109, 'Jazz', 80),
(5, 110, 'Pop', 65),
(1, 111, 'Jazz', 50),
(2, 112, 'Classical', 40),
(3, 113, 'Pop', 100),
(4, 114, 'Rock', 70),
(5, 115, 'Classical', 60),
(6, 116, 'Rock', 130),
(6, 117, 'Pop', 120),
(7, 118, 'Jazz', 75),
(7, 119, 'Classical', 50),
(7, 120, 'Rock', 65),
(8, 201, 'Rock', 140),
(8, 202, 'Pop', 100),
(9, 203, 'Jazz', 90),
(9, 204, 'Classical', 60),
(10, 205, 'Rock', 100),
(10, 206, 'Pop', 130),
(11, 207, 'Jazz', 85),
(11, 208, 'Classical', 95),
(12, 209, 'Rock', 120),
(12, 210, 'Pop', 75),
(13, 211, 'Jazz', 55),
(13, 212, 'Classical', 80),
(14, 213, 'Rock', 110),
(14, 214, 'Pop', 105),
(15, 215, 'Jazz', 45),
(15, 216, 'Classical', 65),
(16, 217, 'Rock', 125),
(16, 218, 'Pop', 95),
(17, 219, 'Jazz', 70),
(17, 220, 'Classical', 85),
(18, 221, 'Rock', 135),
(18, 222, 'Pop', 100),
(19, 223, 'Jazz', 60),
(19, 224, 'Classical', 110),
(20, 225, 'Rock', 80),
(20, 226, 'Pop', 115),
(1, 227, 'Jazz', 75),
(2, 228, 'Classical', 90),
(3, 229, 'Rock', 150),
(4, 230, 'Pop', 85),
(5, 231, 'Jazz', 95),
(6, 232, 'Classical', 70),
(7, 233, 'Rock', 125),
(8, 234, 'Pop', 140),
(9, 235, 'Jazz', 55),
(10, 236, 'Classical', 60),
(11, 237, 'Rock', 100),
(12, 238, 'Pop', 115),
(13, 239, 'Jazz', 85),
(14, 240, 'Classical', 75),
(15, 241, 'Rock', 135),
(16, 242, 'Pop', 95),
(17, 243, 'Jazz', 65),
(18, 244, 'Classical', 90),
(19, 245, 'Rock', 110),
(20, 246, 'Pop', 130),
(1, 247, 'Jazz', 50),
(2, 248, 'Classical', 105),
(3, 249, 'Rock', 125),
(4, 250, 'Pop', 75),
(5, 251, 'Jazz', 95),
(6, 252, 'Classical', 80),
(7, 253, 'Rock', 150),
(8, 254, 'Pop', 85),
(9, 255, 'Jazz', 60),
(10, 256, 'Classical', 110),
(11, 257, 'Rock', 130),
(12, 258, 'Pop', 140),
(13, 259, 'Jazz', 55),
(14, 260, 'Classical', 100),
(15, 261, 'Rock', 90),
(16, 262, 'Pop', 75),
(17, 263, 'Jazz', 95),
(18, 264, 'Classical', 85),
(19, 265, 'Rock', 110),
(20, 266, 'Pop', 105),
(1, 267, 'Jazz', 65),
(2, 268, 'Classical', 120),
(3, 269, 'Rock', 145),
(4, 270, 'Pop', 80),
(5, 271, 'Jazz', 90),
(6, 272, 'Classical', 70),
(7, 273, 'Rock', 100),
(8, 274, 'Pop', 115),
(9, 275, 'Jazz', 55),
(10, 276, 'Classical', 95),
(11, 277, 'Rock', 125),
(12, 278, 'Pop', 140),
(13, 279, 'Jazz', 60),
(14, 280, 'Classical', 110),
(15, 281, 'Rock', 130),
(16, 282, 'Pop', 140),
(17, 283, 'Jazz', 55),
(18, 284, 'Classical', 100),
(19, 285, 'Rock', 90),
(20, 286, 'Pop', 75),
(1, 287, 'Jazz', 95),
(2, 288, 'Classical', 85),
(3, 289, 'Rock', 110),
(4, 290, 'Pop', 105),
(5, 291, 'Jazz', 45),
(6, 292, 'Classical', 65),
(7, 293, 'Rock', 125),
(8, 294, 'Pop', 95),
(9, 295, 'Jazz', 70),
(10, 296, 'Classical', 85),
(11, 297, 'Rock', 135),
(12, 298, 'Pop', 100),
(13, 299, 'Jazz', 60),
(14, 300, 'Classical', 110);


/*
Question:
Analyze Spotify's user listening data to find out 
which genre of music has the highest average listening time per user.
*/

-- METHOD-1: USING CTEs

WITH avg_listen_time_genre AS(
SELECT u.user_id,
	   u.user_name,
       p.genre,
       ROUND(AVG(listening_time),2) as avg_time
FROM users u
LEFT JOIN plays p
ON u.user_id=p.user_id
GROUP BY u.user_id,
	     u.user_name,
         p.genre
),
RANKED_GENRES AS(
SELECT ag.user_id,
       ag.user_name,
	   ag.genre,
       ag.avg_time,
	   DENSE_RANK() OVER(PARTITION BY ag.user_id ORDER BY ag.avg_time DESC) as genre_ranking
FROM avg_listen_time_genre ag
)
SELECT user_id,
	   user_name,
       genre,
       avg_time
FROM RANKED_GENRES
WHERE genre_ranking=1;


-- METHOD-2: USING SUBQUERY

SELECT 
    user_id,
    user_name,
    avg_listening_time,
    genre
FROM (
    SELECT 
        user_id,
        user_name,
        genre,
        avg_listening_time,
        DENSE_RANK() OVER (PARTITION BY user_id ORDER BY avg_listening_time DESC) AS ranking
    FROM (
        SELECT 
            u.user_id,
            u.user_name,
            p.genre,
            ROUND(AVG(p.listening_time), 2) AS avg_listening_time
        FROM users u
        LEFT JOIN plays p ON u.user_id = p.user_id
        GROUP BY u.user_id, u.user_name, p.genre
    ) sub_query
) ranked_genre
WHERE ranking = 1;



