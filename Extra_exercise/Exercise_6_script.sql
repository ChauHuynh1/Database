USE Exercise_6;

-- 6.1 List all the scientists' names, their projects' names, 
    -- and the hours worked by that scientist on each project, 
    -- in alphabetical order of project name, then scientist name.
 SELECT S.Name, P.Name As Project_name, P.Hours
 FROM Scientists S, AssignedTo A, Projects P
 WHERE S.SSN = A.Scientist
 AND A.Project = P.code
 ORDER BY P.name ASC, S.name ASC;
    
-- 6.2 Select the project names which are not assigned yet
SELECT P.name
FROM Projects P
WHERE P.code NOT IN (SELECT A.Project
                     FROM AssignedTo A)
