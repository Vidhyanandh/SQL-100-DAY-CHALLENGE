DROP TABLE IF EXISTS department;
CREATE TABLE department (
    Department_ID INT PRIMARY KEY,
    Department VARCHAR(50),
    Location_ID INT
);

-- Insert data into department table
INSERT INTO department (Department_ID, Department, Location_ID)
VALUES 
    (10, 'Accounting', 122),
    (20, 'Research', 124),
    (30, 'Sales', 123),
    (40, 'Operations', 167);


-- Create emp_fact table
DROP TABLE IF EXISTS emp_fact;
CREATE TABLE emp_fact (
    Employee_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Job_ID INT,
    Manager_ID INT,
    Hired_Date DATE,
    Salary DECIMAL(10, 2),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES department(Department_ID)
);

-- Insert data into emp_fact table
INSERT INTO emp_fact (Employee_ID, Emp_Name, Job_ID, Manager_ID, Hired_Date, Salary, Department_ID)
VALUES 
    (7369, 'John', 667, 7902, '2006-02-20', 800.00, 10),
    (7499, 'Kevin', 670, 7698, '2008-11-24', 1550.00, 20),
    (7505, 'Jean', 671, 7839, '2009-05-27', 2750.00, 30),
    (7506, 'Lynn', 671, 7839, '2007-09-27', 1550.00, 30),
    (7507, 'Chelsea', 670, 7110, '2014-09-14', 2200.00, 30),
    (7521, 'Leslie', 672, 7698, '2012-02-06', 1250.00, 30);

-- Create jobs table

DROP TABLE IF EXISTS jobs;
CREATE TABLE jobs (
    Job_ID INT PRIMARY KEY,
    Job_Role VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Insert data into jobs table
INSERT INTO jobs (Job_ID, Job_Role, Salary)
VALUES 
    (667, 'Clerk', 800.00),
    (668, 'Staff', 1600.00),
    (669, 'Analyst', 2850.00),
    (670, 'Salesperson', 2200.00),
    (671, 'Manager', 3050.00),
    (672, 'President', 1250.00);
    
    
    
    SELECT * FROM department;
    SELECT * FROM jobs;
    SELECT * FROM emp_fact;
    
   
    -- Q1: LIST OUT THE DEPARTMENT WISE MINIMUM SALARY, MAXIMUM SALARY, AVERAGE SALARY OF THE EMPLOYEES.
    
    SELECT d.department AS department, MAX(ef.salary) AS max_salary, MIN(ef.salary) AS min_salary, AVG(ef.salary) as avg_salary
    FROM department d 
    LEFT JOIN emp_fact ef ON d.Department_ID = ef.Department_ID
    GROUP BY d.Department;
    
    -- Q2: LIST OUT THE EMPLOYEE HAVING THIRD HIGHEST SALARY 
    
    
   -- METHOD-1:
   
SELECT ef.Employee_ID AS emp_id, ef.Emp_Name AS emp_name, ef.Salary AS salary
FROM emp_fact ef
WHERE ef.Salary = (
    SELECT DISTINCT Salary
    FROM emp_fact
    ORDER BY Salary DESC
    LIMIT 1 OFFSET 2
);

-- METHOD-2:

WITH emp_rank AS(
SELECT *, dense_rank() OVER(ORDER BY salary DESC) AS salary_rank
FROM emp_fact)
SELECT * FROM emp_rank
WHERE salary_rank=3;


-- METHOD-3:

SELECT *
FROM emp_fact
WHERE salary = (
    SELECT DISTINCT salary
    FROM emp_fact
    ORDER BY salary DESC
    LIMIT 1 OFFSET 2
);

-- METHOD-4:
SELECT *
FROM(
SELECT *,dense_rank() OVER(ORDER BY salary) as salary_rank
FROM emp_fact) as emp_rank
WHERE salary_rank=3;

-- Q3: LIST OUT THE DEPARTEMENT HAVING ATLEAST FOUR EMPLOYEES

SELECT d.Department_ID AS department_id ,d.Department, COUNT(e.Employee_ID) as no_of_employees
FROM department d
LEFT JOIN emp_fact e
ON d.Department_ID=e.Department_ID
GROUP BY d.Department_ID
HAVING COUNT(e.Employee_ID) >=4;

-- Q4: FIND OUT THE EMPLOYEES WHO EARN GREATER THAN THE AVERAGE SALARY FOR THEIR DEPARTMENT 

-- METHOD-1:

SELECT e1.Employee_ID as emp_id, e1.Department_ID as dept_id,e1.salary as emp_salary,e1.Emp_name as emp_Name
FROM emp_fact e1
WHERE e1.salary > (
SELECT AVG(e2.salary) as avg_salary 
FROM emp_fact e2
WHERE e2.Department_ID=e1.Department_ID
GROUP BY e1.Department_ID);


-- METHOD-2:

SELECT Employee_ID, Department_ID, Emp_name,salary
FROM
(SELECT *, AVG(salary) OVER(PARTITION BY Department_id) as avg_salary
FROM emp_fact) avg_salaries
where salary >avg_salary;

-- METHOD-3:

WITH avg_salaries AS(
SELECT Department_ID,AVG(salary) as avg_salary
FROM emp_fact
GROUP BY Department_ID) 
SELECT e.Employee_ID, e.Department_ID, e.Emp_name,e.salary
FROM emp_fact e
JOIN avg_salaries a
ON e.Department_ID = a.Department_ID
WHERE e.salary>a.avg_salary;

-- METHOD-4:

SELECT e1.Employee_ID, e1.Department_ID, e1.Emp_Name, e1.Salary, avg_salaries.avg_salary
FROM emp_fact e1
JOIN (
    SELECT Department_ID, AVG(Salary) AS avg_salary
    FROM emp_fact
    GROUP BY Department_ID
) avg_salaries
ON e1.Department_ID = avg_salaries.Department_ID
WHERE e1.Salary > avg_salaries.avg_salary;


    
    