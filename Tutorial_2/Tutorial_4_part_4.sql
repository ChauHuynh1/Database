USE Tutorial_4_Basic_Query;

-- 1. Codes of the positions and total number of employees of each position who has a higher income than the company’s average income. 
-- Assume that a given position may NOT have any employee. (Note: use the function IFNULL (MySQL) or NVL (Oracle)).
SELECT P.code, P.title, COUNT(E.number)
FROM Position P
LEFT JOIN Employee E
ON E.position = P.code
WHERE P.income > (SELECT AVG(P1.income) 
                  FROM Position P1
                 )
GROUP BY P.code;

-- 2. Names of the departments, positions’ titles, starting dates and names of the employees who were the first employees with these positions. 
-- Assume that an employee cannot move to a different department.
SELECT P.code, D.name, P.title, H.start_date, E.name
FROM employee E, department D, position P, history H
WHERE H.position = P.code
AND E.department = D.code
AND H.employee = E.number
AND (P.code, H.start_date) IN (SELECT H1.position, MIN(H1.start_date)
                               FROM history H1, employee E1
                               WHERE H1.employee = E1.number
                               GROUP BY H1.position
                               );
                               
-- Another solution from different interpretation of the question: group by both department and position

SELECT D.name Dept, P.title, H.start_date, E.name
FROM employee E, history H, position P, department D
WHERE H.employee = E.number
AND H.position = P.code
AND E.department = D.code
AND (E.department, H.position, H.start_date) IN (SELECT E1.department, H1.position, MIN(H1.start_date)
                                                 FROM employee E1, history H1
                                                 WHERE H1.employee = E1.number
                                                 GROUP BY E1.department, H1.position
                                                 );
                    
-- 3. Names of the departments and names of the respective employees who have the highest incomes of the department.
SELECT D.name, E.name
FROM department D, employee E, position P
WHERE E.department = D.code
AND E.position = P.code
AND (E.department, P.income) IN (SELECT E1.department, MAX(P1.income)
                                 FROM employee E1, position P1
                                 WHERE E1.position = P1.code
                                 GROUP BY E1.department
                                 );

-- 4. Names of the departments and codes of the positions which two or more employees belong to.
SELECT D.name, E.position, COUNT(*)
FROM employee E, department D
WHERE E.department = D.code
GROUP BY D.name, E.position
HAVING COUNT(*)>=2;

-- 5. Create a view, named employees_most_positions_department, which has two columns: names of the
-- departments and names of the respective employees who already had more than 3 different
-- positions. Assume that an employee cannot move to a different department.
CREATE OR REPLACE VIEW employees_most_positions_department AS
    SELECT D.name AS Dept_Name, E.name AS Emp_Name, COUNT(*)
    FROM employee E, department D, history H
    WHERE E.department = D.code
    AND E.number = H.employee
    GROUP BY D.code, H.employee
    HAVING Count(*) > 3;

-- 6. Names of the departments where the average income of the respective employees is lower than all
-- the average incomes of the departments which their directors’ names start with the letter P.
SELECT D.name, AVG(P.income)
FROM employee E, position P, department D
WHERE E.position = P.code
AND E.department = D.code
GROUP BY E.department
HAVING AVG(P.income) < (SELECT AVG(P1.income)
                        FROM employee E1, position P1, department D1, employee Dir
                        WHERE E1.position = P1.code
                        AND E1.department = D1.code
                        AND D1.director = Dir.number
                        AND Dir.name LIKE 'P%'
                       );

-- 7. Names of the departments which have employees from all positions. That is, names of the
-- departments which there is no position for which there are no employees who have that position.

-- Solution 1
SELECT D.name
FROM employee E, department D
WHERE E.department = D.code
GROUP BY E.department
HAVING COUNT(DISTINCT E.position) = (SELECT COUNT(*) FROM position);

-- Solution 2
SELECT D.name
FROM department D
WHERE NOT EXISTS (SELECT *
                  FROM position P
                  WHERE NOT EXISTS (SELECT *
                                    FROM employee E
                                    WHERE E.position = P.code
                                    AND E.department = D.code
                                   )
                  );