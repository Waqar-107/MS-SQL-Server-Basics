# Learning-MySQL

### Facts

1. comment appending `--` at the start of the line.
2. `use database_name` selects the database to query.
3. `concat(args)` will concatenate the arguments given.

### codes

1. select all from a table
   ```SQL
   select * from customers;
   ```
2. select particular columns from the table
   ```SQL
   select
     last_name,
      first_name,
      points
   from customers;
   ```
3. do mathematical calculation while calling

   ```SQL
   select
   	last_name,
       first_name,
       points,
       (points * 10) / 100
   from customers;
   ```

4. when using calculation while fetching data, give them readable names

   ```SQL
   select
      concat(first_name," ", last_name) as full_name,
      points,
      (points * 10) / 100 as discount
   from customers;
   ```

5. remove duplicate using `distinct`

   ```SQL
   select distinct state
   from customers
   ```

6. using conditions while query

   ```SQL
   select *
   from customers
   where state != 'VA';
   ```

7. use multiple conditions using `and` or `or`. `not` can also be used to negate.

   ```SQL
   select *
   from customers
   where points > 1000 and birth_date >= '1990-01-01'
   ```

8. we can use `in` operator to compare during use of `where`

   ```SQL
   select *
   from customers
   where state in ("VA", "FL", "GA");

   select *
   from products
   where quantity_in_stock in (49, 38, 72);
   ```
