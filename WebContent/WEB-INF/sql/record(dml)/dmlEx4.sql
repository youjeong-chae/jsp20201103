-- UPDATE
-- �����͸� �����ϴ� ��ɹ�
-- UPDATE tname SET col1=val1, col2=val2, , , WHERE ,,
DROP TABLE dept_copy;
CREATE TABLE dept_copy
AS
SELECT * FROM department;

SELECT * FROM dept_copy;

-- å (232��)
UPDATE dept_copy
SET dname='HR';

-- å (233��)
UPDATE dept_copy
SET dname='PROGRAMMING', loc='SEOUL'
WHERE dno=10;
SELECT * FROM dept_copy;

COMMIT;

UPDATE dept_copy
SET loc=(
        SELECT loc
        FROM dept_copy
        WHERE dno=20
)
WHERE dno=10;
SELECT * FROM dept_copy;

-- å 234��
UPDATE dept_copy
SET dname=(SELECT dname 
            FROM dept_copy
            WHERE dno=30
),
loc=(SELECT loc
     FROM dept_copy
     WHERE dno=30)
WHERE dno=10;
SELECT * FROM dept_copy;

COMMIT;

-- DELETE
-- DELETE FROM tname WHERE 
SELECT * FROM dept_copy;

DELETE dept_copy
WHERE dno=10;

DELETE dept_copy;

COMMIT;

-- å 236��
DROP TABLE emp_copy;
CREATE TABLE emp_copy
AS
SELECT * FROM employee;
SELECT * FROM emp_copy;

DELETE emp_copy
WHERE dno=(SELECT dno
           FROM department
           WHERE dname='SALES');
COMMIT;

SELECT dno
FROM department
WHERE dname='SALES';