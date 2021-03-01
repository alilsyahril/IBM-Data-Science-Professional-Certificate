-- Retrieve all employees whose address is in Elgin,IL
select F_NAME , L_NAME
from EMPLOYEES
where ADDRESS LIKE '%Elgin,IL%' ;

-- Retrieve all employees who were born during the 1970's
select F_NAME , L_NAME
from EMPLOYEES
where B_DATE LIKE '197%' ;

-- Retrieve all employees in department 5 whose salary is between 60000 and 70000 
select *
from EMPLOYEES
where (SALARY BETWEEN 60000 and 70000)  and DEP_ID = 5 ;

-- Retrieve a list of employees ordered by department ID
select F_NAME, L_NAME, DEP_ID 
from EMPLOYEES
order by DEP_ID;

--  Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name
select F_NAME, L_NAME, DEP_ID
from EMPLOYEES
order by DEP_ID desc, L_NAME desc;

-- For each department ID retrieve the number of employees in the department
select DEP_ID, COUNT(*) as Count
from EMPLOYEES
group by DEP_ID;

-- For each department retrieve the number of employees in the department, and the average employees salary in the department and order by average salary
select DEP_ID, COUNT(*) as "Count", AVG(SALARY) as "Average"
from EMPLOYEES
group by DEP_ID
order by "Average";

-- Above condition but limit the result to departments with fewer than 4 employees
select DEP_ID, COUNT(*) as "Count", AVG(SALARY) as "Average"
from EMPLOYEES
group by DEP_ID
having count(*) < 4
order by "Average";

--alternative: if you want to use the label
select DEP_ID, NUM_EMPLOYEES, AVG_SALARY from
  ( select DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY from EMPLOYEES group by DEP_ID)
  where NUM_EMPLOYEES < 4
order by AVG_SALARY;

--  Multiple Tables
-- Retrieve a list of employees ordered in descending order by department name in Departements Table 
-- and within each department ordered alphabetically in descending order by last name
select D.DEP_NAME , E.F_NAME, E.L_NAME
from EMPLOYEES as E, DEPARTMENTS as D
where E.DEP_ID = D.DEPT_ID_DEP
order by D.DEP_NAME, E.L_NAME desc ;