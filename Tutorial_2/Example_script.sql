USE Example;

-- Sailors with a rating above 7:
SELECT S.sid, S.sname, S.rating, S.age
FROM Sailors S
Where S.rating > 7;

-- Names of the Sailors who reserved the boat 103: 
SELECT S.sid, S.sname
FROM Sailors S, Reserves r
WHERE R.sid = S.sid
AND R.bid = 103;

-- Names of the Sailors who reserved a red boat:
SELECT DISTINCT S.sname
FROM Sailors S, Reserves R, Boats B
WHERE S.sid = R.sid 
AND R.bid = B.bid
AND B.color = 'red';

-- Colors of the Boats reserved by the sailor “Lubber”:
SELECT DISTINCT B.color
FROM Sailors S, Reserves R, Boats B
WHERE S.sname = 'Lubber'
AND S.sid = R.sid
AND R.bid = B.bid;

-- Names of the Sailors who reserved, at least, one boat:
SELECT DISTINCT S.sname
FROM Sailors S, Reserves R
WHERE S.sid = R.sid;

-- Names of the Sailors (pairs) who have the same rating:
SELECT DISTINCT S1.sname, S2.sname, S1.rating
FROM Sailors S1, Sailors S2
WHERE S1.rating = S2.rating
AND S1.sid > S2.sid;

-- Calculate the rating increments (+1) of the sailors who reserved two boats in the same day
SELECT DISTINCT S.sname, S.rating + 1 AS new_rating
FROM Sailors S, Reserves R1, Reserves R2
WHERE S.sid = R1.sid
AND S.sid = R2.sid
AND R1.day = R2.day 
AND R1.bid <> R2.bid;

-- Name of the Sailors who have double or higher rating than another sailor
SELECT DISTINCT S1.sname, S2.sname
FROM Sailors S1, Sailors S2
WHERE S1.rating >= 2 * S2.rating;

-- The age and name of the sailors whose names start with ‘L’ and end with ‘R’ and with at least 3 characters
SELECT DISTINCT S.sname
FROM Sailors S
WHERE S.sname LIKE 'L_%r';

-- Names of the sailors who reserve green OR red boats

-- Basic solution:
SELECT DISTINCT S.sname
FROM Sailors S, Reserves R, Boats B 
WHERE S.sid = R.sid 
AND R.bid = B.bid 
AND (B.color = 'green' OR B.color = 'red');

/* Union Solution */
SELECT DISTINCT S.sname
FROM Sailors S, Reserves R, Boats B
WHERE S.sid = R.sid
AND R.bid = B.bid 
AND B.color = 'red'
UNION
SELECT DISTINCT S.sname
FROM Sailors S, Reserves R, Boats B
WHERE S.sid = R.sid
AND R.bid = B.bid
AND B.color = 'green';

-- Names of the sailors who reserve green OR red boats
SELECT DISTINCT S.sname
FROM Sailors S, Reserves R, Boats B 
WHERE S.sid = R.sid 
AND R.bid = B.bid
AND (B.color = 'green' OR B.color = 'red');

-- Names of the sailors who did not reserve any blue boat
SELECT S.sname
FROM Sailors S
WHERE (S.sid NOT IN (SELECT R.bid
                     FROM Reserves R
                     WHERE (R.bid IN(SELECT B.color
									 FROM Boats B
									 WHERE B.color = 'blue'))));

-- Names of the sailors who reserve the boat 101
SELECT S.sname
FROM Sailors S
WHERE EXISTS (SELECT R.sid
              FROM Reserves R
              WHERE R.sid = S.sid 
              AND R.bid = 101);

-- Names of the sailors who did not reserve any blue boat-- 
SELECT DISTINCT S.sname
FROM Sailors S
WHERE NOT EXISTS (SELECT *
                  FROM Reserves R, Boats B
                  WHERE R.bid = B.bid
                  AND S.sid = R.sid
                  AND B.color = 'blue');
                  
-- Sailors whose ratings are higher than (at least one) another sailor-- 
SELECT DISTINCT S.sname
FROM Sailors S
WHERE (S.rating > ANY (SELECT S2.rating
                       FROM Sailors S2));

-- Sailors with maximum rating-- 
SELECT S1.sid
FROM Sailors S1
WHERE (S1.rating >= ALL (SELECT S2.rating
FROM Sailors S2));

-- Names of the sailors who reserve green AND red boats-- 
SELECT DISTINCT S.sname
FROM Sailors S, Boats B1, Boats B2, Reserves R1, Reserves R2
WHERE S.sid = R1.sid AND S.sid = R2.sid AND R1.bid = B1.bid AND R2.bid = B2.bid
AND B1.color = 'green' AND B2.color = 'red';

-- Names of the sailors who reserved all the boats (at least one time)
SELECT DISTINCT S.sname 
FROM Sailors S
WHERE NOT EXISTS (SELECT *
				  FROM Boats B
                  WHERE NOT EXISTS (SELECT *
                                    FROM Reserves R
                                    WHERE R.bid = B.bid AND R.sid = S.sid))