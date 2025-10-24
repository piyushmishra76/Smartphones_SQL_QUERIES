-- 1 Cross join it will show the cartesian prodict of each table to another like in 1st table 2 rows and in 2nd table 4 rows total rows in the results are 8
select * from sql_cx_live.users1 t1
cross join sql_cx_live.groups
;
-- 2 Inner join between membership and the user table
select * from sql_cx_live.membership t1
inner join sql_cx_live.users1 t2
on t1.user_id=t2.user_idl;

-- 3 Left join Left: memebrship, right: users1
select * from sql_cx_live.membership t1
left join sql_cx_live.users1 t2 -- all the other fields which are not in the right table throuh the primary key will be trated as null
on t1.user_id=t2.user_id;

-- 4 Right join , Priority will go to the right table
select * from sql_cx_live.membership t1
right join sql_cx_live.users1 t2
on t1.user_id=t2.user_id;
-- 5 Full outer join
-- Default we cant do full outer join in MYSQL

-- SET OPERATIONS UNION
select * from sql_cx_live.person1
UNION
Select * from sql_cx_live.person2 ;-- combine two table and remove repeatation
-- SET OPERATIONS UNION ALL
select * from sql_cx_live.person1
UNION ALL
Select * from sql_cx_live.person2; -- combine two table andwill not remove duplicates
-- SET OPERATIONS INTERSECTION
select * from sql_cx_live.person1
intersect
Select * from sql_cx_live.person2 ;-- combine two table and remove repeatation

-- SET OPERATIONS EXCEPT table1 except table2 rows ( set operation jaise hai A-B)
select * from sql_cx_live.person1
except
Select * from sql_cx_live.person2 ;-- combine two table and remove repeatation

-- Full outer join jugaad
-- simply pahle left join chalaingfe uske baad right join chalainge uske baad dono ko union karwenge
-- 3 Left join Left: memebrship, right: users1
select * from sql_cx_live.membership t1
left join sql_cx_live.users1 t2 -- all the other fields which are not in the right table throuh the primary key will be trated as null
on t1.user_id=t2.user_id
UNION -- For outer join (full)
-- 4 Right join , Priority will go to the right table
select * from sql_cx_live.membership t1
right join sql_cx_live.users1 t2
on t1.user_id=t2.user_id;

-- SQL SELF JOIN
/*
A self join is a type of join in which a table is joined with itself. This means that the table is trated as two seperated tables,
with each row in the table being compared to every other row in the sametable 

Self joins are used when you want to compare the values of two different rows within the sametable . for example , we might use a self join to compare the salaries of two employees
who work in the same department , o to find all pairs of customers who have the same billing address
*/
-- checking which users having whose number as emergency contact using self join video time 1: 21: 46
select * from sql_cx_live.users1 t1
join sql_cx_live.users1 t2
on t1.emergency_contact= t2.user_id;

-- Joining the table on the basis of two columns 
select * from sql_cx_live.students t1
join sql_cx_live.class t2
on t1.class_id=t2.class_id and t1.enrollment_year=t2.class_year