 -- 207p
 CREATE TABLE dept(
        dno NUMBER(2),
        dname VARCHAR2(14),
        loc VARCHAR2(13));
        
DESC dept;

CREATE TABLE dept_second 
AS 
SELECT *
FROM department;

SELECT * FROM dept_second;

CREATE TABLE dept20
AS
SELECT eno, ename, salary * 12 annsal
FROM employee
WHERE dno=20;

SELECT * FROM dept20;

CREATE TABLE dept_third
AS 
SELECT dno, dname
FROM dept
WHERE 0=1;

DESC dept_third;

SELECT * FROM dept_third;