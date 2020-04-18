CREATE DATABASE Example;
USE Example;
/* CREATE TABLES*/

/* CREATE SAILORS TABLES*/
CREATE TABLE Sailors(
       sid INT,
       sname TEXT NOT NULL,
       rating INT NOT NULL,
       age INT,
       CONSTRAINT pk_Sailors
       PRIMARY KEY (sid));
       
/* CREATE BOATS TABLES*/
CREATE TABLE Boats(
       bid INT,
       bname TEXT NOT NULL,
       color VARCHAR(20) NOT NULL,
       CONSTRAINT pk_Boat
       PRIMARY KEY(bid));
       
/* CREATE RESERVES TABLES*/
CREATE TABLE Reserves(
	   sid INT,
       bid INT,
       day date,
       CONSTRAINT pk_Reserves
       PRIMARY KEY (sid, bid));
/* INSERT VALUES */

/* INSERT VALUES INTO SAILORS TABLE*/
INSERT INTO Sailors VALUES (22, 'Dustin', 7, 45);
INSERT INTO Sailors VALUES (29, 'Brutus', 1, 33);
INSERT INTO Sailors VALUES (31, 'Lubber', 8, 55);
INSERT INTO Sailors VALUES (32, 'Andy', 8, 25);
INSERT INTO Sailors VALUES (58, 'Rusty', 10, 35);
INSERT INTO Sailors VALUES (64, 'Horatio', 7, 35);
INSERT INTO Sailors VALUES (71, 'Zorba', 10, 16);
INSERT INTO Sailors VALUES (74, 'Horatio', 9, 35);
INSERT INTO Sailors VALUES (85, 'Horatio', 3, 25);
INSERT INTO Sailors VALUES (95, 'bob', 3, 63);

/* INSERT VALUES INTO BOATS TABLE*/
INSERT INTO Boats VALUES (101, 'Interlake', 'blue');
INSERT INTO Boats VALUES (102, 'Interlake', 'red');
INSERT INTO Boats VALUES (103, 'Clipper', 'green');
INSERT INTO Boats VALUES (104, 'Marine', 'red');
INSERT INTO Boats VALUES (105, 'Clipper', 'black');
INSERT INTO Boats VALUES (106, 'Marine', 'grey');
INSERT INTO Boats VALUES (107, 'Interlake', 'pink');
INSERT INTO Boats VALUES (108, 'Marine', 'black');
INSERT INTO Boats VALUES (109, 'Clipper', 'blue');
INSERT INTO Boats VALUES (110, 'Marine', 'black');

/* INSERT VALUES INTO RESERVES TABLE*/
INSERT INTO Reserves VALUES (22, 101, '1998-10-10');
INSERT INTO Reserves VALUES (22, 102, '1998-10-10');
INSERT INTO Reserves VALUES (22, 103, '1998-08-10');
INSERT INTO Reserves VALUES (22, 104, '1998-07-10');
INSERT INTO Reserves VALUES (31, 102, '1998-11-10');
INSERT INTO Reserves VALUES (31, 103, '1998-06-11');
INSERT INTO Reserves VALUES (31, 104, '1998-12-11');
INSERT INTO Reserves VALUES (64, 101, '1998-05-09');
INSERT INTO Reserves VALUES (64, 102, '1998-08-09');
INSERT INTO Reserves VALUES (74, 103, '1998-08-09');

       
