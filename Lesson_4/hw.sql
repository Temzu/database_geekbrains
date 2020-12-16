CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `geodata`.`find_moscow_region` AS
    SELECT 
        `ci`.`id` AS `id`, `ci`.`title` AS `title`
    FROM
        (`geodata`.`_cities` `ci`
        JOIN `geodata`.`_regions` `re` ON ((`ci`.`region_id` = `re`.`id`)))
    WHERE
        (`re`.`title` = 'Московская область')



CREATE DEFINER=`root`@`localhost` FUNCTION `find_manager`(_first_name varchar(50), _last_name varchar(50)) RETURNS int
    DETERMINISTIC
BEGIN
declare result int;
SELECT 
    em.emp_no
into result FROM
    employees em
        JOIN
    dept_manager de ON em.emp_no = de.emp_no
where em.first_name = _first_name and em.last_name = _last_name;
RETURN result;
END



CREATE DEFINER=`root`@`localhost` 
TRIGGER `employees_AFTER_INSERT` 
AFTER INSERT ON `employees` 
FOR EACH ROW BEGIN
INSERT INTO salaries (emp_no, salary, from_date, to_date) VALUES (NEW.emp_no, 2000, current_date(), current_date());
END
