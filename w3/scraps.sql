-- 2
select avg(salary), max(salary),
       min(salary), sum(salary)
from   employees
where  job_id like '%REP%';

select min(hire_date), max(hire_date)
from	  employees;

select count(commission_pct)
from   employees
where  department_id = 80;

select count(distinct department_id)
from   employees;

-- almost useless, gets all the duplicates
select count(department_id)
from   employees;

select avg(commission_pct)
from employees;

select avg(nvl(commission_pct, 0))
from   employees;

select   department_id, trunc(avg(salary), 2) as "Average salary"
from     employees
group by department_id ;

select   department_id, job_id, sum(salary)
from     employees
group by department_id, job_id;

select   department_id, job_id, sum(salary)
from     employees
group by department_id, job_id
order by job_id;

select   department_id, max(salary)
from     employees
group by department_id
having   max(salary)> 10000 ;

select   trunc(max(avg(salary)), 2) as "Max average salary"
from     employees
group by department_id;

-- 3
select employee_id, first_name, job_id, job_title
from employees natural join jobs;

-- equijoin, using only dep_id
select employee_id, last_name, 
       department_name, department_id
from   employees join departments
using (department_id);

-- natural join, uses both shared cols, emp_id and dep_id
select employee_id, last_name, 
       department_name, department_id
from   employees natural join departments;

-- bugged
select l.city, d.department_name, d.manager_id 
from   locations l join departments d
using (location_id)
-- column part of USING clause cannot have qualifier
where d.location_id = 1400;

-- corrected
select l.city, d.department_name, d.manager_id
from   locations l join departments d
using (location_id)
where  location_id = 1400;

-- using ON instead
select l.city, d.department_name, d.manager_id
from   locations l join departments d
on l.location_id = d.location_id
where l.location_id = 1400;

select e.employee_id, e.last_name, e.department_id, 
       d.department_id, d.location_id
from   employees e join departments d
on     e.department_id = d.department_id;

-- threeway join w/ ON
select e.employee_id, l.city, d.department_name
from   employees e 
join   departments d
on     d.department_id = e.department_id 
join   locations l
on     d.location_id = l.location_id;

-- threeway join w/ USING
select e.employee_id, l.city, d.department_name
from employees e
join departments d
using (department_id)
join locations l
using (location_id);

select e.employee_id, e.last_name, e.department_id, 
       d.department_id, d.location_id
from   employees e join departments d
on     (e.department_id = d.department_id)
and    e.manager_id = 149 ;

-- same, using WHERE
select e.employee_id, e.last_name, e.department_id, 
       d.department_id, d.location_id
from   employees e join departments d
on     (e.department_id = d.department_id)
where   e.manager_id = 149 ;

-- 4

-- self join
select emp.last_name as emp, mgr.last_name as mgr
from   employees emp join employees mgr
on    (emp.manager_id = mgr.employee_id);

-- nonequi join
select e.last_name, e.salary, j.grade_level
from   employees e join job_grades j
on     e.salary
between j.lowest_sal and j.highest_sal;

-- Left outer, all rows in left are in
select e.last_name, e.department_id, d.department_name
from   employees e left outer join departments d
on   (e.department_id = d.department_id) ;

-- right outer, all rows in right are in
select e.last_name, d.department_id, d.department_name
from   employees e right outer join departments d
on    (e.department_id = d.department_id) ;

-- full outer
select e.last_name, d.department_id, d.department_name
from   employees e full outer join departments d
on   (e.department_id = d.department_id) ;

-- are you really sure you want it?
select last_name, department_name
from   employees
cross join departments ;

-- 5

select last_name, hire_date
from   employees 
where  hire_date > (select hire_date 
                    from   employees
                    where  last_name = 'Davies');

select last_name, job_id, salary
from   employees
where  job_id =  
                (select job_id
                 from   employees
                 where  last_name = 'Taylor')
and    salary >
                (select salary
                 from   employees
                 where  last_name = 'Taylor');

select last_name, job_id, salary
from   employees
where  salary = 
                (select min(salary)
                 from   employees);

select   department_id, min(salary)
from     employees
group by department_id
having   min(salary) >
                       (select min(salary)
                        from   employees
                        where  department_id = 50);

-- buggy
select employee_id, last_name
from   employees
where  salary =
                -- single-row subquery returns more than one row!
                (select   min(salary)
                 from     employees
                 group by department_id);

-- should be:
select employee_id, last_name
from   employees
where  salary in
                (select   min(salary)
                 from     employees
                 group by department_id);

-- buggy, not such a job_title, subquery returns null
select last_name, job_id 
from   employees
where job_id = 
                (select job_id
                 from   jobs 
                 where  job_title = 'Architect'); 

-- 6

select last_name, salary, department_id
   from   employees
   where  salary in (select   min(salary)
                     from     employees
                     group by department_id);

select last_name, salary, department_id
   from   employees
   where  salary in (2500, 4200, 4400, 6000, 7000,   8300, 	8600, 17000);

select employee_id, last_name, job_id, salary
from   employees
where  salary < any
                    (select salary
                     from   employees
                     where  job_id = 'IT_PROG')
and    job_id <> 'IT_PROG';


select employee_id, last_name, job_id, salary
from   employees
where  salary < all
                    (select salary
                     from   employees
                     where  job_id = 'IT_PROG')
and    job_id <> 'IT_PROG';


select first_name, department_id, salary
from employees
where (salary, department_id) in
      (select min(salary), department_id
       from employees
       group by department_id)
order by department_id;

-- buggy, there is a NULL in the sub
-- NOT IN is dangerous in case of possible NULL
select emp.last_name
from   employees emp
where  emp.employee_id not in
                           (select mgr.manager_id
                            from   employees mgr);

-- shield NULL in sub
select last_name from employees
where  employee_id not in
                        (select manager_id 
                         from   employees 
                         where  manager_id is not null);


select emp.last_name
    from   employees emp
    where  emp.employee_id  in
                              (select mgr.manager_id
                               from   employees mgr);
