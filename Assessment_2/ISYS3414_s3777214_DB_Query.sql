USE ABC_Hire_Firm;

-- 1. For given particular equipment, show current stock and current items on hire and the name of its category.
SELECT E.E_code, E.name AS Equipment, E.In_stock, E.On_hire, E.Category
FROM Equipment E; 

-- 2. For a particular business customer, show the current items on hire with expected return dates plus 
-- any previous complaints that made by that customer which involved a replacement of equipment or a full refund.
SELECT B1.Customer, C1.Customer_name, H1.Equipment AS `CURRENT Equipment on Hire`, H.Expected_returned_date, NULL AS `PAST Complaint`, NULL AS `Faulty Equipment`, NULL AS Solution 
FROM Customer C1, hire_bill H
right outer join business_customer B1 ON H.Customer = B1.Customer AND H.`Return Status` = 'Current'
left outer join Hiring_Detail H1 ON H.Hire_ID = H1.Hire_ID
WHERE C1.CID = B1.Customer
UNION 
SELECT distinct B.Customer, C1.Customer_name, NULL, NULL, C.Complaint_code, C.Equipment, C.Solution 
FROM complaint C, Customer C1, business_customer B
WHERE B.Customer = C.Customer AND C1.CID = B.Customer;

-- 3. A list of names and addresses of all suppliers along with the total number of equipment from all categories they currently supply.
SELECT Sup.Sup_code, Sup.name AS Supplier, Sup.Address , SUM(E.In_stock + E.On_hire)
FROM Supplier Sup, Supply S , Equipment E
WHERE Sup.Sup_code = S.Supplier
AND E.E_code = S.equipment
GROUP BY Sup.Sup_code;

-- 4. For a given category, the total number of equipment (i.e. items) under that category available in stock 
-- and the number currently on hire to customers. 
-- Note: You should have at least three items under each category to display appropriate output.
SELECT E.category, SUM(E.In_stock) AS 'Number of available equipment', SUM(E.On_hire) AS 'Number of on-hire equipment'
FROM Equipment E
GROUP BY E.Category;

-- 5. Summary of income from hiring equipment for last month. The result should be sub-divided according to equipment categories.

Select E.category , Sum(ID.cost)
FROM Equipment E , Invoice_Detail ID , Invoice I
WHERE E.E_code = ID.Equipment
AND I.Invoice_ID = ID.Invoice_ID
AND MONTH(I.returned_date) = MONTH(current_date() - interval 1 month)
GROUP BY E.category;