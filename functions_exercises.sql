USE employees;

SELECT *
FROM employees
WHERE gender = 'M'
AND (first_name = 'Irena' OR first_name ='Vidya' OR first_name = 'Maya')
ORDER BY last_name ASC, first_name ASC ;

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
AND last_name LIKE '%E'
ORDER BY emp_no;

SELECT *
FROM employees
WHERE last_name LIKE ('%Q%');

SELECT *
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';