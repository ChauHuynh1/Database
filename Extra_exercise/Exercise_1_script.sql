USE EXERCISE_1;

-- 1.1 Select the names of all the products in the store.
SELECT P.name
FROM Products P;

-- 1.2 Select the names and the prices of all the products in the store.
SELECT P.name, P.price
FROM Products P;

-- 1.3 Select the name of the products with a price less than or equal to $200.
SELECT P.name, P.price
FROM Products P
WHERE P.price <= 200;

-- 1.4 Select all the products with a price between $60 and $120.
SELECT P.name, P.price
FROM Products P
WHERE P.price <= 120 AND P.price >= 60;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT P.Name, P.price * 100 AS Price_in_cent
FROM Products P;

-- 1.6 Compute the average price of all the products.
SELECT AVG(price) AS Average_price
FROM Products;

-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(price) AS Average_price
FROM Products
WHERE Manufacturer = 2;

-- 1.8 Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(*)
FROM Products P
WHERE P.price >= 180;

-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT P.name, P.price
FROM Products P 
ORDER BY P.price DESC, P.name ASC;

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
SELECT P.*, M.name AS Manufacturer
FROM Products P, Manufacturers M
WHERE P.manufacturer = M.code;

-- 1.11 Select the product name, price, and manufacturer name of all the products.
SELECT P.name, P.price, M.name AS manufacturer
FROM Products P, Manufacturers M
WHERE M.code = P.manufacturer;

-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT AVG(price), Manufacturer
FROM Products
GROUP BY Manufacturer;

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT AVG(P.price) AS Average_price, M.name As Manufacturer
FROM Manufacturers M Join Products P on P.manufacturer = M.code
GROUP BY M.name;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT AVG(P.price) AS Average_price, M.name As Manufacturer
FROM Manufacturers M Join Products P on P.manufacturer = M.code
GROUP BY M.name
HAVING AVG(P.Price) >= 150;

-- 1.15 Select the name and price of the cheapest product.
SELECT P.Name, P.Price
FROM Products P
WHERE P.Price = (SELECT MIN(P.price)
                 FROM Products P);

SELECT P.Name, P.Price
FROM Products P
WHERE P.Price = (SELECT MAX(P.price)
                 FROM Products P);

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
SELECT DISTINCT M.name, P1.name , P1.price 
FROM Manufacturers M , Products P1 , Products P2
WHERE M.code = P1.manufacturer 
AND P1.Price >= All (SELECT P2.price 
                     FROM Products P2 
					 WHERE P2.Manufacturer = P1.Manufacturer 
					) ;

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.

-- 1.18 Update the name of product 8 to "Laser Printer".
-- 1.19 Apply a 10% discount to all products.
-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.