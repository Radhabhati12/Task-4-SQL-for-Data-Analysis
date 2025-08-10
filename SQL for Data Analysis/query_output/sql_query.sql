*******************Sql queries*************

-- 1. SELECT query--
Select name, email, country  from customers where country = 'India';

-- 2. WHERE Clause--
Select name, country  from customers order by country ASC, name ASC;

-- 3. ORDER BY--
Select country, count(*) as total_customers  from customers group by country order by total_customers desc;

-- 4. inner join--
Select o.order_date, c.name, c.country from orders o  inner join customers c on o.customer_id = c.customer_id;

-- 5. INNER JOIN--
select o.order_id, c.name, p.product_name, oi.quantity  from orders o inner join customers c on o.customer_id = c.customer_id inner join order_items oi on o.order_id = oi.order_id inner join products p on oi.product_id = p.product_id;
-- 5. left JOIN--
Select c.name, o.order_id, c.country  from customers c left join orders o on c.customer_id = o.customer_id;

-- 6. Right JOIN--
Select o.order_id, c.name  from orders o right join customers c on o.customer_id = c.customer_id;

-- 8. Subquery: Customers who spent more than 50,000--
Select sum(p.price * oi.quantity) AS total_revenue from order_items oi join products p on oi.product_id = p.product_id;

-- 9. GROUP BY with Aggregate--
 Select name from customers where customer_id IN ( select o.customer_id from orders o  join order_items oi on o.order_id = oi.order_id join products p on oi.product_id = p.product_id group by o.customer_id having sum(p.price * oi.quantity) > 50000);

-- 10. Create a View--
 create view customer_orders as select c.name, p.product_name, oi.quantity, (p.price * oi.quantity) AS total_amount from customers c join orders o on c.customer_id = o.customer_id join order_items oi on o.order_id = oi.order_id join products p on oi.product_id = p.product_id;
 Select * from customer_orders;

-- 11. Index for Optimization--
 create index idx_customer_id on orders(customer_id);