-- 14¡Æ©ø??, 8¡Æ©ø¢¯¡©
SELECT * FROM employee;
-- 4¡Æ©ø??, 3¡Æ©ø¢¯¡©
SELECT * FROM department;

SELECT * FROM employee, department;

SELECT eno, ename, dname FROM employee, department;
SELECT eno, ename, employee.dno edno, department.dno ddno, dname
FROM employee, department;

SELECT eno, ename, employee.dno edno, department.dno ddno, dname
FROM employee, department 
WHERE eno = 7369;

SELECT eno, ename, employee.dno edno, department.dno ddno, dname
FROM employee, department 
WHERE eno = 7369 AND employee.dno = department.dno;

-- equi join
SELECT * FROM employee, department
WHERE employee.dno = department.dno;

SELECT * FROM employee, department
WHERE employee.dno = department.dno
AND eno = 7369;

SELECT * FROM employee e, department d
WHERE e.dno = d.dno
AND e.eno = 7369;

SELECT e.eno, e.ename, e.dno, d.dname 
FROM employee e, department d
WHERE e.dno = d.dno;

-- natural join
SELECT * FROM employee natural join department;
SELECT * FROM employee natural join department
WHERE eno = 7788;

-- join using
SELECT * FROM employee JOIN department USING(dno);
SELECT * FROM employee JOIN department USING(dno)
WHERE eno = 7788;

-- join on
SELECT * FROM employee e JOIN department d ON e.dno = d.dno;
SELECT * FROM employee e JOIN department d ON e.dno = d.dno
WHERE eno = 7788;