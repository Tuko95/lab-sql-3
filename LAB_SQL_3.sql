use sakila;

-- 1. How many distinct (different) actors' last names are there?
select * from actor;
select count(distinct(last_name)) as 'Nº different names' from actor;

-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
select * from film;
select count(distinct(language_id)) from film;

-- 3 How many movies were released with "PG-13" rating?
select * from film;
select count(*) from film where rating = 'PG-13';

-- 4. Get 10 the longest movies from 2006.
select * from film;
select * from film where release_year = '2006' order by length desc limit 10;

-- 5. How many days has been the company operating (check DATEDIFF() function)?
SELECT * FROM payment;
SELECT datediff(day, '2005-05-25', '2006-02-14') from payment; -- ERROR

-- 6. Show rental info with additional columns month and weekday. Get 20.
select * from rental;
select *, 
date_format(rental_date, "%M") as 'Month',
date_format(rental_date, "%W") as 'Weekday' from rental limit 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select * from rental;
select *,
case
when (date_format(rental_date, "%W") = 'Monday') then "Workday"
when (date_format(rental_date, "%W") = 'Tuesday') then "Workday"
when (date_format(rental_date, "%W") = 'Wednesday') then "Workday"
when (date_format(rental_date, "%W") = 'Thursday') then "Workday"
when (date_format(rental_date, "%W") = 'Friday') then "Workday"
else "Weekend"
end as "Day_type"
from rental;

-- 8. How many rentals were in the last month of activity?
select * from rental;
select count(date_format(last_update, '%M') = 'May') from rental;