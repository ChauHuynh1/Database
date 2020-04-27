USE ABC_Hire_Firm;

-- INSERT INTO TRANSACTION TABLE
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (247845, 9876, '1964-09-03');
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (252346, 3530, '1965-10-07');
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (234346, 3567, '1966-08-09');
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (144678, 5689, '1967-09-03');
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (632657, 0123, '1968-09-05');
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (245324, 2345, '1969-09-03');
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (235234, 9012, '1970-10-15');
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (215853, 0921, '1971-07-08');
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (775234, 3210, '1971-07-06');
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (256678, 4567, '1972-10-12');
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (564325, 7654, '1973-09-01');
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (346743, 5432, '1974-01-02');
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (532578, 1209, '1975-08-10');
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (864335, 0823, '1977-09-04');
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (962656, 3486, '1978-05-03');
INSERT INTO Transaction (Transcode, Equipment, Transdate)   VALUES (355327, 6789, '1979-10-03');

-- INSERT INTO STOCK TABLE
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(9876, 247845, 10000);
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(3530, 252346, 10000);
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(3567, 234346, 10000);
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(5689, 144678, 10000);
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(0123, 632657, 10000);
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(2345, 245324, 10000);
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(9012, 235234, 10000);
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(0921, 215853, 10000);
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(3210, 775234, 10000);
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(4567, 256678, 10000);
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(7654, 564325, 10000);
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(5432, 346743, 10000);
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(1209, 532578, 10000);
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(0823, 864335, 10000);
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(3486, 962656, 10000);
INSERT INTO Stock (Equipment, Transaction, Available_quantity) VALUES(6789, 355327, 10000);

-- INSERT INTO EQUIPMENT TABLE
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (9876, 1234, 'Garden Fork'); 
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (6789, 1234, 'Lawn Mower'); 
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (7654, 3456, 'Harmer'); 
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (4567, 3456, 'Hand Saw'); 
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (5432, 5678, 'Cherry Picker'); 
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (2345, 5678, 'Scissor Lifts'); 
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (3210, 7891, 'Brush'); 
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (0123, 7891, 'Paint'); 
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (9012, 1011, 'Air Compressor'); 
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (1209, 1011, 'Air Ratchet'); 
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (0921, 1112, 'Cordless Drill'); 
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (0823, 1112, 'Ax'); 
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (3486, 1213, 'Regal '); 
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (5689, 1213, 'Thermo Pride'); 
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (3567, 1314, 'CD'); 
INSERT INTO Equipment (Ecode, Category, Ename)  VALUES (3530, 1314, 'Book'); 

-- INSERT INTO CATEGORY TABLE
INSERT INTO Category (Code, Name) VALUES (1234, 'Gardening Equipment');
INSERT INTO Category (Code, Name) VALUES (3456, 'Building Equipment');
INSERT INTO Category (Code, Name) VALUES (5678, 'Access Equipment');
INSERT INTO Category (Code, Name) VALUES (7891, 'Decorating Equipment');
INSERT INTO Category (Code, Name) VALUES (1011, 'Car Maintenance');
INSERT INTO Category (Code, Name) VALUES (1112, 'Power Tools');
INSERT INTO Category (Code, Name) VALUES (1213, 'Heating and Lighting');
INSERT INTO Category (Code, Name) VALUES (1314, 'Miscellaneous');

-- INSERT INTO SUPPLY TABLE
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (12, 3530, 2);
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (23, 3567, 12.3);
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (12, 5689, 14.1);
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (23, 3486, 23.18);
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (34, 0823, 29.34);
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (34, 0921, 3.99);
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (78, 1209, 3.78);
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (09, 9012, 28.9);
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (90, 0123, 45.6);
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (78, 3210, 35.78);
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (90, 2345, 1.6);
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (09, 5432, 2.9);
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (34, 4567, 2.1);
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (12, 7654, 2.1);
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (34, 6789, 23.4);
INSERT INTO Supply (Supplier, Equipment, Price) VALUES (78, 9876, 99.7);

-- INSERT INTO SUPPLIER TABLE
INSERT INTO Supplier (Supcode, Name, Address) VALUES (12, 'JK Store', '42 Duong Quang Ham');
INSERT INTO Supplier (Supcode, Name, Address) VALUES (23, 'Alex Store', '148 Ton Dan');
INSERT INTO Supplier (Supcode, Name, Address) VALUES (34, 'Bryan Store', '496 Nguyen Dinh Chieu');
INSERT INTO Supplier (Supcode, Name, Address) VALUES (78, 'Bob Store', '98 Duong Quang Ham');
INSERT INTO Supplier (Supcode, Name, Address) VALUES (90, 'Helen Equipment Store', '97 Duong Quang Ham');
INSERT INTO Supplier (Supcode, Name, Address) VALUES (09, 'Twin Brother Store', '45 Le Duc Tho');

-- INSERT INTO BRAND TABLE
INSERT INTO Brand (Brand_code, Brand_name) VALUES (1, 'Hello Eddy');
INSERT INTO Brand (Brand_code, Brand_name) VALUES (2, 'Bonjour');
INSERT INTO Brand (Brand_code, Brand_name) VALUES (3, 'Tan Hung');
INSERT INTO Brand (Brand_code, Brand_name) VALUES (4, 'Viet Phat');
INSERT INTO Brand (Brand_code, Brand_name) VALUES (5, 'Vietnamese Goods');
INSERT INTO Brand (Brand_code, Brand_name) VALUES (6, 'I love Vietnam');
INSERT INTO Brand (Brand_code, Brand_name) VALUES (7, 'My lovely country');
INSERT INTO Brand (Brand_code, Brand_name) VALUES (8, 'Gorgeous Vietnam');

-- INSERT INTO OBTAIN TABLE
INSERT INTO Obtain (Brand, Supplier, Price) VALUES (1, 12, 23.87);
INSERT INTO Obtain (Brand, Supplier, Price) VALUES (2, 23, 2.8);
INSERT INTO Obtain (Brand, Supplier, Price) VALUES (3, 34, 3.7);
INSERT INTO Obtain (Brand, Supplier, Price) VALUES (4, 90, 8.9);
INSERT INTO Obtain (Brand, Supplier, Price) VALUES (5, 09, 2.7);
INSERT INTO Obtain (Brand, Supplier, Price) VALUES (6, 78, 85.9);

-- INSERT INTO HOUR_SUPPORT TABLE


-- INSERT INTO SOLUTION TABLE

-- INSERT INTO EQUIPMENT_REPLACEMENT TABLE

-- INSERT INTO REFUND TABLE

-- INSERT INTO CUSTOMER TABLE

-- INSERT INTO PRIVATE_CUSTOMER TABLE

-- INSERT INTO BUSSINESS_CUSTOMER TABLE

-- INSERT INTO SILVER_MEMBER TABLE

-- INSERT INTO GOLD_MEMBER TABLE

-- INSERT INTO DIAMOND_MEMBER TABLE

-- INSERT INTO HIRING_EQUIPMENT TABLE

-- INSERT INTO INVOICE_CALCULATION TABLE

-- INSERT INTO INVOICE TABLE
