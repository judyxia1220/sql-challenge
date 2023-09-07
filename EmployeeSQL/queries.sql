--View Tables:
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

--List the employee number, last name, first name, sex, and salary of each employee.
Select e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex, 
	s.salary
From employees as e 
left join salaries as s on e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
Select e.first_name,
	e.last_name,
	e.hire_date
From employees as e
Where hire_date between '1986-01-01' and '1986-12-31';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
From dept_manager as dm
inner join departments as d on dm.dept_no = d.dept_no
inner join employees as e on dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select de.dept_no,
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
From dept_emp as de
Inner join departments as d on de.dept_no = d.dept_no 
Inner join employees as e on de.emp_no = e.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
Select first_name,
	last_name,
	sex
From employees
Where first_name = 'Hercules' and last_name like'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
Select d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
From dept_emp as de
Inner join departments as d on de.dept_no = d.dept_no 
Inner join employees as e on de.emp_no = e.emp_no
Where dept_name='Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
From dept_emp as de
Inner join departments as d on de.dept_no = d.dept_no 
Inner join employees as e on de.emp_no = e.emp_no
Where dept_name='Sales' or dept_name='Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
Select last_name, Count (*) as Frequency
From employees
Group by last_name
Order by frequency desc;

