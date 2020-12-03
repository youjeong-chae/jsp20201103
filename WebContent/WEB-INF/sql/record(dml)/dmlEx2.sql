-- 
CREATE TABLE data_type_ex1
(
num1 NUMBER,
num2 NUMBER(2),
num3 NUMBER(3, 2)
);
INSERT INTO data_type_ex1 (num1)
VALUES (0);
INSERT INTO data_type_ex1 (num1)
VALUES (0.01);
INSERT INTO data_type_ex1 (num1)
VALUES (99999999999);
INSERT INTO data_type_ex1 (num2)
VALUES (0);
INSERT INTO data_type_ex1 (num2)
VALUES (5.5); -- 반올림
INSERT INTO data_type_ex1 (num2)
VALUES (99);
INSERT INTO data_type_ex1 (num2)
VALUES (100);
INSERT INTO data_type_ex1 (num3)
VALUES (0.01);
INSERT INTO data_type_ex1 (num3)
VALUES (0.015); -- 반올림
INSERT INTO data_type_ex1 (num3)
VALUES (9.015); -- 반올림
INSERT INTO data_type_ex1 (num3)
VALUES (10.015); -- x
COMMIT;
SELECT * FROM data_type_ex1;

-- 문자열
CREATE TABLE data_type_ex2
(
char1 CHAR(3),
vchar2 VARCHAR2(6)
);
INSERT INTO data_type_ex2
(char1) VALUES ('');
INSERT INTO data_type_ex2
(char1) VALUES ('a');
INSERT INTO data_type_ex2
(char1) VALUES ('abc');
INSERT INTO data_type_ex2
(char1) VALUES ('abcd'); -- x

INSERT INTO data_type_ex2
(vchar2) VALUES ('abc');
INSERT INTO data_type_ex2
(vchar2) VALUES ('abcdef');
INSERT INTO data_type_ex2
(vchar2) VALUES ('abcdefg');

INSERT INTO data_type_ex2
(vchar2) VALUES ('한');
INSERT INTO data_type_ex2
(vchar2) VALUES ('한글');
INSERT INTO data_type_ex2
(vchar2) VALUES ('한글날');
COMMIT;
SELECT * FROM data_type_ex2;


-- 날짜
-- DATE
CREATE TABLE data_type_ex3
(
date1 DATE
);
SELECT sysdate FROM DUAL;
INSERT INTO data_type_ex3
VALUES (sysdate);
INSERT INTO data_type_ex3
VALUES ('2020/11/01');
INSERT INTO data_type_ex3
VALUES (TO_DATE('2020-10-10', 'YYYY-MM-DD'));
INSERT INTO data_type_ex3
VALUES (TO_DATE('2020-09-09 17:33:22', 'YYYY-MM-DD HH24:MI:SS'));
SELECT * FROM data_type_ex3;
SELECT TO_CHAR(date1, 'YYYY-MM-DD HH24:MI:SS')
FROM data_type_ex3;
COMMIT;

-- 책(229쪽)
CREATE TABLE emp_copy
AS
SELECT eno, ename, job, hiredate, dno
FROM employee
WHERE 0=1;

INSERT INTO emp_copy
VALUES (7000, 'CANDY', 'MANAGER', '2012/05/01', 10);

INSERT INTO emp_copy
VALUES (7000, 'CANDY', 'MANAGER', TO_DATE('2012/05/01', 'YYYY/MM/DD'), 10);

SELECT * FROM emp_copy;

-- 책 (230쪽)
INSERT INTO emp_copy
VALUES (7010, 'TOM', 'MANAGER',
TO_DATE('2012,05,01', 'YYYY,MM,DD'), 20);

INSERT INTO emp_copy
VALUES (7020, 'JERRY', 'SALESMAN', SYSDATE, 30);

SELECT * FROM emp_copy;