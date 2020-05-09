USE ABC_Hire_Firm;

-- 1. For given particular equipment, show current stock and current items on hire and the name of its category.
SELECT E.E_code, E.name AS Equipment, E.In_stock, E.On_hire, Category
FROM Equipment E; 

-- 2. For a particular business customer, show the current items on hire with expected return dates plus 
-- any previous complaints that made by that customer which involved a replacement of equipment or a full refund.
Select Distinct C.cid , C.customer_name, HU.Equipment, H.Expected_returned_date,  CO.Complaint_code , CO.Solution
FROM Customer C , Business_Customer BC , Hire_Bill H ,Complaint CO, Hiring_Update HU
WHERE C.cid = BC.Customer
AND C.cid = H.Customer
AND H.Hire_ID = HU.Hire_ID
AND C.cid = CO.customer ;

-- 3. A list of names and addresses of all suppliers along with the total number of equipment from all categories they currently supply.
SELECT Sup.Sup_code, Sup.name AS Supplier, Sup.Address, COUNT(S.Equipment)
FROM Supplier Sup, Supply S 
WHERE Sup.Sup_code = S.Supplier
GROUP BY Sup.Sup_code;

-- 4. For a given category, the total number of equipment (i.e. items) under that category available in stock 
-- and the number currently on hire to customers. 
-- Note: You should have at least three items under each category to display appropriate output.
SELECT E.category, SUM(E.In_stock) AS 'Number of available equipment', SUM(E.On_hire) AS 'Number of on-hire equipment'
FROM Equipment E
GROUP BY E.Category;

-- 5. Summary of income from hiring equipment for last month. The result should be sub-divided according to equipment categories.
Select E.category , Sum(IU.cost)
FROM Equipment E , Invoice_Update IU , Invoice I
WHERE E.E_code = IU.Equipment
AND I.Invoice_ID = IU.Invoice_ID
AND I.returned_date between '2020-04-01' and '2020-04-30'
GROUP BY E.category;
