CREATE DATABASE ABC_Hire_Firm;
USE ABC_Hire_Firm;

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE Transaction (
       Transcode INT,
       Equipment INT, -- code of equipment
       Transdate DATE,
       CONSTRAINT pk_Transaction
       PRIMARY KEY (Transcode), 
       CONSTRAINT fk_Transaction_Equipment
       FOREIGN KEY (Equipment)
       REFERENCES Equipment(Ecode) ON DELETE CASCADE ON UPDATE CASCADE
                         );

CREATE TABLE Stock (
       Equipment INT, -- code of equipment
       Transaction INT, -- code of transaction
       Available_quantity BIGINT,
       CONSTRAINT pk_Stock
       PRIMARY KEY (Equipment),
       CONSTRAINT fk_Stock_Equipment
       FOREIGN KEY (Equipment)
       REFERENCES Equipment(Ecode) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fk_Stock_Transaction
       FOREIGN KEY (Transaction)
       REFERENCES Transaction(Transcode) ON DELETE CASCADE ON UPDATE CASCADE
                   );
                   
CREATE TABLE Equipment (
       Ecode INT,
       Category INT,  -- code of category
       Ename VARCHAR(50),
       CONSTRAINT pk_Equipment
       PRIMARY KEY (Ecode, Ename),
       CONSTRAINT fk_Equipment_Catergory
       FOREIGN KEY (Category)
       REFERENCES Catefory(code)
                       );
                       
CREATE TABLE Category (
       Code INT,
       Name VARCHAR(50),
       CONSTRAINT pk_Category
       PRIMARY KEY (Code, Name) 
                       );

CREATE TABLE Supply (
       Supplier INT, -- code of supplier 
       Equipment INT, -- code of equipment
       Price FLOAT NOT NULL,
       CONSTRAINT fk_Supply_Supplier
       FOREIGN KEY (Supplier)
       REFERENCES Supplier(Supcode) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fk_Supply_Equipment
       FOREIGN KEY (Equipment)
       REFERENCES Equipment(Ecode) ON DELETE CASCADE ON UPDATE CASCADE,
       CHECK (Price <> '')
                    );

CREATE TABLE Supplier (
       Supcode INT,
       Name VARCHAR(50),
       Address VARCHAR(50),
       CONSTRAINT pk_Supplier
       PRIMARY KEY (Supcode, Name)
                      );

CREATE TABLE Brand (
       Brand_code INT,
       Brand_name VARCHAR(50) NOT NULL,
       CONSTRAINT pk_Brand
       PRIMARY KEY (Brand_code),
       CHECK (Brand_name <> '')
                   );
                   
CREATE TABLE Obtain (
       Brand INT, -- code of Brand
       Supplier INT, -- code of supplier
       Price FLOAT NOT NULL,
       CONSTRAINT fk_Obtain_Brand
       FOREIGN KEY (Brand)
       REFERENCES Brand(Brand_code) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fk_Obtain_Supplier
       FOREIGN KEY (Supplier)
       REFERENCES Supplier(Supcode) ON DELETE CASCADE ON UPDATE CASCADE
                    );
                    
CREATE TABLE Hour_support (
       Fail_equipment INT,
       Solucode INT,
       Solution VARCHAR(200),
       CONSTRAINT pk_Hour_support
       PRIMARY KEY (Solucode),
       CONSTRAINT fk_Hour_support_Equipment
       FOREIGN KEY (Fail_equipment)
       REFERENCES Equipment(Ecode) ON DELETE CASCADE ON UPDATE CASCADE
                          );

CREATE TABLE Solution (
       Solution INT, -- Solution code from hour support
       Solution_Date DATE NOT NULL,
       CONSTRAINT pk_Solution
       PRIMARY KEY (Solution),
       CONSTRAINT fk_Solution_Hour_support
       FOREIGN KEY (Solution)
       REFERENCES Hour_support(Solucode) ON DELETE CASCADE ON UPDATE CASCADE
                      );
                      
CREATE TABLE Equipment_replacement (
       Solution INT, -- Solution code from Solution
       Equipment_replacement INT, -- code of equipment
       CONSTRAINT pk_Equipment
       PRIMARY KEY (Solution),
       CONSTRAINT fk_Equipment_replacement_Solution
       FOREIGN KEY (Solution)
       REFERENCES Solution(Solution) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fk_Equipment_replacement_Equipment
       FOREIGN KEY (Equipment_replacement)
       REFERENCES Equipment(Ecode) ON DELETE CASCADE ON UPDATE CASCADE
                                   );

CREATE TABLE Refund (
       Solution INT, -- Solution code from Solution
       Refund_code INT,
       Equipment INT, -- code of equipment, then the amount of money need to refund will be searched in Supply to find equipment's price
       CONSTRAINT pk_Refund
       PRIMARY KEY (Solution, Refund_code),
       CONSTRAINT fk_Refund_Solution
       FOREIGN KEY (Solution)
       REFERENCES Solution(Solution) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fk_Refund_Equipment
       FOREIGN KEY (Equipment)
       REFERENCES Equipment(Ecode) ON DELETE CASCADE ON UPDATE CASCADE
                          );

