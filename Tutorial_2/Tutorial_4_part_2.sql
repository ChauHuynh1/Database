USE Tutorial_4_Basic_Query;

-- 10. Using EXIST, write this query: Names of the departments and names of the respective employees who are supervisors and directors of the department.
SELECT E1.name, D.name
FROM employee E1, department D, employee E2
WHERE EXISTS (SELECT D.name
              FROM department D
			  WHERE E1.number = D.director)
AND E1.number = E2.supervisor
AND E1.number = D.director;

SELECT DISTINCT E1.name, D.name
FROM department D, employee E1
WHERE EXISTS (SELECT *
              FROM employee E2
              WHERE E1.number = D.director
              AND E1.number = E2.supervisor);

-- 11. Numbers of the employees who are directors or supervisors (use Set Operators).
SELECT E1.number, E1.name
FROM employee E1
WHERE EXISTS (SELECT *
              FROM employee E2, department D
              WHERE E1.number = D.director
              OR E1.number = E2.supervisor);

SELECT E1.number, E1.name
FROM employee E1, department D
WHERE E1.number = D.director
UNION
SELECT E2.number, E2.name
FROM employee E2, employee E1
WHERE E2.number = E1.supervisor;

-- 12. Codes of the positions which belonged to employees of departments located in Hanoi, and
-- currently are positions of employees of departments whose director’s name starts with the letter P. (
-- Assume that an employee cannot change department). [No sub queries needed here]
SELECT DISTINCT E.Position, E.Name
FROM employee E, department D
WHERE D.location = 'Hanoi'
AND E.name LIKE 'P%';

-- 13. Names, incomes, and department’ names of the supervisors who do not supervised employees who work in Hanoi.
SELECT E1.Name, P.Income, D1.name AS Departmentment
FROM employee E1, employee E2, position P, department D1
WHERE P.code = E1.position
AND D1.code = E1.department
AND E2.supervisor = E1.number
AND E2.department NOT IN (SELECT D2.code 
                          FROM department D2 
                          WHERE D2.location = 'Hanoi');

-- 14. Name of employee with highest income
SELECT E.name, P.income
FROM employee E, position P
WHERE P.income = (SELECT MAX(P.income)
                  FROM position P)
AND P.code = E.position;

-- 15. Names and id of employees who supervise at least one another person.
SELECT E1.name, E1.number
FROM employee E1
WHERE E1.number IN
      (SELECT supervisor
      FROM employee
      WHERE supervisor IS NOT NULL );
-- 16. Names of employees whose salary is higher than all employees in department DP1.
SELECT E.name
FROM employee E, position P
WHERE E.position  = P.code
AND P.income > ALL (SELECT P1.income 
                    FROM employee E1, position P1
                    WHERE E1.position = P1.code 
                    AND E1.department = 'DP1');
-- 17. Names and id of employees who do not supervise anyone
SELECT E.number, E.name
FROM employee E
WHERE E.number NOT IN (SELECT E1.supervisor FROM employee E1 WHERE E1.supervisor IS NOT NULL);

Select E1.number, E1.name
from Employee E1 , Employee E2 
where E1.number not in ( select E2.supervisor ) 
and E1.number = E2.number;

-- 18. Names of employees who supervise all employees who work in HCMC.
SELECT E.name, D.location
FROM employee E, department D
WHERE D.location = 'HCMC'
AND D.code = E.department;