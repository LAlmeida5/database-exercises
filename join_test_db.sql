USE employees;

CREATE TABLE roles (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       role_id INT UNSIGNED DEFAULT NULL,
                       PRIMARY KEY (id),
                       FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
                                             ('bob', 'bob@example.com', 1),
                                             ('joe', 'joe@example.com', 2),
                                             ('sally', 'sally@example.com', 3),
                                             ('adam', 'adam@example.com', 3),
                                             ('jane', 'jane@example.com', null),
                                             ('mike', 'mike@example.com', null),
                                             ('david', 'davd@example.com', null),
                                             ('chris', 'chrisd@example.com', 2),
                                             ('roger', 'rogerd@example.com', 2),
                                             ('derek', 'derekd@example.com', 2);

SELECT d.dept_name AS department, CONCAT(e.first_name, ' ', e.last_name) AS department_manager
FROM employees AS e
JOIN dept_manager AS dm on e.emp_no = dm.emp_no
JOIN departments AS d ON d.dept_no = dm.dept_no
WHERE YEAR(dm.to_date) = 9999
ORDER BY d.dept_name;

SELECT d.dept_name AS department, CONCAT(e.first_name, ' ', e.last_name) AS department_manager
FROM employees AS e
JOIN dept_manager AS dm on e.emp_no = dm.emp_no
JOIN departments AS d ON d.dept_no = dm.dept_no
WHERE YEAR(dm.to_date) = 9999 AND e.gender = 'F'
ORDER BY d.dept_name;

SELECT t.title, COUNT(t.title) AS Total
FROM employees AS e
JOIN titles AS t ON e.emp_no = t.emp_no
JOIN dept_emp AS de ON e.emp_no =de.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no
WHERE t.to_date = '9999-01-01' AND de.to_date = '9999-01-01' AND d.dept_name = 'Customer Service'
GROUP BY t.title;

SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, '',e.last_name) AS 'Department Manager', s.salary AS 'Salary'
FROM departments AS d
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN employees AS e on dm.emp_no = e.emp_no
JOIN salaries AS s on e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY d.dept_name;

SELECT CONCAT(e.first_name, '',e.last_name), d.dept_name, CONCAT(e2.first_name,'',e2.last_name)
FROM employees AS e
JOIN dept_emp AS de on e.emp_no = de.emp_no
JOIN departments AS d on d.dept_no = de.dept_no
JOIN dept_manager AS dm on e.emp_no = dm.emp_no
JOIN employees AS e2 on e2.emp_no = dm.emp_no
WHERE YEAR(de.to_date) = 9999 AND YEAR(dm.to_date) = 9999
ORDER BY d.dept_name, e.emp_no;