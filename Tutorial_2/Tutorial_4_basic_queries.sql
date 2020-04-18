USE Tutorial_4_Basic_Query;

-- 1. Names of the employees and names of the respective departments where they work.
SELECT E.name, D.name
FROM employee E, department D
WHERE E.department = D.code;

-- 2. Names of employees (pair) who work at the same department
SELECT E1.number ,E1.name, E1.department, E2.number, E2.name, E2.department
FROM employee E1, employee E2
WHERE E1.department = E2.department
AND E1.number > E2.number;
-- 3. Calculate income increasement (+50) for employees who have started working before 1/1/2012. Do not list repetitive records.
SELECT DISTINCT E.name, E.position, H.start_date, P.income + 50 AS new_income
FROM history H, employee E, position P
WHERE P.code = E.position AND H.position = E.position
AND H.start_date < '2012-01-01';

-- 4. Name and position of employee who have double or higher income than other.
SELECT E1.name, P1.title, P1.income, E2.name, P2.title, P2.income 
FROM employee E1, employee E2, position P1, position P2
WHERE P1.income >= 2 * P2.income
AND P1.code = E1.position 
AND P2.code = E2.position 
AND E1.number < E2.number;

-- 5. Number, name and income of employees whose names start with L and has at least 3 characters
SELECT E.number, E.name, P.income 
FROM employee E, position P
WHERE E.name LIKE 'L__%'
AND P.code = E.position;

-- 6. Union employees from DP1 and DP2 department, listing number, name and position
SELECT E.number, E.name, E.position, E.department
FROM employee E
WHERE E.department = 'DP1'
UNION
SELECT E.number, E.name, E.position, E.department
FROM employee E
WHERE E.department = 'DP2';

-- 7. Names of the departments and names of the respective employees who are supervisors and directors of the department.
SELECT E2.name, D.name
FROM employee E1, department D, employee E2
WHERE E1.supervisor = E2.number
AND E2.number = D.director;

-- 8. Code of the positions and names of the departments where these positions exist.
SELECT P.code, D.name
FROM position P, employee E, department D
WHERE E.position = P.code
AND E.department = D.code;
