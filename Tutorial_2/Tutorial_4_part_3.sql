USE Tutorial_4_Basic_Query;

-- 1. Names of all employees whose salary is between 200 and 600
SELECT E.name, P.income
FROM employee E, position P
WHERE E.position = P.code
AND P.income BETWEEN 200 AND 600;

-- 2. Names of the departments and (total) number of employees who work there.
SELECT D.name, COUNT(*)
FROM Employee E, Department D
WHERE E.department = D.code
GROUP BY D.code;

-- 3. Names of the supervisors and the number of employees who they supervise
SELECT E1.number, E1.name, E2.number, E2.name
FROM Employee E1, Employee E2
WHERE E1.supervisor = E2.number;

-- 4. Names of the supervisors and the number of employees who they supervise and these employees must not work in Hanoi.
SELECT E1.number, E1.name, E2.number, E2.name
FROM Employee E1, Employee E2, Department D1, Department D2
WHERE E1.supervisor = E2.number
AND D1.code = E1.department
AND D2.code = E2.department
AND D2.location <> 'Hanoi';

-- 5. Codes of the positions, names of the departments and the number of employees who are holding those positions in the respective department.
SELECT D.name, D.location, COUNT(*)
FROM Department D, Employee E
WHERE D.code = E.department
GROUP BY D.code;

-- 6. Codes of the position, income for the position and the number of employees in each position and the employees must not work in Hanoi.
SELECT P.code, P.income, COUNT(*)
FROM Position P, Employee E, Department D
WHERE E.position = P.code
AND D.location <> 'Hanoi'
GROUP BY E.position;


-- 7. Names of the employees, and respective annual income, whose incomes are around the company’s average monthly income with a maximum deviation of 100 dollars.
SELECT E.name, P.income * 12 AS Annual_income
FROM Employee E, Position P
WHERE P.code = E.position 
AND ABS(P.income - (SELECT AVG(P2.income)
                    FROM Employee E2, Position P2
                    WHERE P2.code = E2.position
				   )
       ) <= 100;

-- 8. Names, income of ALL employees who work in Hanoi with highest salary
SELECT E1.name, P1.income
FROM Employee E1, Position P1, Department D
WHERE E1.department = D.code
AND P1.code = E1.position
AND D.location = 'Hanoi'
AND P1.income = ALL ( SELECT MAX(P2.income)
					  FROM Employee E2, Position P2
					  WHERE P2.code = E2.position
                       );

-- 9. Names and number of supervisors who supervise the greatest number of employees together with the number of employees they supervise.
SELECT E2.number, E2.name, COUNT(*)
FROM Employee E1, Employee E2
WHERE E1.supervisor = E2.number
GROUP BY E2.number
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
                        FROM Employee E3, Employee E4
                        WHERE E3.supervisor = E4.number
                        GROUP BY E4.number
                       );
-- 10. Names of director, the department they manage and the total number of employees in that department
SELECT E1.Name, D.name AS Department, COUNT(*) AS Number_of_employee
FROM Employee E1, Department D, Employee E2
WHERE E1.number = D.director
AND E1.department = D.code
AND D.code = E2.department
GROUP BY E1.department;

-- 11. Names of director whose department has the most number of employees together with the department name and the number of employees.
SELECT E1.name, D1.name AS Department, COUNT(*) AS Number_of_employee
FROM Employee E1, Department D1, Employee E2
WHERE E1.number = D1.director
AND E1.department = D1.code
AND D1.code = E2.department
GROUP BY E1.department
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
                        FROM Employee E3, Department D2
                        WHERE E3.department = D2.code
                        GROUP BY E3.department
                       );

-- 12. For each department with more than 2 employees, 
-- select name, number of the director and the number of employees in the department whose income is greater than 300.
SELECT E1.number, E1.name, D.name AS Department, P.income, COUNT(*) AS Number_of_employee
FROM Employee E1, Department D, Employee E2, Position P
WHERE E1.number = D.director
AND E1.department = D.code
AND D.code = E2.department
AND E1.position = P.code
AND P.income > 300
GROUP BY E1.department
HAVING COUNT(*) > 2;

-- 13. For each department where the department average income is greater than the company’s average income, 
-- select the employee with the lowest income in that department.
SELECT E.name, D.code, D.name AS Department, P.income
FROM Employee E, Position P, Department D
WHERE E.position = P.code
AND D.code = E.department
AND D.code IN( SELECT E1.department
			   FROM Position P1, Employee E1
			   WHERE E1.position = P1.code
			   GROUP BY E1.department
			   HAVING AVG(P1.income) > (SELECT AVG(P2.income)
										FROM Position P2, Employee E2
										WHERE E2.position = P2.code
									  )
			 )
ORDER BY P.income ASC, D.name ASC
LIMIT 2;

set global sql_mode='';


/* Other solution */
SELECT E.number, E.name, D.name AS Department, P.income
FROM Employee E, Position P, Department D
WHERE E.position = P.code
AND D.code = E.department
AND D.code IN( SELECT E1.department
			   FROM Position P1, employee E1
			   WHERE E1.position = P1.code
			   GROUP BY E1.department
			   HAVING AVG(P1.income) > (SELECT AVG(P2.income)
										FROM position P2, employee E2
										WHERE E2.position = P2.code
									  )
			 )
GROUP BY E.department
HAVING P.income = MIN(P.income);

set global sql_mode='';
set global sql_mode='STRICT_TRANS_TABLES';

-- 14.For each position whose income is smaller than the company’s average income,
-- select the average income of the supervisors who supervise employees in those position.

SELECT AVG(P.income)
FROM employee E, position P
WHERE E.number IN (SELECT E1.supervisor
                    FROM employee E1
                    WHERE E1.position IN (SELECT P2.code
                                        FROM position P2, employee E2
                                        WHERE E2.position = P2.code
                                        GROUP BY P2.code
                                        HAVING AVG(P2.income) < (SELECT AVG(P3.income) AS "company’s average income"
                                                                FROM position P3, employee E3
                                                                WHERE E3.position = P3.code)))
AND E.position = P.code;
