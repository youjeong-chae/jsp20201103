 SELECT commission, nvl(commission, 0) from employee;
 
 SELECT SUM(salary) FROM employee;
 SELECT AVG(salary) FROM employee;
 SELECT MIN(salary) FROM employee;
 SELECT MAX(salary) FROM employee;
 
 SELECT COUNT(salary) FROM employee;
 
 SELECT * FROM employee;
 SELECT COUNT(*) FROM employee;
 
 
 SELECT COUNT(commission) FROM employee;
 SELECT SUM(commission) FROM employee;
 SELECT MAX(commission) FROM employee;
 SELECT MIN(commission) FROM employee;
 SELECT AVG(commission) FROM employee;
 
 SELECT COUNT(JOB) FROM employee;
 SELECT DISTINCT(job) FROM employee;
 SELECT COUNT(DISTINCT(job)) FROM employee;
 
 SELECT ename, SUM(salary) FROM employee;
 SELECT ename, MAX(salary) FROM employee;
 
 SELECT ename FROM employee
 WHERE salary = (SELECT MAX(salary) FROM employee);