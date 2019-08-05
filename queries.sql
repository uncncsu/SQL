--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_number, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM salaries
JOIN employees ON salaries.emp_number = employees.emp_number;
--2. List employees who were hired in 1986.
SELECT * FROM employees;
select employees.emp_number, employees.hire_date
from employees
where TO_CHAR(hire_date, 'YYYY') = TO_CHAR(hire_date, '1986')
order by hire_date ASC;
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name, and start and end employment dates.
SELECT * FROM managers;
SELECT * FROM departments;
SELECT * FROM department_employees;
SELECT * FROM employees;


SELECT
   managers.dept_number, 
   managers.emp_number, 
   managers.from_date, 
   managers.to_date,
   employees.first_name,
   employees.last_name,
   departments.dept_name
FROM
   managers
INNER JOIN employees ON employees.emp_number = managers.emp_number
INNER JOIN departments ON departments.dept_number = managers.dept_number;

--List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
SELECT
   department_employees.emp_number, 
   employees.first_name,
   employees.last_name,
   departments.dept_name
FROM
   employees
INNER JOIN department_employees ON employees.emp_number = department_employees.emp_number
INNER JOIN departments ON departments.dept_number = department_employees.dept_number;
--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT
   first_name,
   last_name
FROM
   employees
WHERE
   first_name LIKE 'Hercules%' AND last_name LIKE 'B%';
--List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.
SELECT
	department_employees.emp_number, 
	employees.first_name, 
	employees.last_name, 
	departments.dept_name
FROM
   employees
INNER JOIN department_employees ON employees.emp_number = department_employees.emp_number
INNER JOIN departments ON departments.dept_number = department_employees.dept_number
WHERE
	departments.dept_name LIKE 'Sales';
--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT
	department_employees.emp_number, 
	employees.first_name, 
	employees.last_name, 
	departments.dept_name
FROM
   employees
INNER JOIN department_employees ON employees.emp_number = department_employees.emp_number
INNER JOIN departments ON departments.dept_number = department_employees.dept_number
WHERE
	departments.dept_name LIKE 'Sales' OR departments.dept_name LIKE 'Development';
--In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.

SELECT
	COUNT(*), last_name
FROM
	employees
GROUP BY
	last_name
ORDER BY
	COUNT(*) DESC;



