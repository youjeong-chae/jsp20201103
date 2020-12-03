-- KEY 
-- : �� ���ڵ�(row)�� �����ϰ� ������ �� �ִ� �÷�(��)

-- PRIMARY KEY
-- �� ���ڵ�� �����ϰ� �����ϴ� �÷�
-- ������ �� : ������ �ʴ� ��
--   -> Ű �÷� ���� ����� ��õ
--      �ڵ����� �þ�� ����
-- : NOT NULL UNIQUE


CREATE TABLE const05 (
    email VARCHAR(30),
    name VARCHAR(30),
    ssn VARCHAR(30),
    address VARCHAR(30),
    birth DATE
);
SELECT * FROM const05;

CREATE TABLE const06 (
    id NUMBER PRIMARY KEY, 
    name VARCHAR2(30)
);
INSERT INTO const06 (id, name)
VALUES (1, 'a');
INSERT INTO const06 (id, name)
VALUES (null, 'b');
INSERT INTO const06 (id, name)
VALUES (1, 'c');
INSERT INTO const06 (id, name)
VALUES (2, 'd');
SELECT * FROM const06;
COMMIT;


-- foreign key
CREATE TABLE const07_emp
AS
SELECT * FROM employee;
CREATE TABLE const07_dep
AS
SELECT * FROM department;

SELECT eno, ename, dno FROM const07_emp;
SELECT * FROM const07_dep;
INSERT INTO const07_emp (eno, ename, dno)
VALUES (8787, 'ABC', 50);
COMMIT;

DESC department;
CREATE TABLE const08_dep
(
DNO NUMBER(2) PRIMARY KEY,
DNAME VARCHAR2(14),
LOC VARCHAR2(13)
);
INSERT INTO const08_dep
SELECT * FROM department;
COMMIT;
SELECT * FROM const08_dep;

CREATE TABLE const08_emp
(
name VARCHAR2(30),
dno NUMBER(2) REFERENCES const08_dep
);
INSERT INTO const08_emp (name, dno)
VALUES ('a', 10);
INSERT INTO const08_emp (name, dno)
VALUES ('b', 50);
INSERT INTO const08_emp (name, dno)
VALUES ('c', null);
COMMIT;