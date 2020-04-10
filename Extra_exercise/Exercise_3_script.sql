USE Exercise_3;

-- 3.1 Select all warehouses.
SELECT *
FROM warehouses;

-- 3.2 Select all boxes with a value larger than $150.
SELECT * 
FROM boxes 
WHERE Value > 150;

-- 3.3 Select all distinct contents in all the boxes.
SELECT DISTINCT contents 
FROM boxes;

-- 3.4 Select the average value of all the boxes.
SELECT AVG(value) 
FROM boxes;

-- 3.5 Select the warehouse code and the average value of the boxes in each warehouse.
SELECT warehouse, AVG(value)
FROM boxes
GROUP BY warehouse;

-- 3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
SELECT warehouse, AVG(value) 
FROM boxes 
GROUP BY warehouse
HAVING AVG(value) > 150;

-- 3.7 Select the code of each box, along with the name of the city the box is located in.
SELECT B.code, W.location
FROM Boxes B, Warehouses W
WHERE B.warehouse = W.code;

-- 3.8 Select the warehouse codes, along with the number of boxes in each warehouse. 
SELECT Warehouse, COUNT(*) 
FROM boxes 
GROUP BY warehouse;

-- 3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
SELECT Code
   FROM Warehouses
   WHERE Capacity <
   (
     SELECT COUNT(*)
       FROM Boxes
       WHERE Warehouse = Warehouses.Code
   );

-- 3.10 Select the codes of all the boxes located in Chicago.
SELECT Code
   FROM Boxes
   WHERE Warehouse IN
   (
     SELECT Code
       FROM Warehouses
       WHERE Location = 'Chicago'
   );
   
-- 3.11 Create a new warehouse in New York with a capacity for 3 boxes.
INSERT INTO Warehouses VALUES (6, 'New York', 3);

-- 3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
INSERT INTO Boxes VALUES('H5RT', 'Papers', 200, 2);

-- 3.13 Reduce the value of all boxes by 15%.
UPDATE boxes
SET Value = value * 0.85;

-- 3.14 Remove all boxes with a value lower than $100.
DELETE FROM boxes 
WHERE value < 100;

-- 3.15 Remove all boxes from saturated warehouses.
DELETE FROM boxes
WHERE warehouse in
(
SELECT Code
   FROM Warehouses
   WHERE Capacity <
   (
     SELECT COUNT(*)
       FROM Boxes
       WHERE Warehouse = Warehouses.Code
   )
);

-- 3.16 Add Index for column "Warehouse" in table "boxes"
-- !!!NOTE!!!: index should NOT be used on small tables in practice
CREATE INDEX Warehouse
ON Boxes(Warehouse);

-- 3.17 Print all the existing indexes
-- !!!NOTE!!!: index should NOT be used on small tables in practice
SHOW INDEX FROM Boxes FROM mydb;
