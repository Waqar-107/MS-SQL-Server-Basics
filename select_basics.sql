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

-- exercise
select *
from products
where quantity_in_stock in (49, 38, 72);

-- between operator
select *
from customers
where points between 1000 and 3000;

-- exercise
select *
from customers
where birth_date between "1990-01-01" and "2000-01-01";

-- like operator
-- % means any number of char
-- _ means only a single character
select *
from customers
where last_name like 'b%';

select *
from customers
where last_name like 'brush%';

select *
from customers
where last_name like '_y';

-- exercise
select *
from customers
where address like '%trail%' or address like '%avenue%';

select *
from customers
where phone like '%9';

-- regexp
select *
from customers
where last_name regexp 'field';

-- multiple search
select *
from customers
where last_name regexp 'field|mac|rose';

-- exercise
-- first names are elka or ambur
select *
from customers
where first_name regexp "^ELKA$|^AMBUR$";

-- last names end with ey or on
select *
from customers
where last_name regexp "EY$|ON$";

-- last name start with my or contain se
select *
from customers
where first_name regexp "^MY|SE";

-- last name contains b followed by r or u
select *
from customers
where last_name regexp "B[RU]";