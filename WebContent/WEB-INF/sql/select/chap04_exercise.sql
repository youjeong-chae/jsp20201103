-- 102
SELECT 'Oracle mania',
    UPPER('Oracle mania'),
    LOWER('Oracle mania'),
    INITCAP('Oracle mania') 
FROM dual;

SELECT ename, LOWER(ename), job, initcap(job) from employee;

SELECT eno, ename, dno FROM employee WHERE ename='scott';
SELECT eno, ename, dno FROM employee WHERE LOWER(ename)='scott';
SELECT eno, ename, dno FROM employee WHERE INITCAP(ename)='Scott';

-- 105
SELECT length('OracleMania'), length('오라클매니아') FROM dual;
SELECT lengthb('OracleMania'), lengthb('오라클매니아') FROM dual;

--106
SELECT 'Oracle', 'mania', concat('Oracle', 'mania') FROM dual;
SELECT SUBSTR('Oracle mania', 4, 3), SUBSTR('Oracle mania', -4, 3) FROM dual;
SELECT * FROM employee WHERE SUBSTR(ename, -1, 1) = 'N';
SELECT * FROM employee WHERE SUBSTR(hiredate, 1, 2) ='87';

SELECT SUBSTR('Oracle mania', 4, 3), 
       SUBSTRB('Oracle mania', 4, 3)
FROM dual;

SELECT SUBSTR('오라클매니아', 4, 3), 
       SUBSTRB('오라클매니아', 4, 3)
FROM dual;

-- 109
SELECT INSTR('Oracle mania','a') FROM dual;
SELECT INSTR('Oracle mania', 'a', 5, 2) FROM dual;

SELECT INSTR('오라클매니아', '라'),
      INSTRB('오라클매니아', '라')
FROM dual;

SELECT * FROM employee WHERE INSTR(ename, 'R', 3, 1)=3;

SELECT LPAD(salary, 10, '*') FROM employee;
SELECT RPAD(salary, 10, '*') FROM employee;

SELECT '  Oracle mania  ',
    LTRIM('  Oracle mania  '),
    RTRIM('  Oracle manie  ')
FROM dual;

SELECT 'Oracle mania', TRIM('O' FROM 'Oracle mania') FROM dual;
SELECT TRIM('  Oracle mania  ') FROM dual;

-- 114
SELECT 98.7654,
    ROUND(98.7654),
    ROUND(98.7654, 2),
    ROUND(98.7654, -1)
FROM dual;

SELECT 98.7654,
    TRUNC(98.7654),
    TRUNC(98.7654, 2),
    TRUNC(98.7654, -1)
FROM dual;

SELECT MOD(31, 2),
       MOD(31, 5),
       MOD(31, 8)
FROM dual;

SELECT ename, salary, MOD(salary, 500) FROM employee;

-- 117
SELECT sysdate FROM dual;

SELECT SYSDATE - 1 어제,
       SYSDATE 오늘,
       SYSDATE + 1 내일
FROM dual;

SELECT ROUND(SYSDATE-HIREDATE) 근무일수 FROM employee;
SELECT SYSDATE-HIREDATE 근무일수 FROM employee;

SELECT hiredate, TRUNC(HIREDATE, 'MONTH') FROM employee;

SELECT ename, sysdate, hiredate, TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) FROM employee;

SELECT ename, hiredate, ADD_MONTHS(hiredate, 6) FROM employee;

SELECT SYSDATE, NEXT_DAY(SYSDATE,'토요일') FROM dual;

SELECT ename, hiredate, LAST_DAY(hiredate) FROM employee;

-- 124
SELECT ename, hiredate, 
    TO_CHAR(hiredate, 'YY-MM'),
    TO_CHAr(hiredate, 'YYYY/MM/DD DAY'),
    TO_CHAr(hiredate, 'YYYY/MON/DD DY')
FROM employee;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD, HH24:MI:SS') FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD, HH:MI:SS') FROM dual;

SELECT ename, TO_CHAR(salary, 'L999,999') FROM employee;
SELECT ename, TO_CHAR(salary, 'L000,000.') FROM employee;

SELECT ename, hiredate FROM employee WHERE hiredate=19810220;
SELECT ename, hiredate FROM employee WHERE hiredate=TO_DATE(19810220,'YYYYMMDD');

SELECT '100,000'-'50,000' FROM dual;
SELECT TO_NUMBER('100,000','999,999') - TO_NUMBER('50,000','999,999') FROM dual;

NVL(commission, 0)
NVL(hiredate, '2011/5/10')
NVL(job, 'MANAGER')

SELECT ename, salary, commission, 
    NVL(commission, 0),
    salary*12+NVL(commission, 0)
FROM employee ORDER BY job;

SELECT ename, salary, commission, 
    NVL2(commission, salary*12+commission, salary*12) 
FROM employee ORDER BY job;

SELECT NULLIF('A', 'A'), NULLIF('A', 'B') FROM dual;

SELECT ename, salary, commission, 
    COALESCE(commission, salary, 0) 
FROM employee
ORDER BY job;

SELECT ename, dno, 
    DECODE(dno, 10, 'ACCOUNTING', 
                20, 'RESEARCH',
                30, 'SALES',
                40, 'OPERATIONS',
                'DEFAULT') AS DNAME
FROM employee
ORDER BY dno;

SELECT ename, dno, 
    CASE WHEN dno=10 THEN 'ACCOUNTING'
         WHEN dno=20 THEN 'RESEARCH'
         WHEN dno=30 THEN 'SALES'
         WHEN dno=40 THEN 'OPERATIONS'
         ELSE 'DEFAULT' 
    END AS DNAME
FROM employee
ORDER BY dno;