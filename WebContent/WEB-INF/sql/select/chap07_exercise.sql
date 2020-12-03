-- 189p SCOTT�� ������ �μ����� �ٹ��ϴ� ��� ����ϱ�
SELECT ename, dno
FROM employee 
WHERE dno = (SELECT dno
                FROM employee 
                WHERE ename='SCOTT');

-- 190p �ּ� �޿��� �޴� ����� �̸�, ��� ����, �޿� ����ϱ�
SELECT ename, JOB, salary
FROM employee
WHERE salary = (SELECT MIN(salary)
                FROM employee);
                
-- 190p ���� ������ HAVING �� ����ϱ�
SELECT dno, MIN(salary)
FROM employee 
GROUP BY dno
HAVING MIN(salary) > (SELECT MIN(salary)
                    FROM employee
                    WHERE dno=30);

-- 192p ���� �� �������� IN ����ϱ�
SELECT eno, ename
FROM employee
WHERE salary IN (SELECT MIN(salary)
                FROM employee
                GROUP BY dno);

-- 193p ANY ������ ����ϱ�
SELECT eno, ename, JOB, salary
FROM employee
WHERE salary < ANY (SELECT salary
                    FROM employee
                    WHERE JOB='SALESMAN')
AND JOB <> 'SALESMAN';

-- 194p ALL ������ ����ϱ�
SELECT eno, ename, JOB, salary
FROM employee
WHERE salary < ALL (SELECT salary
                    FROM employee
                    WHERE JOB='SALESMAN')
AND JOB <> 'SALESMAN';