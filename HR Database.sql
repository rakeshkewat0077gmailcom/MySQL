use hr ;
1. Write a query to display the names (first_name, last_name) using alias name “First Name", "Last 
Name"? -
Ans. select first_name "First Name",last_name "Last Name" from employees;

2. Write a query to get unique department ID from employee table
Ans. select distinct department_id from employees;

3. Write a query to get all employee details from the employee table order by first name, descending -
Ans. select * from employees
	 order by first_name desc;
     
4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is 
calculated as 15% of salary) -
Ans. select first_name,last_name,salary,salary*0.15 pf from employees;

5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of 
salary -
Ans. select employee_id,first_name,last_name,salary from employees
order by salary asc;

6. Write a query to get the total salaries payable to employees -
Ans. select sum(salary) from employees; 

7. Write a query to get the maximum and minimum salary from employees table -
Ans. select max(salary), min(salary) from employees;

8. Write a query to get the average salary and number of employees in the employees table -
Ans. select avg(salary),count(employee_id) from employees;

9. Write a query to get the number of employees working with the company -
Ans. select count(*) from employees;

10. Write a query to get the number of jobs available in the employees table -
Ans. select count(distinct job_id) from employees;

11. Write a query get all first name from employees table in upper case -
Ans. select UPPER(first_name) 
	FROM employees;
    
12. Write a query to get the first 3 characters of first name from employees table -
Ans. select SUBSTRING(first_name,1,3) 
     FROM employees
     
13. Write a query to get first name from employees table after removing white spaces from both side -
 Ans. select TRIM(first_name) 
      FROM employees;
      
14. Write a query to get the length of the employee names (first_name, last_name) from employees table -
  Ans. select first_name,last_name, LENGTH(first_name)+LENGTH(last_name) 'Length of  Names' 
    FROM employees; 
    
15. Write a query to check if the first_name fields of the employees table contains numbers-
Ans. a) select * FROM employees 
        WHERE  first_name REGEXP '[0-9]';   
	 b) select * FROM employees WHERE concat('',first_name * 1) = first_name;
 
16. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is 
     not in the range $10,000 through $15,000 -
  Ans. select first_name, last_name, salary FROM employees 
	   WHERE salary NOT BETWEEN 10000 AND 15000;
       
17. Write a query to display the name (first_name, last_name) and department ID of all employees in 
	  departments 30 or 100 in ascending order -   
   Ans. select first_name, last_name, department_id
		FROM employees
        WHERE department_id IN (30, 100)
        ORDER BY  department_id asc; 
       
18. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is 
       not in the range $10,000 through $15,000 and are in department 30 or 100 -
    Ans.  select first_name, last_name, salary
		  FROM employees
		  WHERE salary NOT BETWEEN 10000 AND 15000
          and department_id in (30 , 100)
		  order by department_id;

19. Write a query to display the name (first_name, last_name) and hire date for all employees who were 
    hired in 1987 -
    Ans. select first_name, last_name, hire_date 
         FROM employees 
         WHERE YEAR(hire_date)  LIKE '1987%';  
         
20. Write a query to display the first_name of all employees who have both "b" and "c" in their first name -        
	Ans. select first_name
         FROM employees
         WHERE first_name LIKE '%b%'
         AND first_name LIKE '%c%';
         
21. Write a query to display the last name, job, and salary for all employees whose job is that of a 
	Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000 - 
   Ans. select last_name, job_id, salary
        FROM employees
		WHERE job_id IN ('IT_PROG', 'SH_CLERK')
        AND salary NOT IN (4500,10000, 15000); 
        
22. Write a query to display the last name of employees whose names have exactly 6 characters -
   Ans. select last_name FROM employees HAVING LENGTH(last_name) = 6
   
23. Write a query to display the last name of employees having 'e' as the third character -
    Ans. select last_name FROM employees WHERE last_name LIKE '__e%';
    Ans2. select LAST_NAME FROM employees WHERE SUBSTRING(LAST_NAME, 3, 1) = 'e';
         
24. Write a query to get the job_id and related employee's id
    Partial output of the query : -
    job_id Employees ID
    AC_ACCOUNT206
    AC_MGR 205
    AD_ASST 200
    AD_PRES 100
    AD_VP 101 ,102
    FI_ACCOUNT 110 ,113 ,111 ,109 ,112  
   Ans. select job_id, GROUP_CONCAT(employee_id, ' ')  'Employees ID' 
        FROM employees GROUP BY job_id; 
        
25. Write a query to update the portion of the phone_number in the employees table, within the phone 
    number the substring '124' will be replaced by '999' -
   Ans. select first_name,concat(left(phone_number,4),999,right(phone_number,5)) 
		from employees where phone_number like "%124%";
   
26. Write a query to get the details of the employees where the length of the first name greater than or 
    equal to 8 -
   Ans. select * FROM employees
        WHERE LENGTH(first_name) >= 8; 
        
27. Write a query to append '@example.com' to email field -
    Ans. select rpad(email,length(email)+12,'@example.com') from employees; 
    
28. Write a query to extract the last 4 character of phone numbers -
  Ans. select RIGHT(phone_number, 4) as 'Ph.No.' FROM employees; 
  
29. Write a query to get the last word of the street address -
  Ans. select location_id, street_address, 
       SUBSTRING_INDEX(REPLACE(REPLACE(REPLACE(street_address,',',' '),')',' '),'(',' '),' ',-1) 
       AS 'Last--word-of-street_address' 
        FROM locations;
        
30. Write a query to get the locations that have minimum street length -
    Ans.  select * FROM locations
         WHERE LENGTH(street_address) <= (SELECT  MIN(LENGTH(street_address)) 
         FROM locations);     
         
31. Write a query to display the first word from those job titles which contains more than one words -
    Ans. select job_title, SUBSTR(job_title,1, INSTR(job_title, ' ')-1)
	     FROM jobs;
         
32. Write a query to display the length of first name for employees where last name contain character 'c'
    after 2nd position -    
    Ans. select first_name, last_name FROM employees WHERE INSTR(last_name,'C') > 2;
    
33. Write a query that displays the first name and the length of the first name for all employees whose
    name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the
	employees' first names - 
    Ans. select first_name "Name",
         LENGTH(first_name) "Length"
         FROM employees
         WHERE first_name LIKE 'J%'
         OR first_name LIKE 'M%'
         OR first_name LIKE 'A%'
         ORDER BY first_name ;
         
34. Write a query to display the first name and salary for all employees. Format the salary to be 10
    characters long, left-padded with the $ symbol. Label the column SALARY -
   Ans. select first_name,
		LPAD(salary, 10, '$') SALARY
		FROM employees; 
        
35. Write a query to display the first eight characters of the employees' first names and indicates the
    amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in
    descending order of salary -    
	Ans. select left(first_name, 8),
         REPEAT('$', FLOOR(salary/1000)) 
         'SALARY($)', salary
         FROM employees
         ORDER BY salary desc;
         
 36. Write a query to display the employees with their code, first name, last name and hire date who hired
     either on seventh day of any month or seventh month in any year -  
     Ans. select employee_id,first_name,last_name,hire_date 
          FROM employees 
          WHERE POSITION("07" IN DATE_FORMAT(hire_date, '%d %m %Y'))>0;
          