-- 195P 혼자해보기
-- 01 사원번호가 7788인 사원 표시하기
SELECT ename, JOB
FROM employee
WHERE JOB = (SELECT JOB 
             FROM employee 
             WHERE eno = 7788);
             
-- 02 사원번호가 7499인 사원보다 급여가 많은 사원 표시하기
SELECT ename, JOB
FROM employee 
WHERE salary > ANY (SELECT salary 
                   FROM employee
                   WHERE eno = 7499);
                   
-- 03 최소 급여를 받는 사원 표시하기
SELECT ename, JOB, salary
FROM employee
WHERE salary = (SELECT 
                MIN(salary)
                FROM employee);
                
-- 04 평균 급여가 가장 적은 사원의 담당 업무를 찾아 직급과 평균 급여 표시하기
SELECT JOB, round(AVG(salary), 1) 
FROM employee
GROUP BY JOB
HAVING round(AVG(salary), 1) = (SELECT MIN(round(AVG(salary), 1))
                                FROM employee
                                GROUP BY JOB);

-- 05 각 부서의 최소 급여를 받는 사원 표시하기 
SELECT ename, salary, dno 
FROM employee 
WHERE salary IN (SELECT MIN(salary)
                FROM employee 
                GROUP BY dno);
                
-- 06 담당 업무가 ANALYST인 사원보다 급여가 적은 사원 표시하기
SELECT eno, ename, JOB, salary 
FROM employee
WHERE salary < ANY (SELECT salary
                FROM employee
                WHERE JOB = 'ANALYST')
AND JOB <> 'ANALYST';

-- 07 부하직원이 없는 사원 표시하기
SELECT ename 
FROM employee 
WHERE eno IN (SELECT eno
            FROM employee
            WHERE MANAGER IS NULL);
            
-- 08 부하직원이 있는 사원 표시하기
SELECT ename 
FROM employee 
WHERE eno IN (SELECT eno
            FROM employee
            WHERE MANAGER IS NOT NULL);
            
-- 09 BLAKE와 동일한 부서에 속한 사원 표시하기
SELECT ename, hiredate 
FROM employee 
WHERE dno = (SELECT dno
            FROM employee
            WHERE ename = 'BLAKE')
AND ename <> 'BLAKE';

-- 10 급여가 평균 급여보다 많은 사원 표시하기
SELECT eno, ename
FROM employee
WHERE salary > (SELECT AVG(salary)
                    FROM employee)
                    ORDER BY salary ASC; 

-- 11 이름에 K가 포함된 사원과 같은 부서에서 근무하는 사원 표시하기
SELECT eno, ename
FROM employee
WHERE dno IN (SELECT dno
            FROM employee
            WHERE ename LIKE '%K%');

-- 12 DALLAS에서 근무하는 사원 표시하기
SELECT ename, dno, JOB 
FROM employee
WHERE dno = (SELECT dno
             FROM department
             WHERE loc='DALLAS');

-- 13 KING에게 보고하는 모든 사원의 이름과 급여를 표시하기
SELECT ename, salary
FROM employee
WHERE MANAGER = (SELECT eno 
                 FROM employee
                 WHERE ename = 'KING');

-- 14 RESEARCH에서 근무하는 사원 표시하기
select eno, ename, job
from employee
where dno = (select dno
             from department
             where dname = 'RESEARCH');
             
-- 15 평균 급여보다 많은 급여를 받고 이름에 M이 포함된 사원과 같은 부서에서 근무하는 사원 표시하기
select eno, ename, salary
from employee
where salary > (select avg(salary)
                from employee)
and dno in(select dno 
           from employee
           where ename like '%M%');
                
-- 16 평균 급여가 가장 적은 업무 표시하기
SELECT JOB, AVG(salary)
FROM employee
GROUP BY JOB 
HAVING AVG(salary) = (SELECT  MIN(AVG(salary))
                      FROM employee
                      GROUP BY JOB);

-- 17 담당 업무가 MANAGER인 사원이 소속된 부서와 동일한 부서의 사원 표시하기
select ename
from employee
where eno in (select MANAGER
               from employee);

