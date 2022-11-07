
--Задача #1
select * from products p;

--Задача #2
select prod_name 
from products p;

--Задача #3
select prod_id, prod_name, prod_price 
from products p;

--Задача #4
select distinct(prod_name) 
from products p ;

--Задача #5
select prod_name 
from products p 
limit 15;

--Задача #6 
select prod_name 
from Products p 
order by prod_name;

--Задача #7
select prod_id, prod_name, prod_desc 
from products p 
order by prod_desc desc;

--Задача #8
select vend_id, vend_city, vend_state 
from vendors v 
order by vend_state, vend_city;

--Задача #9

— 1 способ 
select concat(vend_name, ' ', vend_country) 
from Vendors v;

— 2 способ 
select (vend_name, ' ', vend_country) 
from Vendors v;

--Задача #10
select vend_name, vend_city,
concat(vend_name, ' ', vend_city) as "location" 
from vendors v;

--Задача #11 
select prod_id, quantity * item_price as "Expanded_price" 
from orderitems o;

--Задача #12 
select vend_name || '(' || vend_country || ')' as "location", 
length(vend_name || '(' || vend_country || ')') as "NumOfSU"
from vendors v;

--Задача 13
select upper(concat(cust_city, cust_address, cust_email)) from customers c;

--Задача 14
select prod_desc, ltrim(prod_desc, 'T') as "Результат" 
from products p;

--Задача 15
select prod_desc, ltrim(prod_desc, 'Jet') as "Результат" 
from products p;

--Задача 32
select substr(note_text, 1, 22) as "Результат" 
from productnotes p; 

--Задача 33 
select substring(note_text from -22 for 0) as "Результат" from productnotes p;

--Задача 34
select substring(note_text, char_length(note_text) - 22)
from productnotes p;

--Задача 35 
select substring(note_text, char_length(note_text) - 17)
from productnotes p;

--Задача 36 
select repeat(vend_name, 3) as "Повтор" 
from vendors v;

--Задача 37 
select reverse(vend_name) as "Повтор" 
from vendors v;

--Задача 38
select split_part(cust_email, '@', 1) as "Table1" from customers c;

--Задача 39
select split_part(cust_email, ' ', 1) as "Table1", split_part(cust_email, ' ', 2) as "Table2" from customers c;

--Задача 40
Select age('2022-10-23', '1812-08-03');

--Задача 41
Select age(order_date) as "Интервал" from orders o;

--Задача 42 
select current_time;
select current_timestamp;
