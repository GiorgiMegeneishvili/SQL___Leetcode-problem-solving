-----------------------------------  leetCode soultion SQL -----------------------

--------         196. Delete Duplicate Emails -----------------------------------

DELETE p1
FROM Person p1
JOIN Person p2
ON p1.Email = p2.Email AND p1.Id > p2.Id;


--------         197. Rising Temperature      -----------------------------------

SELECT w1.id
FROM Weather w1
JOIN Weather w2
  ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;



--------        1741. Find Total Time Spent by Each Employee      -----------------------------------


select event_day as day, emp_id, (sum(out_time) - sum(in_time) ) as total_time
from employees
group by event_day, emp_id




--------      1757. Recyclable and Low Fat Products      -----------------------------------

select 
    product_id
from Products p
    where p.low_fats in ('Y') and p.recyclable in ('y')





--------       1789. Primary Department for Each Employee      -----------------------------------

SELECT DISTINCT
  e.employee_id,
  (
    SELECT department_id
    FROM Employee
    WHERE employee_id = e.employee_id
    ORDER BY CASE WHEN primary_flag = 'Y' THEN 1 ELSE 2 END
    LIMIT 1
  ) AS department_id
FROM Employee e;





--------         1873. Calculate Special Bonus    -----------------------------------

SELECT 
    employee_id,
    CASE
        WHEN LEFT(name, 1) != 'M' AND employee_id % 2 != 0 THEN salary
        ELSE 0
    END AS bonus
FROM Employees;






--------         607. Sales Person        -----------------------------------

SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT DISTINCT o.sales_id
    FROM Orders o
    JOIN Company c ON o.com_id = c.com_id
    WHERE c.name = 'RED'
)



--------         211. Queries Quality and Percentage        -----------------------------------



select 
    query_name, 
    round((sum((rating/position)) / count(query_name) ),2) as quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS poor_query_percentage
from Queries
group by query_name


select 
    s.student_id,
    s.student_name
from Students as s left join Examinations as e on s.student_id = e.student_id 
inner join Subjects as s1 on e.subject_name = s1.subject_name
order by s.student_id, s1.subject_name


--------         1280. Students and Examinations        -----------------------------------


SELECT 
    s.student_id, 
    s.student_name, 
    sub.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e 
    ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;



--------         1327. List the Products Ordered in a Period        -----------------------------------



select 
    p.product_name,
    sum(unit) as unit    
from 
(   select product_id,order_date,unit 
    from Orders 
    where YEAR(order_date) = 2020 and MONTH(order_date) = 2 ) as o  
inner join Products  p on o.product_id = p.product_id
group by p.product_id
having sum(unit) > 99





--------         1407. Top Travellers       -----------------------------------


select 
    u.name,
    COALESCE(SUM(r.distance), 0) AS travelled_distance
from Users as u left join Rides as r on u.id = r.user_id
group by r.user_id, u.name
order by travelled_distance desc, u.name 



--------         1484. Group Sold Products By The Date       -----------------------------------

select 
    Activities1.sell_date,
    count(Activities1.product) as num_sold,
    GROUP_CONCAT(DISTINCT Activities1.product ORDER BY Activities1.product ASC) AS products
from (select
    distinct
    a.sell_date,
    a.product
from Activities a
    order by a.sell_date) as Activities1
    group by Activities1.sell_date




--------         1517. Find Users With Valid E-Mails       -----------------------------------


SELECT *
FROM Users
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$';
