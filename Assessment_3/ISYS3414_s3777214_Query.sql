USE ATP_Tour;

-- Select a list of name of participant and their score in the increasing order of their score ( use ORDER BY)
SELECT P.name, I.score
FROM Participant P, In_match I
WHERE P.code = I.participant
ORDER BY Score ASC;

-- Select a list of name of players in match (use INNER JOINS)
SELECT I.matches, P.Name AS "Participant"
FROM In_match I
INNER JOIN Participant P ON I.participant = P.code;

--  Number of matches in this Tournament (A query that uses aggregate functions)
SELECT COUNT(*)
FROM Matches M;

-- Select list of stadium which have at least once held a tournament and the number of match
-- (A query that uses the GROUP BY and HAVING clauses)
SELECT S.Name AS 'Stadium', COUNT(M.code) AS 'Number of match'
FROM (Matches M
INNER JOIN Stadium S ON M.Stadium = S.code)
GROUP BY M.Stadium
HAVING COUNT(M.code) >= 1;

-- List of particioant have score which is higher than the average (A query that uses a sub-query as a relation)
SELECT DISTINCT P.code, P.name, I.score
FROM (SELECT AVG(I.score) AS averageScore
      FROM In_match I) AS Score, Participant P, In_match I
WHERE I.score > Score.averageScore
AND I.participant = P.code;

-- Select information of any Umpire who has least controlled a match (A query that uses a sub-query in the WHERE clause)
SELECT U1.code, U1.name
FROM Umpire U1
WHERE U1.code IN (SELECT C.Umpire
                  FROM Umpire U2, Control C
                  WHERE C.Umpire = U2.code
                 );
              
--  Create a view to illustrate the name and code of 5 champion with their rank (A query stored as a VIEW)
CREATE VIEW Champion AS
SELECT P.code, P.name AS 'Participant', C.ranking
FROM Participant P, Championship C
WHERE C.participant = P.code;

-- Select the information of the participants whose names start with A (A query that uses LIKE in the WHERE clause)
SELECT Participant.*
FROM Participant
WHERE Participant.Name LIKE 'A%';

-- Select a list of match and its stadium where held the match (A query that uses a self-JOIN)
SELECT M1.code AS 'Match', M1.stadium AS 'Stadium'
FROM Matches M1
INNER JOIN Matches M2
ON M1.code = M2.code;

-- The highest score with its participant name (A query that uses ALL or ANY)
SELECT Participant.code, Participant.Name, In_match.Score, In_match.matches
FROM Participant, In_match
WHERE Participant.code = In_match.participant
AND In_match.score >= ANY (SELECT MAX(In_match.score)
                            FROM In_match
						   )