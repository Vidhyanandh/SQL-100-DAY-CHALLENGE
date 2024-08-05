CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    department VARCHAR(50)
);

-- Insert records into the employees table
INSERT INTO employees (emp_id, emp_name, salary, department) VALUES
(1, 'Alice', 50000, 'HR'),
(2, 'Bob', 60000, 'Engineering'),
(3, 'Charlie', 60000, 'Engineering'),
(4, 'David', 45000, 'Sales'),
(5, 'Eve', 70000, 'Engineering'),
(6, 'Frank', 50000, 'HR'),
(7, 'Grace', 55000, 'Sales'),
(8, 'Heidi', 65000, 'Engineering'),
(9, 'Ivan', 60000, 'Marketing'),
(10, 'Judy', 75000, 'Sales'),
(11, 'Mallory', 60000, 'Marketing'),
(12, 'Oscar', 72000, 'HR'),
(13, 'Peggy', 52000, 'Marketing'),
(14, 'Sybil', 50000, 'Engineering'),
(15, 'Trent', 45000, 'Sales'),
(16, 'Victor', 50000, 'HR'),
(17, 'Walter', 55000, 'Engineering'),
(18, 'Xavier', 70000, 'Engineering'),
(19, 'Yvonne', 62000, 'Marketing'),
(20, 'Zach', 64000, 'HR'),
(21, 'Alice', 50000, 'HR'),
(22, 'Bob', 60000, 'Engineering'),
(23, 'Charlie', 60000, 'Engineering'),
(24, 'David', 45000, 'Sales'),
(25, 'Eve', 70000, 'Engineering'),
(26, 'Frank', 50000, 'HR'),
(27, 'Grace', 55000, 'Sales'),
(28, 'Heidi', 65000, 'Engineering'),
(29, 'Ivan', 60000, 'Marketing'),
(30, 'Judy', 75000, 'Sales'),
(31, 'Mallory', 60000, 'Marketing'),
(32, 'Oscar', 72000, 'HR'),
(33, 'Peggy', 52000, 'Marketing'),
(34, 'Sybil', 50000, 'Engineering'),
(35, 'Trent', 45000, 'Sales'),
(36, 'Victor', 50000, 'HR'),
(37, 'Walter', 55000, 'Engineering'),
(38, 'Xavier', 70000, 'Engineering'),
(39, 'Yvonne', 62000, 'Marketing'),
(40, 'Zach', 64000, 'HR'),
(41, 'Alice', 51000, 'HR'),
(42, 'Bob', 60000, 'Engineering'),
(43, 'Charlie', 60000, 'Engineering'),
(44, 'David', 46000, 'Sales'),
(45, 'Eve', 70000, 'Engineering'),
(46, 'Frank', 51000, 'HR'),
(47, 'Grace', 56000, 'Sales'),
(48, 'Heidi', 66000, 'Engineering'),
(49, 'Ivan', 61000, 'Marketing'),
(50, 'Judy', 76000, 'Sales'),
(51, 'Mallory', 61000, 'Marketing'),
(52, 'Oscar', 73000, 'HR'),
(53, 'Peggy', 53000, 'Marketing'),
(54, 'Sybil', 51000, 'Engineering'),
(55, 'Trent', 46000, 'Sales'),
(56, 'Victor', 51000, 'HR'),
(57, 'Walter', 56000, 'Engineering'),
(58, 'Xavier', 71000, 'Engineering'),
(59, 'Yvonne', 63000, 'Marketing'),
(60, 'Zach', 65000, 'HR');



-- DELETING DUPLICATES

-- METHOD-1: USING JOINS

DELETE e1
FROM employees e1
JOIN employees e2
ON e1.emp_name=e2.emp_name
AND e1.salary=e2.salary 
AND e1.department=e2.department
AND e1.emp_id<e2.emp_id;

-- METHOD 2: USING WINDOW FUNCTIONS

DELETE 
FROM employees
WHERE emp_id IN(
	SELECT emp_id
		FROM(
			SELECT emp_id,DENSE_RANK() OVER(partition by emp_name,salary ) ranking
					FROM employees) ranked_salaries
	WHERE ranking>1
);
    
    
-- METHOD-3: USING TEMPORARY TABLES

CREATE temporary table unique_records AS(
SELECT MIN(emp_id) as emp_id,emp_name,salary,department
FROM employees
GROUP BY emp_name,salary
);

DELETE FROM employees
WHERE emp_id NOT IN(
SELECT emp_id
FROM employees);

DROP TEMPORARY TABLE unique_records;


