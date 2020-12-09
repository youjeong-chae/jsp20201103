-- table �����
-- CREATE TABLE

CREATE TABLE table1 (
 col1 NUMBER(3, 1), -- �� 3�� ���̰� �Ҽ��� 1
 col2 VARCHAR2(6),  -- �������� ���ڿ� 6bytes����
 col3 CHAR(4),      -- �������� ���ڿ� 4bytes
 col4 DATE          -- ��¥�ð�
);
SELECT * FROM table1;
DESC table1;
SELECT * FROM department;

-- DATA TYPE (å 17��)
-- ��, ���ڿ�, ��¥�ð�
-- ��
-- NUMBER
-- NUMBER(��)
--   ex)���� 3�̸� 1000�̻� ǥ�� ����
-- NUMBER(��1, ��2)
--   ex)��1�� �ѱ���, ��2�� �Ҽ������� ����
--      NUMBER(3, 2) : 10�̻� ǥ�� ����

-- ���ڿ�
-- VARCHAR2(��) : ���� ����
-- ��: byte��
-- CHAR(��) : ���� ����
-- ��: byte��


-- ��¥�ð�
-- DATE


-- å ���� (207��)
CREATE TABLE dept (
    dno NUMBER(2),
    dname VARCHAR2(14),
    loc VARCHAR2(13)
);
SELECT * FROM dept;
DESC dept;

-- �̹� �ִ� ���̺� ����
-- 1. ���� ������ table �����
-- 2. ��table�� select -> ��table insert

CREATE TABLE new_table
AS
SELECT * FROM old_table;

-- å ���� (207��)
CREATE TABLE dept_second
AS
SELECT * FROM department;
DESC dept_second;
DESC department;
SELECT * FROM dept_second;

-- å ���� (208��)
CREATE TABLE dept20
AS
SELECT eno, ename, salary*12 annsal
FROM employee
WHERE dno=20;
DESC dept20;
DESC employee;

-- å ���� (209��)
CREATE TABLE dept_forth
AS
SELECT dno, dname
FROM department
WHERE 0=1;
SELECT * FROM department;
SELECT * FROM dept_forth;