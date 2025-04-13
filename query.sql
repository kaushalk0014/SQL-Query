--Data Definition Langusge (DDL)
	--which is used to define the database internal structure and pattern
		--Create      			Rename
		--Alter 				DROP
		--Truncate

--Data Manipulation Langusge
	--Which is used to manipulate the data in database by using different commonds
		
		--INSERT			UPDATE
		--DELETE
	
--Data Query Langusge
	--which helps to fetch data using select statement

--To create sql view
		
		CREATE VIEW app_db.high_earner AS 
		SELECT id, first_name, last_name, email, department, salary 
		FROM app_db.employee 
		WHERE salary > 80000;

-- To run slq view we need to use below query
		
		select * from app_db.high_earner;
		
-- Write a query (find second highest salary in a table)
	
	select max(salary) 
	from employee where 
	salary < (select max(salary) 
	from employee);
	
--If employee having more then same salary then we use below one
	
	select first_name,salary department 
	from employee where salary = (
		select max(salary) from employee where salary < (
					select max(salary) from employee
					)
			);

--salary having more then one records the above sql query will return more then one

	select distinct salary 
	from employee order by salary desc limit 1 offset 1;
	
	-- limit means, how many recors we want
	-- offset nothing but row index(how many records we want to skip)
	
--Using Dense_Rank() (for advance SQL analytic function)
	select salary from (
				select salary, Dense_Rank() over(order by salary desc)
				as rank
				from employee
			)
			as ranked where rank =2;
			
  
    select distinct salary  from (select salary, dense_rank() over (order by salary desc) as rnks
	from app_db.employee) as ranked where rnks=2;
	
	--above sql query will we return unique row( If se not appling distinct then will 
	--return multiple with same salary

-- Find Nth highest salary
	
	select destinct salary
	from employee e1 where (
		select count(distinct salary)
		from employee e2
		where e2.salary>e1.salary
	) = N-1;
	
-- Find all duplicate records by first_name

	select first_name, count(*) from employee
	group by first_name
	having count(*)>1;
	
--Find employee with the highest salary in each department
	
	select * from employee e where
	salary =(select max(salary) from employee
	where department=e.department;
	
--Employees Hired in the last 6 MONTHS_BETWEEN
	
	select * from employee
	where hire_date>=CURDATE()-INTERVAL-6 MONTH;
	
--department wise Average salary
		select department, avg(salary)
		as avg_salary
		from employee
		group by department;
		
--Count of Employees i each department
			
	Select department, count(*) as total_employees
	from employee group by department;
	
-- Find employee with same salary

	select salary, count(*) as count
	from employee
	group by salary
	having count(*)>1;
	
-- self join employee and their manager

	select e.first_name as employee, m.first_name as manager
	from employee e
	left join employee m on 
	e.manager_id=m.id;
	
-- Retrive employee with Null value in manager
	
	select *from employee
	where manager_id is null;
	
-- Find emploees whose name start with 'A'

	select * from employee where name like 'A%';
	
-- Top 3 salaries

	select distinct salary 
	from employee
	order by salary desc
	limit 3;
	
-- Total salary per(each) department

	select depertment, sum(salary) as total_salary
	from employee
	group by department;
	
-- Employees who earn more then department Average
	
	select * from employee e1
	where salary>(
				select avg(salary)
				from employee
				where department=e1.department
			);
		
-- Using CASE Grade Employees by salary
	
	select first_name, salary
		case 
			when salary>=8000 then 'high'
			when salary>=5000 then 'Medium'
		else 'Low'
	end as Grade
	from employee;
	
-- Using window function Rank salaries

	select first_name, salary
	Rank() over (order by salary desc)
	as salary_rank
	from employee;
	
-- Retirieve cmmon records from two tale

	select * from employee INTERSECT
	select * from from employee BACKUP;

-- List employee with same hire DATE
	
	select hire_date, count(*) from employee
	group by hire_date
	having count(*)>1;
	
-- Find the youngest and olderst employee
	select * from 
	employee where hire_date= (select max(hire_date) from employee)
	or hire_date = (select min(hire_date) from employee;

-- Create sql view
	
	create view view_name as  
	select column1, column2, col....
	from table_name where condition;
	
	create view employee_view as select first_name, last_name, 
	salary from employee where salary > 5000;
	
-- how to use view in sql
	select * from view_name;
	
-- If we want to change the view
	
	create or replace view high_earnersnas as select id, first_name, salary,
	department_id from employee where salary>80000;

-- To drop view
	drop view view_name

	
			
	
		
		