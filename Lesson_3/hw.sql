-- База данных «Страны и города мира»:
-- 1. Сделать запрос, в котором мы выберем все данные о городе – регион, страна.
USE geodata;
SELECT 
    ci.id, ci.title, re.title, co.title_ru
FROM
    _cities ci
        JOIN
    _countries co ON ci.country_id = co.id
        JOIN
    _regions re ON ci.region_id = re.id
WHERE
    ci.title = 'Some city';
-- 2. Выбрать все города из Московской области.
USE geodata;
SELECT 
    ci.id, ci.title
FROM
    _cities ci
        JOIN
    _regions re ON ci.region_id = re.id
WHERE
    re.title = 'Московская область'
    
-- База данных «Сотрудники»:
-- 1. Выбрать среднюю зарплату по отделам.

USE employees;
SELECT 
    de.dept_name, AVG(salary) AS avg_salary
FROM
    departments de
        JOIN
    dept_emp demp ON de.dept_no = demp.dept_no
        JOIN
    salaries s ON demp.emp_no = s.emp_no
GROUP BY de.dept_name

-- 2. Выбрать максимальную зарплату у сотрудника.
USE employees;
SELECT 
    em.emp_no, em.first_name, em.last_name, MAX(salary) AS max_salary
FROM
    employees em
        JOIN
    salaries sa ON em.emp_no = sa.emp_no
WHERE
    em.first_name = 'Georgi' and em.last_name = 'Facello'
GROUP BY em.first_name

-- 3. Удалить одного сотрудника, у которого максимальная зарплата.
DELETE FROM employees 
WHERE
    emp_no = (SELECT 
        emp_no
    FROM
        salaries
    ORDER BY salary
    LIMIT 1)
    
-- 4. Посчитать количество сотрудников во всех отделах.
SELECT 
    de.dept_name, COUNT(*) as count
FROM
    dept_emp demp
    join
    departments de on de.dept_no = demp.dept_no
GROUP BY de.dept_name;

-- 5. Найти количество сотрудников в отделах и посмотреть, сколько всего денег получает отдел.

SELECT 
    de.dept_name,
    COUNT(demp.dept_no) AS count,
    SUM(sa.salary) AS total_salary
FROM
    dept_emp demp
        JOIN
    departments de ON de.dept_no = demp.dept_no
        JOIN
    salaries sa ON demp.emp_no = sa.emp_no
GROUP BY de.dept_no;