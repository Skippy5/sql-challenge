/*********************************************************************************************************
Written by: Skip Hobba
Date: 20200502

This creates the tables for the GA Tech Bootcamp Data & Analytics bootcamp.
NOTE: the data being used is structured in a way that a primary key is only defined in employee and department tables
the other tables do not have a primary key. This isn't a best practice, but with the pre-defined data
it works for acedemic purposes. 
*********************************************************************************************************/

/*********************************************************************************************************
Drops tables if they already exist - skips is they do not. 
*********************************************************************************************************/
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

/*********************************************************************************************************
Create tables used in the exercise, only primary keys are in depoartments and employees tables. 
Foreign keys are used / defined throughout where psossible. 
*********************************************************************************************************/
CREATE TABLE departments (
	dept_no character varying(4) PRIMARY KEY,
	dept_name character varying(50)
);

CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY,
	birth_date date,
	first_name character varying(50),
	last_name character varying(50),
	gender character varying(50),
	hire_date date
);

CREATE TABLE dept_emp (
	emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no character varying(4),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	from_date date,
	to_date date
);

CREATE TABLE dept_manager(
	dept_no character varying(4),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	from_date date,
	to_date date
);

CREATE TABLE salaries(
	emp_no INTEGER,	
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary decimal,
	from_date date,
	to_date date
);

CREATE TABLE titles (
	emp_no INTEGER,	
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	title character varying(50),
	from_date date,
	to_date date
);
