/*  */
SELECT employees.emp_no, employees.first_name, employees.last_name, titles.title, titles.from_date, titles.to_date
INTO retirement_titles
FROM employees, titles
WHERE employees.emp_no = titles.emp_no AND (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
ORDER BY employees.emp_no ASC;

/*  */
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

/*  */
SELECT COUNT(title), title
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

/*  */
SELECT DISTINCT ON (employees.emp_no) 
employees.emp_no,
employees.first_name, 
employees.last_name,
employees.birth_date,
dept_emp.from_date,
dept_emp.to_date,
titles.title
INTO mentorship_eligibilty
FROM employees, dept_emp, titles
WHERE (employees.emp_no = titles.emp_no) 
	AND (employees.emp_no = dept_emp.emp_no)
	AND (dept_emp.to_date = '9999-01-01')
	AND (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
ORDER BY employees.emp_no ASC