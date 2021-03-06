USE employees;

SELECT CONCAT(emp_no,' - ',last_name,' ',first_name) AS full_name, birth_date AS DOB
FROM employees
GROUP BY full_name, last_name, birth_date
ORDER BY last_name
LIMIT 10;

