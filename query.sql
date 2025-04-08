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


		
		