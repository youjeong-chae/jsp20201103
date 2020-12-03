-- 195P ȥ���غ���
-- 01 �����ȣ�� 7788�� ��� ǥ���ϱ�
SELECT ename, JOB
FROM employee
WHERE JOB = (SELECT JOB 
             FROM employee 
             WHERE eno = 7788);
             
-- 02 �����ȣ�� 7499�� ������� �޿��� ���� ��� ǥ���ϱ�
SELECT ename, JOB
FROM employee 
WHERE salary > ANY (SELECT salary 
                   FROM employee
                   WHERE eno = 7499);
                   
-- 03 �ּ� �޿��� �޴� ��� ǥ���ϱ�
SELECT ename, JOB, salary
FROM employee
WHERE salary = (SELECT 
                MIN(salary)
                FROM employee);
                
-- 04 ��� �޿��� ���� ���� ����� ��� ������ ã�� ���ް� ��� �޿� ǥ���ϱ�
SELECT JOB, round(AVG(salary), 1) 
FROM employee
GROUP BY JOB
HAVING round(AVG(salary), 1) = (SELECT MIN(round(AVG(salary), 1))
                                FROM employee
                                GROUP BY JOB);

-- 05 �� �μ��� �ּ� �޿��� �޴� ��� ǥ���ϱ� 
SELECT ename, salary, dno 
FROM employee 
WHERE salary IN (SELECT MIN(salary)
                FROM employee 
                GROUP BY dno);
                
-- 06 ��� ������ ANALYST�� ������� �޿��� ���� ��� ǥ���ϱ�
SELECT eno, ename, JOB, salary 
FROM employee
WHERE salary < ANY (SELECT salary
                FROM employee
                WHERE JOB = 'ANALYST')
AND JOB <> 'ANALYST';

-- 07 ���������� ���� ��� ǥ���ϱ�
SELECT ename 
FROM employee 
WHERE eno IN (SELECT eno
            FROM employee
            WHERE MANAGER IS NULL);
            
-- 08 ���������� �ִ� ��� ǥ���ϱ�
SELECT ename 
FROM employee 
WHERE eno IN (SELECT eno
            FROM employee
            WHERE MANAGER IS NOT NULL);
            
-- 09 BLAKE�� ������ �μ��� ���� ��� ǥ���ϱ�
SELECT ename, hiredate 
FROM employee 
WHERE dno = (SELECT dno
            FROM employee
            WHERE ename = 'BLAKE')
AND ename <> 'BLAKE';

-- 10 �޿��� ��� �޿����� ���� ��� ǥ���ϱ�
SELECT eno, ename
FROM employee
WHERE salary > (SELECT AVG(salary)
                    FROM employee)
                    ORDER BY salary ASC; 

-- 11 �̸��� K�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� ��� ǥ���ϱ�
SELECT eno, ename
FROM employee
WHERE dno IN (SELECT dno
            FROM employee
            WHERE ename LIKE '%K%');

-- 12 DALLAS���� �ٹ��ϴ� ��� ǥ���ϱ�
SELECT ename, dno, JOB 
FROM employee
WHERE dno = (SELECT dno
             FROM department
             WHERE loc='DALLAS');

-- 13 KING���� �����ϴ� ��� ����� �̸��� �޿��� ǥ���ϱ�
SELECT ename, salary
FROM employee
WHERE MANAGER = (SELECT eno 
                 FROM employee
                 WHERE ename = 'KING');

-- 14 RESEARCH���� �ٹ��ϴ� ��� ǥ���ϱ�
select eno, ename, job
from employee
where dno = (select dno
             from department
             where dname = 'RESEARCH');
             
-- 15 ��� �޿����� ���� �޿��� �ް� �̸��� M�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� ��� ǥ���ϱ�
select eno, ename, salary
from employee
where salary > (select avg(salary)
                from employee)
and dno in(select dno 
           from employee
           where ename like '%M%');
                
-- 16 ��� �޿��� ���� ���� ���� ǥ���ϱ�
SELECT JOB, AVG(salary)
FROM employee
GROUP BY JOB 
HAVING AVG(salary) = (SELECT  MIN(AVG(salary))
                      FROM employee
                      GROUP BY JOB);

-- 17 ��� ������ MANAGER�� ����� �Ҽӵ� �μ��� ������ �μ��� ��� ǥ���ϱ�
select ename
from employee
where eno in (select MANAGER
               from employee);

