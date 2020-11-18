SELECT manager FROM employee 
WHERE eno = 7499;

SELECT ename FROM employee
WHERE eno = 7698;

SELECT ename FROM employee
WHERE eno = (SELECT manager 
             FROM employee 
             WHERE eno = 7499);
             
SELECT ename FROM employee
WHERE salary > (SELECT salary
                FROM employee
                WHERE eno = 7499);

SELECT ename FROM employee
WHERE salary > (SELECT salary
                FROM employee);
                
-- ���� �� ���� ����
/*
IN        ���� �ϳ��� ������
ANY(SOME) �ϳ� �̻��� �����ϸ�
ALL       ��� �����ϸ�
*/

SELECT dno 
FROM department
WHERE dno <= 20;

SELECT ename, dno 
FROM employee
WHERE dno IN (SELECT dno 
              FROM department
              WHERE dno <= 20);

SELECT eno, ename
FROM employee
WHERE salary IN (SELECT MIN(salary)
                 FROM employee
                 GROUP BY dno);
                 
SELECT eno, ename
FROM employee
WHERE (dno, salary) IN (SELECT dno, MIN(salary)
                         FROM employee
                         GROUP BY dno);
                 
SELECT dno, MIN(salary)
FROM employee
GROUP BY dno;
