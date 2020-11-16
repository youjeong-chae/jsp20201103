-- CHAP01 14p ~ 41p
desc department; 

SELECT * FROM employee;
SELECT eno, ename FROM employee;

SELECT ename, salary, salary*12 FROM employee;
SELECT ename, salary, job, dno, commission, salary*12, salary*12+commission FROM employee;
SELECT ename, salary, job, dno, nvl(commission, 0), salary*12, salary*12+nvl(commission, 0) FROM employee;

SELECT ename, salary*12+nvl(commission, 0) 연봉 FROM employee;
SELECT ename, salary*12+nvl(commission, 0) AS 연봉 FROM employee;
SELECT ename, salary*12+nvl(commission, 0) "연  봉" FROM employee;

SELECT dno FROM employee;
SELECT distinct dno FROM employee;

desc dual;
SELECT*FROM dual;

SELECT sysdate from department;
SELECT sysdate from dual;

-- CHAP02 44p ~ 64p
SELECT * FROM employee WHERE salary >= 1500;
SELECT * FROM employee WHERE dno=10;

SELECT * FROM employee WHERE ename=SCOTT;
SELECT * FROM employee WHERE ename='SCOTT';

SELECT * FROM employee WHERE hiredate<='1981/01/01';

SELECT * FROM employee WHERE dno=10 AND job='MANAGER';
SELECT * FROM employee WHERE dno=10 OR job='MANAGER';
SELECT * FROM employee WHERE NOT dno=10;
SELECT * FROM employee WHERE dno<>10;
SELECT * FROM employee WHERE salary>=1000 AND salary<=1500;
SELECT * FROM employee WHERE salary<1000 OR salary>1500;
SELECT * FROM employee WHERE commission=300 or commission=500 or commission=1400;

SELECT * FROM employee WHERE salary BETWEEN 1000 and 1500;
SELECT * FROM employee WHERE salary>=1000 and salary<=1500;

SELECT * FROM employee WHERE salary NOT BETWEEN 1000 and 1500;
SELECT * FROM employee WHERE salary<1000 or salary>1500;

SELECT * FROM employee WHERE hiredate BETWEEN '1982/01/01' and '1982/12/31';

-- from 다음은 테이블 테이블에도 별칭을 줄 수 있음(질문함)
SELECT e.*, commission 수수료 FROM employee e WHERE commission IN(300, 500, 1400);

SELECT * FROM employee WHERE commission IN(300, 500, 1400);
SELECT * FROM employee WHERE commission=300 OR commission=500 OR commission=1400;

SELECT * FROM employee WHERE commission<>300 AND commission<>500 AND commission<>1400;
SELECT * FROM employee WHERE commission NOT IN(300, 500, 1400);

SELECT * FROM employee WHERE ename LIKE 'F%';
SELECT * FROM employee WHERE ename='F'; 

SELECT * FROM employee WHERE ename LIKE '%M%';

SELECT * FROM employee WHERE ename LIKE '%N';

SELECT * FROM employee WHERE ename LIKE '_A';
SELECT * FROM employee WHERE ename LIKE '_A%';
SELECT * FROM employee WHERE ename LIKE '__A%';
SELECT * FROM employee WHERE ename NOT LIKE '%A%';

SELECT ename, dno, commission FROM employee;

SELECT * FROM employee WHERE commission=null;

SELECT * FROM employee WHERE commission IS null;
SELECT * FROM employee WHERE commission IS NOT null;

-- 105
SELECT length('OracleMania'), length('오라클매니아') from dual;
SELECT lengthb('OracleMania'), lengthb('오라클매니아') from dual;