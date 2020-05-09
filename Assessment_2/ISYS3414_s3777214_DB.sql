CREATE DATABASE ABC_Hire_Firm;
USE ABC_Hire_Firm;

SET FOREIGN_KEY_CHECKS=0;

-- Create table Brand (Brand_code, name)
CREATE TABLE Brand (
       Brand_code VARCHAR(5),
       Name VARCHAR(50),
       CONSTRAINT pk_Brand
       PRIMARY KEY (Brand_code),
       CHECK (Brand_code REGEXP '^[A-Z]{2}[[:digit:]]{3}$') 
                   );


 
-- Create table Supplier (Sup_code, Brand.Brand_code Brand, Name, address)
CREATE TABLE Supplier (
       Sup_code VARCHAR(5),
       Brand VARCHAR(5),
       Name VARCHAR(50),
       Address VARCHAR(50),
       CONSTRAINT pk_Supply
       PRIMARY KEY (Sup_code),
       CONSTRAINT fk_Supplier_Brand
       FOREIGN KEY (Brand)
       REFERENCES Brand (Brand_code) ON DELETE CASCADE ON UPDATE CASCADE,
		 CHECK (Sup_code REGEXP ('^[A-Z]{2}[[:digit:]]{3}$')    
                    ));

-- Create table Equipment (E_code, name, Brand.Brand_code Brand, Category, 
--                                           In_stock, On_hire, Weekday_rate, Weekend_price, Deposit)
CREATE TABLE Equipment (
       E_code VARCHAR(5),
       Name VARCHAR(50),
       Brand VARCHAR(5),
       Category VARCHAR(50),
       In_stock INT NOT NULL,
       On_hire INT NOT NULL,
       Weekday_rate FLOAT,
       Weekend_price FLOAT,
       Deposit FLOAT,
       CONSTRAINT pk_Equipment
       PRIMARY KEY (E_code),
       CONSTRAINT fk_Equipment_Brand
       FOREIGN KEY (Brand)
       REFERENCES Brand (Brand_code) ON DELETE CASCADE ON UPDATE CASCADE,
		 CHECK (E_code REGEXP '^[A-Z]{5}$') 
                       );


/* Create table Supply (Supplier.Sup_code Supplier, Equipment.E_code 
                                      Equipment, Price, Delivery_time) */
CREATE TABLE Supply (
       Supplier VARCHAR(5),
       Equipment VARCHAR(5),
       Price FLOAT,
       Delievery_time TIME(0),
       Primary Key (Supplier, Equipment),
       CONSTRAINT fk_Supply_Supplier
       FOREIGN KEY (Supplier)
       REFERENCES Supplier (Sup_code) ON DELETE CASCADE ON UPDATE CASCADE,
	   CONSTRAINT fk_Supply_Equipment
	   FOREIGN KEY (Equipment)
	   REFERENCES Equipment (E_code) ON DELETE CASCADE ON UPDATE CASCADE
                       );



-- Create table Customer (CID, Customer_Name, Phone, Address)

CREATE TABLE Customer(
         CID VARCHAR(5),
         customer_name VARCHAR (30),
         phone VARCHAR(11),
         address VARCHAR (50),
         CONSTRAINT pk_Customer
         PRIMARY KEY (CID),
         CHECK (CID REGEXP '^(PR|B(S|G|D))[[:digit:]]{3}$') 
                     );
                                            
-- Create table Business_customer ( Customer.CID Customer, Membership)

CREATE TABLE Business_customer(
          Customer VARCHAR(5),
          Membership VARCHAR(50),
          CONSTRAINT pk_Bussiness_customer
          PRIMARY KEY (Customer),
          CONSTRAINT fk_Bussiness_Customer
          FOREIGN KEY (Customer)
          REFERENCES Customer (CID) ON DELETE CASCADE ON UPDATE CASCADE     
                                                           );

-- Create table Private_customer (Customer.CID Customer, Distance)

CREATE TABLE Private_customer (
          Customer VARCHAR(5),
          CONSTRAINT pk_Private_Customer
          PRIMARY KEY (Customer),
          CONSTRAINT fk_Private_Customer_Customer
          FOREIGN KEY (Customer)
          REFERENCES Customer (CID) ON DELETE CASCADE ON UPDATE CASCADE
                                                                         );
                                                                         
-- Create table Hire_Bill (Customer.CID Customer ,Hire_ID, Total_Deposit, expected_return_date, hired_date)

