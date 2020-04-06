CREATE DATABASE Students;
USE Students;
DROP TABLE students;
CREATE TABLE students ( 
       sid   INTEGER,  
       gname VARCHAR(30)  NOT NULL,  
       fname VARCHAR(30)  NOT NULL,  
       age   INTEGER      NOT NULL,  
       gpa   REAL    NOT NULL,
       CONSTRAINT pk_student    
       PRIMARY KEY (sid) );
CREATE TABLE enrolled (  
       sid   INTEGER,  
       cid   VARCHAR(20),  
       grade CHAR(1)     NOT NULL,
	   CONSTRAINT pk_enrolled    
       PRIMARY KEY (sid, cid),
       CONSTRAINT fk_enrolled_sid    
       FOREIGN KEY (sid)    
       REFERENCES students(sid) );

INSERT INTO students (sid, gname, fname, age, gpa) 
       VALUES (682634, 'John', 'Smith',20, 3.0);
INSERT INTO students (sid, gname, fname, age, gpa) 
       VALUES (632461, 'Phu', 'Nguyen',21, 1.0);
INSERT INTO students (sid, gname, fname, age, gpa) 
       VALUES (612352, 'Thong', 'Nguyen', 19, 2.7);
INSERT INTO students (sid, gname, fname, age, gpa) 
       VALUES (603111, 'Tam', 'Quach', 20, 0.8);
INSERT INTO students (sid, gname, fname, age, gpa)
       VALUES (123456, 'Donald', 'Trump', 23, 0.1);
       
INSERT INTO enrolled (sid, cid, grade)     
       VALUES (123456, 'MATH2239', 'D');
INSERT INTO enrolled (sid, cid, grade)     
       VALUES (123456, 'MATH2240', 'D');
INSERT INTO enrolled (sid, cid, grade)     
       VALUES (682634, 'ISYS2077', 'A');
INSERT INTO enrolled (sid, cid, grade)     
       VALUES (632461, 'ISYS2040', 'C');