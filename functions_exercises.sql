USE employees;

SELECT *
FROM employees
WHERE gender = 'M'
AND (first_name = 'Irena' OR first_name ='Vidya' OR first_name = 'Maya')
ORDER BY last_name ASC, first_name ASC ;


SELECT CONCAT(first_name,' ',last_name)
FROM employees
WHERE last_name LIKE 'E%'
AND last_name LIKE '%E';

SELECT *
FROM employees
WHERE last_name LIKE ('%Q%');

SELECT *
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';

SELECT DATEDIFF(NOW(), hire_date)
FROM employees
WHERE year(hire_date) BETWEEN 1990 AND 1999
AND month(birth_date) = 12
AND day(birth_date) = 25
ORDER BY year(hire_date) DESC;