CREATE TABLE Customer (
       Custcode INT,
       Name VARCHAR(50),
       Type VARCHAR(10),
       CONSTRAINT pk_Customer
       PRIMARY KEY (Custcode)
                      );

CREATE TABLE Private_customer (
       ID INT, -- Code of Customer
       Address VARCHAR(50) NOT NULL,
       CONSTRAINT pk_Private_customer
       PRIMARY KEY (ID),
       CONSTRAINT fk_Private_customer_Customer
       FOREIGN KEY (ID)
       REFERENCES Customer(Custcode) ON DELETE CASCADE ON UPDATE CASCADE,
       CHECK (Address <> '')
                              );
                              
CREATE TABLE Bussiness_customer (
       ID INT, -- Code of Customer
       Discount INT, -- Code for discounting
       Equipment INT, -- Code of equipment
       CONSTRAINT pk_Bussiness_customer
       PRIMARY KEY (ID),
       CONSTRAINT fk_Bussiness_customer_Customer
       FOREIGN KEY (ID)
       REFERENCES Customer(Custcode) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fk_Bussiness_customer_Equipment
       FOREIGN KEY (Equipment)
       REFERENCES Equipment(Ecode) ON DELETE CASCADE ON UPDATE CASCADE
                                );
                                
CREATE TABLE Silver_member (
       Custcode INT, -- customer code
       Memcode INT, -- discount code
       CONSTRAINT pk_Silver_member
       PRIMARY KEY (Memcode, Custcode),
       CONSTRAINT fk_Silver_member_Customer
       FOREIGN KEY (Custcode)
       REFERENCES Customer(Custcode) ON DELETE CASCADE ON UPDATE CASCADE
                           );

CREATE TABLE Gold_member (
       Custcode INT, -- customer code
       Memcode INT, -- discount code
       CONSTRAINT pk_Gold_member
       PRIMARY KEY (Memcode, Custcode),
       CONSTRAINT fk_Golde_member_Customer
       FOREIGN KEY (Custcode)
       REFERENCES Customer(Custcode) ON DELETE CASCADE ON UPDATE CASCADE
                           );

CREATE TABLE Diamond_member (
       Custcode INT, -- customer code
       Memcode INT, -- discount code
       CONSTRAINT pk_Diamond_member
       PRIMARY KEY (Memcode, Custcode),
       CONSTRAINT fk_Diamond_member_Customer
       FOREIGN KEY (Custcode)
       REFERENCES Customer(Custcode) ON DELETE CASCADE ON UPDATE CASCADE
                           );

CREATE TABLE Hiring_equipment (
       Transaction INT, -- transaction code
       Hiring_code INT,
       Hiring_equipment INT, -- code of equipment
       Amount INT NOT NULL,
       Hiring_date DATE,
       Expected_return_date DATE,
       Return_date DATE,
       CONSTRAINT pk_Hiring_equipment
       PRIMARY KEY (Hiring_code, Hiring_equipment),
       CONSTRAINT fk_Hiring_equipment_Transaction
       FOREIGN KEY (Transaction)
       REFERENCES Transaction(Transcode) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fk_Hiring_equipment_Equipment
       FOREIGN KEY (Hiring_equipment)
       REFERENCES Equipment(Ecode) ON DELETE CASCADE ON UPDATE CASCADE,
       CHECK (Amount <> '')
                              );

CREATE TABLE Invoice_calculation (
       Hiring_code INT, -- code of hiring
       Invoice_code INT, -- Code of invoice
       Invoice_money FLOAT NOT NULL,
       CONSTRAINT fk_Invoice_calculation_Hiring_equipment
       FOREIGN KEY (Hiring_code)
       REFERENCES Hiring_equipment(Hiring_code) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fk_Invoice_calculation_Invoice
       FOREIGN KEY (Invoice_code)
       REFERENCES Invoice(Invoice_code) ON DELETE CASCADE ON UPDATE CASCADE
                                 );
                                 
CREATE TABLE Invoice (
       Transaction INT, -- code of transaction
       Invoice_code INT,
       Equipment INT, -- code of Hiring Equipment
       CONSTRAINT pk_Invoice
       PRIMARY KEY (Invoice_code),
       CONSTRAINT fk_Invoice_Transaction
       FOREIGN KEY (Transaction)
       REFERENCES Transaction(Transcode) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fk_Invoice_Hiring_equipment
       FOREIGN KEY (Equipment)
       REFERENCES Hiring_equipment(Hiring_equipment) ON DELETE CASCADE ON UPDATE CASCADE
					 );

COMMIT;
SET FOREIGN_KEY_CHECKS=1;