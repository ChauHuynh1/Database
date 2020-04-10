USE Exercise_7;
 
-- 7.1 Who receieved a 1.5kg package? The result is "Al Gore's Head".
SELECT C.Name
FROM Client C, Package P 
WHERE C.AccountNumber = P.Recipient
AND P.Weight = 1.5;
    
-- 7.2 What is the total weight of all the packages that he sent?
SELECT SUM(Weight) AS Total_weight_sent_package
FROM Package 
WHERE Sender = (SELECT Recipient 
               FROM Package 
               WHERE Weight = 1.5
              );