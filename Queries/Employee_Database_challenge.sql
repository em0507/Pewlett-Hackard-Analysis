#
SELECT employees.emp_no, employees.first_name, employees.last_name, titles.title, titles.from_date, titles.to_date
INTO retirement_titles
FROM employees, titles
WHERE employees.emp_no = titles.emp_no AND (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31') ORDER BY employees.emp_no ASC;

#
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

#
SELECT COUNT(title), title
FROM unique_titles
GROUP BY title
ORDER BY count DESC;