CREATE TABLE Hire_Bill (
       Customer VARCHAR(5),
       Hire_ID VARCHAR(5) ,
       Total_Deposit FLOAT,
       Hired_Date Date,
       Expected_returned_date DATE,
       CONSTRAINT pk_Hire_Bill
       PRIMARY KEY (Hire_ID),
       CONSTRAINT fk_Hire_bill_Customer
       FOREIGN KEY (Customer)
       REFERENCES Customer (CID) ON DELETE CASCADE ON UPDATE CASCADE,
       CHECK (Hire_ID REGEXP ('^[A-Z]{1}[[:digit:]]{4}$'))
                       );

/* Create table Hiring_update (Hire_Bill.Hire_code Hire_id, 
                                                 Equipment.E_code Equipment , Quantity) */
                                                 
CREATE TABLE Hiring_update (
       Hire_ID VARCHAR(5), 
       Equipment VARCHAR(5),
       Quantity INT,
       PRIMARY KEY ( Hire_ID, Equipment),
       CONSTRAINT fk_Hiring_update_hire_bill
       FOREIGN KEY (Hire_ID) 
       REFERENCES Hire_Bill (Hire_ID) on DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_Hiring_Update_Equipment
        FOREIGN KEY (Equipment)
        REFERENCES Equipment (E_code) ON DELETE CASCADE ON UPDATE CASCADE
                       );


/* Create table Invoice (Customer.CID Customer, Invoice_ID,Returned_date, overdue_rate
						,overdue_fee,VAT,Total_Hiring_Cost) */
CREATE TABLE Invoice (
          Customer VARCHAR(5),
          Invoice_ID VARCHAR(5),
          Returned_Date DATE,
          Overdue_fee_rate VARCHAR(4),
		  Overdue_fee FLOAT,
		  VAT VARCHAR(4),
          Total_Hiring_Cost FLOAT,
          CONSTRAINT pk_Invoice 
          PRIMARY KEY ( Invoice_ID),
          CONSTRAINT fk_Invoice_Customer
          FOREIGN KEY (Customer)
          REFERENCES Customer (CID) ON DELETE CASCADE ON UPDATE CASCADE,
          CHECK (Invoice_ID REGEXP ('^[A-Z]{2}[[:digit:]]{3}$'))
                                                                         );

/* Create table Invoice_update (Invoice.Customer Customer, Invoice.Invoice_ID Invoice, Equipment.E_code Equipment, Quantity, Cost) */
CREATE TABLE Invoice_Update (
          Invoice_ID VARCHAR(5),
          Equipment VARCHAR(5),
          Quantity INT,
          Cost FLOAT,
          CONSTRAINT pk_Invoice_Update 
          PRIMARY KEY ( Invoice_ID, Equipment ),
          CONSTRAINT fk_Invoice_Update_Equipment 
          FOREIGN KEY (Equipment)
          REFERENCES Equipment (E_code) ON DELETE CASCADE ON UPDATE CASCADE
                                                                         );


/* Create table Discount_Detail (Discount_ID, Business_customer.Customer Customer,        
								Discount_Rate, Discount,Invoice.Invoice_ID Invoice NOT NULL) */
CREATE TABLE Discount_Detail ( 
          Discount_ID VARCHAR(5),
          Customer VARCHAR(5),
          Invoice VARCHAR(5),
          Discount_Rate VARCHAR(4),
          Discount Float,
          PRIMARY KEY ( Discount_ID),
          CONSTRAINT fk_Discount_Detail_Customer
          FOREIGN KEY (Customer)
          REFERENCES Business_Customer (Customer) ON DELETE CASCADE ON UPDATE CASCADE,
          CONSTRAINT fk_Discount_Detail_Invoice
          FOREIGN KEY (Invoice)
          REFERENCES Invoice (Invoice_ID) ON DELETE CASCADE ON UPDATE CASCADE,
          CHECK (Discount_ID REGEXP ('^[A-Z]{2}[[:digit:]]{3}$'))
			  );


/* Create table Complaint (Customer.CID Customer, Complaint_code, date,
                                          Equipment.E_code Equipment, status, solution) */
CREATE TABLE Complaint(
       Customer VARCHAR(5),
       Complaint_code VARCHAR(5),
       Equipment VARCHAR(5),
       Status VARCHAR(50),
       Solution VARCHAR(50),
       Complaint_date DATE,
       24_hour_support VARCHAR(3), 
       CONSTRAINT pk_Complaint
       PRIMARY KEY (Customer, Complaint_code),
       CONSTRAINT fk_Complaint_Equipment
       FOREIGN KEY (Equipment)
       REFERENCES Equipment (E_code) ON DELETE CASCADE ON UPDATE CASCADE 
                    );

COMMIT;
SET FOREIGN_KEY_CHECKS=1;