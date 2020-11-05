# Learning-MySQL

### Facts

1. comment appending `--` at the start of the line.
2. `use database_name` selects the database to query.
3. `concat(args)` will concatenate the arguments given.
4. order of query: `select -> from -> where -> order by -> limit`

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

9. we can use `between` to compare range. this equivalent to `points >= 1000 and points <= 3000`

   ```SQL
   select *
   from customers
   where points between 1000 and 3000;
   ```

10. ```SQL
    select *
    from customers
    where last_name like 'brush%';

    select *
    from customers
    where last_name like '_y';

    select *
    from customers
    where address like '%trail%' or address like '%avenue%';
    ```

    `%` means any number of character. this can be used at the start, end, middle anywhere.

    `_` means a single character. can be used anywhere. the comparisons ignores case(upper or lower).

11. we can use `regexp` to compare strings

    ```SQL
    select *
    from customers
    where last_name regexp 'field';
    ```

    `^` in regexp will indicate the start of the word.

    `$` would indicate the end.

    `|` defines `or`

    `[xyab]` whatever is inside, a char should belong to one of them.

    `[a-z]` character should belong in the range.

12. we can look for empty fields or slect those that doesn't have any particular field null.

    ```sql
    select *
    from customers
    where phone is null;

    select *
    from customers
    where phone is not null;
    ```

13. we can sort data by columns. by default by ascending, using `desc` in descending.

    ```sql
    select order_id, product_id, quantity, unit_price
    from order_items
    where order_id = 2
    order by (quantity * unit_price) desc;

    -- we can use alias for sorting too.
    select order_id, product_id, quantity, unit_price, (quantity * unit_price) as total_price
    from order_items
    where order_id = 2
    order by total_price desc;

    ```

14. we can limit the number of results given. first param is the offset. that is how many to skip. it is optional.
    ```sql
    select *
    from customers
    limit 2, 5;
    ```

start from
https://www.youtube.com/watch?v=7S_tz1z_5bA&list=PLFtRSCvCGryX4CrSJlBF_-pJK0IEDMI16&index=1&t=5090s
