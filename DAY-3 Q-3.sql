CREATE TABLE students (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Gender CHAR(1)
);


INSERT INTO students (ID, Name, Gender) VALUES
(1, 'Gopal', 'M'),
(2, 'Rohit', 'M'),
(3, 'Amit', 'M'),
(4, 'Suraj', 'M'),
(5, 'Ganesh', 'M'),
(6, 'Neha', 'F'),
(7, 'Isha', 'F'),
(8, 'Geeta', 'F');


SELECT *,ROW_NUMBER() OVER(PARTITION BY GENDER ORDER BY ID) as seq_no
FROM students
ORDER BY seq_no,ID;

