USE Exercise_2;

-- 2.1 Select the last name of all employees, without duplicates.
SELECT DISTINCT LastName
FROM employees;

-- 2.2 Select all the data of employees whose last name is "Smith".
SELECT *
FROM Employees
WHERE LastName = 'Smith';

-- 2.3 Select all the data of employees whose last name is "Smith" or "Doe".
SELECT *
FROM Employees
WHERE LastName = 'Smith'
OR LastName = 'Doe';

-- 2.4 Select all the data of employees that work in department 14.
SELECT *
FROM Employees E
WHERE E.department = 14;

-- 2.5 Select all the data of employees whose last name begins with an "S".
SELECT *
FROM Employees E
WHERE E.LastName LIKE 'L%';

-- 2.6 Select the sum of all the departments' budgets.
SELECT D.Name, SUM(Budget)
FROM Departments D 
GROUP BY Name;

-- 2.7 Select the number of employees in each department (you only need to show the department code and the number of employees).
SELECT E.Department, COUNT(E.SSN) FROM Employees E GROUP BY E.Department; 

-- 2.8 Select all the data of employees, including each employee's department's data.
SELECT E.*, D.*
FROM Departments D, Employees E
WHERE E.department = D.code;

-- 2.9 Select the name and last name of each employee, along with the name and budget of the employee's department.
SELECT E.name, E.LastName, D.name AS Department, D.Budget
FROM Departments D, Employees E
WHERE E.department = D.code;

-- 2.10 Select the name and last name of employees working for departments with a budget greater than $60,000.
SELECT E.Name, E.LastName
FROM Employees E 
WHERE E.department IN (SELECT D.code
                       FROM Departments D
                       WHERE D.budget > 600);

-- 2.11 Select the departments with a budget larger than the average budget of all the departments.
SELECT D.*
FROM Departments D
WHERE D.budget > (SELECT AVG(Budget)
                  FROM Departments);

-- 2.12 Select the names of departments with more than two employees.
SELECT D.name AS Department
FROM Departments D
WHERE D.code IN (SELECT E.department
                 FROM Employees E
                 GROUP BY Department
				 HAVING COUNT(*) > 2);

-- 2.13 Very Important - Select the name and last name of employees working for departments with second lowest budget.
SELECT E.Name, E.LastName, D.name AS Department
FROM Employees E, Departments D
WHERE E.department = (SELECT D.code
                      FROM (SELECT * FROM Departments ORDER BY budget LIMIT 2) D
                      ORDER BY budget DESC LIMIT 1)
AND D.code = E.department;

-- 2.14  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
-- And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
INSERT INTO Departments VALUES(11, 'Quality Assurance', 40000);
INSERT INTO Employees VALUES(847219811, 'Mary', 'Moore', 11);

-- 2.15 Reduce the budget of all departments by 10%.
UPDATE Department
SET Budget = Budget * 0.9;

-- 2.16 Reassign all employees from the Research department (code 77) to the IT department (code 14).
UPDATE Employees 
SET Department = 14
WHERE Department = 17;

-- 2.17 Delete from the table all employees in the IT department (code 14).
DELETE FROM Employees 
WHERE Department = 14;

-- 2.18 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
DELETE FROM Employees 
WHERE Department IN (SELECT D.budget
                     FROM Departments D
                     WHERE D.budget >= 60000);

-- 2.19 Delete from the table all employees.
