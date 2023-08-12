-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name , monthly_salary from employees 
		join employee_salary on employee_id = employees.id 
		join salary on salary_id = salary.id;	
-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary from employees 
		join employee_salary on employee_id = employees.id 
		join salary on salary.id = employee_salary.salary_id
where monthly_salary < 2000;
-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_salary.id, employee_name, monthly_salary from salary 
		join employee_salary on salary.id = employee_salary.salary_id
		left join employees on employees.id = employee_id
where employee_name is null										
order by employee_salary.id;
-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_salary.id, employee_name, monthly_salary from salary 
		join employee_salary on salary.id = employee_salary.salary_id
		left join employees on employees.id = employee_id
where employee_name is null and monthly_salary < 2000
order by employee_salary.id;
-- 5. Найти всех работников кому не начислена ЗП.
select employee_name, salary_id from employees 
		left join employee_salary on employees.id = employee_id
where salary_id is null
order by employee_name;
-- 6. Вывести всех работников с названиями их должности.
select employee_name, role_name from employees	
		join roles_employee on roles_employee.employee_id = employees.id
		join roles on roles.id = roles_employee.role_id
order by employee_name;				
-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name from employees	
		join roles_employee on roles_employee.employee_id = employees.id
		join roles on roles.id = roles_employee.role_id
where role_name like '%Java %'
order by role_name;	
-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name from employees	
		join roles_employee on roles_employee.employee_id = employees.id
		join roles on roles.id = roles_employee.role_id
where role_name like '%Pyth%'
order by role_name;	
-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from employees	
		join roles_employee on roles_employee.employee_id = employees.id
		join roles on roles.id = roles_employee.role_id
where role_name like '%QA%'
order by role_name;	
-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from employees	
		join roles_employee on roles_employee.employee_id = employees.id
		join roles on roles.id = roles_employee.role_id
where role_name like '%Manual QA%'
order by role_name;
-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name from employees	
		join roles_employee on roles_employee.employee_id = employees.id
		join roles on roles.id = roles_employee.role_id
where role_name like '%Automation QA%'
order by role_name;
-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          --если нужно отсечь тех у кого monthly_salary NULL , right и left убираем
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where role_name like '%Junior%'
order by monthly_salary ;
-- 13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          --если нужно отсечь тех у кого monthly_salary NULL, right и left убираем
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where role_name like '%Middle%'
order by monthly_salary ;
-- 14. Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		join roles_employee using (employee_id)         
		join roles on roles.id = roles_employee.role_id
		join employees on employee_id = employees.id
where role_name like '%Senior%'
order by monthly_salary ;
-- 15. Вывести зарплаты Java разработчиков
select monthly_salary from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          --если нужно отсечь тех у кого monthly_salary NULL, right и left убираем
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where role_name like '%Java dev%'
order by monthly_salary ;
-- 16. Вывести зарплаты Python разработчиков
select monthly_salary from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          --если нужно отсечь тех у кого monthly_salary NULL, right и left убираем
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where role_name like '%Pyth%'
order by monthly_salary ;
-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, monthly_salary from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          --если нужно отсечь тех у кого monthly_salary NULL, right и left убираем
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where role_name like '%Junior Py%'
order by monthly_salary ;
-- 18. Вывести имена и зарплаты Middle JS разработчиков    -- их нет _))
select employee_name, monthly_salary from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where role_name like '%Middle JavaScript%'
order by monthly_salary ;
-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, monthly_salary from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		join roles_employee using (employee_id)          
		join roles on roles.id = roles_employee.role_id
		join employees on employee_id = employees.id
where role_name like '%Senior Java %';
-- 20. Вывести зарплаты Junior QA инженеров
select monthly_salary from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where role_name in ('Junior Manual QA engineer', 'Junior Automation QA engineer')
order by monthly_salary ;
-- 21. Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary) from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          
		left join roles on roles.id = roles_employee.role_id                 -- те у кого зарплата null не считаются при avg
		left join employees on employee_id = employees.id
where role_name like '%Junior%';
-- 22. Вывести сумму зарплат JS разработчиков
select avg(monthly_salary) from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where role_name like '%JavaScript%';
-- 23. Вывести минимальную ЗП QA инженеров
select min(monthly_salary) from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where role_name like '%QA%';
-- 24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where role_name like '%QA%';
-- 25. Вывести количество QA инженеров
select count(role_name) as Количество_QA_инженеров from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where role_name like '%QA%';
-- 26. Вывести количество Middle специалистов.
select count(role_name) as Количество_QA_инженеров from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where role_name like '%Middle%';
-- 27. Вывести количество разработчиков
select count(role_name) as Количество_QA_инженеров from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where role_name like '%developer%';
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) as Количество_QA_инженеров from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where role_name like '%developer%';
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
order by role_name, monthly_salary ;
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where monthly_salary >= 1700 and monthly_salary <= 2300              --надо понимать включительно или нет
order by role_name, monthly_salary ;
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary from salary 
		join employee_salary on salary.id = employee_salary.salary_id	 
		right join roles_employee using (employee_id)            
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where monthly_salary < 2300
order by monthly_salary ;
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary from salary 
		join employee_salary on salary.id = employee_salary.salary_id	
		right join roles_employee using (employee_id)          
		left join roles on roles.id = roles_employee.role_id
		left join employees on employee_id = employees.id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary ;
