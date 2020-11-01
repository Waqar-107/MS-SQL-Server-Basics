USE sql_store;

-- select all from the table
select * from customers;

-- select particular columns
select 
	last_name,
    first_name,
    points
from customers;

-- do mathematical calculation while calling
select 
	last_name,
    first_name,
    points,
    (points * 10) / 100
from customers;

-- when using calculation while fetching data, give them readable names
select
    concat(first_name," ", last_name) as full_name,
    points,
    (points * 10) / 100 as discount
from customers;

-- remove duplicate
select distinct state
from customers;

-- exercise
select 
	name, 
    unit_price, 
    unit_price * 1.1 as new_price
from products;

-- using conditions while query
select *
from customers
where state != 'VA';

-- exercise
select *
from orders
where order_date >= '2019-01-01';

-- use multiple conditions
select *
from customers
where points > 1000 and birth_date >= '1990-01-01';

-- negate works here too!!
select *
from customers
where not (points > 1000 and birth_date >= '1990-01-01');

-- exercise
select *
from order_items
where order_id = 6 and (quantity * unit_price) > 30;

-- use of in 
select *
from customers
where state in ("VA", "FL", "GA");