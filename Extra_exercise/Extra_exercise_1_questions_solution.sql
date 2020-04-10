USE EXTRA_EXERCISE;

-- 1.1 Select the names of all the products in the store.
SELECT P.Name
FROM Products P;

-- 1.2 Select the names and the prices of all the products in the store.
SELECT P.Name, P.Price
FROM Products P;

-- 1.3 Select the name of the products with a price less than or equal to $200.
SELECT P.Name, P.Price
FROM Products P
WHERE (P.Price <= 200);
-- 1.4 Select all the products with a price between $60 and $120.
SELECT P.Name, P.Price
FROM Products P
WHERE P.Price <= 120 
AND P.Price >= 60;
-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT P.Name, P.Price * 100 AS price_in_cent
FROM Products P;

-- 1.6 Compute the average price of all the products.
SELECT AVG(Price) FROM Products;

SELECT SUM(Price)/ COUNT(Price) FROM Products;

-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(Price) FROM Products WHERE Manufacturer = 2;

-- 1.8 Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(*) FROM Products WHERE Price>=180;

-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT P.Name, P.Price
FROM Products P
WHERE P.Price >= 180 ORDER BY Price DESC, name ASC;

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
SELECT M.Name,P.*
FROM Products P, Manufacturers M
WHERE P.Manufacturer = M.code;

-- 1.11 Select the product name, price, and manufacturer name of all the products.
SELECT P.Name, P.Price, M.Name
FROM Products P, Manufacturers M
WHERE M.Code = P.manufacturer;

SELECT P.Name, P.Price, M.Name FROM Products P JOIN Manufacturers M ON(P.manufacturer = M.code);

-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT AVG(Price), Manufacturer
FROM Products
GROUP BY Manufacturer;

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT AVG(P.Price), M.name
FROM Products P, Manufacturers M
WHERE P.manufacturer = M.code
GROUP BY M.name;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT AVG(P.Price), M.Name
FROM Manufacturers M, Products P
WHERE  M.Code = P.Manufacturer
GROUP BY M.name
HAVING AVG(P.Price) >= 150;


-- 1.15 Select the name and price of the cheapest product.
select name, price from Products 
where price = (
select min(price)
from products);

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product:
SELECT max_price_mapping.name as manu_name, max_price_mapping.price, products_with_manu_name.name as product_name
FROM 
    (SELECT Manufacturers.Name, MAX(Price) price
     FROM Products, Manufacturers
     WHERE Manufacturer = Manufacturers.Code
     GROUP BY Manufacturers.Name)
     AS max_price_mapping
   LEFT JOIN
     (SELECT products.*, manufacturers.name manu_name
      FROM products join manufacturers
      ON (products.manufacturer = manufacturers.code))
      AS products_with_manu_name
ON
   (max_price_mapping.name = products_with_manu_name.manu_name
    and
    max_price_mapping.price = products_with_manu_name.price); 
    
-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
insert into Products values (11, 'Loudspeakers', 70, 2);

-- 1.18 Update the name of product 8 to "Laser Printer".
UPDATE Products
SET Name = 'Laser Printer'
WHERE Code = 8;

-- 1.19 Apply a 10% discount to all products.
UPDATE Products
SET Price = Price * 0.9;

-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
update products
set price = price * 0.9
where price >= 120; 
