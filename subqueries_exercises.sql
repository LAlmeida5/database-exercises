USE employees;

# 1
SELECT CONCAT(first_name,' ',last_name)
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = '101010'
    );

# 2
SELECT title, COUNT(emp_no)
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
    )
GROUP BY title;

# SELECT title
# FROM titles
# WHERE emp_no IN (
#     SELECT emp_no
#     FROM employees
#     WHERE first_name = 'Aamod'
#     );

# 3
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date = '9999-01-01'
    ) AND  gender = 'F';

# Bonus 1
SELECT dept_name
FROM departments
WHERE dept_no IN (
    SELECT dept_no
    FROM dept_manager
    WHERE emp_no IN (
        SELECT emp_no
        FROM employees
        WHERE gender = 'F'
        ) AND to_date = '9999-01-01'
    );

# Bonus 2
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM salaries
    WHERE salary = (
        SELECT MAX(salary)
        FROM salaries
        )
    );