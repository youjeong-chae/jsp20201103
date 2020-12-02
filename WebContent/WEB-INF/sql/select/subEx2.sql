SELECT *
FROM employee
WHERE
ename='SMITH'
;
SELECT ename, dno
FROM employee
WHERE dno='20'
;
SELECT dno 
FROM employee
WHERE 
ename = 'SCOTT';

SELECT ename, dno
FROM employee
WHERE dno=(
            SELECT dno 
            FROM employee
            WHERE 
            ename = 'SCOTT'
);

SELECT ename, job, salary
FROM employee
WHERE
salary = (SELECT MIN(salary)
          FROM employee);
SELECT dno, min(salary)
FROM employee
GROUP BY dno
HAVING min(salary) > (SELECT MIN(salary)
                        FROM employee
                        WHERE dno=30);

SELECT MIN(salary)
FROM employee
WHERE dno=30;

-- 다중 행 서브 쿼리
-- IN
SELECT MIN(salary)
FROM employee
GROUP BY dno;

SELECT eno, ename, salary
FROM employee
WHERE salary IN (SELECT MIN(salary)
                    FROM employee
                    GROUP BY dno);
SELECT eno, ename, salary
FROM employee
WHERE (dno, salary) IN (SELECT dno, MIN(salary)
                        FROM employee
                        GROUP BY dno);

-- ANY, SOME
SELECT eno, ename, job, salary
FROM employee
WHERE salary < ANY (SELECT salary
                    FROM employee
                    WHERE job='SALESMAN')
AND job <> 'SALESMAN';

SELECT salary
FROM employee
WHERE job='SALESMAN';

-- ALL
SELECT eno, ename, job, salary
FROM employee
WHERE salary < ALL (SELECT salary 
                    FROM employee
                    WHERE job='SALESMAN')
AND job <> 'SALESMAN';

SELECT salary 
FROM employee
WHERE job='SALESMAN';