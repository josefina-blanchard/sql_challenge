--1) List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary 
FROM employees as emp
    FULL OUTER JOIN salaries as sal
    ON emp.emp_no = sal.emp_no;

--2) List employees who were hired in 1986.
SELECT emp_no, hire_date FROM employees  
WHERE hire_date >= '1986-01-01';

--3) List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT depts.dept_no, 
        depts.dept_name, 
        man.emp_no, 
        CONCAT(emp.last_name, ', ', emp.first_name) as e_name, 
        man.from_date, 
        man.to_date
FROM departments as depts
    JOIN dept_manager as man
        ON depts.dept_no = man.dept_no
       --AND to_date = '9999-01-01' --This will get the current managers only, commenting out since later on 
        --I realized no indication of current employment was made and from-to dates were requested.
    JOIN employees as emp
        ON man.emp_no = emp.emp_no;

--4) List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
SELECT emp.emp_no, 
    CONCAT(emp.last_name, ', ', emp.first_name) as e_name,
    dept.dept_name
FROM employees as emp
    JOIN dept_emp as de
        ON emp.emp_no = de.emp_no
    JOIN departments as dept
        ON de.dept_no = dept.dept_no;

--5) List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6) List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT depts.dept_name,
    de.emp_no,
    CONCAT(emp.last_name, ', ', emp.first_name) as e_name
FROM departments as depts
    JOIN dept_emp as de
        ON depts.dept_no = 'd007'
        AND depts.dept_no = de.dept_no
    JOIN employees as emp
        ON de.emp_no = emp.emp_no;

--7) List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT depts.dept_name,
    de.emp_no,
    CONCAT(emp.last_name, ', ', emp.first_name) as e_name	
FROM departments as depts
    JOIN dept_emp as de
        ON depts.dept_no = de.dept_no
    JOIN employees as emp
        ON de.emp_no = emp.emp_no
WHERE depts.dept_no IN ('d005','d007');

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, COUNT(emp_no) AS "emp_count"
FROM employees
GROUP BY last_name
ORDER BY "emp_count" DESC;
