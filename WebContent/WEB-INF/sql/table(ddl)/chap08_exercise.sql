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

-- 210p
ALTER TABLE dept20
ADD(birth DATE);

DESC dept20;

SELECT * FROM dept20;

ALTER TABLE dept20
MODIFY ename VARCHAR2(30);

DESC dept20;

ALTER TABLE dept20
DROP COLUMN ename;

DESC dept20;

ALTER TABLE dept20
SET UNUSED(eno);

DESC dept20;

ALTER TABLE dept20
DROP UNUSED COLUMNS;

RENAME dept20 TO emp20;

DESC dept20;

DESC emp20;

drop table emp20;

desc emp20;

truncate table dept_second;

select * from dept_second;

desc dept_second;

select table_name from user_tables;

select owner, table_name from all_tables;