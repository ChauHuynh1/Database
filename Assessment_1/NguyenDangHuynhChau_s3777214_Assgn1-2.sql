CREATE DATABASE ManiGem;
USE ManiGem;
/* 2.Create table */
CREATE TABLE Customer( 
       customer_ID bigint,
       customer_name text not null,
       phone_number bigint not null unique,
       address varchar(100),
       constraint pk_Customer
       primary key (customer_ID),
       CHECK (customer_name <> ''),
       CHECK (phone_number <> '') );
CREATE TABLE Product(
       product_ID varchar(30),
       product_name text not null,
       price_USD bigint not null,
       product_type text,
       primary_color text,
       constraint pk_Product
       primary key (product_ID),
       CHECK (product_name <> ''),
       CHECK(price_USD <> ''));
CREATE TABLE Sale(
       trans_ID bigint,
       customer_ID bigint,
       sale_date date not null,
       total_amount_USD bigint,
       constraint pk_Sale
       primary key (trans_ID),
       constraint fk_Sale
       foreign key(customer_ID)
       references Customer(customer_ID));
CREATE TABLE Sale_detail(
       product_ID varchar(30),
       trans_ID bigint,
       quantity bigint not null,
       constraint fk_Sale_Detail_1
       foreign key(product_ID)
       references Product(product_ID),
       constraint fk_Sale_Detail_2
       foreign key(trans_ID)
       references Sale(trans_ID),
       CHECK(quantity <> ''));
   /* 3. Insert table*/
  /* Customer Table */
insert into Customer values(3777212, 'Tran Kien Phong', 09237643876, '148 Ton Dan');
insert into Customer values(3941728, 'Nguyen Anh Sa', 07297532567, '256 Nguyen Dinh Chieu');
insert into Customer values(1616372, 'Tran Han Tram', 081238776548, '4 Dinh Tien Hoang');
insert into Customer values(2465758, 'Nguyen Truong Bang', 0924567895, '78 Hai Ba Trung');
insert into Customer values(6282927, 'Truong Huu Kiet', 09182746982, '56 Bach Dang');
/* Product Table */
insert into Product values('BR123', 'Gold bracelet', 647, 'bracelet', 'gold');
insert into Product values('RH112', 'Leaf silver bracelet', 753, 'ring', 'silver');
insert into Product values('LM986', 'Silver Necklet', 356, 'necklet', 'silver');
insert into Product values('BM984', 'Ruby ring', 265, 'ring', 'red');
insert into Product values('HMO688', 'Gold ring', 154, 'ring', 'gold');
/* Sale Table */
insert into Sale values(1800008, 3777212, '2018-10-18', 150);
insert into Sale values(1348743, 3941728, '2019-09-08', 400);
insert into Sale values(7644332, 1616372, '2016-08-13', 478);
insert into Sale values(1247643, 2465758, '2017-04-23', 569);
insert into Sale values(1854328, 6282927, '2018-12-20', 467);
/* Sale Detail Table */
insert into Sale_detail values('BR123', 1800008, 1);
insert into Sale_detail values('RH112', 1348743, 10);
insert into Sale_detail values('LM986', 7644332, 29);
insert into Sale_detail values('BM984', 1247643, 9);
insert into Sale_detail values('HMO688', 1854328, 3);
/* Additional command */
SELECT * FROM ManiGem.Product;
SELECT * FROM ManiGem.Sale_detail WHERE trans_ID = 1800008;
SELECT * FROM ManiGem.Sale WHERE MONTH(CURDATE()) = MONTH(date); 
UPDATE Product
SET price_USD = price_USD + 1
WHERE product_type = 'bracelet';
UPDATE Product
SET price_USD = price_USD - 1
WHERE product_type = 'ring';