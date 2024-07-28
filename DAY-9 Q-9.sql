
-- Create the table with employee name
CREATE TABLE salary_table (
    employee_id INTEGER,
    name VARCHAR(255),
    year INTEGER,
    salary INTEGER,
    department VARCHAR(255)
);

-- Insert sample data into the new table
INSERT INTO salary_table (employee_id, name, year, salary, department) VALUES
(125, 'John Doe', 2021, 50000, 'Sales'),
(125, 'John Doe', 2022, 52000, 'Sales'),
(125, 'John Doe', 2023, 54000, 'Sales'),
(125, 'John Doe', 2024, 56000, 'Sales'),
(125, 'John Doe', 2025, 58000, 'Sales'),
(125, 'John Doe', 2026, 58000, 'Sales'),
(102, 'Jane Smith', 2020, 45000, 'Marketing'),
(102, 'Jane Smith', 2021, 47000, 'Marketing'),
(102, 'Jane Smith', 2022, 49000, 'Marketing'),
(102, 'Jane Smith', 2023, 51000, 'Marketing'),
(165, 'Alice Johnson', 2021, 60000, 'Engineering'),
(165, 'Alice Johnson', 2022, 62000, 'Engineering'),
(165, 'Alice Johnson', 2023, 64000, 'Engineering'),
(165, 'Alice Johnson', 2024, 68000, 'Engineering'),
(200, 'Bob Brown', 2021, 55000, 'HR'),
(200, 'Bob Brown', 2022, 57000, 'HR'),
(200, 'Bob Brown', 2023, 58000, 'HR'),
(200, 'Bob Brown', 2024, 58000, 'HR'),
(999, 'Kishore', 2020, 36000, 'BA'),
(999, 'Kishore', 2021, 38000, 'BA'),
(999, 'Kishore', 2022, 38000, 'BA'),
(999, 'Kishore', 2023, 38000, 'BA'),
(888, 'Sai', 2020, 30000, 'DA'),
(888, 'Sai', 2021, 32000, 'DA'),
(888, 'Sai', 2024, 34000, 'DA'),
(888, 'Sai', 2026, 35000, 'DA');



select * from salary_table;

-- Identify the employee who received at least 3 year over year increase in salaries!

-- METHOD-1 SUB QUERY

WITH LAST_YEAR_SALARY AS (
SELECT employee_id,
	   name,
       year,
       salary,
       LAG(salary) OVER(partition by employee_id ORDER BY year) as prev_year_salary
FROM salary_table )
SELECT employee_id,
	   name
FROM LAST_YEAR_SALARY
WHERE salary>prev_year_salary
GROUP BY employee_id,
		 name
HAVING COUNT(*)>=3;

-- METHOD-2 SUB QUERY

SELECT employee_id,
	   name
	FROM(
SELECT employee_id,
	   name,
       year,
       salary,
       LAG(salary) OVER(PARTITION BY employee_id ORDER BY year) as prev_year_salary
FROM salary_table) as last_year_salary
WHERE salary>prev_year_salary
GROUP BY employee_id,
		 name
HAVING COUNT(*)>=3;







