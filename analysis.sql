/*********************************************************************************************************
Written by: Skip Hobba
Date: 20200502

This file has multiple sections for each requirement for the SQL homework assigned in
GA Tech Data & Anlaytics Bootcamp.
*********************************************************************************************************/

/*********************************************************************************************************
Requirement 1: List the following details of each employee: employee number, last name, first name, gender, and salary.
Notes: Selected data from employees table, with join to salaries table for Salary field. Remaned fields for better viewing. 
*********************************************************************************************************/
select 
emp.emp_no as "Employee Number",
emp.last_name as "Last Name",
emp.first_name as "First Name",
emp.gender as "Gender",
sal.salary::money as Salary
from employees emp
	left join salaries sal
		on emp.emp_no = sal.emp_no
;

/*********************************************************************************************************
Requirement 2: List employees who were hired in 1986.
Notes: simple select with year - a few ways to do this, date_part is typically less sloppy.
*********************************************************************************************************/
select * from employees
where date_part('year', hire_date) = 1986;

/*********************************************************************************************************
Requirement 3: List the manager of each department with the following information: department number,
			   department name, the manager's employee number, last name, first name,
			   and start and end employment dates.
Notes: Multiple to and from dates are listed, was unsure which was required for this exercise, 
	   assumed it was department start and end date, as employees can move between departments... 
*********************************************************************************************************/
select
dept.dept_no as "Department Number",
dept.dept_name as "Department Name",
deptm.emp_no as "Manager Employee Number",
emp.last_name as "Last Name",
emp.first_name as "First Name",
deptm.from_date as "Department Hire Date",
deptm.to_date as "Department End Date"
from departments dept
	left join dept_manager deptm
		on dept.dept_no = deptm.dept_no
	left join employees emp
		on deptm.emp_no = emp.emp_no;

/*********************************************************************************************************
Requirement 4: List the department of each employee with the following information:
			   employee number, last name, first name, and department name.
Notes: This will show the data required - however, it should include department from and to dates, 
	   as you will get duplicate records for each employee. 
*********************************************************************************************************/
select 
emp.emp_no as "Employee Number",
emp.last_name as "Last Name",
emp.first_name as "First Name",
dept.dept_name as "Department Name"
from employees emp
	left join dept_emp depte
		on emp.emp_no = depte.emp_no
	left join departments dept
		on depte.dept_no = dept.dept_no
;

/*********************************************************************************************************
Requirement 5: List all employees whose first name is "Hercules" and last names begin with "B."
Notes: Simple query use both equal and like terms
*********************************************************************************************************/
select 
emp.emp_no as "Employee Number",
emp.birth_date as "Date of Birth",
emp.first_name as "First Name",
emp.last_name as "Last Name",
emp.gender as "Gender",
emp.hire_date as "Hire Date"
from employees emp
where emp.first_name = 'Hercules'
	and emp.last_name like 'E%'
;


/*********************************************************************************************************
Requirement 6: List all employees in the Sales department, including their employee number, last name, first name, and department name.
Notes: This doesn't define if all Sales employees or current (meaning those where end date is in furture). 
	   The commented line can be removed to pull this data.
*********************************************************************************************************/
select 
emp.emp_no as "Employee Number",
emp.last_name as "Last Name",
emp.first_name as "First Name",
dept.dept_name as "Department Name"
from employees emp
	left join dept_emp depte
		on emp.emp_no = depte.emp_no
	left join departments dept
		on depte.dept_no = dept.dept_no
where dept.dept_name = 'Sales'
	--and date_part('year', hire_date) = 1999
;

/*********************************************************************************************************
Requirement 7: List all employees in the Sales and Development departments, 
			including their employee number, last name, first name, and department name.
Notes: Same comments as above... Used () around departments to ensure the "or" and "and" statments worked properly together
*********************************************************************************************************/
select 
emp.emp_no as "Employee Number",
emp.last_name as "Last Name",
emp.first_name as "First Name",
dept.dept_name as "Department Name"
from employees emp
	left join dept_emp depte
		on emp.emp_no = depte.emp_no
	left join departments dept
		on depte.dept_no = dept.dept_no
where (dept.dept_name = 'Sales' or dept.dept_name = 'Development')
	--and date_part('year', hire_date) = 1999
;


/*********************************************************************************************************
Requirement 7: In descending order, list the frequency count of employee last names
			   , i.e., how many employees share each last name.
Notes: Selected Data, counted instances, order by 2, which uses second column. 
*********************************************************************************************************/
select 
emp.last_name as "Last Name",
count(*) as "Count of Name"
from employees emp
group by emp.last_name
order by 2 desc;